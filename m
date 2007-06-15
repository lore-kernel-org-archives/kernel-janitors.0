From: "Vegard Nossum" <vegard.nossum@gmail.com>
Date: Fri, 15 Jun 2007 15:57:28 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <19f34abd0706150857p611c2faflc968e8c1a68376b6@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> which explanatory comment?  the one from init/main.c?  but why would i
> leave it in when the code it pertains to has been removed?

Yes. Wouldn't it be good to keep it with the checks (so
include/linux/compiler.h)? It's a useful comment.

Vegard
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
