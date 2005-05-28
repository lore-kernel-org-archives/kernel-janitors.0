From: Chuck Short <zulcss@gmail.com>
Date: Sat, 28 May 2005 04:00:25 +0000
Subject: [KJ] GCC4 cleanup question
Message-Id: <4297ECD9.2060505@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I was wondering how would you fix warnings like the following:

net/ipv4/route.c: In function 'ip_route_input_slow':
net/ipv4/route.c:1770: warning: 'rth' may be used uninitialized in this 
functionnet/ipv4/route.c:1797: warning: 'rth' may be used uninitialized 
in this functionnet/ipv4/route.c: In function 'ip_route_output_slow':
net/ipv4/route.c:2270: warning: 'rth' may be used uninitialized in this 
functionnet/ipv4/route.c:2242: warning: 'rth' may be used uninitialized 
in this function

Thanks
chuck
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
