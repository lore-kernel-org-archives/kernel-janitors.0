From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 15:40:21 +0000
Subject: [PATCH] openpromfs: Adjust three seq_printf() calls in property_show()
Message-Id: <22563348-fefa-8540-9d71-de37764f0596@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 17:24:27 +0200

A bit of information should be put into a sequence.
Thus improve the execution speed for this data output by better usage
of corresponding functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/openpromfs/inode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
index e6cb7689fec4..2234103fd8ee 100644
--- a/fs/openpromfs/inode.c
+++ b/fs/openpromfs/inode.c
@@ -76,14 +76,14 @@ static int property_show(struct seq_file *f, void *v)
 		while (len > 0) {
 			int n = strlen(pval);

-			seq_printf(f, "%s", (char *) pval);
+			seq_puts(f, (char *) pval);

 			/* Skip over the NULL byte too.  */
 			pval += n + 1;
 			len -= n + 1;

 			if (len > 0)
-				seq_printf(f, " + ");
+				seq_puts(f, " + ");
 		}
 	} else {
 		if (len & 3) {
@@ -111,8 +111,7 @@ static int property_show(struct seq_file *f, void *v)
 			}
 		}
 	}
-	seq_printf(f, "\n");
-
+	seq_putc(f, '\n');
 	return 0;
 }

--
2.22.0
