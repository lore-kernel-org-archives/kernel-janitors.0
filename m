From: Colin King <colin.king@canonical.com>
Date: Sat, 14 Oct 2017 15:00:49 +0000
Subject: [PATCH] selinux: remove redundant assignment to len
Message-Id: <20171014150049.1053-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171014124655.32438-1-colin.king@canonical.com>
In-Reply-To: <20171014124655.32438-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable len is being set to zero and this value is never
being read since len is being set to a different value just
a few lines later.  Remove this redundant assignment. Cleans
up clang warning: Value stored to 'len' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 security/selinux/ss/conditional.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 771c96afe1d5..c91543a617ac 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -361,7 +361,6 @@ static int cond_read_av_list(struct policydb *p, void *fp, struct cond_av_list *
 
 	*ret_list = NULL;
 
-	len = 0;
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc)
 		return rc;
-- 
2.14.1

