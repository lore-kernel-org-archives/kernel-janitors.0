From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 27 Jan 2005 00:20:58 +0000
Subject: [KJ] [PATCH] media/saa7110: remove sleep_on*() usage
Message-Id: <20050127002058.GA16171@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25138312724134071=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050126194511.GG3593@us.ibm.com>
In-Reply-To: <20050126194511.GG3593@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============25138312724134071==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The author of the driver requested I send the patch on the mjpeg maintainer &
list. Please consider applying.

Description: Directly use wait-queues instead of the deprecated
sleep_on_timeout(). Since the sleep in this function is unconditional,
wait_event_timeout() does not appear to be appropriate. Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/media/video/saa7110.c	2005-01-24 09:34:08.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/saa7110.c	2005-01-26 10:42:51.000000000 -0800
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 
@@ -205,13 +206,16 @@ static const unsigned char initseq[] = {
 static int
 determine_norm (struct i2c_client *client)
 {
+	DEFINE_WAIT(wait);
 	struct saa7110 *decoder = i2c_get_clientdata(client);
 	int status;
 
 	/* mode changed, start automatic detection */
 	saa7110_write_block(client, initseq, sizeof(initseq));
 	saa7110_selmux(client, decoder->input);
-	sleep_on_timeout(&decoder->wq, HZ / 4);
+	prepare_to_wait(&decoder->wq, &wait, TASK_UNINTERRUPTIBLE);
+	schedule_timeout(HZ/4);
+	finish_wait(&decoder->wq, &wait);
 	status = saa7110_read(client);
 	if (status & 0x40) {
 		dprintk(1, KERN_INFO "%s: status=0x%02x (no signal)\n",
@@ -250,7 +254,9 @@ determine_norm (struct i2c_client *clien
 	saa7110_write(client, 0x11, 0x59);
 	//saa7110_write(client,0x2E,0x9A);
 
-	sleep_on_timeout(&decoder->wq, HZ / 4);
+	prepare_to_wait(&decoder->wq, &wait, TASK_UNINTERRUPTIBLE);
+	schedule_timeout(HZ/4);
+	finish_wait(&decoder->wq, &wait);
 
 	status = saa7110_read(client);
 	if ((status & 0x03) == 0x01) {

--===============25138312724134071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25138312724134071==--
