From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:50:13 +0000
Subject: [KJ] [PATCH 13/20] sound/gus_pcm: remove
Message-Id: <20050202195013.GR2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86583511575973793=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86583511575973793==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() with
wait_event_timeout(). Code is not identical, as the current sleeping system is 1
jiffy at a time checking atomic_read()'s return every iteration. Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/sound/isa/gus/gus_pcm.c	2005-01-26 11:19:06.000000000 -0800
+++ 2.6.11-rc2-kj/sound/isa/gus/gus_pcm.c	2005-02-02 11:34:20.000000000 -0800
@@ -697,16 +697,10 @@ static int snd_gf1_pcm_playback_close(sn
 	snd_gus_card_t *gus = snd_pcm_substream_chip(substream);
 	snd_pcm_runtime_t *runtime = substream->runtime;
 	gus_pcm_private_t *pcmp = runtime->private_data;
-	unsigned long jiffies_old;
+	
+	if (!wait_event_timeout(pcmp->sleep, (atomic_read(&pcmp->dma_count) <= 0), 2*HZ))
+		snd_printk("gf1 pcm - serious DMA problem\n");
 
-	jiffies_old = jiffies;
-	while (atomic_read(&pcmp->dma_count) > 0) {
-		interruptible_sleep_on_timeout(&pcmp->sleep, 1);
-		if ((signed long)(jiffies - jiffies_old) > 2*HZ) {
-			snd_printk("gf1 pcm - serious DMA problem\n");
-			break;
-		}
-	}
 	snd_gf1_dma_done(gus);	
 	return 0;
 }

--===============86583511575973793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86583511575973793==--
