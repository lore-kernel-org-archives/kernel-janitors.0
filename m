From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 13:42:18 +0000
Subject: [PATCH 2/3] ima: Combine two function calls into one in ima_policy_show()
Message-Id: <cd8a009f-c61b-4a7d-596a-1e2e64edeea6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <416e6b01-7abb-d894-3bd6-d8bda05ed6b2@users.sourceforge.net>
In-Reply-To: <416e6b01-7abb-d894-3bd6-d8bda05ed6b2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 14:58:55 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/ima/ima_policy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 3ab1067db624..83446a383ace 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -1086,10 +1086,8 @@ int ima_policy_show(struct seq_file *m, void *v)
 		seq_puts(m, " ");
 	}
 
-	if (entry->flags & IMA_FSUUID) {
-		seq_printf(m, "fsuuid=%pU", entry->fsuuid);
-		seq_puts(m, " ");
-	}
+	if (entry->flags & IMA_FSUUID)
+		seq_printf(m, "fsuuid=%pU ", entry->fsuuid);
 
 	if (entry->flags & IMA_UID) {
 		snprintf(tbuf, sizeof(tbuf), "%d", __kuid_val(entry->uid));
-- 
2.12.2

