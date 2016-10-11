From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2016 05:50:00 +0000
Subject: [PATCH] um: remove hppfs MAINTAINERS entry
Message-Id: <20161011055000.GA6961@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We removed hppfs in commit f74a14e870c8 ('um: Remove hppfs') so we can
remove the MAINTAINERS entry as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 63f15c9..116729a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12671,7 +12671,6 @@ F:	Documentation/virtual/uml/
 F:	arch/um/
 F:	arch/x86/um/
 F:	fs/hostfs/
-F:	fs/hppfs/
 
 USERSPACE I/O (UIO)
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
