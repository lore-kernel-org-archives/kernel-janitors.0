From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2020 09:11:53 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <20201215091153.GH2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
 <20201215085655.ddacjfvogc3e33vz@gilmour>
In-Reply-To: <20201215085655.ddacjfvogc3e33vz@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime@cerno.tech>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kuba@kernel.org, sr@denx.de, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com

On Tue, Dec 15, 2020 at 09:56:55AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Dec 14, 2020 at 09:21:17PM +0100, Christophe JAILLET wrote:
> > 'irq_of_parse_and_map()' should be balanced by a corresponding
> > 'irq_dispose_mapping()' call. Otherwise, there is some resources leaks.
> 
> Do you have a source to back that? It's not clear at all from the
> documentation for those functions, and couldn't find any user calling it
> from the ten-or-so random picks I took.

It looks like irq_create_of_mapping() needs to be freed with
irq_dispose_mapping() so this is correct.

regards,
dan carpenter
