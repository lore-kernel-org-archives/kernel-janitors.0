From: Tony Lindgren <tony@atomide.com>
Date: Wed, 22 Aug 2018 14:29:49 +0000
Subject: Re: [bug report] bus: ti-sysc: Fix module register ioremap for larger offsets
Message-Id: <20180822142949.GA94926@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180822132258.rh5u5kenlx2anuvs@kili.mountain>
In-Reply-To: <20180822132258.rh5u5kenlx2anuvs@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

* Dan Carpenter <dan.carpenter@oracle.com> [180822 13:26]:
> Hello Tony Lindgren,
> 
> The patch 7180c523efca: "bus: ti-sysc: Fix module register ioremap
> for larger offsets" from Aug 8, 2018, leads to the following static
> checker warning:
> 
> 	drivers/bus/ti-sysc.c:518 sysc_ioremap()
> 	warn: unsigned 'size' is never less than zero.

Thanks for catching it, we should use int here instead of u32.

>    510  static int sysc_ioremap(struct sysc *ddata)
>    511  {
>    512          u32 size;
>    513  
>    514          size = max3(ddata->offsets[SYSC_REVISION],
>    515                      ddata->offsets[SYSC_SYSCONFIG],
>    516                      ddata->offsets[SYSC_SYSSTATUS]);
>    517  
>    518          if (size < 0)
>                     ^^^^^^^^
> It's weird that we don't trust the offsets.  Can the += 4 overflow?

Some registers may not exist or can be at offset 0 so we use -ENODEV
too. If no registers are found it's a dts configuration error for sure.

Checking for overflow is a good idea. It could happen with misconfigured
dts file if a reg is past the module sizez. I'll be posting v2 of the
patch.

Regards,

Tony
