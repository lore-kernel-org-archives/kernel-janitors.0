From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 30 Oct 2004 04:44:18 +0000
Subject: Re: [KJ] 2.6.10-rc1-kjt1: ixgb_ethtool.c doesn't compile
Message-Id: <29495f1d04102921447ab65101@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96238506611122021=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041024151241.GA1920@stro.at> <20041029235137.GG6677@stusta.de>
In-Reply-To: <20041029235137.GG6677@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org, Nishanth Aravamudan <nacc@us.ibm.com>

--===============96238506611122021==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 30 Oct 2004 01:51:37 +0200, Adrian Bunk <bunk@stusta.de> wrote:
> On Sun, Oct 24, 2004 at 05:12:41PM +0200, maximilian attems wrote:
> >...
> > splitted out 168 patches:
> > http://debian.stro.at/kjt/2.6.10-rc1-kjt1/split/
> 
> Could you provide a .tar.gz (or .tar.bz) of the splitted patches
> (similar to how Andrew does for -mm)?

Do you mean like the one he provided?

please test out:
http://debian.stro.at/kjt/2.6.10-rc1-kjt1/2.6.10-rc1-kjt1.patch.bz2

Admittedly, it's not tarred first, but still... Maybe you mean
something else, though, and I'm just confused.

> > thanks for feedback.
> > maks
> >...
> 
> msleep_interruptible-drivers_net_ixgb_ixgb_ethtool.patch doesn't
> compile:
> 
> <--  snip  -->
> 
> ...
>   CC      drivers/net/ixgb/ixgb_ethtool.o
> drivers/net/ixgb/ixgb_ethtool.c: In function `ixgb_ethtool_led_blink':
> drivers/net/ixgb/ixgb_ethtool.c:407: error: `id' undeclared (first use in this function)
> drivers/net/ixgb/ixgb_ethtool.c:407: error: (Each undeclared identifier is reported only once
> drivers/net/ixgb/ixgb_ethtool.c:407: error: for each function it appears in.)
> make[3]: *** [drivers/net/ixgb/ixgb_ethtool.o] Error 1

Thanks for catching this, I will make the change to the patch tomorrow
and send it again.

-Nish

--===============96238506611122021==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96238506611122021==--
