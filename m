From: Julien Brunel <brunel@diku.dk>
Date: Thu, 28 Aug 2008 13:31:07 +0000
Subject: [PATCH] drivers/infiniband/core: Use a NULL test rather than an IS_ERR test
Message-Id: <200808281531.07942.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function ucma_alloc_multicast returns a NULL
pointer, but never returns an ERR pointer. So after a call to this
function, an IS_ERR test should be replaced by a NULL test.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match bad_is_err_test@
expression x, E;
@@

x = ucma_alloc_multicast(...)
... when != x = E
IS_ERR(x)
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 drivers/infiniband/core/ucma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -904,8 +904,8 @@ static ssize_t ucma_join_multicast(struc
 
 	mutex_lock(&file->mut);
 	mc = ucma_alloc_multicast(ctx);
-	if (IS_ERR(mc)) {
-		ret = PTR_ERR(mc);
+	if (mc = NULL) {
+		ret = -ENOMEM;
 		goto err1;
 	}
 
