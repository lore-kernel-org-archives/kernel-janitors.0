From: Zachary Richey <zr.public@gmail.com>
Date: Tue, 11 May 2010 18:13:49 +0000
Subject: [PATCH 2/2] Staging: wlan-ng: Fixed non static functions in prism2fw.c
Message-Id: <18a8de485e018309d5e2d58d998446e128c17d4b.1273600945.git.zr.public@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed non static functions in prism2fw.c

Signed-off-by: Zachary Richey <zr.public@gmail.com>
---
 drivers/staging/wlan-ng/prism2fw.c |   33 +++++++++++++++++++++------------
 1 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index d383ea8..fc2d8f4 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -160,21 +160,30 @@ hfa384x_caplevel_t priid;
 /*================================*/
 /* Local Function Declarations */
 
-int prism2_fwapply(const struct ihex_binrec *rfptr, wlandevice_t *wlandev);
-int read_fwfile(const struct ihex_binrec *rfptr);
-int mkimage(imgchunk_t *clist, unsigned int *ccnt);
-int read_cardpda(pda_t *pda, wlandevice_t *wlandev);
-int mkpdrlist(pda_t *pda);
-int plugimage(imgchunk_t *fchunk, unsigned int nfchunks,
+static int prism2_fwapply(const struct ihex_binrec *rfptr,
+wlandevice_t *wlandev);
+
+static int read_fwfile(const struct ihex_binrec *rfptr);
+
+static int mkimage(imgchunk_t *clist, unsigned int *ccnt);
+
+static int read_cardpda(pda_t *pda, wlandevice_t *wlandev);
+
+static int mkpdrlist(pda_t *pda);
+
+static int plugimage(imgchunk_t *fchunk, unsigned int nfchunks,
 	      s3plugrec_t *s3plug, unsigned int ns3plug, pda_t * pda);
-int crcimage(imgchunk_t *fchunk, unsigned int nfchunks,
+
+static int crcimage(imgchunk_t *fchunk, unsigned int nfchunks,
 	     s3crcrec_t *s3crc, unsigned int ns3crc);
-int writeimage(wlandevice_t *wlandev, imgchunk_t *fchunk,
+
+static int writeimage(wlandevice_t *wlandev, imgchunk_t *fchunk,
 	       unsigned int nfchunks);
-void free_chunks(imgchunk_t *fchunk, unsigned int *nfchunks);
-void free_srecs(void);
+static void free_chunks(imgchunk_t *fchunk, unsigned int *nfchunks);
+
+static void free_srecs(void);
 
-int validate_identity(void);
+static int validate_identity(void);
 
 /*================================*/
 /* Function Definitions */
@@ -255,7 +264,7 @@ int prism2_fwapply(const struct ihex_binrec *rfptr, wlandevice_t *wlandev)
 	/* clear the pda and add an initial END record */
 	memset(&pda, 0, sizeof(pda));
 	pda.rec[0] = (hfa384x_pdrec_t *) pda.buf;
-	pda.rec[0]->len = cpu_to_le16(2);	/* len in words *//* len in words */
+	pda.rec[0]->len = cpu_to_le16(2);	/* len in words */
 	pda.rec[0]->code = cpu_to_le16(HFA384x_PDR_END_OF_PDA);
 	pda.nrec = 1;
 
-- 
1.6.3.3

