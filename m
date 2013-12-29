From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:54:59 +0000
Subject: [PATCH 9/25]  fix error return code
Message-Id: <1388357260-4843-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hiral Patel <hiralpat@cisco.com>
Cc: kernel-janitors@vger.kernel.org, Suma Ramars <sramars@cisco.com>, Brian Uchino <buchino@cisco.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not tested.

 drivers/scsi/fnic/fnic_main.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_main.c b/drivers/scsi/fnic/fnic_main.c
index 33e4ec2..a3472a1 100644
--- a/drivers/scsi/fnic/fnic_main.c
+++ b/drivers/scsi/fnic/fnic_main.c
@@ -731,17 +731,23 @@ static int fnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		spin_lock_init(&fnic->io_req_lock[i]);
 
 	fnic->io_req_pool = mempool_create_slab_pool(2, fnic_io_req_cache);
-	if (!fnic->io_req_pool)
+	if (!fnic->io_req_pool) {
+		err = -ENOMEM;
 		goto err_out_free_resources;
+	}
 
 	pool = mempool_create_slab_pool(2, fnic_sgl_cache[FNIC_SGL_CACHE_DFLT]);
-	if (!pool)
+	if (!pool) {
+		err = -ENOMEM;
 		goto err_out_free_ioreq_pool;
+	}
 	fnic->io_sgl_pool[FNIC_SGL_CACHE_DFLT] = pool;
 
 	pool = mempool_create_slab_pool(2, fnic_sgl_cache[FNIC_SGL_CACHE_MAX]);
-	if (!pool)
+	if (!pool) {
+		err = -ENOMEM;
 		goto err_out_free_dflt_pool;
+	}
 	fnic->io_sgl_pool[FNIC_SGL_CACHE_MAX] = pool;
 
 	/* setup vlan config, hw inserts vlan header */

