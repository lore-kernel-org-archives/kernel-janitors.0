From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 15:22:36 +0000
Subject: [PATCH 7/9] um/drivers/vector_user: Adjust an error message in user_init_tap_fds()
Message-Id: <04d337d2-a2db-a5c8-e056-4eb51a3882b3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
In-Reply-To: <e21083ff-0ba7-42ad-e3f0-d84da9c93208@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: user-mode-linux-devel@lists.sourceforge.net, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 15:10:05 +0100

Adjust an error message at the end of this function so that its name
will be automatically determined as a parameter.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/um/drivers/vector_user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/um/drivers/vector_user.c b/arch/um/drivers/vector_user.c
index 4c265262a369..5e78723c34d4 100644
--- a/arch/um/drivers/vector_user.c
+++ b/arch/um/drivers/vector_user.c
@@ -192,7 +192,6 @@ static struct vector_fds *user_init_tap_fds(struct arglist *ifspec)
 	}
 	return result;
 tap_cleanup:
-	printk(UM_KERN_ERR "user_init_tap: init failed, error %d", err);
 	if (result != NULL) {
 		if (result->rx_fd >= 0)
 			os_close_file(result->rx_fd);
@@ -200,6 +199,8 @@ static struct vector_fds *user_init_tap_fds(struct arglist *ifspec)
 			os_close_file(result->tx_fd);
 		kfree(result);
 	}
+
+	printk(UM_KERN_ERR "%s: init failed: %d", __func__, err);
 	return NULL;
 }
 
-- 
2.16.2

