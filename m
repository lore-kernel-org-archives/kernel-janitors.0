From: <gregkh@suse.de>
Date: Tue, 10 Jul 2007 21:11:14 +0000
Subject: [KJ] patch
Message-Id: <20070710211134.AED7E14540CF@imap.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


This is a note to let you know that I've just added the patch titled

     Subject: USB: ohci-pnx4008: Remove unnecessary cast of return value of kzalloc

to my gregkh-2.6 tree.  Its filename is

     usb-ohci-pnx4008-remove-unnecessary-cast-of-return-value-of-kzalloc.patch

This tree can be found at 
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/


From kernel-janitors-bounces@lists.linux-foundation.org Thu Jun 28 10:16:37 2007
From: Suresh Jayaraman <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 11:16:30 -0600
Subject: USB: ohci-pnx4008: Remove unnecessary cast of return value of kzalloc
To: <kernel-janitors@lists.osdl.org>
Message-ID: <46843A46020000F40000A9BA@lucius.provo.novell.com>
Content-Disposition: inline


Remove unnecessary cast of return value of kzalloc() in
usb/host/ohci-pnx4008.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/usb/host/ohci-pnx4008.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/usb/host/ohci-pnx4008.c
+++ b/drivers/usb/host/ohci-pnx4008.c
@@ -134,7 +134,7 @@ static int isp1301_attach(struct i2c_ada
 {
 	struct i2c_client *c;
 
-	c = (struct i2c_client *)kzalloc(sizeof(*c), GFP_KERNEL);
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
 
 	if (!c)
 		return -ENOMEM;


Patches currently in gregkh-2.6 which might be from sjayaraman@novell.com are

usb/usb-ohci-pnx4008-remove-unnecessary-cast-of-return-value-of-kzalloc.patch
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
