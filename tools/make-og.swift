// Génère les images d'aperçu de lien (Open Graph, 1200×630) dans assets/og/.
// Usage, depuis la racine du site :  swift tools/make-og.swift
// À relancer après un changement d'icône, de slogan, ou l'ajout d'une app.
import AppKit

let W = 1200, H = 630
let root = FileManager.default.currentDirectoryPath
let outDir = root + "/assets/og"
try? FileManager.default.createDirectory(atPath: outDir, withIntermediateDirectories: true)

func hex(_ s: String, _ a: CGFloat = 1) -> NSColor {
    let v = Int(s.dropFirst(), radix: 16)!
    return NSColor(srgbRed: CGFloat((v >> 16) & 255) / 255, green: CGFloat((v >> 8) & 255) / 255,
                   blue: CGFloat(v & 255) / 255, alpha: a)
}
func img(_ name: String) -> NSImage { NSImage(contentsOfFile: root + "/assets/" + name)! }

struct Card {
    let file: String          // nom du JPEG produit
    let icon: String?         // icône d'app (nil = accueil)
    let colors: (String, String)
    let eyebrow: String
    let title: String
    let tagline: String
}

let apps: [(id: String, icon: String, colors: (String, String), title: String, fr: String, en: String)] = [
    ("pokocheck", "icon-pokocheck.png", ("#9BE15D", "#2E9E54"), "PokoCheck",
     "Votre compagnon tout-en-un pour suivre votre aventure dans Pokopia.",
     "Your all-in-one companion to track your Pokopia adventure."),
    ("teachbook", "icon-teacher.png", ("#3B82F6", "#8B5CF6"), "TeachBook",
     "Notes, agenda et plans de classe : toute votre année au même endroit.",
     "Grades, planner and seating charts: your whole year in one place."),
    ("mathik", "icon-mathik.png", ("#FFB25A", "#F76B15"), "Mathik",
     "Les automatismes de maths du lycée, façon jeu.",
     "High-school math drills, as a game."),
    ("caseclosed", "icon-caseclosed.png", ("#FFD84A", "#F5A524"), "Case Closed",
     "Place les suspects. Démasque le coupable.",
     "Place the suspects. Unmask the culprit."),
]

var cards: [Card] = [
    Card(file: "home-fr.jpg", icon: nil, colors: ("#3B82F6", "#8B5CF6"),
         eyebrow: "Développeur iOS indépendant", title: "Kevin Blayassi",
         tagline: "Des apps pensées pour iPhone\u{00A0}&\u{00A0}iPad."),
    Card(file: "home-en.jpg", icon: nil, colors: ("#3B82F6", "#8B5CF6"),
         eyebrow: "Independent iOS developer", title: "Kevin Blayassi",
         tagline: "Apps designed for iPhone\u{00A0}&\u{00A0}iPad."),
]
for a in apps {
    cards.append(Card(file: "\(a.id)-fr.jpg", icon: a.icon, colors: a.colors,
                      eyebrow: "App iPhone & iPad", title: a.title, tagline: a.fr))
    cards.append(Card(file: "\(a.id)-en.jpg", icon: a.icon, colors: a.colors,
                      eyebrow: "iPhone & iPad app", title: a.title, tagline: a.en))
}

func font(_ size: CGFloat, _ weight: NSFont.Weight) -> NSFont {
    let base = NSFont.systemFont(ofSize: size, weight: weight)
    if let d = base.fontDescriptor.withDesign(.rounded), weight == .heavy {
        return NSFont(descriptor: d, size: size) ?? base
    }
    return base
}

func blob(_ ctx: CGContext, _ c: NSColor, x: CGFloat, y: CGFloat, r: CGFloat) {
    let g = CGGradient(colorsSpace: CGColorSpace(name: CGColorSpace.sRGB),
                       colors: [c.cgColor, c.withAlphaComponent(0).cgColor] as CFArray, locations: [0, 1])!
    ctx.drawRadialGradient(g, startCenter: CGPoint(x: x, y: y), startRadius: 0,
                           endCenter: CGPoint(x: x, y: y), endRadius: r, options: [])
}

