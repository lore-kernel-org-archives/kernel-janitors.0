From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:20:53 +0000
Subject: [PATCH 11/20] vme: fix misspelling of current function in string
Message-Id: <1417980062-25151-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martyn Welch <martyn.welch@ge.com>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, Manohar Vanga <manohar.vanga@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

This is the get function, not the set function, as was indicated by the
string.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/vme/vme.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index 7516030..d95fb84 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -502,7 +502,7 @@ int vme_master_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (bridge->master_get = NULL) {
-		printk(KERN_WARNING "vme_master_set not supported\n");
+		printk(KERN_WARNING "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 

