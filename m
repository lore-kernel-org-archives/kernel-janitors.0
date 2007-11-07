From: Nicolas Kaiser <nikai@nikai.net>
Date: Wed, 07 Nov 2007 10:38:53 +0000
Subject: [PATCH] sound/pci: remove line duplications in defines
Message-Id: <20071107113853.2da183d4@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove line duplications in defines.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 sound/pci/ca0106/ca0106.h |    1 -
 sound/pci/maestro3.c      |    1 -
 2 files changed, 2 deletions(-)

diff -ur a/sound/pci/ca0106/ca0106.h b/sound/pci/ca0106/ca0106.h
--- a/sound/pci/ca0106/ca0106.h	2007-11-07 11:26:35.000000000 +0100
+++ b/sound/pci/ca0106/ca0106.h	2007-11-07 11:29:05.000000000 +0100
@@ -272,7 +272,6 @@
 #define SPCS_WORD_LENGTH_20A	0x0000000a	/* Word Length 20 bit				*/
 #define SPCS_WORD_LENGTH_20	0x00000009	/* Word Length 20 bit (both 0xa and 0x9 are 20 bit) */
 #define SPCS_WORD_LENGTH_21	0x00000007	/* Word Length 21 bit				*/
-#define SPCS_WORD_LENGTH_21	0x00000007	/* Word Length 21 bit				*/
 #define SPCS_WORD_LENGTH_22	0x00000005	/* Word Length 22 bit				*/
 #define SPCS_WORD_LENGTH_23	0x00000003	/* Word Length 23 bit				*/
 #define SPCS_WORD_LENGTH_24	0x0000000b	/* Word Length 24 bit				*/
diff -ur a/sound/pci/maestro3.c b/sound/pci/maestro3.c
--- a/sound/pci/maestro3.c	2007-11-07 11:26:36.000000000 +0100
+++ b/sound/pci/maestro3.c	2007-11-07 11:29:06.000000000 +0100
@@ -732,7 +732,6 @@
 
 #define MINISRC_IN_BUFFER_SIZE   ( 0x50 * 2 )
 #define MINISRC_OUT_BUFFER_SIZE  ( 0x50 * 2 * 2)
-#define MINISRC_OUT_BUFFER_SIZE  ( 0x50 * 2 * 2)
 #define MINISRC_TMP_BUFFER_SIZE  ( 112 + ( MINISRC_BIQUAD_STAGE * 3 + 4 ) * 2 * 2 )
 #define MINISRC_BIQUAD_STAGE    2
 #define MINISRC_COEF_LOC          0x175
