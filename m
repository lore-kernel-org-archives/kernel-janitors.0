From: walter harms <wharms@bfs.de>
Date: Tue, 09 Aug 2005 15:25:34 +0000
Subject: Re: [KJ] rfc about an uncommented string
Message-Id: <42F8CAEE.2050401@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050809141147.GB4603@voyager>
In-Reply-To: <20050809141147.GB4603@voyager>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


this will break if CONFIG_SERIO_I8042 is set and i guess intentionaly.

who checked that in ?  perhaps the mips ppl know about it.

re,
	walter


Carlo Perassi wrote:
> Hi.
> 
> I'd like to collect some comments about the following code
> segment I found in
> linux-2.6.13-rc6/arch/mips/ite-boards/generic/it8172_setup.c
> (the "^^^" sequence is not mine, it's in the code)
> 
> #ifdef CONFIG_SERIO_I8042
> /*
>  * According to the ITE Special BIOS Note for waking up the
>  * keyboard controller...
>  */
> static int init_8172_keyboard(void)
> {
> 	unsigned int cmd_port = 0x14000064;
> 	unsigned int data_port = 0x14000060;
> 	                         ^^^^^^^^^^^
> 	Somebody here doesn't grok the concept of io ports.
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
