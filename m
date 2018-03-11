From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 15:20:24 +0000
Subject: [PATCH 5/9] um/drivers/vector_user: Delete two unnecessary checks before freeaddrinfo() in user_init
Message-Id: <cccfbd35-ddea-dd71-2538-7230d5f2b543@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
In-Reply-To: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: user-mode-linux-devel@lists.sourceforge.net, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 14:20:46 +0100

The implementation returns from this function if a null pointer
was detected in the local variable "gairesult". Thus the check
before two calls of the function "freeaddrinfo" is not needed.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/um/drivers/vector_user.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/um/drivers/vector_user.c b/arch/um/drivers/vector_user.c
index e831bd85cad4..2dee1e183387 100644
--- a/arch/um/drivers/vector_user.c
+++ b/arch/um/drivers/vector_user.c
@@ -384,9 +384,7 @@ static struct vector_fds *user_init_socket_fds(struct arglist *ifspec, int id)
 		goto cleanup;
 	}
 
-	if (gairesult != NULL)
-		freeaddrinfo(gairesult);
-
+	freeaddrinfo(gairesult);
 	gairesult = NULL;
 
 	gairet = getaddrinfo(dst, dstport, &dsthints, &gairesult);
@@ -416,8 +414,7 @@ static struct vector_fds *user_init_socket_fds(struct arglist *ifspec, int id)
 	freeaddrinfo(gairesult);
 	return result;
 cleanup:
-	if (gairesult != NULL)
-		freeaddrinfo(gairesult);
+	freeaddrinfo(gairesult);
 
 	if (fd >= 0)
 		os_close_file(fd);
-- 
2.16.2

