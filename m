From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:10 +0000
Subject: [PATCH 6/8] Staging: lustre: obd: put constant on the right of binary operator
Message-Id: <1440869412-4899-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/cl_object.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/cl_object.c b/drivers/staging/lustre/lustre/obdclass/cl_object.c
index 163fe0c..9f4fa41 100644
--- a/drivers/staging/lustre/lustre/obdclass/cl_object.c
+++ b/drivers/staging/lustre/lustre/obdclass/cl_object.c
@@ -693,10 +693,10 @@ static struct lu_env *cl_env_new(__u32 ctx_tags, __u32 ses_tags, void *debug)
 		INIT_LIST_HEAD(&cle->ce_linkage);
 		cle->ce_magic = &cl_env_init0;
 		env = &cle->ce_lu;
-		rc = lu_env_init(env, LCT_CL_THREAD|ctx_tags);
+		rc = lu_env_init(env, ctx_tags | LCT_CL_THREAD);
 		if (rc = 0) {
 			rc = lu_context_init(&cle->ce_ses,
-					     LCT_SESSION | ses_tags);
+					     ses_tags | LCT_SESSION);
 			if (rc = 0) {
 				lu_context_enter(&cle->ce_ses);
 				env->le_ses = &cle->ce_ses;

