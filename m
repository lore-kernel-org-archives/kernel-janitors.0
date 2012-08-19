From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Sun, 19 Aug 2012 09:36:49 +0000
Subject: Re: [PATCH 1/5] drivers/net/wireless/ipw2x00/ipw2100.c: introduce missing initialization
Message-Id: <CA++WF2MmTe6WP6MQRV-v1VwkpcUrw4hU6yh79NdG-K4snzQkbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345325159-7365-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345325159-7365-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Julia,

On 19 August 2012 01:25, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> -       ipw2100_get_ordinal(priv, IPW_ORD_STAT_ASSN_AP_BSSID, &bssid, &len);
> +       ret = ipw2100_get_ordinal(priv, IPW_ORD_STAT_ASSN_AP_BSSID, &bssid,
> +                                 &len);

This is correct, but this line has one more typo. It should be

-&bssid
+bssid

according to the bssid definition in the beginning of the function:

u8 bssid[ETH_ALEN];

Could you fix this as well?

Thanks!
Stanislav.
