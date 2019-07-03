From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 15:08:54 +0000
Subject: [PATCH 1/3] NFS: Use seq_putc() in nfs_show_stats()
Message-Id: <c8837b8d-34ca-a8d0-acb6-6cad599df3e7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
In-Reply-To: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jul 2019 15:33:09 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function “seq_putc”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/nfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index f88ddac2dcdf..0c229e877ba6 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -887,7 +887,7 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)
 			seq_printf(m, "%Lu ", totals.fscache[i]);
 	}
 #endif
-	seq_printf(m, "\n");
+	seq_putc(m, '\n');

 	rpc_clnt_show_stats(m, nfss->client);

--
2.22.0
