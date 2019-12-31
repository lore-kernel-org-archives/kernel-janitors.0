From: David Miller <davem@davemloft.net>
Date: Tue, 31 Dec 2019 01:52:35 +0000
Subject: Re: [PATCH] sfc: avoid duplicate error handling code in 'efx_ef10_sriov_set_vf_mac()'
Message-Id: <20191230.175235.1109525824306658097.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191226150224.8701-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191226150224.8701-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, mhabets@solarflare.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 16:02:24 +0100

> 'eth_zero_addr()' is already called in the error handling path. This is
> harmless, but there is no point in calling it twice, so remove one.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to net-next, thank you.
