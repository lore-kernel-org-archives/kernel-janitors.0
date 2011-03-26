From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Mar 2011 01:55:30 +0000
Subject: [PATCH 6/6] [media] pvrusb2: replace !0 with 1
Message-Id: <20110326015530.GK2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Using !0 is less readable than just saying 1.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
index 9bebc08..ca4f67b 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
@@ -158,7 +158,7 @@ int pvr2_std_str_to_id(v4l2_std_id *idPtr, const char *buf,
 			cnt++;
 			buf += cnt;
 			buf_size -= cnt;
-			mMode = !0;
+			mMode = 1;
 			cmsk = sp->id;
 			continue;
 		}
@@ -190,7 +190,7 @@ int pvr2_std_str_to_id(v4l2_std_id *idPtr, const char *buf,
 
 	if (idPtr)
 		*idPtr = id;
-	return !0;
+	return 1;
 }
 
 unsigned int pvr2_std_id_to_str(char *buf, unsigned int buf_size,
@@ -217,10 +217,10 @@ unsigned int pvr2_std_id_to_str(char *buf, unsigned int buf_size,
 					buf_size -= c2;
 					buf += c2;
 				}
-				cfl = !0;
+				cfl = 1;
 				c2 = scnprintf(buf, buf_size,
 					       "%s-", gp->name);
-				gfl = !0;
+				gfl = 1;
 			} else {
 				c2 = scnprintf(buf, buf_size, "/");
 			}
@@ -315,7 +315,7 @@ static int pvr2_std_fill(struct v4l2_standard *std, v4l2_std_id id)
 	std->name[bcnt] = 0;
 	pvr2_trace(PVR2_TRACE_STD, "Set up standard idx=%u name=%s",
 		   std->index, std->name);
-	return !0;
+	return 1;
 }
 
 /*
