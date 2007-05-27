From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Sun, 27 May 2007 17:17:59 +0000
Subject: Re: [KJ] why doesn't module.h include init.h?
Message-Id: <alpine.DEB.0.99.0705271316410.15256@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271126550.29617@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271126550.29617@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>   i just *know* i'm going to regret bringing this up, but does it make
> sense to anyone else that include/linux/module.h doesn't explicitly
> include include/linux/init.h?
> 
>   one would think that the sane way to have done this would have been
> for init.h to define the generic init-related stuff, then for module.h
> to include init.h and further define the module-related stuff with
> respect to *that*.
> 
>   yeesh.  what a mess.

I haven't looked at it at all, so this is coming off the top of my head, 
but code that cannot be compiled as a loadable module but does require 
boot-time initialization would need init.h but not module.h...wouldn't it?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
