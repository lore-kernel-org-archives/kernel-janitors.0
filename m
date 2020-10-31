From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sat, 31 Oct 2020 02:21:55 +0000
Subject: [PATCH] media: ipu3-cio2: fix trivial style warning
Message-Id: <20201031022155.GA32878@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yong.zhi@intel.com, trivial@kernel.org
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Comment has 'the' repeated twice. Let's clean it up.
This patch reduces checkpatch warnings for this file to nil.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4e598e937dfe..d4ff80ff7be0 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -286,7 +286,7 @@ static s32 cio2_rx_timing(s32 a, s32 b, s64 freq, int def)
 	return r;
 };
 
-/* Calculate the the delay value for termination enable of clock lane HS Rx */
+/* Calculate the delay value for termination enable of clock lane HS Rx */
 static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 				 struct cio2_csi2_timing *timing)
 {
-- 
2.28.0
