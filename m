From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 15:21:49 +0000
Subject: [PATCH] md: fix compilation warning: left shift count >= width of type
Message-Id: <154e089b0811210721i35738ef3yf4f1cd5b340a6cf0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cheng Renquan <crquan@gmail.com>, NeilBrown <neilb@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following warnings:

drivers/md/md.c:1678: warning: left shift count >= width of type
drivers/md/md.c:1702: warning: left shift count >= width of type

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 include/linux/raid/md_p.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/raid/md_p.h b/include/linux/raid/md_p.h
index 269e147..9491026 100644
--- a/include/linux/raid/md_p.h
+++ b/include/linux/raid/md_p.h
@@ -194,7 +194,7 @@ static inline __u64 md_event(mdp_super_t *sb) {
 	return (ev<<32)| sb->events_lo;
 }

-#define MD_SUPERBLOCK_1_TIME_SEC_MASK ((1UL<<40) - 1)
+#define MD_SUPERBLOCK_1_TIME_SEC_MASK ((1ULL<<40) - 1)

 /*
  * The version-1 superblock :
