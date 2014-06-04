From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 04 Jun 2014 09:07:57 +0000
Subject: [PATCH 7/10] cciss: use safer test on the result of find_first_zero_bit
Message-Id: <1401872880-23685-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401872880-23685-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1401872880-23685-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Miller <mike.miller@hp.com>
Cc: kernel-janitors@vger.kernel.org, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Find_first_zero_bit considers BITS_PER_LONG bits at a time, and thus may
return a larger number than the maximum position argument if that position
is not a multiple of BITS_PER_LONG.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,e3;
statement S1,S2;
@@

e1 = find_first_zero_bit(e2,e3)
...
if (e1 
- =
+ >  e3)
S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/cciss.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/block/cciss.c b/drivers/block/cciss.c
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -980,7 +980,7 @@ static CommandList_struct *cmd_alloc(ctl
 
 	do {
 		i = find_first_zero_bit(h->cmd_pool_bits, h->nr_cmds);
-		if (i = h->nr_cmds)
+		if (i >= h->nr_cmds)
 			return NULL;
 	} while (test_and_set_bit(i, h->cmd_pool_bits) != 0);
 	c = h->cmd_pool + i;

