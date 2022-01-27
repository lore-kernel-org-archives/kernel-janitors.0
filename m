Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E22EC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jan 2022 13:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbiA0Nod (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jan 2022 08:44:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46382 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiA0Nod (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jan 2022 08:44:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F50DB82187
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jan 2022 13:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16E3C340E4;
        Thu, 27 Jan 2022 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643291071;
        bh=HgSBcMtXvwzE+HjCLhONBCyia5TpamPu00fjWV7PjLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=abUF1WBLyyJdR0F7PXk80kF5UxABkh0jTre78XisxrY8m52hB46rwb6/4hB3DHww4
         dZV7Z9t+AhcJqD/vCTZxeIj1zFxEhiomVkgMT6YBoY05b5I+H1KeeUkYVao+b/ZPLx
         wE4nZPvZkX1i15F/arSOdOUSsJurdk/xMAyjNiAPZOf8vmvVoq/rpM6pjJ5V1bcdt+
         Sc/s1O3dpPKc4jB/Vct6M5mYz8PWtQOVK4BKPt8U1RU0h/qEokRWFyhXATyo4QdzP5
         O1zO03DjpT3lmZAQm8YW9sOBayhxyJ7TV60HcgXpeXEy9V7sijHc4BoIC1pVFrkHlt
         auFrF5RC8erBg==
Date:   Thu, 27 Jan 2022 14:44:27 +0100
From:   Lorenzo Bianconi <lorenzo@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: mvneta: add frags support to XDP_TX
Message-ID: <YfKhu4BXp9D8v2tO@lore-desk>
References: <20220127085320.GB25851@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NHcf1ooyFcrZ6Knc"
Content-Disposition: inline
In-Reply-To: <20220127085320.GB25851@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--NHcf1ooyFcrZ6Knc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello Lorenzo Bianconi,

Hi Dan,

>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch c41ced023a98: "net: mvneta: add frags support to XDP_TX"
> from Jan 21, 2022, leads to the following Smatch complaint:
>=20
>     drivers/net/ethernet/marvell/mvneta.c:2145 mvneta_xdp_submit_frame()
>     warn: variable dereferenced before check 'tx_desc' (see line 2136)
>=20
> drivers/net/ethernet/marvell/mvneta.c
>   2080        static int
>   2081        mvneta_xdp_submit_frame(struct mvneta_port *pp, struct mvne=
ta_tx_queue *txq,
>   2082                                struct xdp_frame *xdpf, int *nxmit_=
byte, bool dma_map)
>   2083        {
>   2084                struct skb_shared_info *sinfo =3D xdp_get_shared_in=
fo_from_frame(xdpf);
>   2085                struct device *dev =3D pp->dev->dev.parent;
>   2086                struct mvneta_tx_desc *tx_desc =3D NULL;
>   2087                int i, num_frames =3D 1;
>   2088                struct page *page;
>   2089
>   2090                if (unlikely(xdp_frame_has_frags(xdpf)))
>   2091                        num_frames +=3D sinfo->nr_frags;
>   2092
>   2093                if (txq->count + num_frames >=3D txq->size)
>   2094                        return MVNETA_XDP_DROPPED;
>   2095
>   2096                for (i =3D 0; i < num_frames; i++) {
>=20
> We know num_frames is non-zero
>=20
>   2097                        struct mvneta_tx_buf *buf =3D &txq->buf[txq=
->txq_put_index];
>   2098                        skb_frag_t *frag =3D NULL;
>   2099                        int len =3D xdpf->len;
>   2100                        dma_addr_t dma_addr;
>   2101
>   2102                        if (unlikely(i)) { /* paged area */
>   2103                                frag =3D &sinfo->frags[i - 1];
>   2104                                len =3D skb_frag_size(frag);
>   2105                        }
>   2106
>   2107                        tx_desc =3D mvneta_txq_next_desc_get(txq);
>   2108                        if (dma_map) {
>   2109                                /* ndo_xdp_xmit */
>   2110                                void *data;
>   2111
>   2112                                data =3D unlikely(frag) ? skb_frag_=
address(frag)
>   2113                                                      : xdpf->data;
>   2114                                dma_addr =3D dma_map_single(dev, da=
ta, len,
>   2115                                                          DMA_TO_DE=
VICE);
>   2116                                if (dma_mapping_error(dev, dma_addr=
)) {
>   2117                                        mvneta_txq_desc_put(txq);
>   2118                                        goto unmap;
>   2119                                }
>   2120
>   2121                                buf->type =3D MVNETA_TYPE_XDP_NDO;
>   2122                        } else {
>   2123                                page =3D unlikely(frag) ? skb_frag_=
page(frag)
>   2124                                                      : virt_to_pag=
e(xdpf->data);
>   2125                                dma_addr =3D page_pool_get_dma_addr=
(page);
>   2126                                if (unlikely(frag))
>   2127                                        dma_addr +=3D skb_frag_off(=
frag);
>   2128                                else
>   2129                                        dma_addr +=3D sizeof(*xdpf)=
 + xdpf->headroom;
>   2130                                dma_sync_single_for_device(dev, dma=
_addr, len,
>   2131                                                           DMA_BIDI=
RECTIONAL);
>   2132                                buf->type =3D MVNETA_TYPE_XDP_TX;
>   2133                        }
>   2134                        buf->xdpf =3D unlikely(i) ? NULL : xdpf;
>   2135
>   2136                        tx_desc->command =3D unlikely(i) ? 0 : MVNE=
TA_TXD_F_DESC;
>                               ^^^^^^^^^^^^^^^^
> Dereferenced
>=20
>   2137                        tx_desc->buf_phys_addr =3D dma_addr;
>   2138                        tx_desc->data_size =3D len;
>   2139                        *nxmit_byte +=3D len;
>   2140
>   2141                        mvneta_txq_inc_put(txq);
>   2142                }
>   2143
>   2144                /*last descriptor */
>   2145                if (likely(tx_desc))

since num_frames is at least 1, I guess we can drop this if condition.

Regards,
Lorenzo

>                                  ^^^^^^^
> Checked after dereference.
>=20
>   2146                        tx_desc->command |=3D MVNETA_TXD_L_DESC | M=
VNETA_TXD_Z_PAD;
>   2147
>   2148                txq->pending +=3D num_frames;
>   2149                txq->count +=3D num_frames;
>   2150
>   2151                return MVNETA_XDP_TX;
>   2152
>   2153        unmap:
>   2154                for (i--; i >=3D 0; i--) {
>   2155                        mvneta_txq_desc_put(txq);
>   2156                        tx_desc =3D txq->descs + txq->next_desc_to_=
proc;
>   2157                        dma_unmap_single(dev, tx_desc->buf_phys_add=
r,
>   2158                                         tx_desc->data_size,
>=20
> regards,
> dan carpenter

--NHcf1ooyFcrZ6Knc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYfKhugAKCRA6cBh0uS2t
rFTgAQCPKJw3v9fcMq9QtRSxaAZy2VSqmkFs8MIeOUYc+rCprgD/VbZ4w6nNpZnG
YZTBhZosCNtp8bcPqjh81wnevCOaFQg=
=vya5
-----END PGP SIGNATURE-----

--NHcf1ooyFcrZ6Knc--
