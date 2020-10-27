From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Oct 2020 11:49:25 +0000
Subject: [PATCH] net: atm: fix update of position index in lec_seq_next
Message-Id: <20201027114925.21843-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The position index in leq_seq_next is not updated when the next
entry is fetched an no more entries are available. This causes
seq_file to report the following error:

"seq_file: buggy .next function lec_seq_next [lec] did not update
 position index"

Fix this by always updating the position index.

[ Note: this is an ancient 2002 bug, the sha is from the
  tglx/history repo ]

Fixes 4aea2cbff417 ("[ATM]: Move lan seq_file ops to lec.c [1/3]")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/atm/lec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/atm/lec.c b/net/atm/lec.c
index dbabb65d8b67..7226c784dbe0 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -954,9 +954,8 @@ static void *lec_seq_next(struct seq_file *seq, void *v, loff_t *pos)
 {
 	struct lec_state *state = seq->private;
 
-	v = lec_get_idx(state, 1);
-	*pos += !!PTR_ERR(v);
-	return v;
+	++*pos;
+	return lec_get_idx(state, 1);
 }
 
 static int lec_seq_show(struct seq_file *seq, void *v)
-- 
2.27.0
