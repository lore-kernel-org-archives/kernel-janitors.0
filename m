From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Oct 2017 11:52:12 +0000
Subject: [PATCH] drivers: hv: balloon: remove extraneous assignment to region_start
Message-Id: <20171018115212.29111-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, devel@linuxdriverproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable region_start is assigned twice, the first value is
never read and redundant, so can be removed.  We can clean up the
code further by assigning rg_start directly rather than using the
temporary variable region_start which can then be removed. Cleans
up the clang warning:

drivers/hv/hv_balloon.c:976:3: warning: Value stored to 'region_start'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hv/hv_balloon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index db0e6652d7ef..54e1ab3d5bad 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -964,7 +964,6 @@ static void hot_add_req(struct work_struct *dummy)
 
 	if ((rg_start = 0) && (!dm->host_specified_ha_region)) {
 		unsigned long region_size;
-		unsigned long region_start;
 
 		/*
 		 * The host has not specified the hot-add region.
@@ -973,14 +972,11 @@ static void hot_add_req(struct work_struct *dummy)
 		 * that need to be hot-added while ensuring the alignment
 		 * and size requirements of Linux as it relates to hot-add.
 		 */
-		region_start = pg_start;
 		region_size = (pfn_cnt / HA_CHUNK) * HA_CHUNK;
 		if (pfn_cnt % HA_CHUNK)
 			region_size += HA_CHUNK;
 
-		region_start = (pg_start / HA_CHUNK) * HA_CHUNK;
-
-		rg_start = region_start;
+		rg_start = (pg_start / HA_CHUNK) * HA_CHUNK;
 		rg_sz = region_size;
 	}
 
-- 
2.14.1

