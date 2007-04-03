From: Jaco Kroon <jaco@kroon.co.za>
Date: Tue, 03 Apr 2007 09:30:15 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <46121EA7.5070106@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Richard Knutsson wrote:
> Hello
> 
> There were recently a thread in LKML about C++-usage in the kernel (again).
> That reminded me, why do we have those "ifdef __cplusplus"? As an 
> example, we have this (in include/linux/stddef.h) when defining NULL as 
> 0 in C++ and ((void *)0) otherwise. From what I can see, there is no
> reason to have them, or am I missing something? (like they are needed by
> libraries)


Many of these headers are exported to userspace, eg the linux-headers 
package on many linux distributions.  If a user includes them from a C++ 
program, they shouldn't break.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
