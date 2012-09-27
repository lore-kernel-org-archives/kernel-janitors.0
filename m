From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 02:59:34 +0000
Subject: Re: [tty:tty-next 36/40] kernel/debug/kdb/kdb_main.c:2839:4: warning: passing argument 2 of 'kdb_reg
Message-Id: <20120927025934.GA16400@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927012916.GA9207@localhost>
 <20120927013930.GA27336@lizard>
 <20120927021119.GA29097@lizard>
 <20120927023647.GA12399@localhost>
 <20120927025242.GA10435@lizard>
In-Reply-To: <20120927025242.GA10435@lizard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton.vorontsov@linaro.org>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>

> > > Also, "arch/cris/arch-v32/kernel/kgdb.c" -- it seems like it is its own
> > > implementation of KGDB. :-) But it's CONFIG_ETRAX_KGDB...
> > 
> > Doing the regular 'make' triggers these errors:
> > 
> > arch/cris/arch-v10/kernel/kgdb.c:1273:6: warning: missing terminating " character [enabled by default]
> 
> Yup, as I said, arch/cris/arch-v10/kernel/kgdb.c have nothing to do with
> kernel/debug/'s KGDB/KDB stuff. It seem to be a very-very old, completely
> separate implementation of GDB protocol.

OK.

Thanks,
Fengguang
