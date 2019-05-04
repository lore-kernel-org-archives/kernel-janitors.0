From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 04 May 2019 09:52:16 +0000
Subject: Re: [PATCH] mt76: mt7615: Use after free in mt7615_mcu_set_bcn()
Message-Id: <20190504095215.GA23263@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503130909.GI29695@mwanda>
In-Reply-To: <20190503130909.GI29695@mwanda>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> We dereference "skb" when we assign:
>=20
> 	req.pkt_len =3D cpu_to_le16(MT_TXD_SIZE + skb->len);
>                                                 ^^^^^^^^
> So this patch just moves the dev_kfree_skb() down a bit to avoid the
> use after free.
>=20
> Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chi=
psets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index ea67c6022fe6..dc1301effa24 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1270,7 +1270,6 @@ int mt7615_mcu_set_bcn(struct mt7615_dev *dev, stru=
ct ieee80211_vif *vif,
>  	mt7615_mac_write_txwi(dev, (__le32 *)(req.pkt), skb, wcid, NULL,
>  			      0, NULL);
>  	memcpy(req.pkt + MT_TXD_SIZE, skb->data, skb->len);
> -	dev_kfree_skb(skb);
> =20
>  	req.omac_idx =3D mvif->omac_idx;
>  	req.enable =3D en;
> @@ -1281,6 +1280,7 @@ int mt7615_mcu_set_bcn(struct mt7615_dev *dev, stru=
ct ieee80211_vif *vif,
>  	req.pkt_len =3D cpu_to_le16(MT_TXD_SIZE + skb->len);
>  	req.tim_ie_pos =3D cpu_to_le16(MT_TXD_SIZE + tim_off);
> =20
> +	dev_kfree_skb(skb);
>  	skb =3D mt7615_mcu_msg_alloc(&req, sizeof(req));
> =20
>  	return mt7615_mcu_msg_send(dev, skb, MCU_EXT_CMD_BCN_OFFLOAD,
> --=20
> 2.18.0
>=20

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXM1gzAAKCRA6cBh0uS2t
rDeKAQDGjECddgKPoW1n3Dnye8aHew95bCQqgsIeRCLiVSH00QD/VWP4FLjdbVHM
+9OT95BeBDbj0eG7VaB6OROPr+8wLwg=
=UKNW
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
