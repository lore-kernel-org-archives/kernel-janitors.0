From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2015 09:09:24 +0000
Subject: [patch] ncpfs: don't allow negative timeouts
Message-Id: <20151110090924.GB2934@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: Jan Kara <jack@suse.cz>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code causes a static checker warning because it's a user controlled
variable where we cap the upper bound but not the lower bound.  If
someone passes us a negative timeout then I guess lets set it to the
default.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ncpfs/ioctl.c b/fs/ncpfs/ioctl.c
index 79b1130..c07498a 100644
--- a/fs/ncpfs/ioctl.c
+++ b/fs/ncpfs/ioctl.c
@@ -525,7 +525,7 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			switch (rqdata.cmd) {
 				case NCP_LOCK_EX:
 				case NCP_LOCK_SH:
-						if (rqdata.timeout = 0)
+						if (rqdata.timeout <= 0)
 							rqdata.timeout = NCP_LOCK_DEFAULT_TIMEOUT;
 						else if (rqdata.timeout > NCP_LOCK_MAX_TIMEOUT)
 							rqdata.timeout = NCP_LOCK_MAX_TIMEOUT;
