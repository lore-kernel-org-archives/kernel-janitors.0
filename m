From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2015 22:14:41 +0000
Subject: [patch v2] ncpfs: don't allow negative timeouts
Message-Id: <20151110221441.GA30281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151110091923.GE26699@quack.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code causes a static checker warning because it's a user controlled
variable where we cap the upper bound but not the lower bound.  Let's
return an -EINVAL for negative timeouts.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: in the original I just ignored the invalid data and went with the
    default but now it returns -EINVAL.

diff --git a/fs/ncpfs/ioctl.c b/fs/ncpfs/ioctl.c
index 79b1130..ebf45d2 100644
--- a/fs/ncpfs/ioctl.c
+++ b/fs/ncpfs/ioctl.c
@@ -525,7 +525,9 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			switch (rqdata.cmd) {
 				case NCP_LOCK_EX:
 				case NCP_LOCK_SH:
-						if (rqdata.timeout = 0)
+						if (rqdata.timeout < 0)
+							return -EINVAL;
+						else if (rqdata.timeout = 0)
 							rqdata.timeout = NCP_LOCK_DEFAULT_TIMEOUT;
 						else if (rqdata.timeout > NCP_LOCK_MAX_TIMEOUT)
 							rqdata.timeout = NCP_LOCK_MAX_TIMEOUT;
