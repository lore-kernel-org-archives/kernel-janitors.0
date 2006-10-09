From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 09 Oct 2006 05:12:30 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting, v.3
Message-Id: <20061008221230.fbd6a9f8.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 08 Oct 2006 21:56:33 -0700 Don Mullis wrote:

> Refactor Kconfig content to maximize nesting of menus by menuconfig
> and xconfig.
> 
> Tested by simultaneously running `make xconfig` with and without
> patch, and comparing displays.
> 
> Signed-off-by: Don Mullis <dwm@meer.net>
> Cc: Randy Dunlap <rdunlap@xenotime.net>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
> The claim is that this helps the user's understanding of options -- but
> since options are reordered, experts on particular subsystems might
> disagree in some instances.
> 
> Thanks to Randy Dunlap for spotting a major oversight (LKDTM), and
> suggesting dropping an OSS sound change.  Corrections incorporated
> into this version.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
