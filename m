From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 13:41:14 +0000
Subject: [PATCH 1/3] ima: Use seq_putc() in ima_ascii_measurements_show()
Message-Id: <6d0e528b-dc78-7927-1820-a6eaf5c7cb02@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <416e6b01-7abb-d894-3bd6-d8bda05ed6b2@users.sourceforge.net>
In-Reply-To: <416e6b01-7abb-d894-3bd6-d8bda05ed6b2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 14:45:01 +0200

Two single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/ima/ima_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index ca303e5d2b94..732b5cd27042 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -242,14 +242,14 @@ static int ima_ascii_measurements_show(struct seq_file *m, void *v)
 
 	/* 4th:  template specific data */
 	for (i = 0; i < e->template_desc->num_fields; i++) {
-		seq_puts(m, " ");
+		seq_putc(m, ' ');
 		if (e->template_data[i].len = 0)
 			continue;
 
 		e->template_desc->fields[i]->field_show(m, IMA_SHOW_ASCII,
 							&e->template_data[i]);
 	}
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 	return 0;
 }
 
-- 
2.12.2

