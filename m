From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 06 May 2014 14:56:19 +0000
Subject: [PATCH] staging: lustre: remove unused variables
Message-Id: <1399388179-7647-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Tao <bergwolf@gmail.com>, Andreas Dilger <andreas.dilger@intel.com>, Fredrick John Berchmans <fredrickprashanth@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The following commit left some unused variables behind.

commit 80db2734acbc78db12798cfb611d6acc7fe389e6
Author: Fredrick John Berchmans <fredrickprashanth@gmail.com>
Date:   Fri May 2 19:50:15 2014 -0700

    staging: lustre use kernel socket sockopt apis

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/lustre/lustre/libcfs/linux/linux-tcpip.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-tcpip.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-tcpip.c
index 4153b4a..ac3a444 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-tcpip.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-tcpip.c
@@ -46,10 +46,8 @@
 int
 libcfs_sock_ioctl(int cmd, unsigned long arg)
 {
-	mm_segment_t    oldmm = get_fs();
 	struct socket  *sock;
 	int	     rc;
-	struct file    *sock_filp;
 
 	rc = sock_create (PF_INET, SOCK_STREAM, 0, &sock);
 	if (rc != 0) {
-- 
1.7.10.4

