From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:39 +0000
Subject: [PATCH] staging: cpia: fix camera file owner in cpia_open()
Message-Id: <1286731719-17953-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Use effective UID instead of real UID for camera owner.
There is no need to check for pending signals just before successfull
return.  Exit in case of pending signal also leaved camera in open state.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/cpia/cpia.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/cpia/cpia.c b/drivers/staging/cpia/cpia.c
index 933ae4c..0e740b8 100644
--- a/drivers/staging/cpia/cpia.c
+++ b/drivers/staging/cpia/cpia.c
@@ -3184,13 +3184,9 @@ static int cpia_open(struct file *file)
 		goto oops;
 	}
 
-	err = -EINTR;
-	if(signal_pending(current))
-		goto oops;
-
 	/* Set ownership of /proc/cpia/videoX to current user */
 	if(cam->proc_entry)
-		cam->proc_entry->uid = current_uid();
+		cam->proc_entry->uid = current_euid();
 
 	/* set mark for loading first frame uncompressed */
 	cam->first_frame = 1;
-- 
1.7.0.4

