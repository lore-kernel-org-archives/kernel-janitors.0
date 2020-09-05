From: Ioana Ciornei <ioana.ciornei@nxp.com>
Date: Sat, 05 Sep 2020 20:14:37 +0000
Subject: RE: [PATCH] MAINTAINERS: repair reference in LYNX PCS MODULE
Message-Id: <VI1PR0402MB38710D434D6549E644B241BBE02A0@VI1PR0402MB3871.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905103700.17162-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200905103700.17162-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


> Subject: [PATCH] MAINTAINERS: repair reference in LYNX PCS MODULE
> 
> Commit 0da4c3d393e4 ("net: phy: add Lynx PCS module") added the files in
> ./drivers/net/pcs/, but the new LYNX PCS MODULE section refers to
> ./drivers/net/phy/.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/net/phy/pcs-lynx.c
> 
> Repair the LYNX PCS MODULE section by referring to the right location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>

> ---
> applies cleanly on next-20200903
> 
> Ioana, please ack.
> David, please pick this minor non-urgent patch into your net-next.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bb0cb31d323b..918deaa1d96e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10350,7 +10350,7 @@ LYNX PCS MODULE
>  M:	Ioana Ciornei <ioana.ciornei@nxp.com>
>  L:	netdev@vger.kernel.org
>  S:	Supported
> -F:	drivers/net/phy/pcs-lynx.c
> +F:	drivers/net/pcs/pcs-lynx.c
>  F:	include/linux/pcs-lynx.h
> 
>  M68K ARCHITECTURE
> --
> 2.17.1
