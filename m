From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 08:57:25 +0000
Subject: [PATCH] thunderbolt: remove redundant variable 'approved'
Message-Id: <20180713085725.32099-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'approved' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'approved' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thunderbolt/icm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 500911f16498..2f50bc6a35fd 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -650,7 +650,6 @@ icm_fr_xdomain_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 	struct tb_xdomain *xd;
 	struct tb_switch *sw;
 	u8 link, depth;
-	bool approved;
 	u64 route;
 
 	/*
@@ -664,7 +663,6 @@ icm_fr_xdomain_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 	link = pkg->link_info & ICM_LINK_INFO_LINK_MASK;
 	depth = (pkg->link_info & ICM_LINK_INFO_DEPTH_MASK) >>
 		ICM_LINK_INFO_DEPTH_SHIFT;
-	approved = pkg->link_info & ICM_LINK_INFO_APPROVED;
 
 	if (link > ICM_MAX_LINK || depth > ICM_MAX_DEPTH) {
 		tb_warn(tb, "invalid topology %u.%u, ignoring\n", link, depth);
-- 
2.17.1

