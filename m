From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 05 Sep 2020 15:40:48 +0000
Subject: Re: [PATCH] MAINTAINERS: repair reference in LYNX PCS MODULE
Message-Id: <20200905154048.GH3164319@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905103700.17162-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200905103700.17162-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Sep 05, 2020 at 12:37:00PM +0200, Lukas Bulwahn wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
