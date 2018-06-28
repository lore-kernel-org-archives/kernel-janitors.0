From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2018 09:31:25 +0000
Subject: [PATCH net] cnic: tidy up a size calculation
Message-Id: <20180628093125.6qamire66fzkv47l@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that id_tbl->table points to longs and 4 bytes
is smaller than sizeof(long).  But the since other side is dividing by
32 instead of sizeof(long), that means the current code works fine.

Anyway, it's more conventional to use the BITS_TO_LONGS() macro when
we're allocating a bitmap.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 30273a7717e2..4fd829b5e65d 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -660,7 +660,7 @@ static int cnic_init_id_tbl(struct cnic_id_tbl *id_tbl, u32 size, u32 start_id,
 	id_tbl->max = size;
 	id_tbl->next = next;
 	spin_lock_init(&id_tbl->lock);
-	id_tbl->table = kcalloc(DIV_ROUND_UP(size, 32), 4, GFP_KERNEL);
+	id_tbl->table = kcalloc(BITS_TO_LONGS(size), sizeof(long), GFP_KERNEL);
 	if (!id_tbl->table)
 		return -ENOMEM;
 
