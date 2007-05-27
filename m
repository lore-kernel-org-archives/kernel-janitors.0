From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sun, 27 May 2007 18:21:58 +0000
Subject: Re: [KJ] is it safe to assume anything referring to "MODULE_PARM"
Message-Id: <20070527112158.471fea48.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271356130.9605@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271356130.9605@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 27 May 2007 13:57:31 -0400 (EDT) Robert P. J. Day wrote:

> 
>   given that the old-style MODULE_PARM macro has been obsolete since
> 2003:
> 
> http://lwn.net/Articles/22197/
> 
> is it safe to assume that any still-active references to it can't
> possibly mean anything?
> 
>   $ grep -rw MODULE_PARM *

It's safe to clean up any existing references, esp. if they are
more than comments or not-live code.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
