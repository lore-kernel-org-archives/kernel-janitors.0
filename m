From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 23 Jun 2005 10:33:17 +0000
Subject: [KJ] [PATCH 2/2] sb16_csp: untypedef
Message-Id: <200506231433.17485.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81592257856881067=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81592257856881067==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 sound/isa/sb/sb16_csp.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

Index: linux-sparse/sound/isa/sb/sb16_csp.c
===================================================================
--- linux-sparse.orig/sound/isa/sb/sb16_csp.c	2005-06-23 14:13:55.000000000 +0400
+++ linux-sparse/sound/isa/sb/sb16_csp.c	2005-06-23 14:17:14.000000000 +0400
@@ -54,20 +54,20 @@ MODULE_LICENSE("GPL");
 /*
  * RIFF data format
  */
-typedef struct riff_header {
+struct riff_header {
 	__u32 name;
 	__u32 len;
-} riff_header_t;
+};
 
-typedef struct desc_header {
-	riff_header_t info;
+struct desc_header {
+	struct riff_header info;
 	__u16 func_nr;
 	__u16 VOC_type;
 	__u16 flags_play_rec;
 	__u16 flags_16bit_8bit;
 	__u16 flags_stereo_mono;
 	__u16 flags_rates;
-} desc_header_t;
+};
 
 /*
  * prototypes
@@ -300,9 +300,9 @@ static int snd_sb_csp_riff_load(snd_sb_c
 	unsigned char __user *data_end;
 	unsigned short func_nr = 0;
 
-	riff_header_t file_h, item_h, code_h;
+	struct riff_header file_h, item_h, code_h;
 	__u32 item_type;
-	desc_header_t funcdesc_h;
+	struct desc_header funcdesc_h;
 
 	unsigned long flags;
 	int err;

--===============81592257856881067==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81592257856881067==--
