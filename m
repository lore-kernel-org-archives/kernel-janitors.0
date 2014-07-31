From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 15:21:34 +0000
Subject: [patch] staging: lustre: bitwise vs logical typo
Message-Id: <20140731152134.GC31539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bitwise AND was intended here obviously.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I wasn't able to compile this.

Also lustre needs an entry in MAINTAINERS because otherwise
get_maintainer.pl still sends everything to Peng Tao only.

diff --git a/drivers/staging/lustre/lustre/obdecho/echo.c b/drivers/staging/lustre/lustre/obdecho/echo.c
index f3b7429..dae1599 100644
--- a/drivers/staging/lustre/lustre/obdecho/echo.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo.c
@@ -125,7 +125,7 @@ static int echo_create(const struct lu_env *env, struct obd_export *exp,
 		return -EINVAL;
 	}
 
-	if (!(oa->o_mode && S_IFMT)) {
+	if (!(oa->o_mode & S_IFMT)) {
 		CERROR("echo obd: no type!\n");
 		return -ENOENT;
 	}
