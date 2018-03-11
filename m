From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 15:19:08 +0000
Subject: [PATCH 4/9] um/drivers/vector_user: Delete an unnecessary check before kfree() in user_init_socket_f
Message-Id: <16c0e64e-01f1-4275-51cc-b56401f6f91d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
In-Reply-To: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: user-mode-linux-devel@lists.sourceforge.net, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 14:00:09 +0100

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/um/drivers/vector_user.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/vector_user.c b/arch/um/drivers/vector_user.c
index 9cc4651990e3..e831bd85cad4 100644
--- a/arch/um/drivers/vector_user.c
+++ b/arch/um/drivers/vector_user.c
@@ -422,8 +422,7 @@ static struct vector_fds *user_init_socket_fds(struct arglist *ifspec, int id)
 	if (fd >= 0)
 		os_close_file(fd);
 	if (result != NULL) {
-		if (result->remote_addr != NULL)
-			kfree(result->remote_addr);
+		kfree(result->remote_addr);
 		kfree(result);
 	}
 
-- 
2.16.2

