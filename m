From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 16:38:27 +0000
Subject: [PATCH] fs/seq_file: Replace a seq_printf() call by seq_puts() in seq_hex_dump()
Message-Id: <8c295901-cdbd-a4a2-f23f-f63a58330f20@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 18:28:10 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/seq_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index abe27ec43176..ecc68e9dd31f 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -868,7 +868,7 @@ void seq_hex_dump(struct seq_file *m, const char *prefix_str, int prefix_type,
 			seq_printf(m, "%s%.8x: ", prefix_str, i);
 			break;
 		default:
-			seq_printf(m, "%s", prefix_str);
+			seq_puts(m, prefix_str);
 			break;
 		}

--
2.22.0
