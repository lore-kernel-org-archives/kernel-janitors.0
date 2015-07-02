From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Jul 2015 19:05:05 +0000
Subject: [PATCH 2/2] tools/testing/nvdimm: Improve error detection in __test_alloc()
Message-Id: <55958B61.1070002@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <559589D3.8000709@users.sourceforge.net>
In-Reply-To: <559589D3.8000709@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Jul 2015 20:45:53 +0200

Three checks were combined at the beginning of the __test_alloc() function.
This implementation detail can become safer according to the Linux coding
style convention.

* Return directly if a null pointer was passed for the variable "buf".
  Delete an unnecessary check then.

* Allocate memory for the data structure "nfit_test_resource"
  only if a previous allocation succeeded.

* Rename a jump label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/testing/nvdimm/test/nfit.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/testing/nvdimm/test/nfit.c b/tools/testing/nvdimm/test/nfit.c
index 9c910f1..d5f22ea 100644
--- a/tools/testing/nvdimm/test/nfit.c
+++ b/tools/testing/nvdimm/test/nfit.c
@@ -244,16 +244,21 @@ static void *__test_alloc(struct nfit_test *t, size_t size, dma_addr_t *dma,
 		void *buf)
 {
 	struct device *dev = &t->pdev.dev;
-	struct resource *res = kzalloc(sizeof(*res) * 2, GFP_KERNEL);
-	struct nfit_test_resource *nfit_res = kzalloc(sizeof(*nfit_res),
-			GFP_KERNEL);
+	struct resource *res;
+	struct nfit_test_resource *nfit_res = NULL;
 	int rc;
 
-	if (!res || !buf || !nfit_res)
-		goto err;
+	if (!buf)
+		return NULL;
+	res = kzalloc(sizeof(*res) * 2, GFP_KERNEL);
+	if (!res)
+		goto free_memory;
+	nfit_res = kzalloc(sizeof(*nfit_res), GFP_KERNEL);
+	if (!nfit_res)
+		goto free_memory;
 	rc = devm_add_action(dev, release_nfit_res, nfit_res);
 	if (rc)
-		goto err;
+		goto free_memory;
 	INIT_LIST_HEAD(&nfit_res->list);
 	memset(buf, 0, size);
 	nfit_res->dev = dev;
@@ -267,8 +272,8 @@ static void *__test_alloc(struct nfit_test *t, size_t size, dma_addr_t *dma,
 	spin_unlock(&nfit_test_lock);
 
 	return nfit_res->buf;
- err:
-	if (buf && !is_vmalloc_addr(buf))
+free_memory:
+	if (!is_vmalloc_addr(buf))
 		dma_free_coherent(dev, size, buf, *dma);
 	else
 		vfree(buf);
-- 
2.4.5

