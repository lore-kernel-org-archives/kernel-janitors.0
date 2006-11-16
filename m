From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 16 Nov 2006 07:28:36 +0000
Subject: Re: [KJ] [tipc-discussion] [patch] net/tipc:sprintf/strcpy
Message-Id: <20061115232836.f3cfb588.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061102062656.GA8339@Chamillionaire.breakpoint.cc>
In-Reply-To: <20061102062656.GA8339@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2 Nov 2006 13:23:09 -0800 Horvath, Elmer wrote:

> Hi, 
> 
> Good observations.  My comments in <Elmer> </Elmer> way down below.
> 
> What is 'kernel-janitors@lists.osdl.org' ?

Mailing list for kernel-janitors work.
See http://www.kerneljanitors.org/ for info.


> <Elmer> If you want to be 'secure', as you say, then strlcpy() is a
> better choice than strncpy() to guarantee that you will have a
> null-terminated string in the destination address (as far as I
> understand the subtle differences).  strncpy() will result in a non-null
> terminated octet-string if the source string is too long.  Any future
> string operations may cause problems that are harder to trace.
> 
> Is strlcpy() available on all implementations?  I once compiled code on
> an architecture that did not support it and had to use strncpy() with an
> explicit assignment bloating code:
>     dest_string[last_octet] = '\0';
> </Elmer>

(1-2 minutes of grep:)

Yes, strlcpy() is available on all Linux architectures.
An arch. can provide a specific version of it and also
#define __HAVE_ARCH_STRLCPY

If that's not done, then the generic version in lib/string.c
will be used.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
