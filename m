From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:20:53 +0000
Subject: [KJ] [PATCH] drivers/scsi/qlogicfc.c : Use of the time_after() macro
Message-Id: <42D8B555.3050307@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060501050000060001000504"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060501050000060001000504
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------060501050000060001000504
Content-Type: text/x-patch;
 name="qlogicfc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="qlogicfc.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/qlogicfc.c	2005-07-13 17:53:34.000000000 -0300
+++ linux-kj/drivers/scsi/qlogicfc.c	2005-07-15 16:20:25.394712680 -0300
@@ -1327,7 +1327,8 @@
 		cmd->control_flags = cpu_to_le16(CFLAG_READ);
 
 	if (Cmnd->device->tagged_supported) {
-		if ((jiffies - hostdata->tag_ages[Cmnd->device->id]) > (2 * ISP_TIMEOUT)) {
+		if (time_after(jiffies, hostdata->tag_ages[Cmnd->device->id] 
+					+ (2 * ISP_TIMEOUT))) {
 			cmd->control_flags |= cpu_to_le16(CFLAG_ORDERED_TAG);
 			hostdata->tag_ages[Cmnd->device->id] = jiffies;
 		} else

--------------060501050000060001000504
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060501050000060001000504--
