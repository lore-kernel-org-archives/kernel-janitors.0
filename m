From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Apr 2017 19:11:53 +0000
Subject: [PATCH] orangefs: handle zero size write in debugfs
Message-Id: <20170414191153.GB30875@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If we write zero bytes to this debugfs file, then it will cause an
underflow when we do copy_from_user(buf, ubuf, count - 1).  Debugfs can
normally only be written to by root so the impact of this is low.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 791912da97d7..716ed337f166 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -440,6 +440,9 @@ static ssize_t orangefs_debug_write(struct file *file,
 		"orangefs_debug_write: %pD\n",
 		file);
 
+	if (count = 0)
+		return 0;
+
 	/*
 	 * Thwart users who try to jamb a ridiculous number
 	 * of bytes into the debug file...
