From: Cripps <acripps@gmail.com>
Date: Wed, 16 May 2007 15:49:54 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <c6711b6b0705160901h3b361266pcbc8e6aaf833be42@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

So then where possible pm_send_all() should just be yanked from things
like arch/i386/kernel/apm.c , and then don't worry about it elsewhere?
-Aaron

On 5/16/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Wed, 16 May 2007, Cripps wrote:
>
> > so is apm support being completely removed then?
>
> no.  "legacy PM" refers to power management that's even older than
> APM.
>
> rday
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
