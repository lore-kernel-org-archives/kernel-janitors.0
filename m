From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:45:50 +0000
Subject: [PATCH 2/8] [media] v4l2-async: Delete an error message for a failed memory allocation in v4l2_async
Message-Id: <a00be613-169b-4992-dc29-c4b9e82d5501@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
In-Reply-To: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 19:19:49 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/v4l2-core/v4l2-async.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 277183f2d514..812d0b2a2f73 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -203,11 +203,6 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
 		return;
 
 	dev = kmalloc_array(n_subdev, sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
-		dev_err(notifier->v4l2_dev->dev,
-			"Failed to allocate device cache!\n");
-	}
-
 	mutex_lock(&list_lock);
 
 	list_del(&notifier->list);
-- 
2.11.0

