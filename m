From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 27 Jan 2018 10:55:10 +0000
Subject: [PATCH 2/2] um: vector: Fix an error handling path in 'vector_parse()'
Message-Id: <20180127105510.2782-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

If 'find_device()' finds something, we set '*error_out' and we should
return an error. However, 'err' is known to be 0 at this point.

Explicitly return -EINVAL instead.

While at it, remove the initialization of 'err' at the beginning of the
function and also explicitly return an error code if the first check
fails.

Fixes: ad1f62ab2bd4 ("High Performance UML Vector Network Driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure if correct, but it looks spurious to set 'error_out' and return
0 (i.e. success)
---
 arch/um/drivers/vector_kern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 3c1e6ad91016..6fab02a126e6 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -677,7 +677,7 @@ static struct vector_device *find_device(int n)
 static int vector_parse(char *str, int *index_out, char **str_out,
 			char **error_out)
 {
-	int n, len, err = -EINVAL;
+	int n, len, err;
 	char *start = str;
 
 	len = strlen(str);
@@ -686,7 +686,7 @@ static int vector_parse(char *str, int *index_out, char **str_out,
 		str++;
 	if (*str != ':') {
 		*error_out = "Expected ':' after device number";
-		return err;
+		return -EINVAL;
 	}
 	*str = '\0';
 
@@ -699,7 +699,7 @@ static int vector_parse(char *str, int *index_out, char **str_out,
 	str++;
 	if (find_device(n)) {
 		*error_out = "Device already configured";
-		return err;
+		return -EINVAL;
 	}
 
 	*index_out = n;
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

