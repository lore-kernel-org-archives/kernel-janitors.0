From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 19:44:00 +0000
Subject: [KJ] [PATCH] sound/korg1212: remove sleep_on*() usage
Message-Id: <20050126194400.GF3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56064500901479342=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56064500901479342==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated
sleep_on_timeout(). Since the sleep in this function is unconditional,
wait_event_timeout() does not appear to be appropriate. Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/sound/pci/korg1212/korg1212.c	2005-01-24 09:34:24.000000000 -0800
+++ 2.6.11-rc2-kj/sound/pci/korg1212/korg1212.c	2005-01-26 10:50:44.000000000 -0800
@@ -620,11 +620,14 @@ static void snd_korg1212_SendStop(korg12
 
 static void snd_korg1212_SendStopAndWait(korg1212_t *korg1212)
 {
+	DEFINE_WAIT(wait);
 	unsigned long flags;
 	spin_lock_irqsave(&korg1212->lock, flags);
 	snd_korg1212_SendStop(korg1212);
 	spin_unlock_irqrestore(&korg1212->lock, flags);
-	sleep_on_timeout(&korg1212->wait, (HZ * 3) / 2);
+	prepare_to_wait(&korg1212->wait, &wait, TASK_UNINTERRUPTIBLE);
+	schedule_timeout((HZ * 3) / 2);
+	finish_wait(&korg1212->wait, &wait);
 }
 
 /* timer callback for checking the ack of stop request */
@@ -1243,7 +1246,8 @@ static irqreturn_t snd_korg1212_interrup
 
 static int snd_korg1212_downloadDSPCode(korg1212_t *korg1212)
 {
-
+	DEFINE_WAIT(wait);
+	unsigned long i;
 #if K1212_DEBUG_LEVEL > 0
         K1212_DEBUG_PRINTK("K1212_DEBUG: DSP download is starting... [%s]\n", stateName[korg1212->cardState]);
 #endif
@@ -1267,9 +1271,12 @@ static int snd_korg1212_downloadDSPCode(
 	if (rc) K1212_DEBUG_PRINTK("K1212_DEBUG: Start DSP Download RC = %d [%s]\n", rc, stateName[korg1212->cardState]);
 #endif
 
-	if (! sleep_on_timeout(&korg1212->wait, HZ * CARD_BOOT_TIMEOUT))
+	prepare_to_wait(&korg1212->wait, &wait, TASK_UNINTERRUPTIBLE);
+	i = schedule_timeout(HZ * CARD_BOOT_TIMEOUT);
+	finish_wait(&korg1212->wait, &wait);
+	if (i == 0) 
 		return -EBUSY; /* timeout */
-
+	
 	snd_korg1212_OnDSPDownloadComplete(korg1212);
 
         return 0;

--===============56064500901479342==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56064500901479342==--
