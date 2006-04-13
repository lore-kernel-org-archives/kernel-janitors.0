From: Jean Delvare <khali@linux-fr.org>
Date: Thu, 13 Apr 2006 10:29:18 +0000
Subject: Re: [KJ][patch] fix array overflow in ak4114.c
Message-Id: <20060413122918.a0e861a1.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93885909318167893=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1144849044.8222.10.camel@localhost.localdomain>
In-Reply-To: <1144849044.8222.10.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============93885909318167893==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Darren,

> Coverity found a static overflow in ak4114.c @ line 46.
> 
> After looking at this a little it seems like someone has typed in the
> wrong symbolic name (twice), as they were trying to save the TX state
> register info.
> 
> The patch below changes the relevant AK4114_REG_RXCSB0 values to
> AK4114_REG_TXCSB0. Which both makes more sense and fixes the array
> overflow.
> (...)
> --- 2.6.17-rc1-git5/sound/i2c/other/ak4114.c.orig	2006-04-12 23:12:43.000000000 +1000
> +++ 2.6.17-rc1-git5/sound/i2c/other/ak4114.c	2006-04-12 23:16:56.000000000 +1000

I'm not maintaining the sound drivers, so please don't Cc: me on this.
The only case where I would be able (and willing) to help is when a bug
actually involves the i2c part of a driver. Doesn't seem to be the case
here.

Thanks,
-- 
Jean Delvare

--===============93885909318167893==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93885909318167893==--
