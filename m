From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 06:28:49 +0000
Subject: [patch] hid: picolcd: testing the wrong variable
Message-Id: <20100806062848.GL9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Jaya Kumar <jayakumar.lkml@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

"ref_cnt" is a point to the reference count and it's non-null.  We really
want to test the reference count itself.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/hid-picolcd.c b/drivers/hid/hid-picolcd.c
index 346f0e3..c0bdeba 100644
--- a/drivers/hid/hid-picolcd.c
+++ b/drivers/hid/hid-picolcd.c
@@ -547,7 +547,7 @@ static void picolcd_fb_destroy(struct fb_info *info)
 	ref_cnt--;
 	mutex_lock(&info->lock);
 	(*ref_cnt)--;
-	may_release = !ref_cnt;
+	may_release = !*ref_cnt;
 	mutex_unlock(&info->lock);
 	if (may_release) {
 		framebuffer_release(info);
