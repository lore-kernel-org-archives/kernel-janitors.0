From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sat, 10 Aug 2013 00:32:46 +0000
Subject: [PATCH 3/3] staging: lustre: fix non-ANSI function prototypes.
Message-Id: <1376094766-9175-4-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add "void" to ksocknal_lib_tunables_init(), lwt_init() and  lwt_fini(), which
are parameterless functions;

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c | 2 +-
 drivers/staging/lustre/lustre/libcfs/lwt.c                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
index a1c6a51..5ccb7c4 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
@@ -296,7 +296,7 @@ ctl_table_t ksocknal_top_ctl_table[] = {
 };
 
 int
-ksocknal_lib_tunables_init ()
+ksocknal_lib_tunables_init(void)
 {
 	if (!*ksocknal_tunables.ksnd_typed_conns) {
 		int rc = -EINVAL;
diff --git a/drivers/staging/lustre/lustre/libcfs/lwt.c b/drivers/staging/lustre/lustre/libcfs/lwt.c
index b631f7d..e21eb86 100644
--- a/drivers/staging/lustre/lustre/libcfs/lwt.c
+++ b/drivers/staging/lustre/lustre/libcfs/lwt.c
@@ -173,7 +173,7 @@ lwt_snapshot (cfs_cycles_t *now, int *ncpu, int *total_size,
 }
 
 int
-lwt_init ()
+lwt_init(void)
 {
 	int     i;
 	int     j;
@@ -230,7 +230,7 @@ lwt_init ()
 }
 
 void
-lwt_fini ()
+lwt_fini(void)
 {
 	int    i;
 
-- 
1.8.3.1

