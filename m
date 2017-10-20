From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 20 Oct 2017 19:33:31 +0000
Subject: [PATCH] umh: Optimize 'proc_cap_handler()'
Message-Id: <20171020193331.7233-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mcgrof@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'write' is 0, we can avoid a call to spin_lock/spin_unlock.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/umh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/umh.c b/kernel/umh.c
index 6ff9905250ff..18e5fa4b0e71 100644
--- a/kernel/umh.c
+++ b/kernel/umh.c
@@ -537,14 +537,14 @@ static int proc_cap_handler(struct ctl_table *table, int write,
 	/*
 	 * Drop everything not in the new_cap (but don't add things)
 	 */
-	spin_lock(&umh_sysctl_lock);
 	if (write) {
+		spin_lock(&umh_sysctl_lock);
 		if (table->data = CAP_BSET)
 			usermodehelper_bset = cap_intersect(usermodehelper_bset, new_cap);
 		if (table->data = CAP_PI)
 			usermodehelper_inheritable = cap_intersect(usermodehelper_inheritable, new_cap);
+		spin_unlock(&umh_sysctl_lock);
 	}
-	spin_unlock(&umh_sysctl_lock);
 
 	return 0;
 }
-- 
2.14.1

