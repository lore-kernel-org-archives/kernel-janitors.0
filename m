From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Jan 2013 18:54:55 +0000
Subject: [patch] compat: return -EFAULT on error in waitid()
Message-Id: <20130104185451.GA2038@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Jan Kiszka <jan.kiszka@siemens.com>, Chris Metcalf <cmetcalf@tilera.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_to_user() call returns the number of bytes remaining but we
want to return -EFAULT on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/kernel/compat.c b/kernel/compat.c
index de6f324..19971d8 100644
--- a/kernel/compat.c
+++ b/kernel/compat.c
@@ -593,7 +593,7 @@ COMPAT_SYSCALL_DEFINE5(waitid,
 		else
 			ret = put_compat_rusage(&ru, uru);
 		if (ret)
-			return ret;
+			return -EFAULT;
 	}
 
 	BUG_ON(info.si_code & __SI_MASK);
