From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat, 12 Dec 2020 23:05:40 +0000
Subject: Re: [PATCH] net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
Message-Id: <454c848c-27d3-5683-1f11-7169200fec28@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212182005.120437-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212182005.120437-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, opendmb@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 12/12/2020 10:20 AM, Christophe JAILLET wrote:
> If the 'register_netdev()' call fails, we must undo a previous
> 'bcmgenet_mii_init()' call.
> 
> Fixes: 1c1008c793fa ("net: bcmgenet: add main driver file")> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
> The missing 'bcmgenet_mii_exit()' call is added here, instead of in the
> error handling path in order to avoid some goto spaghetti code.

Yes that makes sense, thanks!
-- 
Florian
