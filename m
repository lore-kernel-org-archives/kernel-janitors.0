From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:36:49 +0000
Subject: [PATCH 01/10] dlm: Replace six seq_puts() calls by seq_putc()
Message-Id: <fff4aae9-e088-c32a-e7db-58ea9c0a4e7c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:12:31 +0200

Six single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/debug_fs.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index ca7089aeadab..464218c6b502 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -68,7 +68,7 @@ static void print_format1_lock(struct seq_file *s, struct dlm_lkb *lkb,
 	if (lkb->lkb_wait_type)
 		seq_printf(s, " wait_type: %d", lkb->lkb_wait_type);
 
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 }
 
 static void print_format1(struct dlm_rsb *res, struct seq_file *s)
@@ -111,7 +111,7 @@ static void print_format1(struct dlm_rsb *res, struct seq_file *s)
 		}
 		if (rsb_flag(res, RSB_VALNOTVALID))
 			seq_puts(s, " (INVALID)");
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 		if (seq_has_overflowed(s))
 			goto out;
 	}
@@ -156,7 +156,7 @@ static void print_format1(struct dlm_rsb *res, struct seq_file *s)
 			   lkb->lkb_id, print_lockmode(lkb->lkb_rqmode));
 		if (lkb->lkb_wait_type)
 			seq_printf(s, " wait_type: %d", lkb->lkb_wait_type);
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 		if (seq_has_overflowed(s))
 			goto out;
 	}
@@ -287,7 +287,7 @@ static void print_format3(struct dlm_rsb *r, struct seq_file *s)
 		else
 			seq_printf(s, " %02x", (unsigned char)r->res_name[i]);
 	}
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 	if (seq_has_overflowed(s))
 		goto out;
 
@@ -298,7 +298,7 @@ static void print_format3(struct dlm_rsb *r, struct seq_file *s)
 
 	for (i = 0; i < lvblen; i++)
 		seq_printf(s, " %02x", (unsigned char)r->res_lvbptr[i]);
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 	if (seq_has_overflowed(s))
 		goto out;
 
@@ -361,8 +361,7 @@ static void print_format4(struct dlm_rsb *r, struct seq_file *s)
 		else
 			seq_printf(s, " %02x", (unsigned char)r->res_name[i]);
 	}
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	unlock_rsb(r);
 }
 
-- 
2.12.2

