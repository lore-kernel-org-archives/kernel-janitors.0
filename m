From: Lauri Jakku <lja@iki.fi>
Date: Wed, 05 Feb 2020 15:39:45 +0000
Subject: [PATCH v6] USB: HID: random timeout failures tackle try.
Message-Id: <20200205153944.11955-1-lja@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 -- v1 ------------------------------------------------------------
 send, 20ms apart, control messages, if error is timeout.

 There is multiple reports of random behaviour of USB HID devices.

 I have mouse that acts sometimes quite randomly, I debugged with
 logs others have published that there is HW timeouts that leave
 device in state that it is errorneus.

 To fix this I introduced retry mechanism in root of USB HID drivers.

 Fix does not slow down operations at all if there is no -ETIMEDOUT
 got from control message sending. If there is one, then sleep 20ms
 and try again. Retry count is 20 witch translates maximum of 400ms
 before giving up.

 NOTE: This does not sleep anymore then before, if all is golden.

 -- v2 ------------------------------------------------------------

 If there is timeout, then sleep 20ms and try again. Retry count is 20
 witch translates maximum of 400ms before giving up. If the 400ms
 boundary is reached the HW is really bad.

 JUST to be clear:
     This does not make USB HID devices to sleep anymore than
     before, if all is golden.

 Why modify usb-core: No need to modify driver by driver.

 -- v3 ------------------------------------------------------------

 Timeout given is divided by 100, but taken care that it is always
 at least 10ms.

 so total time in common worst-case-scenario is:

  sleep of 20ms + common timeout divided by 100 (50ms) makes
  70ms per loop, 20 loops => 1.4sec .

 -- v4 ------------------------------------------------------------
 No changes in code, just elaborating what is done in v[1,2,3].

 -- v5 ------------------------------------------------------------
 changes in code: what the build robot found:
    drivers/usb/core/message.c: In function 'usb_control_msg':
 >> drivers/usb/core/message.c:173:11: error: type defaults to
    'int' in declaration of 'timeout_happened' [-Werror=implicit-int]

        static timeout_happened = 0;
               ^~~~~~~~~~~~~~~~
    cc1: some warnings being treated as errors

 -- v6 ------------------------------------------------------------
 Moved and simplified code from usb/core to hid/usbhid/hid-core.

 Made wrapper function to handle actual usb_control_msg() call.

 Timeout is now divided by constant, witch is loop iteration
 count. This way the timeout is kept what user have requested,
 and no additional time is spent.

Signed-off-by: Lauri Jakku <lja@iki.fi>

USB: HID: random timeout failures tackle try.

 -- v1 ------------------------------------------------------------
 send, 20ms apart, control messages, if error is timeout.

 There is multiple reports of random behaviour of USB HID devices.

 I have mouse that acts sometimes quite randomly, I debugged with
 logs others have published that there is HW timeouts that leave
 device in state that it is errorneus.

 To fix this I introduced retry mechanism in root of USB HID drivers.

 Fix does not slow down operations at all if there is no -ETIMEDOUT
 got from control message sending. If there is one, then sleep 20ms
 and try again. Retry count is 20 witch translates maximum of 400ms
 before giving up.

 NOTE: This does not sleep anymore then before, if all is golden.

 -- v2 ------------------------------------------------------------

 If there is timeout, then sleep 20ms and try again. Retry count is 20
 witch translates maximum of 400ms before giving up. If the 400ms
 boundary is reached the HW is really bad.

 JUST to be clear:
     This does not make USB HID devices to sleep anymore than
     before, if all is golden.

 Why modify usb-core: No need to modify driver by driver.


 Timeout given is divided by 100, but taken care that it is always
 at least 10ms.

 so total time in common worst-case-scenario is:

  sleep of 20ms + common timeout divided by 100 (50ms) makes
  70ms per loop, 20 loops => 1.4sec .

 -- v4 ------------------------------------------------------------
 No changes in code, just elaborating what is done in v[1,2,3].

 -- v5 ------------------------------------------------------------
 changes in code: what the build robot found:
    drivers/usb/core/message.c: In function 'usb_control_msg':
 >> drivers/usb/core/message.c:173:11: error: type defaults to
    'int' in declaration of 'timeout_happened' [-Werror=implicit-int]

        static timeout_happened = 0;
               ^~~~~~~~~~~~~~~~
    cc1: some warnings being treated as errors

 -- v6 ------------------------------------------------------------
 Moved and simplified code from usb/core to hid/usbhid/hid-core.

 Made wrapper function to handle actual usb_control_msg() call.

 Timeout is now divided by constant, witch is loop iteration
 count. This way the timeout is kept what user have requested,
 and no additional time is spent.

