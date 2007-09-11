From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 11 Sep 2007 20:01:47 +0000
Subject: Re: does '__setup("dscc4.setup=", dscc4_setup);' make any sense?
Message-Id: <20070911130147.0b7bced9.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 11 Sep 2007 15:41:02 -0400 (EDT) Robert P. J. Day wrote:

> 
>   in drivers/net/wan/dscc4.c, you have the snippet:
> 
> ==> #ifndef MODULE
> static int __init dscc4_setup(char *str)
> {
>         int *args[] = { &debug, &quartz, NULL }, **p = args;
> 
>         while (*p && (get_option(&str, *p) = 2))
>                 p++;
>         return 1;
> }
> 
> __setup("dscc4.setup=", dscc4_setup);
> #endif
> ==> 
>   but is that call to __setup() correct?  i thought you would just use
> 
>   __setup("setup=", dscc4_setup);
> 
> but you * would* specify "dscc4.setup=" on the boot line and that
> would properly be associated with that setup routine if that code were
> compiled into the kernel.
> 
> or am i totally misreading how this mechanism works?


You are correct AFAIK.  Please check with the driver maintainer:

DSCC4 DRIVER
P:	Francois Romieu
M:	romieu@fr.zoreil.com
L:	netdev@vger.kernel.org
S:	Maintained

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
