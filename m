From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:31:02 +0000
Subject: [PATCH 57] net/netfilter/nf_conntrack_expect.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312331.02887.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, netfilter-devel@lists.netfilter.org, coreteam@netfilter.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 net/netfilter/nf_conntrack_expect.c | 14786 -> 14726 (-60 bytes)
 net/netfilter/nf_conntrack_expect.o | 137990 -> 138154 (+164 bytes)

 net/netfilter/nf_conntrack_expect.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/net/netfilter/nf_conntrack_expect.c	2007-07-26 13:07:44.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/net/netfilter/nf_conntrack_expect.c	2007-07-31 15:22:45.000000000 +0200
@@ -477,15 +477,14 @@ static int exp_open(struct inode *inode,
 	struct ct_expect_iter_state *st;
 	int ret;

-	st = kmalloc(sizeof(struct ct_expect_iter_state), GFP_KERNEL);
-	if (st = NULL)
+	st = kzalloc(sizeof(struct ct_expect_iter_state), GFP_KERNEL);
+	if (!st)
 		return -ENOMEM;
 	ret = seq_open(file, &exp_seq_ops);
 	if (ret)
 		goto out_free;
 	seq          = file->private_data;
 	seq->private = st;
-	memset(st, 0, sizeof(struct ct_expect_iter_state));
 	return ret;
 out_free:
 	kfree(st);
