Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F1FE9270D
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 15:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbjJEPx6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235715AbjJEPvl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 11:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5938E20E63
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696514952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D2fnoj8vzkTz1uPdmOImvOOhAqJGXgCxNbu69/797zA=;
        b=FeVSjt2pfjdD1BjdvtyHqNtSfz5ktD8wdQsHxbKphom5+5AkZTm9c/QQK7+1xs+T7q1Hrm
        8cVNf8+wPeh8QRbXMdHwUqwr+jU49NdUIKCwkCnYAMGghuYlQVtr1HXEBl4Wgg5TI7H8oR
        ocbFq8wCUmWwO5olO+bG5I8y0AUFC4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-1Rv6iIZNN2yJolcwKKicJQ-1; Thu, 05 Oct 2023 04:06:25 -0400
X-MC-Unique: 1Rv6iIZNN2yJolcwKKicJQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae5101b152so15404966b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 01:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696493184; x=1697097984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2fnoj8vzkTz1uPdmOImvOOhAqJGXgCxNbu69/797zA=;
        b=eJTZ/bxMaul3SSioBx/BXnK+TjmHXOmj5PdqBeSqNty7HXzV85uQ4JM5qItKMVUuoO
         dFh8EnlnAz9OfYpBK6Qmid2TTb9dzFYOwcTvxrVq1e3509kHfcOVgUdtL+yj4cYRNUPg
         GOhVTerzkeb5qfST3iykJ6Zyp/CwnH9kSetfZ84ly8s+pU712hxcaXiRTEQjo7fDt152
         DZHUmen6ThKHr98fhBptrh9brTe05NndyvERBZu9pTPOS9tkxCHKrP/TPNnNiCimu6EP
         AuXkV/u/kUuRLqv4aDhWmFcNdt/IQGcmU7tAAgTKXdpCT4VtpYBxq8gS/ynsdfFAZKEK
         YHkw==
X-Gm-Message-State: AOJu0Yz/S/vRWwFHDB5WSAdBd37wiVf9EyzFFoyWfdPLAERp5s1+H6x5
        pF5i9n3+Uov8MiZ64m0al7WWHVmask+Toy6nxo6DHEwLcgCginqr6kLh+G+36fnAhjOFhTBsqPB
        5YkndpGwQD8DQ8CtxMce7VrGFyVeC
X-Received: by 2002:a17:906:10a:b0:9b1:488d:afd1 with SMTP id 10-20020a170906010a00b009b1488dafd1mr4562856eje.5.1696493184541;
        Thu, 05 Oct 2023 01:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeg2b8hY+aWyTZPpZKtdDpIPfskC7OlfK/6tOjFU1hvul2wP0Aq6GMQ3TFGXo026SjSV5hYg==
X-Received: by 2002:a17:906:10a:b0:9b1:488d:afd1 with SMTP id 10-20020a170906010a00b009b1488dafd1mr4562827eje.5.1696493184131;
        Thu, 05 Oct 2023 01:06:24 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-237-55.dyn.eolo.it. [146.241.237.55])
        by smtp.gmail.com with ESMTPSA id si5-20020a170906cec500b009b97d9ae329sm747224ejb.198.2023.10.05.01.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 01:06:23 -0700 (PDT)
Message-ID: <7102fb731c18f7b10f19f6bdc05d8a7f74e43feb.camel@redhat.com>
Subject: Re: [PATCH net-next] net: dsa: microchip: Uninitialized variable in
 ksz9477_acl_move_entries()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Vladimir Oltean <olteanv@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 05 Oct 2023 10:06:22 +0200
In-Reply-To: <20231002152853.xjyxlvpouktfbg6k@skbuf>
References: <2f58ca9a-9ac5-460a-98a4-aa8304f2348a@moroto.mountain>
         <20230927144624.GN2714790@pengutronix.de>
         <20231002152853.xjyxlvpouktfbg6k@skbuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2023-10-02 at 18:28 +0300, Vladimir Oltean wrote:
> Hi Oleksij,
>=20
> On Wed, Sep 27, 2023 at 04:46:24PM +0200, Oleksij Rempel wrote:
> > On Wed, Sep 27, 2023 at 03:53:37PM +0300, Dan Carpenter wrote:
> > > Smatch complains that if "src_idx" equals "dst_idx" then
> > > ksz9477_validate_and_get_src_count() doesn't initialized "src_count".
> > > Set it to zero for this situation.
> > >=20
> > > Fixes: 002841be134e ("net: dsa: microchip: Add partial ACL support fo=
r ksz9477 switches")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >=20
> > Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >=20
> > Thank you!
> >=20
> > > ---
> > >  drivers/net/dsa/microchip/ksz9477_acl.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/dsa/microchip/ksz9477_acl.c b/drivers/net/ds=
a/microchip/ksz9477_acl.c
> > > index 06d74c19eb94..e554cd4a024b 100644
> > > --- a/drivers/net/dsa/microchip/ksz9477_acl.c
> > > +++ b/drivers/net/dsa/microchip/ksz9477_acl.c
> > > @@ -554,7 +554,8 @@ static int ksz9477_acl_move_entries(struct ksz_de=
vice *dev, int port,
> > >  	struct ksz9477_acl_entry buffer[KSZ9477_ACL_MAX_ENTRIES];
> > >  	struct ksz9477_acl_priv *acl =3D dev->ports[port].acl_priv;
> > >  	struct ksz9477_acl_entries *acles =3D &acl->acles;
> > > -	int src_count, ret, dst_count;
> > > +	int ret, dst_count;
> > > +	int src_count =3D 0;
> > > =20
> > >  	ret =3D ksz9477_validate_and_get_src_count(dev, port, src_idx, dst_=
idx,
> > >  						 &src_count, &dst_count);
> > > --=20
> > > 2.39.2
> > >=20
> > >=20
> > >=20
> >=20
> > --=20
> > Pengutronix e.K.                           |                           =
  |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/=
  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
>=20
> For the case where src_idx =3D=3D dst_idx that Dan points out, is this pa=
tch
> sufficient to ensure that ksz9477_acl_move_entries() will not execute
> unwanted code paths? For example, it will still call ksz9477_move_entries=
_upwards(),
> which from what I can tell, will do something given the way in which it's=
 written.
>=20
> Perhaps it would be better to move this line:
>=20
> 	/* Nothing to do */
> 	if (src_idx =3D=3D dst_idx)
> 		return 0;
>=20
> outside of ksz9477_validate_and_get_src_count() and into its single calle=
r,
> ksz9477_acl_move_entries()?

Additionally, it looks like that when (src_idx =3D=3D dst_idx) even
dst_count is not initialized but is still later used.

Cheers,

Paolo

