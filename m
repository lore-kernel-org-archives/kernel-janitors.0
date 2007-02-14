From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 14 Feb 2007 22:27:26 +0000
Subject: Re: [KJ] [PATCH] Marking obsolete-deprecated stuff
Message-Id: <Pine.LNX.4.64.0702141726000.3434@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
In-Reply-To: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 14 Feb 2007, yaman wrote:

...
> diff -uprN -X linux-2.6.20-vanilla/Documentation/dontdiff
> linux-2.6.20-vanilla/arch/arm/mm/mmu.c linux-2.6.20/arch/arm/mm/mmu.c
> --- linux-2.6.20-vanilla/arch/arm/mm/mmu.c    2007-02-14
> 15:12:18.000000000 +0200
> +++ linux-2.6.20/arch/arm/mm/mmu.c    2007-02-14 15:49:33.000000000 +0200
> @@ -117,18 +117,16 @@ static void __init early_cachepolicy(cha
>  }
>  __early_param("cachepolicy=", early_cachepolicy);
>
> -static void __init early_nocache(char **__unused)
> +__deprecated static void __init early_nocache(char **__unused)

it's unusual to put the "__deprecated" attribute at the beginning of
the line, even though it's technically correct.  take a look at some
eof the examples in the tree to see the general usage -- it's more
commonly seen at the end.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
