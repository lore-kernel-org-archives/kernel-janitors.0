From: Amit Choudhary <amit2030@gmail.com>
Date: Mon, 16 Oct 2006 05:55:13 +0000
Subject: [KJ] [PATCH 2.6.19-rc2] drivers/usb/serial/mos7840.c: check
Message-Id: <20061015225513.f35312ec.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function mos7840_get_reg(), in file drivers/usb/serial/mos7840.c.

Signed-off-by: Amit Choudhary <amit2030@gmail.com>

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 021be39..91d474b 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -475,6 +475,14 @@ static int mos7840_get_reg(struct moschi
 	int ret = 0;
 	buffer = (__u8 *) mcs->ctrl_buf;
 
+	/* The memory for ctrl_buf is allocated in
+	 * mos7840_startup(), but it is not checked if
+	 * kmalloc failed. So, mcs->ctrl_buf might be NULL.
+	 * So, it should be checked here.
+	 */
+	if (!buffer)
+		return -ENOMEM;
+
 //      dr=(struct usb_ctrlrequest *)(buffer);
 	dr = (void *)(buffer + 2);
 	dr->bRequestType = MCS_RD_RTYPE;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
