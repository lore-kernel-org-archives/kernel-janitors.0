From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:35:00 +0000
Subject: [KJ] [patch 8/8] ifdef typos: sound_isa_es18xx.c
Message-Id: <20041124153500.GH14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53698131346645461=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53698131346645461==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changed CONFIG_PNP_ to CONFIG_PNP, also fixed a comment related to
another CONFIG_PNP.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/sound/isa/es18xx.c	2004-11-15 13:42:23.000000000 +0100
+++ str2/sound/isa/es18xx.c	2004-11-24 15:58:25.000000000 +0100
@@ -1849,7 +1849,7 @@ static int enable[SNDRV_CARDS] = SNDRV_D
 static int isapnp[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1};
 #endif
 static long port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;	/* 0x220,0x240,0x260,0x280 */
-#ifndef CONFIG_PNP_
+#ifndef CONFIG_PNP
 static long mpu_port[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -1};
 #else
 static long mpu_port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
@@ -1988,7 +1988,7 @@ static int __devinit snd_audiodrive_pnp(
 	kfree(cfg);
 	return 0;
 }
-#endif /* CONFIG_PNP_ */
+#endif /* CONFIG_PNP */
 
 static int __devinit snd_audiodrive_probe(int dev, struct pnp_card_link *pcard,
 					  const struct pnp_card_device_id *pid)

--===============53698131346645461==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53698131346645461==--
