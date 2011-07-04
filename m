From: Julia Lawall <julia@diku.dk>
Date: Mon, 04 Jul 2011 14:11:42 +0000
Subject: [PATCH 2/5] drivers/media/video: add missing kfree
Message-Id: <1309788705-22278-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Free the recently allocated qcam in each case.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier x;
@@

kfree(x)

@@
identifier r.x;
expression E1!=0,E2,E3,E4;
statement S;
@@

(
if (<+...x...+>) S
|
if (...) { ... when != kfree(x)
               when != if (...) { ... kfree(x); ... }
               when != x = E3
* return E1;
}
... when != x = E2
if (...) { ... when != x = E4
 kfree(x); ... return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/bw-qcam.c |    1 +
 drivers/media/video/c-qcam.c  |    1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/video/bw-qcam.c b/drivers/media/video/bw-qcam.c
index c119350..0aad9cc 100644
--- a/drivers/media/video/bw-qcam.c
+++ b/drivers/media/video/bw-qcam.c
@@ -895,6 +895,7 @@ static struct qcam *qcam_init(struct parport *port)
 
 	if (v4l2_device_register(NULL, v4l2_dev) < 0) {
 		v4l2_err(v4l2_dev, "Could not register v4l2_device\n");
+		kfree(qcam);
 		return NULL;
 	}
 
diff --git a/drivers/media/video/c-qcam.c b/drivers/media/video/c-qcam.c
index 24fc009..351b2db 100644
--- a/drivers/media/video/c-qcam.c
+++ b/drivers/media/video/c-qcam.c
@@ -752,6 +752,7 @@ static struct qcam *qcam_init(struct parport *port)
 
 	if (v4l2_device_register(NULL, v4l2_dev) < 0) {
 		v4l2_err(v4l2_dev, "Could not register v4l2_device\n");
+		kfree(qcam);
 		return NULL;
 	}
 

