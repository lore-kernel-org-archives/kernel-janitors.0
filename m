From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 23 Jun 2005 10:32:48 +0000
Subject: [KJ] [PATCH 1/2] sb16_csp: remove home-grown le??_to_cpu macros
Message-Id: <200506231432.48530.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23312971004728267=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23312971004728267==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 sound/isa/sb/sb16_csp.c |   30 ++++++++++++++----------------
 1 files changed, 14 insertions(+), 16 deletions(-)

Index: linux-sparse/sound/isa/sb/sb16_csp.c
===================================================================
--- linux-sparse.orig/sound/isa/sb/sb16_csp.c	2005-06-23 00:56:36.000000000 +0400
+++ linux-sparse/sound/isa/sb/sb16_csp.c	2005-06-23 14:13:55.000000000 +0400
@@ -42,8 +42,6 @@ MODULE_LICENSE("GPL");
 #else
 #define CSP_HDR_VALUE(a,b,c,d)	((d) | ((c)<<8) | ((b)<<16) | ((a)<<24))
 #endif
-#define LE_SHORT(v)		le16_to_cpu(v)
-#define LE_INT(v)		le32_to_cpu(v)
 
 #define RIFF_HEADER	CSP_HDR_VALUE('R', 'I', 'F', 'F')
 #define CSP__HEADER	CSP_HDR_VALUE('C', 'S', 'P', ' ')
@@ -316,12 +314,12 @@ static int snd_sb_csp_riff_load(snd_sb_c
 	if (copy_from_user(&file_h, data_ptr, sizeof(file_h)))
 		return -EFAULT;
 	if ((file_h.name != RIFF_HEADER) ||
-	    (LE_INT(file_h.len) >= SNDRV_SB_CSP_MAX_MICROCODE_FILE_SIZE - sizeof(file_h))) {
+	    (le32_to_cpu(file_h.len) >= SNDRV_SB_CSP_MAX_MICROCODE_FILE_SIZE - sizeof(file_h))) {
 		snd_printd("%s: Invalid RIFF header\n", __FUNCTION__);
 		return -EINVAL;
 	}
 	data_ptr += sizeof(file_h);
-	data_end = data_ptr + LE_INT(file_h.len);
+	data_end = data_ptr + le32_to_cpu(file_h.len);
 
 	if (copy_from_user(&item_type, data_ptr, sizeof(item_type)))
 		return -EFAULT;
@@ -331,7 +329,7 @@ static int snd_sb_csp_riff_load(snd_sb_c
 	}
 	data_ptr += sizeof (item_type);
 
-	for (; data_ptr < data_end; data_ptr += LE_INT(item_h.len)) {
+	for (; data_ptr < data_end; data_ptr += le32_to_cpu(item_h.len)) {
 		if (copy_from_user(&item_h, data_ptr, sizeof(item_h)))
 			return -EFAULT;
 		data_ptr += sizeof(item_h);
@@ -344,7 +342,7 @@ static int snd_sb_csp_riff_load(snd_sb_c
 		case FUNC_HEADER:
 			if (copy_from_user(&funcdesc_h, data_ptr + sizeof(item_type), sizeof(funcdesc_h)))
 				return -EFAULT;
-			func_nr = LE_SHORT(funcdesc_h.func_nr);
+			func_nr = le16_to_cpu(funcdesc_h.func_nr);
 			break;
 		case CODE_HEADER:
 			if (func_nr != info.func_req)
@@ -370,11 +368,11 @@ static int snd_sb_csp_riff_load(snd_sb_c
 				if (code_h.name != INIT_HEADER)
 					break;
 				data_ptr += sizeof(code_h);
-				err = snd_sb_csp_load_user(p, data_ptr, LE_INT(code_h.len),
+				err = snd_sb_csp_load_user(p, data_ptr, le32_to_cpu(code_h.len),
 						      SNDRV_SB_CSP_LOAD_INITBLOCK);
 				if (err)
 					return err;
-				data_ptr += LE_INT(code_h.len);
+				data_ptr += le32_to_cpu(code_h.len);
 			}
 			/* main microcode block */
 			if (copy_from_user(&code_h, data_ptr, sizeof(code_h)))
@@ -386,17 +384,17 @@ static int snd_sb_csp_riff_load(snd_sb_c
 			}
 			data_ptr += sizeof(code_h);
 			err = snd_sb_csp_load_user(p, data_ptr,
-						   LE_INT(code_h.len), 0);
+						   le32_to_cpu(code_h.len), 0);
 			if (err)
 				return err;
 
 			/* fill in codec header */
 			strlcpy(p->codec_name, info.codec_name, sizeof(p->codec_name));
 			p->func_nr = func_nr;
-			p->mode = LE_SHORT(funcdesc_h.flags_play_rec);
-			switch (LE_SHORT(funcdesc_h.VOC_type)) {
+			p->mode = le16_to_cpu(funcdesc_h.flags_play_rec);
+			switch (le16_to_cpu(funcdesc_h.VOC_type)) {
 			case 0x0001:	/* QSound decoder */
-				if (LE_SHORT(funcdesc_h.flags_play_rec) == SNDRV_SB_CSP_MODE_DSP_WRITE) {
+				if (le16_to_cpu(funcdesc_h.flags_play_rec) == SNDRV_SB_CSP_MODE_DSP_WRITE) {
 					if (snd_sb_qsound_build(p) == 0)
 						/* set QSound flag and clear all other mode flags */
 						p->mode = SNDRV_SB_CSP_MODE_QSOUND;
@@ -426,12 +424,12 @@ static int snd_sb_csp_riff_load(snd_sb_c
 				p->mode = 0;
 				snd_printd("%s: Unsupported CSP codec type: 0x%04x\n",
 					   __FUNCTION__,
-					   LE_SHORT(funcdesc_h.VOC_type));
+					   le16_to_cpu(funcdesc_h.VOC_type));
 				return -EINVAL;
 			}
-			p->acc_channels = LE_SHORT(funcdesc_h.flags_stereo_mono);
-			p->acc_width = LE_SHORT(funcdesc_h.flags_16bit_8bit);
-			p->acc_rates = LE_SHORT(funcdesc_h.flags_rates);
+			p->acc_channels = le16_to_cpu(funcdesc_h.flags_stereo_mono);
+			p->acc_width = le16_to_cpu(funcdesc_h.flags_16bit_8bit);
+			p->acc_rates = le16_to_cpu(funcdesc_h.flags_rates);
 
 			/* Decouple CSP from IRQ and DMAREQ lines */
 			spin_lock_irqsave(&p->chip->reg_lock, flags);

--===============23312971004728267==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23312971004728267==--
