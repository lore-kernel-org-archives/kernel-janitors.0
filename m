From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 29 Oct 2004 23:51:37 +0000
Subject: [KJ] 2.6.10-rc1-kjt1: ixgb_ethtool.c doesn't compile
Message-Id: <20041029235137.GG6677@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82021085610115474=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041024151241.GA1920@stro.at>
In-Reply-To: <20041024151241.GA1920@stro.at>
To: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org, Nishanth Aravamudan <nacc@us.ibm.com>

--===============82021085610115474==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 24, 2004 at 05:12:41PM +0200, maximilian attems wrote:
>...
> splitted out 168 patches:
> http://debian.stro.at/kjt/2.6.10-rc1-kjt1/split/

Could you provide a .tar.gz (or .tar.bz) of the splitted patches 
(similar to how Andrew does for -mm)?

> thanks for feedback.
> maks
>...

msleep_interruptible-drivers_net_ixgb_ixgb_ethtool.patch doesn't 
compile:

<--  snip  -->

...
  CC      drivers/net/ixgb/ixgb_ethtool.o
drivers/net/ixgb/ixgb_ethtool.c: In function `ixgb_ethtool_led_blink':
drivers/net/ixgb/ixgb_ethtool.c:407: error: `id' undeclared (first use in this function)
drivers/net/ixgb/ixgb_ethtool.c:407: error: (Each undeclared identifier is reported only once
drivers/net/ixgb/ixgb_ethtool.c:407: error: for each function it appears in.)
make[3]: *** [drivers/net/ixgb/ixgb_ethtool.o] Error 1

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============82021085610115474==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82021085610115474==--
