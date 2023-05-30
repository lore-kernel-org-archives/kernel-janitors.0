Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228ADC77B73
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 09:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjE3JmY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 05:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjE3Jly (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 05:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0293E109
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685439663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KR40UGun3D9uCLEMOWU7FjAZOYxIVlKv4sjwLYNnHpM=;
        b=L2NFyCf1WIEhC6MnRmZ/uR/EWdeql/ToA+fswMKiRhPDXZzIXMA/x7dpEzF5eGKhpfTIdo
        th662g86Q0mmuPPWD5OdUHxU27T7djYwUTRRZHTlZ4CHmhugZ/5jQCSP0/kpZdcIHLY8Ze
        Ve7PPxuTqUSpgjBCXpg7Ms8P05S3FcI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-GY1pA6QeOSW7SIHNjyT12Q-1; Tue, 30 May 2023 05:41:01 -0400
X-MC-Unique: GY1pA6QeOSW7SIHNjyT12Q-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6262552799aso3615306d6.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685439661; x=1688031661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KR40UGun3D9uCLEMOWU7FjAZOYxIVlKv4sjwLYNnHpM=;
        b=iLmGc94PoRDgccaK8a4/7BQVssNdBlUo4qrB7+AfXaezSM2cGGlvKBHCjzv2Oq+oiI
         I8n3UNvF3TB2fBI3JS1balv74XeIqz6oqPU0gNAWv2WCrgdiCCvn/cFw4hTSOhZmoA8E
         IJykt6GZ9O7jqQUp3fDHX7+gTxXR+njyQgRXqHfNCrnaGtaQBpxEeILTRPzrjUEMBNzE
         r5X6Fk9aSai7LWzdQSGkJT+EB7foPx6gm06h455MOdSMpeIkFSLwRcoxuagkAA8S+QXM
         WVYfl0Sui/zLZy4hfrRJY0qkaN6t8MMzpQ03osjXC6L6B5TPD47ApwyDPOJFmJX/MTmG
         fipg==
X-Gm-Message-State: AC+VfDzaigNosxIP97R9Nw+kk7RwMH41V3g9gYjjoY5wGShOzbSZkuVQ
        uzXDz3xWDHwF61bM/VcDlfSefnGwC8JhL69tPg3egdi191kkpzDbhpgihvq/C/eGlI4ArXyvjEM
        hi5u0JukcrXdK6kmLZrS0cwrQ4l0+
X-Received: by 2002:a05:6214:5087:b0:625:8684:33f3 with SMTP id kk7-20020a056214508700b00625868433f3mr1385273qvb.0.1685439661014;
        Tue, 30 May 2023 02:41:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63eKN1Ia1MxuihNqWuJSV/wPZKXQLUOxFWu/wyXmDYug+h73w3Z2lgTUdGGU1QEn2d1wQIuQ==
X-Received: by 2002:a05:6214:5087:b0:625:8684:33f3 with SMTP id kk7-20020a056214508700b00625868433f3mr1385256qvb.0.1685439660687;
        Tue, 30 May 2023 02:41:00 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-248-97.dyn.eolo.it. [146.241.248.97])
        by smtp.gmail.com with ESMTPSA id p2-20020a05621415c200b0061b58b07130sm1197689qvz.137.2023.05.30.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 02:41:00 -0700 (PDT)
Message-ID: <f6deb4f4ebc0659dfdb011c7aec5e4c792f3ef49.camel@redhat.com>
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 30 May 2023 11:40:56 +0200
In-Reply-To: <813008f6-cb26-4666-81ca-6f88c04bba07@kili.mountain>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
         <20230529215802.70710036@kernel.org>
         <c7a1ee2dea22cd9665c0273117fe39eebc72e662.camel@redhat.com>
         <813008f6-cb26-4666-81ca-6f88c04bba07@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 2023-05-30 at 12:23 +0300, Dan Carpenter wrote:
> On Tue, May 30, 2023 at 11:06:55AM +0200, Paolo Abeni wrote:
> > On Mon, 2023-05-29 at 21:58 -0700, Jakub Kicinski wrote:
> > > On Fri, 26 May 2023 14:45:54 +0300 Dan Carpenter wrote:
> > > > The "val" variable is used to store error codes from phy_read() so
> > > > it needs to be signed for the error handling to work as expected.
> > > >=20
> > > > Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed con=
figuration")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > >=20
> > > Is it going to be obvious to PHY-savvy folks that the val passed to
> > > phy_read_poll_timeout() must be an int? Is it a very common pattern?
> > > My outsider intuition is that since regs are 16b, u16 is reasonable,
> > > and more people may make the same mistake. Therefore we should try to
> > > fix phy_read_poll_timeout() instead to use a local variable like it
> > > does for __ret.=20
> > >=20
> > > Weaker version would be to add a compile time check to ensure val=20
> > > is signed (assert(typeof(val)~0ULL < 0) or such?).
> >=20
> > FTR, a BUILD_BUG_ON() the above check spots issues in several places
> > (e.g. r8169_main.c, drivers/net/phy/phy_device.c, ...)
> >=20
>=20
> I don't see an issue in r8169_main.c and in drivers/net/phy/phy_device.c
> then I only find the bug from this patch.
>=20
> regards,
> dan carpenter
>=20
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 6478838405a08..f05fc25b77583 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1173,6 +1173,7 @@ static inline int phy_read(struct phy_device *phyde=
v, u32 regnum)
>  ({ \
>  	int __ret =3D read_poll_timeout(phy_read, val, val < 0 || (cond), \
>  		sleep_us, timeout_us, sleep_before_read, phydev, regnum); \
> +	BUILD_BUG_ON((typeof(val))~0ULL > 0);				\
>  	if (val < 0) \
>  		__ret =3D val; \
>  	if (__ret) \
>=20

Uhm... I have no idea what happened to my build host. I did see more
build errors in previous attempt, but now I only observe the one you
address with this patch. I guess some PEBKAC hit me here.

/P

