From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 16 May 2007 13:16:25 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <Pine.LNX.4.64.0705160915340.4114@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 15 May 2007, Cripps wrote:

> Hey,
> I've found the warning about pm_send_all() being marked for
> deprecation ... it appears as though
> this call is only used in arch/i386/kernel/apm.c and is declared in
> include/pm_legacy.h as:
> #ifdef CONFIG_PM_LEGACY
> ...
> int __deprecated pm_send_all(pm_request_t, void* data);
> #else
> ...
> static inline int pm_send_all(pm_request_t rqst, void* data){ return 0;}
> ...
> #endif
>
>
> I wanted to tackle this as a first time patch, but there is one thing
> I'm not entirely clear on:
> How do I find out what this is to be replaced with (if there is
> another function to replace it with), and if it's not meant to be
> replaced, how would that be handled?

i wouldn't do anything with the legacy PM stuff.  i was working on
that a while back, and it's in the process of being removed entirely,
so there's no point trying to clean it up.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
