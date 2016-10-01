From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:19 +0000
Subject: [PATCH 02/15] netlink: improve function-level documentation
Message-Id: <1475351192-27079-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Rename a variable in the documentation so that it corresponds to the name
of the function parameter.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 lib/nlattr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/nlattr.c b/lib/nlattr.c
index fce1e9a..14cb5cf 100644
--- a/lib/nlattr.c
+++ b/lib/nlattr.c
@@ -139,7 +139,7 @@ int nla_validate(const struct nlattr *head, int len, int maxtype,
 
 /**
  * nla_policy_len - Determin the max. length of a policy
- * @policy: policy to use
+ * @p: policy to use
  * @n: number of policies
  *
  * Determines the max. length of the policy.  It is currently used

