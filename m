From: Matthew L Helsley <matthelsley@us.ibm.com>
Date: Tue, 14 Mar 2006 05:01:24 +0000
Subject: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <OF1D342081.87AEED99-ON08257131.001A5B48-08257131.001B5975@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Narasimha,

        Have you compile-tested this? Also, could you resend the patch to 
matthltc@us.ibm.com?

        Technically, you're not supposed to #include headers from a kernel 
in userspace. That said, I'd rather not include time.h if I don't have to 
-- then it may be easier for someone to build the userspace headers. I'll 
take a look at this.

All,
        Please drop mhelsley@us.ibm.com from replies and use 
matthltc@us.ibm.com instead.

Thanks,
        -Matt Helsley





Narasimha Sharoff <njsharoff@yahoo.com>
03/13/2006 12:35 PM
 
        To:     kernel-janitors@osdl.org
        cc:     Matthew L Helsley/Beaverton/IBM@IBMUS
        Subject:        [PATCH] bug fix to include/linux/cn_proc.h for 
2.6.16-rc5


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
?struct timeval?

Thanks
Narasimha

Signed-Off-By: njsharoff@yahoo.com
--

include/linux/cn_proc.h |    1 -
 1 files changed, 1 deletion(-)

Index: linux-2.6.16-rc5/include/linux/cn_proc.h
=================================--- linux-2.6.16-rc5.orig/include/linux/cn_proc.h
+++ linux-2.6.16-rc5/include/linux/cn_proc.h
@@ -26,7 +26,6 @@
 #define CN_PROC_H
 
 #include <linux/types.h>
-#include <linux/time.h>
 #include <linux/connector.h>
 
 /*

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
