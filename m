From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Mar 2014 11:19:57 +0000
Subject: [patch 1/2] usb: dwc3: gadget: cut and paste fixups in suspend/resume
Message-Id: <20140307111957.GC2351@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These were cut and paste from the ->disconnect function.

Fixes: 30d577b9bcc4 ('usb: dwc3: gadget: call gadget driver's ->suspend/->resume')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index eaf853721fec..95b9eae05617 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2066,7 +2066,7 @@ static void dwc3_disconnect_gadget(struct dwc3 *dwc)
 
 static void dwc3_suspend_gadget(struct dwc3 *dwc)
 {
-	if (dwc->gadget_driver && dwc->gadget_driver->disconnect) {
+	if (dwc->gadget_driver && dwc->gadget_driver->suspend) {
 		spin_unlock(&dwc->lock);
 		dwc->gadget_driver->suspend(&dwc->gadget);
 		spin_lock(&dwc->lock);
@@ -2075,7 +2075,7 @@ static void dwc3_suspend_gadget(struct dwc3 *dwc)
 
 static void dwc3_resume_gadget(struct dwc3 *dwc)
 {
-	if (dwc->gadget_driver && dwc->gadget_driver->disconnect) {
+	if (dwc->gadget_driver && dwc->gadget_driver->resume) {
 		spin_unlock(&dwc->lock);
 		dwc->gadget_driver->resume(&dwc->gadget);
 		spin_lock(&dwc->lock);
