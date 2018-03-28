From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 23:07:05 +0000
Subject: [PATCH] ore: fix spelling mistake: "Multples" -> "multiples"
Message-Id: <20180328230705.28145-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boaz Harrosh <ooo@electrozaur.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ORE_ERR error message text and
make it all lowercase.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/exofs/ore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exofs/ore.c b/fs/exofs/ore.c
index 3c6a9c156b7a..0df0b6d25d06 100644
--- a/fs/exofs/ore.c
+++ b/fs/exofs/ore.c
@@ -68,7 +68,7 @@ int ore_verify_layout(unsigned total_comps, struct ore_layout *layout)
 	}
 	if (0 != (layout->stripe_unit & ~PAGE_MASK)) {
 		ORE_ERR("Stripe Unit(0x%llx)"
-			  " must be Multples of PAGE_SIZE(0x%lx)\n",
+			  " must be multiples of PAGE_SIZE(0x%lx)\n",
 			  _LLU(layout->stripe_unit), PAGE_SIZE);
 		return -EINVAL;
 	}
-- 
2.15.1

