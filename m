From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 16 Oct 2018 06:59:04 +0000
Subject: Re: [PATCH] pinctrl: sunxi: Fix a memory leak in 'sunxi_pinctrl_build_state()'
Message-Id: <20181016065904.53lg6zth6mjf7mkg@flea>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Oct 16, 2018 at 08:22:28AM +0200, Christophe JAILLET wrote:
> If 'krealloc()' fails, 'pctl->functions' is set to NULL.
> We should instead use a temp variable in order to be able to free the
> previously allocated memeory, in case of OOM.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
