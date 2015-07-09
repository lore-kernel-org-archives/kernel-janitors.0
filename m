From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 09 Jul 2015 05:06:04 +0000
Subject: [PATCH 2/2] um: umid: Use strdup to simplify code
Message-Id: <1436418364-5201-2-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436382947-13181-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1436418364-5201-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436418364-5201-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdike@addtoit.com, richard@nod.at
Cc: user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Replace a malloc+strcpy by an equivalent strdup in order to improve
readability.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/um/os-Linux/umid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/um/os-Linux/umid.c b/arch/um/os-Linux/umid.c
index b514ead..cc9ac2e 100644
--- a/arch/um/os-Linux/umid.c
+++ b/arch/um/os-Linux/umid.c
@@ -48,12 +48,11 @@ static int __init make_uml_dir(void)
 		strlcat(dir, "/", sizeof(dir));
 
 	err = -ENOMEM;
-	uml_dir = malloc(strlen(dir) + 1);
+	uml_dir = strdup(dir);
 	if (uml_dir = NULL) {
-		printf("make_uml_dir : malloc failed, errno = %d\n", errno);
+		printf("make_uml_dir : strdup failed, errno = %d\n", errno);
 		goto err;
 	}
-	strcpy(uml_dir, dir);
 
 	if ((mkdir(uml_dir, 0777) < 0) && (errno != EEXIST)) {
 		printf("Failed to mkdir '%s': %s\n", uml_dir, strerror(errno));
-- 
2.1.4

