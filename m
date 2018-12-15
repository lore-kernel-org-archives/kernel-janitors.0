From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 15 Dec 2018 09:58:38 +0000
Subject: [PATCH -next] evm: remove set but not used variable 'xattr'
Message-Id: <1544868370-83459-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544867636-59276-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544867636-59276-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.ibm.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

security/integrity/evm/evm_main.c: In function 'init_evm':
security/integrity/evm/evm_main.c:566:21: warning:
 variable 'xattr' set but not used [-Wunused-but-set-variable]

It never used since commit 21af76631476 ("EVM: turn evm_config_xattrnames
into a list")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 security/integrity/evm/evm_main.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 5ecaa3d..b6d9f14 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -563,7 +563,6 @@ static int __init init_evm(void)
 {
 	int error;
 	struct list_head *pos, *q;
-	struct xattr_list *xattr;
 
 	evm_init_config();
 
@@ -580,11 +579,8 @@ static int __init init_evm(void)
 error:
 	if (error != 0) {
 		if (!list_empty(&evm_config_xattrnames)) {
-			list_for_each_safe(pos, q, &evm_config_xattrnames) {
-				xattr = list_entry(pos, struct xattr_list,
-						   list);
+			list_for_each_safe(pos, q, &evm_config_xattrnames)
 				list_del(pos);
-			}
 		}
 	}
