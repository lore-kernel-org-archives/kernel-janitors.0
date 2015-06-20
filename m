From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:08 +0000
Subject: [PATCH 10/12] staging: lustre: obdecho: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-11-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdecho/echo_client.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/obdecho/echo_client.c b/drivers/staging/lustre/lustre/obdecho/echo_client.c
--- a/drivers/staging/lustre/lustre/obdecho/echo_client.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo_client.c
@@ -480,11 +480,11 @@ static int echo_alloc_memmd(struct echo_
 
 	LASSERT(*lsmp = NULL);
 	*lsmp = kzalloc(lsm_size, GFP_NOFS);
-	if (*lsmp = NULL)
+	if (!*lsmp)
 		return -ENOMEM;
 
 	(*lsmp)->lsm_oinfo[0] = kzalloc(sizeof(struct lov_oinfo), GFP_NOFS);
-	if ((*lsmp)->lsm_oinfo[0] = NULL) {
+	if (!(*lsmp)->lsm_oinfo[0]) {
 		kfree(*lsmp);
 		return -ENOMEM;
 	}
@@ -701,7 +701,7 @@ static struct lu_device *echo_device_all
 	int cleanup = 0;
 
 	ed = kzalloc(sizeof(*ed), GFP_NOFS);
-	if (ed = NULL) {
+	if (!ed) {
 		rc = -ENOMEM;
 		goto out;
 	}
@@ -1878,7 +1878,7 @@ echo_client_iocontrol(unsigned int cmd,
 		return rc;
 
 	env = kzalloc(sizeof(*env), GFP_NOFS);
-	if (env = NULL)
+	if (!env)
 		return -ENOMEM;
 
 	rc = lu_env_init(env, LCT_DT_THREAD);
@@ -2049,7 +2049,7 @@ static int echo_client_setup(const struc
 	ec->ec_nstripes = 0;
 
 	ocd = kzalloc(sizeof(*ocd), GFP_NOFS);
-	if (ocd = NULL) {
+	if (!ocd) {
 		CERROR("Can't alloc ocd connecting to %s\n",
 		       lustre_cfg_string(lcfg, 1));
 		return -ENOMEM;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
