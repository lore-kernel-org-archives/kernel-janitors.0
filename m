From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2020 12:03:47 +0000
Subject: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
Message-Id: <20200519120347.GD42765@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

The alloc_sess() function returns error pointers, it never returns NULL.

Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/block/rnbd/rnbd-clt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 55bff3b1be71..a033247281da 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -923,13 +923,12 @@ rnbd_clt_session *find_or_create_sess(const char *sessname, bool *first)
 	sess = __find_and_get_sess(sessname);
 	if (!sess) {
 		sess = alloc_sess(sessname);
-		if (sess) {
-			list_add(&sess->list, &sess_list);
-			*first = true;
-		} else {
+		if (IS_ERR(sess)) {
 			mutex_unlock(&sess_lock);
-			return ERR_PTR(-ENOMEM);
+			return sess;
 		}
+		list_add(&sess->list, &sess_list);
+		*first = true;
 	} else
 		*first = false;
 	mutex_unlock(&sess_lock);
-- 
2.26.2
