From: Bongani Hlope <bonganilinux@mweb.co.za>
Date: Sat, 28 May 2005 06:25:54 +0000
Subject: Re: [KJ] GCC4 cleanup question
Message-Id: <200505280825.55486.bonganilinux@mweb.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4297ECD9.2060505@gmail.com>
In-Reply-To: <4297ECD9.2060505@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 28 May 2005 06:00 am, Chuck Short wrote:
> Hi,
>
> I was wondering how would you fix warnings like the following:
>
> net/ipv4/route.c: In function 'ip_route_input_slow':
> net/ipv4/route.c:1770: warning: 'rth' may be used uninitialized in this
> functionnet/ipv4/route.c:1797: warning: 'rth' may be used uninitialized
> in this functionnet/ipv4/route.c: In function 'ip_route_output_slow':
> net/ipv4/route.c:2270: warning: 'rth' may be used uninitialized in this
> functionnet/ipv4/route.c:2242: warning: 'rth' may be used uninitialized
> in this function
>
> Thanks
> chuck

I don't have GCC4, the first rth is initialised inside the __mkroute_input 
function and the second one is initialised in the __mkroute_output function. 
I don't know why gcc is giving those warings. 

--- net/ipv4/route.c.old        2005-05-18 21:18:19.000000000 +0200
+++ net/ipv4/route.c    2005-05-28 08:23:18.000000000 +0200
@@ -1767,7 +1767,7 @@ static inline int ip_mkroute_input_def(s
                                       struct in_device *in_dev,
                                       u32 daddr, u32 saddr, u32 tos)
 {
-       struct rtable* rth;
+       struct rtable* rth = NULL;
        int err;
        unsigned hash;

@@ -2267,7 +2267,7 @@ static inline int ip_mkroute_output(stru
        unsigned char hop;
        unsigned hash;
        int err = -EINVAL;
-       struct rtable *rth;
+       struct rtable *rth = NULL;

        if (res->fi && res->fi->fib_nhs > 1) {
                unsigned char hopcount = res->fi->fib_nhs;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