Signed-off-by: Lauri Jakku <lja@iki.fi>
---
 drivers/hid/usbhid/hid-core.c | 35 +++++++++++++++++++++++++++++++----
 drivers/hid/usbhid/usbhid.h   |  4 ++++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..d1f9668df42b 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -75,6 +75,33 @@ static void hid_io_error(struct hid_device *hid);
 static int hid_submit_out(struct hid_device *hid);
 static int hid_submit_ctrl(struct hid_device *hid);
 static void hid_cancel_delayed_stuff(struct usbhid_device *usbhid);
+static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
+				_u8 request, __u8 requesttype, __u16 value,
+				__u16 index, void *data, __u16 size,
+				int timeout);
+
+/* Wrapper function to send control messages */
+static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
+				_u8 request, __u8 requesttype, __u16 value,
+				__u16 index, void *data, __u16 size,
+				int timeout)
+{
+	/* calculate timeout per call, to archieve total timeout requested */
+	int call_timeout = USBHID_CONTROL_COMMAND_TIMEOUT_CALC(timeout);
+	int call_count   = USBHID_CONTROL_COMMAND_RETRY_COUNT;
+	int ret;
+	int timeout_looping;
+
+	do {
+		ret = usb_control_msg(dev, pipe, request, requesttype,
+				value, index, data, size, call_timeout);
+
+		timeout_looping =	(call_count-- > 0) &&
+					(ret = -ETIMEDOUT);
+	} while (timeout_looping);
+
+	return ret;
+}
 
 /* Start up the input URB */
 static int hid_start_in(struct hid_device *hid)
@@ -656,7 +683,7 @@ static int usbhid_wait_io(struct hid_device *hid)
 
 static int hid_set_idle(struct usb_device *dev, int ifnum, int report, int idle)
 {
-	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	return usbhid_control_msg(dev, usb_sndctrlpipe(dev, 0),
 		HID_REQ_SET_IDLE, USB_TYPE_CLASS | USB_RECIP_INTERFACE, (idle << 8) | report,
 		ifnum, NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
@@ -669,7 +696,7 @@ static int hid_get_class_descriptor(struct usb_device *dev, int ifnum,
 	memset(buf, 0, size);
 
 	do {
-		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
+		result = usbhid_control_msg(dev, usb_rcvctrlpipe(dev, 0),
 				USB_REQ_GET_DESCRIPTOR, USB_RECIP_INTERFACE | USB_DIR_IN,
 				(type << 8), ifnum, buf, size, USB_CTRL_GET_TIMEOUT);
 		retries--;
@@ -877,7 +904,7 @@ static int usbhid_get_raw_report(struct hid_device *hid,
 		count--;
 		skipped_report_id = 1;
 	}
-	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
+	ret = usbhid_control_msg(dev, usb_rcvctrlpipe(dev, 0),
 		HID_REQ_GET_REPORT,
 		USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 		((report_type + 1) << 8) | report_number,
@@ -914,7 +941,7 @@ static int usbhid_set_raw_report(struct hid_device *hid, unsigned int reportnum,
 		skipped_report_id = 1;
 	}
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	ret = usbhid_control_msg(dev, usb_sndctrlpipe(dev, 0),
 			HID_REQ_SET_REPORT,
 			USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			((rtype + 1) << 8) | reportnum,
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 8620408bd7af..f72ac754eb31 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -48,6 +48,10 @@ struct usb_interface *usbhid_find_interface(int minor);
  */
 #define HID_IN_POLLING		14
 
+#define USBHID_CONTROL_COMMAND_RETRY_COUNT			10
+#define USBHID_CONTROL_COMMAND_TIMEOUT_CALC(TotalTimeoutInMS) \
+		((TotalTimeoutInMS) / USBHID_CONTROL_COMMAND_RETRY_COUNT)
+
 /*
  * USB-specific HID struct, to be pointed to
  * from struct hid_device->driver_data
-- 
2.25.0
