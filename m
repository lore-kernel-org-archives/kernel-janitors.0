From: Tomas Winkler <tomas.winkler@intel.com>
Date: Sun, 19 Aug 2012 16:20:54 +0000
Subject: [staging-next] ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <1345393254-6060-1-git-send-email-tomas.winkler@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"addr" is a pointer so it's either 4 or 8 bytes, but actually we want
to compare 6 bytes (ETH_ALEN).

As network stack already provides helper function
is_zero_ether_addr() we use that instead of memcmp

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rupesh Gujare <rgujare@ozmodevices.com>
---
V1: by Dan Carpenter <dan.carpenter@oracle.com>
V2: replace memcmp with is_zero_ether_addr

 drivers/staging/ozwpan/ozcdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/ozwpan/ozcdev.c b/drivers/staging/ozwpan/ozcdev.c
index d983219..77c4104 100644
--- a/drivers/staging/ozwpan/ozcdev.c
+++ b/drivers/staging/ozwpan/ozcdev.c
@@ -213,7 +213,7 @@ static int oz_set_active_pd(u8 *addr)
 		if (old_pd)
 			oz_pd_put(old_pd);
 	} else {
-		if (!memcmp(addr, "\0\0\0\0\0\0", sizeof(addr))) {
+		if (is_zero_ether_addr(addr)) {
 			spin_lock_bh(&g_cdev.lock);
 			pd = g_cdev.active_pd;
 			g_cdev.active_pd = 0;
-- 
1.7.4.4

