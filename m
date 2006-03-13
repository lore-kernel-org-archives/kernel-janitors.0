From: Narasimha Sharoff <njsharoff@yahoo.com>
Date: Mon, 13 Mar 2006 20:35:43 +0000
Subject: [KJ] [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <20060313203543.9380.qmail@web52708.mail.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Compilation fails for a test program which includes
cn_proc.h for Process Event Notification.
The Patch below fixes the issue.

Test Code:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/socket.h>
#include <linux/connector.h>
#include <linux/netlink.h>
#include <linux/cn_proc.h>

main()
{
        printf("hello\n");
}

Results:
$gcc -o b b.c
In file included from cn_proc.h:29,
                 from b.c:13:
/usr/include/linux/time.h:18: error: redefinition of
=91struct timeval=92

Thanks
Narasimha

Signed-Off-By: njsharoff@yahoo.com
--

include/linux/cn_proc.h |    1 -
 1 files changed, 1 deletion(-)

Index: linux-2.6.16-rc5/include/linux/cn_proc.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D--- linux-2.6.16-rc5.orig/include/linux/cn_proc.h
+++ linux-2.6.16-rc5/include/linux/cn_proc.h
@@ -26,7 +26,6 @@
 #define CN_PROC_H
=20
 #include <linux/types.h>
-#include <linux/time.h>
 #include <linux/connector.h>
=20
 /*

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
