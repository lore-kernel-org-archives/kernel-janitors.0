From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Mar 2011 01:52:22 +0000
Subject: [PATCH 3/6] [media] pvrusb2: check for allocation failures
Message-Id: <20110326015221.GH2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This function returns NULL on failure so lets do that if kzalloc()
fails.  There is a separate problem that the caller for this function
doesn't check for errors...

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
index 370a9ab..b214f77 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
@@ -388,6 +388,9 @@ struct v4l2_standard *pvr2_std_create_enum(unsigned int *countptr,
 
 	stddefs = kzalloc(sizeof(struct v4l2_standard) * std_cnt,
 			  GFP_KERNEL);
+	if (!stddefs)
+		return NULL;
+
 	for (idx = 0; idx < std_cnt; idx++)
 		stddefs[idx].index = idx;
 
