From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 14 May 2007 17:00:57 +0000
Subject: Re: [KJ] weird Kconfig excerpt in Documentation/CodingStyle
Message-Id: <20070514100057.c27147fb.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 14 May 2007 12:28:23 -0400 (EDT) Robert P. J. Day wrote:

> 
>   is this snippet from Documentation/CodingStyle supposed to make any
> sense?
> 
> ...
> For configuration options (arch/xxx/Kconfig, and all the Kconfig files),
> somewhat different indentation is used.
> 
> Help text is indented with 2 spaces.

2 spaces more than the config keywords, which are usually indented
with 1 tab.

> 
> if CONFIG_EXPERIMENTAL
>         tristate CONFIG_BOOM
>         default n
>         help
>           Apply nitroglycerine inside the keyboard (DANGEROUS)
>         bool CONFIG_CHEER
>         depends on CONFIG_BOOM
>         default y
>         help
>           Output nice messages when you explode
> endif
> ...
> 
>   that just looks so wrong in so many ways.

but none are listed here...

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
