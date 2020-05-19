From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2020 15:45:25 +0000
Subject: [PATCH] RDMA/rtrs: Fix a couple off by one bugs in rtrs_srv_rdma_done()
Message-Id: <20200519154525.GA66801@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAHg0Huz39q9nWwTrtCY=SgU=T9oZJQdchx6c1LOPbSQiywzrqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

These > comparisons should be >= to prevent accessing one element
beyond the end of the buffer.

Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-srv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index 658c8999cb0d..0b53b79b0e27 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -1213,8 +1213,8 @@ static void rtrs_srv_rdma_done(struct ib_cq *cq, struct ib_wc *wc)
 
 			msg_id = imm_payload >> sess->mem_bits;
 			off = imm_payload & ((1 << sess->mem_bits) - 1);
-			if (unlikely(msg_id > srv->queue_depth ||
-				     off > max_chunk_size)) {
+			if (unlikely(msg_id >= srv->queue_depth ||
+				     off >= max_chunk_size)) {
 				rtrs_err(s, "Wrong msg_id %u, off %u\n",
 					  msg_id, off);
 				close_sess(sess);
-- 
2.26.2
