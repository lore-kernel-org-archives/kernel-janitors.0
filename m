From: Colin King <colin.king@canonical.com>
Date: Wed, 08 May 2019 22:42:01 +0000
Subject: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <20190508224201.27120-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable tad_base is being set to a value that is never read
and is being over-written on the next iteration of a for-loop.
This assignment is therefore redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/edac/sb_edac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 9353c3fc7c05..6aa4b1b73a15 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -1513,7 +1513,6 @@ static int knl_get_dimm_capacity(struct sbridge_pvt *pvt, u64 *mc_sizes)
 						sad_actual_size[mc] += tad_size;
 					}
 				}
-				tad_base = tad_limit+1;
 			}
 		}
 
-- 
2.20.1
