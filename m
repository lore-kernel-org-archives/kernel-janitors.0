From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Mar 2006 05:19:57 +0000
Subject: [KJ][Patch]  alter assert in dsp_spos_scb_lib.c
Message-Id: <1141795197.8503.28.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5879335001696071=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5879335001696071==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

Coverity complains about an 'overrun-local' @ line 1485 of
dsp_spos_scb_lib.c.

This is due to an incorrect assertion previously.
The patch below just alters the assert so it will catch the +1 overrun.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/sound/pci/cs46xx/dsp_spos_scb_lib.c.orig	2006-03-08 16:02:21.000000000 +1100
+++ linux-2.6.16-rc5/sound/pci/cs46xx/dsp_spos_scb_lib.c	2006-03-08 16:04:44.000000000 +1100
@@ -1479,7 +1479,7 @@ void cs46xx_dsp_destroy_pcm_channel (str
 	if (!pcm_channel->src_scb->ref_count) {
 		cs46xx_dsp_remove_scb(chip,pcm_channel->src_scb);
 
-		snd_assert (pcm_channel->src_slot >= 0 && pcm_channel->src_slot <= DSP_MAX_SRC_NR,
+		snd_assert (pcm_channel->src_slot >= 0 && pcm_channel->src_slot < DSP_MAX_SRC_NR,
 			    return );
 
 		ins->src_scb_slots[pcm_channel->src_slot] = 0;



--===============5879335001696071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5879335001696071==--
