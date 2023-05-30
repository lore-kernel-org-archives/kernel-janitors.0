Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C31C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 09:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjE3JHv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 05:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjE3JHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 05:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832A3BE
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685437621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r3Zial9iZJISeYClvZYyZ8Yv7etW85azNObdeUUZmYs=;
        b=CBgJBv/oFnM1ev0ejhPT+MXrnhprZIAXRqugJ/OzO0ug2ki7l4t1lTMKM04sTXxI7A3bUZ
        qC3YojtU9g/e0suSntWMiInehA8Z9RSWaWAknNsjgPN8+dGYyJGQYWLjPh0Twc1eAoa3De
        MYrbngVfayjXtp7HNcpeMfMq81ztAww=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-QislfdwNNoudMWmM9RH6hw-1; Tue, 30 May 2023 05:07:00 -0400
X-MC-Unique: QislfdwNNoudMWmM9RH6hw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-75b175cf0d1so36988085a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 02:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437620; x=1688029620;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3Zial9iZJISeYClvZYyZ8Yv7etW85azNObdeUUZmYs=;
        b=Y60GBuOHgRGYo273SgssN1SCvasBV4RprahBWsQ8ZtYLfCxZ8efBByzyGqDwzMdMwa
         djP9GhOyFo40ii1I1XWlyz/hgc9TtwV/BD/x5dDvxy8YtrcioFWT6og24qB6gkkLGFgy
         g+QEp0NQsCY8jLEelB/azIYETOFP0XbjNyhGfLs+End6Awzf+U+xZh+ZyRtlnBsFlyoO
         4pNTtFgRtUl9Nt4Hat7vsguENUYo+VNkN09+AoPpi69fUwxAU6brZvWZdcj3tykK97sw
         oiDuAKCx4vgke5/5yxYAYjZva575CPLsYNmxkTsb/d2YyTTlig59ziaRGefVicFnHbXe
         YR7w==
X-Gm-Message-State: AC+VfDxZjrSr3tjbgi0GbJ0u/YgpgJzNzmC2XScddLWn9W802XQ/XrXv
        e/whb5aKJKWx5fSLb8SDJUJHG7Wn9yIAf52R9hDI7YHmHqjaYOI8h+RPJJtkQPAo7Bj1d0v8ntu
        ANftq5YaqR0nrT3pNRMEM1PCcOKhb69Y7X4/m
X-Received: by 2002:a05:620a:28d1:b0:75b:23a1:69eb with SMTP id l17-20020a05620a28d100b0075b23a169ebmr1642862qkp.2.1685437619917;
        Tue, 30 May 2023 02:06:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JYz1BOc+28hQeM8NLy6JZBLVmZY7T0sdKmepYq5PLTRtGePjFwkRZaNHzSZ6j0qJZ3g1Q1Q==
X-Received: by 2002:a05:620a:28d1:b0:75b:23a1:69eb with SMTP id l17-20020a05620a28d100b0075b23a169ebmr1642848qkp.2.1685437619662;
        Tue, 30 May 2023 02:06:59 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-248-97.dyn.eolo.it. [146.241.248.97])
        by smtp.gmail.com with ESMTPSA id x12-20020ae9f80c000000b0075954005b46sm3959048qkh.48.2023.05.30.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 02:06:59 -0700 (PDT)
Message-ID: <c7a1ee2dea22cd9665c0273117fe39eebc72e662.camel@redhat.com>
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 30 May 2023 11:06:55 +0200
In-Reply-To: <20230529215802.70710036@kernel.org>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
         <20230529215802.70710036@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2023-05-29 at 21:58 -0700, Jakub Kicinski wrote:
> On Fri, 26 May 2023 14:45:54 +0300 Dan Carpenter wrote:
> > The "val" variable is used to store error codes from phy_read() so
> > it needs to be signed for the error handling to work as expected.
> >=20
> > Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configu=
ration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> Is it going to be obvious to PHY-savvy folks that the val passed to
> phy_read_poll_timeout() must be an int? Is it a very common pattern?
> My outsider intuition is that since regs are 16b, u16 is reasonable,
> and more people may make the same mistake. Therefore we should try to
> fix phy_read_poll_timeout() instead to use a local variable like it
> does for __ret.=20
>=20
> Weaker version would be to add a compile time check to ensure val=20
> is signed (assert(typeof(val)~0ULL < 0) or such?).

FTR, a BUILD_BUG_ON() the above check spots issues in several places
(e.g. r8169_main.c, drivers/net/phy/phy_device.c, ...)

I think it should be better resort to a signed local variable in
phy_read_poll_timeout()

Thanks,

Paolo

