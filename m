From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 13:35:24 +0000
Subject: [patch] Yama: remove an unused variable
Message-Id: <20120420133524.GC26339@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

GCC complains that we don't use "one" any more after 389da25f93 "Yama:
add additional ptrace scopes".

security/yama/yama_lsm.c:322:12: warning: ‘one’ defined but not used
	[-Wunused-variable]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index afb04cb..c852f74 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -319,7 +319,6 @@ static int yama_dointvec_minmax(struct ctl_table *table, int write,
 }
 
 static int zero;
-static int one = 1;
 static int max_scope = YAMA_SCOPE_NO_ATTACH;
 
 struct ctl_path yama_sysctl_path[] = {
