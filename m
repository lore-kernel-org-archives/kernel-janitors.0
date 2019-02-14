From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Feb 2019 06:56:35 +0000
Subject: [PATCH] atm: clean up vcc_seq_next()
Message-Id: <20190214065635.GA21768@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Joe Perches <joe@perches.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

It's confusing to call PTR_ERR(v).  The PTR_ERR() function is basically
a fancy cast to long so it makes you wonder, was IS_ERR() intended?  But
that doesn't make sense because vcc_walk() doesn't return error
pointers.

This patch doesn't affect runtime, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/atm/proc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/atm/proc.c b/net/atm/proc.c
index 0b0495a41bbe..d79221fd4dae 100644
--- a/net/atm/proc.c
+++ b/net/atm/proc.c
@@ -134,7 +134,8 @@ static void vcc_seq_stop(struct seq_file *seq, void *v)
 static void *vcc_seq_next(struct seq_file *seq, void *v, loff_t *pos)
 {
 	v = vcc_walk(seq, 1);
-	*pos += !!PTR_ERR(v);
+	if (v)
+		(*pos)++;
 	return v;
 }
 
-- 
2.17.1
