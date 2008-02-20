From: Jiri Olsa <olsajiri@gmail.com>
Date: Wed, 20 Feb 2008 20:57:23 +0000
Subject: [PATCH] fs: removing unused fops from struct char_device_struct
Message-Id: <47BC9433.8020905@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

seems struct char_device_struct::fops is no longer used, removing it.
I checked with "make allyesconfig" and got proper compile.

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 fs/char_dev.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/char_dev.c b/fs/char_dev.c
index c3bfa76..e4527fb 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -55,7 +55,6 @@ static struct char_device_struct {
 	unsigned int baseminor;
 	int minorct;
 	char name[64];
-	struct file_operations *fops;
 	struct cdev *cdev;		/* will die */
 } *chrdevs[CHRDEV_MAJOR_HASH_SIZE];
 
