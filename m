From: Joe Perches <joe@perches.com>
Date: Wed, 31 Aug 2016 15:09:10 +0000
Subject: Re: [PATCH] mwifiex: scan: Simplify code
Message-Id: <1472656150.4176.7.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472644259-15605-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1472644259-15605-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, akarwar@marvell.com, nishants@marvell.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2016-08-31 at 13:50 +0200, Christophe JAILLET wrote:
> This patch:
> =A0=A0=A0- improves code layout
> =A0=A0=A0- removes a useless memset(0) for some memory allocated with kza=
lloc
> =A0=A0=A0- removes a useless if. We know that 'if (chan_band_tlv)' will s=
ucceed
> =A0=A0=A0=A0=A0because it has been tested a few lines above

True, the code above it is also confusing as it's

#ifdef CONFIG_PM
	if (priv->wdev.wiphy->wowlan_config)
		nd_config =3D priv->wdev.wiphy->wowlan_config->nd_config;
#endif

	if (nd_config) {
		adapter->nd_info 			kzalloc(sizeof(struct cfg80211_wowlan_nd_match) +
				sizeof(struct cfg80211_wowlan_nd_match *) *
				scan_rsp->number_of_sets, GFP_ATOMIC);

		if (adapter->nd_info)
			adapter->nd_info->n_matches =3D scan_rsp->number_of_sets;
	}
where nd_config is a pointer already initialized to NULL
so the #endif seems misplaced.

> diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wi=
reless/marvell/mwifiex/scan.c
[]
> @@ -2179,18 +2179,14 @@ int mwifiex_ret_802_11_scan(struct mwifiex_privat=
e *priv,

> =A0
> =A0		if (chan_band_tlv && adapter->nd_info) {
> =A0			adapter->nd_info->matches[idx] > -				kzalloc(sizeof(*pmatch) +
> -				sizeof(u32), GFP_ATOMIC);
> +				kzalloc(sizeof(*pmatch) + sizeof(u32),
> +					GFP_ATOMIC);
> =A0
> =A0			pmatch =3D adapter->nd_info->matches[idx];
> =A0
> =A0			if (pmatch) {
> -				memset(pmatch, 0, sizeof(*pmatch));
> -				if (chan_band_tlv) {
> -					pmatch->n_channels =3D 1;
> -					pmatch->channels[0] > -						chan_band->chan_number;
> -				}
> +				pmatch->n_channels =3D 1;
> +				pmatch->channels[0] =3D chan_band->chan_number;
> =A0			}
> =A0		}

Maybe it'd be better to move the pmatch declaration to this block
and alloc to pmatch then assign adapter->nd_info->matches[idx]
later.

I think the #ifdef CONFIG_PM use in this routine is incomplete.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
