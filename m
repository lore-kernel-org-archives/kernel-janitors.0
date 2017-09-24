From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 10:30:36 +0000
Subject: [PATCH 5/6] [media] omap_vout: Delete an unnecessary variable initialisation in omap_vout_open()
Message-Id: <63bf382e-733f-2060-a4c8-e9863a38f3b7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
In-Reply-To: <f9dc652b-4fca-37aa-0b72-8c9e6a828da9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Muralidharan Karicheri <mkaricheri@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 11:20:11 +0200

The local variable "vout" is reassigned by a statement at the beginning.
Thus omit the explicit initialisation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/omap/omap_vout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index 71b77426271e..f446a37064f4 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -1001,7 +1001,7 @@ static int omap_vout_release(struct file *file)
 static int omap_vout_open(struct file *file)
 {
 	struct videobuf_queue *q;
-	struct omap_vout_device *vout = NULL;
+	struct omap_vout_device *vout;
 
 	vout = video_drvdata(file);
 	if (!vout)
-- 
2.14.1

