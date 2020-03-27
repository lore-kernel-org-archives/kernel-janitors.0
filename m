From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Mar 2020 17:44:02 +0000
Subject: [PATCH] selinux: clean up indentation issue with assignment statement
Message-Id: <20200327174402.351334-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of e->type_names is indented one level too deep,
clean this up by removing the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/selinux/ss/policydb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 932b2b9bcdb2..70ecdc78efbd 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -1219,10 +1219,9 @@ static int read_cons_helper(struct policydb *p,
 				if (rc)
 					return rc;
 				if (p->policyvers >-					POLICYDB_VERSION_CONSTRAINT_NAMES) {
-						e->type_names = kzalloc(sizeof
-						(*e->type_names),
-						GFP_KERNEL);
+				    POLICYDB_VERSION_CONSTRAINT_NAMES) {
+					e->type_names = kzalloc(sizeof
+						(*e->type_names), GFP_KERNEL);
 					if (!e->type_names)
 						return -ENOMEM;
 					type_set_init(e->type_names);
-- 
2.25.1
