From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:34:27 +0000
Subject: [KJ] [patch 7/8] ifdef typos: sound_isa_cs423x_cs4231_lib.c
Message-Id: <20041124153427.GG14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70294456231104174=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70294456231104174==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Funny typo.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/sound/isa/cs423x/cs4231_lib.c	2004-10-19 13:53:23.000000000 +0200
+++ str2/sound/isa/cs423x/cs4231_lib.c	2004-11-24 15:24:27.000000000 +0100
@@ -694,7 +694,7 @@ static void snd_cs4231_init(cs4231_t *ch
 
 	snd_cs4231_mce_down(chip);
 
-#ifdef SNDRV_DEBUGq_MCE
+#ifdef SNDRV_DEBUG_MCE
 	snd_printk("init: (1)\n");
 #endif
 	snd_cs4231_mce_up(chip);

--===============70294456231104174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70294456231104174==--
