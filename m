From: David Miller <davem@davemloft.net>
Date: Fri, 30 Aug 2013 21:54:57 +0000
Subject: Re: [patch v2] net/fec: cleanup types in fec_get_mac()
Message-Id: <20130830.175457.2230524537752247474.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377261869.3364.3.camel@bwh-desktop.uk.level5networks.com>
	<20130829082514.GB14334@elgon.mountain>
In-Reply-To: <20130829082514.GB14334@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, fabio.estevam@freescale.com, Frank.Li@freescale.com, jim_baxter@mentor.com, B38611@freescale.com, netdev@vger.kernel.org, bhutchings@solarflare.com, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 11:25:14 +0300

> My static checker complains that on some arches unsigned longs can be 8
> characters which is larger than the buffer is only 6 chars.
> Additionally, Ben Hutchings points out that the buffer actually holds
> big endian data and the buffer we are reading from is CPU endian.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix endian annotations and reverse the beXX_to_cpu() calls so that
>     they say cpu_to_beXX().

Applied, thanks.
