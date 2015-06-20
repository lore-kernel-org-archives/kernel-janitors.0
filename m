From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:06 +0000
Subject: [PATCH 08/12] staging: lustre: mgc: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/mgc/mgc_request.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/mgc/mgc_request.c b/drivers/staging/lustre/lustre/mgc/mgc_request.c
--- a/drivers/staging/lustre/lustre/mgc/mgc_request.c
+++ b/drivers/staging/lustre/lustre/mgc/mgc_request.c
@@ -1128,7 +1128,7 @@ static int mgc_apply_recover_logs(struct
 	LASSERT(cfg->cfg_sb = cfg->cfg_instance);
 
 	inst = kzalloc(PAGE_CACHE_SIZE, GFP_NOFS);
-	if (inst = NULL)
+	if (!inst)
 		return -ENOMEM;
 
 	if (!IS_SERVER(lsi)) {
@@ -1493,7 +1493,7 @@ static int mgc_process_cfg_log(struct ob
 		lsi = s2lsi(cld->cld_cfg.cfg_sb);
 
 	env = kzalloc(sizeof(*env), GFP_NOFS);
-	if (env = NULL)
+	if (!env)
 		return -ENOMEM;
 
 	rc = lu_env_init(env, LCT_MG_THREAD);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
