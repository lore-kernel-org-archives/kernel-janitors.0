From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 20 Aug 2013 16:52:41 +0000
Subject: Re: Strange Makefile rule
Message-Id: <CA+MoWDoFTRWwHad6gShdx8-Ar9utF9GzQ_UNwVrhkp7J_J9oVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDoAAc3QmK20RscRpi7_U=cU+0BD9RscH6YYYdzjYp1FLg@mail.gmail.com>
	<52139E3F.9090400@infradead.org>
In-Reply-To: <52139E3F.9090400@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Tue, Aug 20, 2013 at 6:50 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 08/20/13 09:42, Peter Senna Tschudin wrote:
>> I do not have cross compile environment but I'm curious how the
>> Makefile rule works:
>>
>> linux-next]$ cat drivers/net/ethernet/arc/Makefile
>>
>> obj-$(CONFIG_ARC_EMAC) += arc_emac.o
>>
>> There is no file named arc_emac.h and arc_emac.c at
>> drivers/net/ethernet/arc, so what does that line do?
>
> It uses the rule from the previous line in the Makefile.
> Both lines are:
>
> arc_emac-objs := emac_main.o emac_mdio.o
> obj-$(CONFIG_ARC_EMAC) += arc_emac.o
>
>
> Any xyz-objs defines the files to be used to build xyz.o.
>
> Is that clear yet?
Thanks!

>
>
> --
> ~Randy



-- 
Peter
