From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 31 Oct 2016 06:50:37 +0000
Subject: [PATCH] tools/testing/nvdimm: Fix error handling
Message-Id: <20161031065037.2873-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, vishal.l.verma@intel.com, jlee@suse.com, rafael@kernel.org, linda.knippers@hpe.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'device_create_with_groups()' returns an error pointer in case of error,
not NULL. So test it with IS_ERR.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/testing/nvdimm/test/nfit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/nvdimm/test/nfit.c b/tools/testing/nvdimm/test/nfit.c
index c9a6458cb63e..a99a1b64dd84 100644
--- a/tools/testing/nvdimm/test/nfit.c
+++ b/tools/testing/nvdimm/test/nfit.c
@@ -715,7 +715,7 @@ static int nfit_test0_alloc(struct nfit_test *t)
 				&t->pdev.dev, 0, NULL,
 				nfit_test_dimm_attribute_groups,
 				"test_dimm%d", i);
-		if (!t->dimm_dev[i])
+		if (IS_ERR(t->dimm_dev[i]))
 			return -ENOMEM;
 	}
 
-- 
2.9.3

