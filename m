From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Mar 2011 01:54:34 +0000
Subject: [PATCH 5/5] [media] pvrusb2: delete generic_standards_cnt
Message-Id: <20110326015434.GJ2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The generic_standards_cnt define is only used in one place and it's
more readable to just call ARRAY_SIZE(generic_standards) directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
index d5a679f..9bebc08 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
@@ -287,13 +287,11 @@ static struct v4l2_standard generic_standards[] = {
 	}
 };
 
-#define generic_standards_cnt ARRAY_SIZE(generic_standards)
-
 static struct v4l2_standard *match_std(v4l2_std_id id)
 {
 	unsigned int idx;
 
-	for (idx = 0; idx < generic_standards_cnt; idx++) {
+	for (idx = 0; idx < ARRAY_SIZE(generic_standards); idx++) {
 		if (generic_standards[idx].id & id)
 			return generic_standards + idx;
 	}
