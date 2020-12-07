From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 17:32:55 +0000
Subject: [PATCH] RDMA/restrack: update kernel documentation for ib_create_named_qp()
Message-Id: <20201207173255.13355-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 66f57b871efc ("RDMA/restrack: Support all QP types") extends
ib_create_qp() to a named ib_create_named_qp(), which takes the caller's
name as argument, but it did not add the new argument description to the
function's kerneldoc.

make htmldocs warns:

  ./drivers/infiniband/core/verbs.c:1206: warning: Function parameter or
  member 'caller' not described in 'ib_create_named_qp'

Add a description for this new argument based on the description of the
same argument in other related functions.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20201207

Doug, Jason, Leon, please pick this minor doc fix on your -next tree.

 drivers/infiniband/core/verbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/core/verbs.c b/drivers/infiniband/core/verbs.c
index 5d4c7c263665..57206fe1bad2 100644
--- a/drivers/infiniband/core/verbs.c
+++ b/drivers/infiniband/core/verbs.c
@@ -1197,6 +1197,7 @@ static struct ib_qp *create_xrc_qp_user(struct ib_qp *qp,
  * @qp_init_attr: A list of initial attributes required to create the
  *   QP.  If QP creation succeeds, then the attributes are updated to
  *   the actual capabilities of the created QP.
+ * @caller: caller's build-time module name
  *
  * NOTE: for user qp use ib_create_qp_user with valid udata!
  */
-- 
2.17.1
