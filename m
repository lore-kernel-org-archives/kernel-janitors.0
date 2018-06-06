From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Jun 2018 08:06:00 +0000
Subject: [PATCH][next] staging: vc04_services: make a couple of pointers static
Message-Id: <20180606080600.29042-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The pointers vchiq_dbg_dir and vchiq_dbg_clients are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
warning: symbol 'vchiq_dbg_dir' was not declared. Should it be static?
warning: symbol 'vchiq_dbg_clients' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index 38805504d462..6a9e71a61142 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -52,8 +52,8 @@
 #define VCHIQ_LOG_TRACE_STR   "trace"
 
 /* Global 'vchiq' debugfs and clients entry used by all instances */
-struct dentry *vchiq_dbg_dir;
-struct dentry *vchiq_dbg_clients;
+static struct dentry *vchiq_dbg_dir;
+static struct dentry *vchiq_dbg_clients;
 
 /* Log category debugfs entries */
 struct vchiq_debugfs_log_entry {
-- 
2.17.0

