From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 27 Jan 2018 10:53:57 +0000
Subject: [PATCH 1/2] um: vector: Fix a memory allocation check
Message-Id: <20180127105357.2728-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Checking the result of the previous 'kstrdup()' call is expected here, so
we should test 'params' and not 'str' (which is known to be non-NULL at
this point)

Fixes: ad1f62ab2bd4 ("High Performance UML Vector Network Driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/um/drivers/vector_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index d1d53015d572..3c1e6ad91016 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -723,7 +723,7 @@ static int vector_config(char *str, char **error_out)
 	 */
 
 	params = kstrdup(params, GFP_KERNEL);
-	if (str = NULL) {
+	if (params = NULL) {
 		*error_out = "vector_config failed to strdup string";
 		return -ENOMEM;
 	}
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

