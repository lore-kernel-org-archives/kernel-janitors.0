From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 19:07:52 +0000
Subject: [PATCH 4/5] staging: lustre: obdclass: llog: drop trivially useless initialization
Message-Id: <1434827273-13929-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove initialization of a variable that is immediately reassigned.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier x;
constant C;
expression e;
@@

T x
- = C
 ;
x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/llog.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/staging/lustre/lustre/obdclass/llog.c
--- a/drivers/staging/lustre/lustre/obdclass/llog.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog.c
@@ -907,7 +907,7 @@ int llog_is_empty(const struct lu_env *e
 		  char *name)
 {
 	struct llog_handle	*llh;
-	int			 rc = 0;
+	int			 rc;
 
 	rc = llog_open(env, ctxt, &llh, NULL, name, LLOG_OPEN_EXISTS);
 	if (rc < 0) {

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