func render(_ card: Card) {
    let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: W, pixelsHigh: H, bitsPerSample: 8,
                               samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                               colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
    rep.size = NSSize(width: W, height: H)
    NSGraphicsContext.saveGraphicsState()
    let nsctx = NSGraphicsContext(bitmapImageRep: rep)!
    NSGraphicsContext.current = nsctx
    let ctx = nsctx.cgContext
    ctx.interpolationQuality = .high

    // Fond clair + halos colorés (comme les blobs du site)
    hex("#FBFBFD").setFill(); NSRect(x: 0, y: 0, width: W, height: H).fill()
    blob(ctx, hex(card.colors.0, 0.45), x: 1080, y: 560, r: 520)
    blob(ctx, hex(card.colors.1, 0.35), x: 120, y: 40, r: 480)

    // Visuel à gauche : icône d'app, ou memoji pour l'accueil
    let side: CGFloat = 400
    let visual = NSRect(x: 80, y: (CGFloat(H) - side) / 2 + 10, width: side, height: side)
    ctx.saveGState()
    ctx.setShadow(offset: CGSize(width: 0, height: -14), blur: 40, color: NSColor(white: 0, alpha: 0.22).cgColor)
    if let icon = card.icon {
        img(icon).draw(in: visual)
    } else {
        let m = img("memoji.png")
        let h = side, w = h * m.size.width / m.size.height
        m.draw(in: NSRect(x: visual.midX - w / 2, y: visual.minY, width: w, height: h))
    }
    ctx.restoreGState()

    // Textes à droite
    let x: CGFloat = 540, maxW: CGFloat = CGFloat(W) - x - 70
    let para = NSMutableParagraphStyle(); para.lineSpacing = 4
    func draw(_ s: String, _ f: NSFont, _ c: NSColor, top: CGFloat) -> CGFloat {
        let attr = NSAttributedString(string: s, attributes: [.font: f, .foregroundColor: c, .paragraphStyle: para])
        let r = attr.boundingRect(with: NSSize(width: maxW, height: 400), options: [.usesLineFragmentOrigin])
        attr.draw(with: NSRect(x: x, y: CGFloat(H) - top - r.height, width: maxW, height: r.height),
                  options: [.usesLineFragmentOrigin])
        return top + r.height
    }
    let titleSize: CGFloat = card.title.count > 11 ? 78 : 88
    let titleH = NSAttributedString(string: card.title, attributes: [.font: font(titleSize, .heavy)]).size().height
    let tagH = NSAttributedString(string: card.tagline, attributes: [.font: font(36, .medium), .paragraphStyle: para])
        .boundingRect(with: NSSize(width: maxW, height: 400), options: [.usesLineFragmentOrigin]).height
    var top = (CGFloat(H) - (34 + 14 + titleH + 18 + tagH)) / 2 - 10
    top = draw(card.eyebrow, font(24, .semibold), hex(card.colors.1), top: top) + 14
    top = draw(card.title, font(titleSize, .heavy), hex("#111114"), top: top) + 18
    _ = draw(card.tagline, font(36, .medium), hex("#55555F"), top: top)

    // Pied : domaine
    let dom = NSAttributedString(string: "kevinblayassi.dev",
                                 attributes: [.font: font(24, .semibold), .foregroundColor: hex("#8A8A95")])
    dom.draw(at: NSPoint(x: x, y: 52))

    NSGraphicsContext.restoreGraphicsState()
    let data = rep.representation(using: .jpeg, properties: [.compressionFactor: 0.85])!
    try! data.write(to: URL(fileURLWithPath: outDir + "/" + card.file))
    print("✓ assets/og/\(card.file)")
}

cards.forEach(render)
