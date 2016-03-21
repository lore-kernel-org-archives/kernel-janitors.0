From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Mar 2016 10:11:07 +0000
Subject: Re: [patch] mdio-sun4i: oops in error handling in probe
Message-Id: <CAGb2v66zC4os_bo2iTZiftcD5X5vVc5s6Mn_KJsUN5pirEUBLA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160321090231.GA31670@mwanda>
In-Reply-To: <20160321090231.GA31670@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Mar 21, 2016 at 5:02 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We could end up dereferencing an error pointer when we call
> regulator_disable().
>
> Fixes: 4bdcb1dd9feb ('net: Add MDIO bus driver for the Allwinner EMAC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
