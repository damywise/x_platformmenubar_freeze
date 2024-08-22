import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    let channel = FlutterMethodChannel(name: "x_platformmenubar_freeze/channel", binaryMessenger: flutterViewController.engine.binaryMessenger)
    channel.setMethodCallHandler(handleMethodCall)

    super.awakeFromNib()
  }


  func handleMethodCall(call: FlutterMethodCall, result: FlutterResult) {
      switch call.method {
      case "setIsVisible(true)":
          self.setIsVisible(true)
          break
      case "NSApp.unhide(nil)":
          NSApp.unhide(nil)
          break
      case "makeKeyAndOrderFront(nil)":
          self.makeKeyAndOrderFront(nil)
          break
      case "setIsVisible(false)":
          self.setIsVisible(false)
          break
      case "NSApp.hide(nil)":
          NSApp.hide(nil)
          break
      default:
          result(FlutterMethodNotImplemented)
      }
  }

}
