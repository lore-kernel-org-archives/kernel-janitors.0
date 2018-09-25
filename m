From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 25 Sep 2018 02:36:04 +0000
Subject: [PATCH -next] EDAC: Remove set but not used variable 'type'
Message-Id: <1537842964-109749-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/edac/skx_edac.c: In function 'skx_mce_output_error':
drivers/edac/skx_edac.c:949:8: warning:
 variable 'type' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/edac/skx_edac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/skx_edac.c b/drivers/edac/skx_edac.c
index b2987ef..3ffdbc4 100644
--- a/drivers/edac/skx_edac.c
+++ b/drivers/edac/skx_edac.c
@@ -959,15 +959,11 @@ static void skx_mce_output_error(struct mem_ctl_info *mci,
 	recoverable = GET_BITFIELD(m->status, 56, 56);
 
 	if (uncorrected_error) {
-		if (ripv) {
-			type = "FATAL";
+		if (ripv)
 			tp_event = HW_EVENT_ERR_FATAL;
-		} else {
-			type = "NON_FATAL";
+		else
 			tp_event = HW_EVENT_ERR_UNCORRECTED;
-		}
 	} else {
-		type = "CORRECTED";
 		tp_event = HW_EVENT_ERR_CORRECTED;
 	}
