From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Feb 2016 11:40:09 +0000
Subject: [patch] fs/compat: fix a bug in do_ncp_super_data_conv()
Message-Id: <20160204114009.GB11239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We are trying to copy the c_n->mounted_vol[] array and the three integer
struct members that follow it.  The problem is that there is a 3 byte
struct hole after c_n->mounted_vol[] so we don't copy the lower 3 bytes
of c_n->flags.

I fixed it by doing the assignments one at a time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/compat.c b/fs/compat.c
index a71936a..355ab04 100644
--- a/fs/compat.c
+++ b/fs/compat.c
@@ -693,7 +693,11 @@ static void *do_ncp_super_data_conv(void *raw_data)
 		n->file_mode = c_n->file_mode;
 		n->gid = c_n->gid;
 		n->uid = c_n->uid;
-		memmove (n->mounted_vol, c_n->mounted_vol, (sizeof (c_n->mounted_vol) + 3 * sizeof (unsigned int)));
+		memmove(n->mounted_vol, c_n->mounted_vol,
+			sizeof(c_n->mounted_vol));
+		n->time_out = c_n->time_out;
+		n->retry_count = c_n->retry_count;
+		n->flags = c_n->flags;
 		n->wdog_pid = c_n->wdog_pid;
 		n->mounted_uid = c_n->mounted_uid;
 	} else if (version = 4) {
