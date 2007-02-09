From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 09 Feb 2007 01:44:07 +0000
Subject: Re: [KJ] linux-2.6/drivers/ide/pci drivers dont have module_exit
Message-Id: <20070208174407.72d358da.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1170937181.3571.31.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1170937181.3571.31.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 08 Feb 2007 17:49:41 +0530 Vignesh Babu BM wrote:

> Can someone clarify on this please:
> Why is it that all the drivers in linux-2.6/drivers/ide/pci have only
> module_init and not module_exit?
> Does that mean these drivers cannot be rmmod'ed?
> If no then what is the exit point for these?

This question is more appropriate for the linux-ide or the
kernelnewbies mailing list.

However.  Quoting from the linux-ide mailing list,
Message-Id: <1138183958.5857.12.camel@lyra.home.ludost.net>:

> The above should never happen because pdc202xx_old and
> ide-generic don't have module_exit() and thus cannot be unloaded.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
