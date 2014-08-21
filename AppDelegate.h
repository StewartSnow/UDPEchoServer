#import <Cocoa/Cocoa.h>
#import "GCDAsyncUdpSocket.h"
#import "SharedStateCollection.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	GCDAsyncUdpSocket *udpSocket;
	BOOL isRunning;
    SharedStateCollection *col;
}

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property  IBOutlet NSTextField *portField;
@property  IBOutlet NSButton *startStopButton;
@property  IBOutlet NSTextView *logView;

- (IBAction)startStopButtonPressed:(id)sender;

@end
