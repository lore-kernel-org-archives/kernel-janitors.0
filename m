From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 22 Nov 2016 07:15:30 +0000
Subject: Re: [PATCH] bnxt_en: Fix a VXLAN vs GENEVE issue
Message-Id: <CACKFLim17ZxiSrGe+TPR2pXDFrcNvZ=h-_xEbsJULiuVoOybbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161122051440.9748-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161122051440.9748-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: David Miller <davem@davemloft.net>, Prashant Sreedharan <prashant.sreedharan@broadcom.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Nov 21, 2016 at 9:14 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
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

Thanks.

Acked-by: Michael Chan <michael.chan@broadcom.com>
