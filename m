From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 21:36:00 +0000
Subject: [PATCH 7/9][v2] mISDN: comment out unused symbols
Message-Id: <49419a3b.0aec660a.2b49.7900@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Karsten Keil <kkeil@suse.de>

Fix this sparse warnings:

  drivers/isdn/hardware/mISDN/hfcmulti.c:794: warning: 'vpm_check' defined but not used
  drivers/isdn/mISDN/dsp_cmx.c:1546: warning: 'dsp_start_jiffies' defined but not used

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
Acked-by: Karsten Keil <kkeil@suse.de>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c |    2 ++
 drivers/isdn/mISDN/dsp_cmx.c           |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 970201d..0668072 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -788,6 +788,7 @@ vpm_init(struct hfc_multi *wc)
 	}
 }
 
+#ifdef UNUSED
 static void
 vpm_check(struct hfc_multi *hctmp)
 {
@@ -798,6 +799,7 @@ vpm_check(struct hfc_multi *hctmp)
 	if ((gpi2 & 0x3) != 0x3)
 		printk(KERN_DEBUG "Got interrupt 0x%x from VPM!\n", gpi2);
 }
+#endif /* UNUSED */
 
 
 /*
diff --git a/drivers/isdn/mISDN/dsp_cmx.c b/drivers/isdn/mISDN/dsp_cmx.c
index e868c47..c884511 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -1543,7 +1543,9 @@ send_packet:
 static u32	samplecount;
 struct timer_list dsp_spl_tl;
 u32	dsp_spl_jiffies; /* calculate the next time to fire */
+#ifdef UNUSED
 static u32	dsp_start_jiffies; /* jiffies at the time, the calculation begins */
+#endif /* UNUSED */
 static struct timeval dsp_start_tv; /* time at start of calculation */
 
 void
-- 
1.5.6.3

