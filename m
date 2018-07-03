From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 07:23:05 +0000
Subject: [PATCH] sgi-xp: remove redundant pointers ch and rp
Message-Id: <20180703072305.29169-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cliff Whickman <cpw@sgi.com>, Robin Holt <robinmholt@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointers ch and rp are set but are never used hence they are
redundant and can be removed.

Cleans up clang warnings:
warning: variable 'ch' set but not used [-Wunused-but-set-variable]
warning: variable 'rp' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/sgi-xp/xpc_channel.c   | 3 ---
 drivers/misc/sgi-xp/xpc_partition.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_channel.c b/drivers/misc/sgi-xp/xpc_channel.c
index 128d5615c804..05a890ce2ab8 100644
--- a/drivers/misc/sgi-xp/xpc_channel.c
+++ b/drivers/misc/sgi-xp/xpc_channel.c
@@ -656,7 +656,6 @@ xpc_initiate_connect(int ch_number)
 {
 	short partid;
 	struct xpc_partition *part;
-	struct xpc_channel *ch;
 
 	DBUG_ON(ch_number < 0 || ch_number >= XPC_MAX_NCHANNELS);
 
@@ -664,8 +663,6 @@ xpc_initiate_connect(int ch_number)
 		part = &xpc_partitions[partid];
 
 		if (xpc_part_ref(part)) {
-			ch = &part->channels[ch_number];
-
 			/*
 			 * Initiate the establishment of a connection on the
 			 * newly registered channel to the remote partition.
diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
index 7284413dabfd..4e59b01ad7eb 100644
--- a/drivers/misc/sgi-xp/xpc_partition.c
+++ b/drivers/misc/sgi-xp/xpc_partition.c
@@ -415,7 +415,6 @@ xpc_discovery(void)
 	int region_size;
 	int max_regions;
 	int nasid;
-	struct xpc_rsvd_page *rp;
 	unsigned long *discovered_nasids;
 	enum xp_retval ret;
 
@@ -432,8 +431,6 @@ xpc_discovery(void)
 		return;
 	}
 
-	rp = (struct xpc_rsvd_page *)xpc_rsvd_page;
-
 	/*
 	 * The term 'region' in this context refers to the minimum number of
 	 * nodes that can comprise an access protection grouping. The access
-- 
2.17.1

