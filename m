From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:55:15 +0000
Subject: [Kernel-janitors] [PATCH] dvb/av7110_hw: replace schedule_timeout()
Message-Id: <20040726175515.GS1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============02805628184884057=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============02805628184884057==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/ttpci/av7110_hw.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/media/dvb/ttpci/av7110_hw.c	2004-07-02 20:25:30.000000000 +0000
@@ -106,7 +106,7 @@ void av7110_reset_arm(struct av7110 *av7
 	saa7146_write(av7110->dev, ISR, (MASK_19 | MASK_03));
 
 	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);
-	dvb_delay(30);	/* the firmware needs some time to initialize */
+	msleep(30);	/* the firmware needs some time to initialize */
 
 	ARM_ResetMailBox(av7110);
 
@@ -268,7 +268,7 @@ int av7110_bootarm(struct av7110 *av7110
 		return -1;
 	}
 	saa7146_setgpio(dev, RESET_LINE, SAA7146_GPIO_OUTHI);
-	dvb_delay(30);	/* the firmware needs some time to initialize */
+	msleep(30);	/* the firmware needs some time to initialize */
 
 	//ARM_ClearIrq(av7110);
 	ARM_ResetMailBox(av7110);
@@ -302,7 +302,7 @@ int __av7110_send_fw_cmd(struct av7110 *
 
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2 )) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_FREE)) {
 			printk(KERN_ERR "%s: timeout waiting for COMMAND idle\n", __FUNCTION__);
 			return -1;
@@ -312,7 +312,7 @@ int __av7110_send_fw_cmd(struct av7110 *
 #ifndef _NOHANDSHAKE
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2 )) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_SHAKE)) {
 			printk(KERN_ERR "%s: timeout waiting for HANDSHAKE_REG\n", __FUNCTION__);
 			return -1;
@@ -322,7 +322,7 @@ int __av7110_send_fw_cmd(struct av7110 *
 
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2) & OSDQFull) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_OSD)) {
 			printk(KERN_ERR "%s: timeout waiting for !OSDQFull\n", __FUNCTION__);
 			return -1;
@@ -341,7 +341,7 @@ int __av7110_send_fw_cmd(struct av7110 *
 #ifdef COM_DEBUG
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2 )) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_FREE)) {
 			printk(KERN_ERR "%s: timeout waiting for COMMAND to complete\n",
 			       __FUNCTION__);
@@ -458,7 +458,7 @@ int av7110_fw_request(struct av7110 *av7
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, COMMAND, 0, 2)) {
 #ifdef _NOHANDSHAKE
-		dvb_delay(1);
+		msleep(1);
 #endif
 		if (time_after(jiffies, start + ARM_WAIT_FREE)) {
 			printk("%s: timeout waiting for COMMAND to complete\n", __FUNCTION__);
@@ -470,7 +470,7 @@ int av7110_fw_request(struct av7110 *av7
 #ifndef _NOHANDSHAKE
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2 )) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_SHAKE)) {
 			printk(KERN_ERR "%s: timeout waiting for HANDSHAKE_REG\n", __FUNCTION__);
 			up(&av7110->dcomlock);
@@ -630,7 +630,7 @@ static int FlushText(struct av7110 *av71
 		return -ERESTARTSYS;
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, BUFF1_BASE, 0, 2)) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_OSD)) {
 			printk(KERN_ERR "%s: timeout waiting for BUFF1_BASE == 0\n",
 			       __FUNCTION__);
@@ -654,7 +654,7 @@ static int WriteText(struct av7110 *av71
 
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, BUFF1_BASE, 0, 2)) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_OSD)) {
 			printk(KERN_ERR "%s: timeout waiting for BUFF1_BASE == 0\n",
 			       __FUNCTION__);
@@ -665,7 +665,7 @@ static int WriteText(struct av7110 *av71
 #ifndef _NOHANDSHAKE
 	start = jiffies;
 	while (rdebi(av7110, DEBINOSWAP, HANDSHAKE_REG, 0, 2)) {
-		dvb_delay(1);
+		msleep(1);
 		if (time_after(jiffies, start + ARM_WAIT_SHAKE)) {
 			printk(KERN_ERR "%s: timeout waiting for HANDSHAKE_REG\n",
 			       __FUNCTION__);

--===============02805628184884057==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============02805628184884057==--
