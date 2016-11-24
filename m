From: David Miller <davem@davemloft.net>
Date: Thu, 24 Nov 2016 01:27:31 +0000
Subject: Re: [PATCH] bnxt_en: Fix a VXLAN vs GENEVE issue
Message-Id: <20161123.202731.15246104261953121.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161122051440.9748-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161122051440.9748-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: michael.chan@broadcom.com, prashant.sreedharan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 22 Nov 2016 06:14:40 +0100

> Knowing that:
>   #define TUNNEL_DST_PORT_FREE_REQ_TUNNEL_TYPE_VXLAN        (0x1UL << 0)
>   #define TUNNEL_DST_PORT_FREE_REQ_TUNNEL_TYPE_GENEVE       (0x5UL << 0)
> and that 'bnxt_hwrm_tunnel_dst_port_alloc()' is only called with one of
> these 2 constants, the TUNNEL_DST_PORT_ALLOC_REQ_TUNNEL_TYPE_GENEVE can not
> trigger.
> 
> Replace the bit test that overlap by an equality test, just as in
> 'bnxt_hwrm_tunnel_dst_port_free()' above.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
