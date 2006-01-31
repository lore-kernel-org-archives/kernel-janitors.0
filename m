From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:59:22 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in sound/sparc/cs4231.c
Message-Id: <1138730363.13327.19.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============084669541269738025=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============084669541269738025==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/sound/sparc/cs4231.c.orig	2006-01-31 14:14:04.000000000 +0100
+++ linux-2.6.16-rc1-git4/sound/sparc/cs4231.c	2006-01-31 14:14:28.000000000 +0100
@@ -610,8 +610,7 @@ static void snd_cs4231_advance_dma(struc
 		unsigned int period_size = snd_pcm_lib_period_bytes(substream);
 		unsigned int offset = period_size * (*periods_sent);
 
-		if (period_size >= (1 << 24))
-			BUG();
+		BUG_ON(period_size >= (1 << 24));
 
 		if (dma_cont->request(dma_cont, runtime->dma_addr + offset, period_size))
 			return;
@@ -1078,8 +1077,7 @@ static int snd_cs4231_playback_prepare(s
 	chip->image[CS4231_IFACE_CTRL] &= ~(CS4231_PLAYBACK_ENABLE |
 					    CS4231_PLAYBACK_PIO);
 
-	if (runtime->period_size > 0xffff + 1)
-		BUG();
+	BUG_ON(runtime->period_size > 0xffff + 1);
 
 	chip->p_periods_sent = 0;
 	spin_unlock_irqrestore(&chip->lock, flags);



--===============084669541269738025==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============084669541269738025==--
