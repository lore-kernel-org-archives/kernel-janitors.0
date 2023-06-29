Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AFEEB64D9
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Jun 2023 05:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjF2Fvz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Jun 2023 01:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjF2FvI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Jun 2023 01:51:08 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434682D4A
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 22:51:03 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-313e1c27476so185979f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688017862; x=1690609862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=peZonunRaJ95r6T1skx2hyGoFsSu6wDgzOW9qrfM4Kc=;
        b=tgfy8qGSD65HWBeWSIUrq2wWBy9Vd26n+4f51LYynMfXR3xx01skrGd0sgmMs9OpTA
         cDfcerpQwY09qL8vel86+NmxTEhQm3d7DtER7CT5WcpLGRGcWN4tn6MU+ZAPaOy5EGMt
         9ONOUxTd0gHb4ERi6CPsC0jpfU6kqDRFQ/VbLOZJpmY/DHvICxEkLpC5RzneK7k7+bAs
         +5P3tk4Bk0OmQUYahxXdYCKj+cg1pSHaWjtPI7661o5+BEAMmXdiPABIbXPe8IcwZ37r
         nsFbf99Gk5ZwMYha6mtBhmDaM4auoL9kE8but4ai5jRteblHx2prqqfj8oZ6nV1zQtTz
         APoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688017862; x=1690609862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peZonunRaJ95r6T1skx2hyGoFsSu6wDgzOW9qrfM4Kc=;
        b=QmnB88HUHjjnAb0KY/clnN5lJMediW9VxxZGCg+5mk+ynKqVqW8kdRKy2HXO3Kq9fA
         qk6CjODECdJb1h3mxjC4FyGtJzlqNoiX1BhL81T2Xmh8ylfhxDn6SiVt1XJPUy68H05g
         WPF9lDzu9t84oZysE2QHGsdPMoqL3BRpy5M/pnvozpEr5sndDmDLJlgiO/EeNThMZcyV
         Ltr3cPvbpi5XAAh6lW0o7xRimfUYmfCXsIYtWT7Z/81jPAjfPaL3Eh9cXIy6mZhSRMdU
         6KCWo5B0I7REC1T9oFSeclsgeJA8EkHkUllH7MAMLy0b1+NARuy3G2FVydVD3HExdFNs
         t6nA==
X-Gm-Message-State: AC+VfDx9JNWTS9w+/6wPkyH0TRrIOcvaP6dMdvamPiAvz/DSwatAEkum
        hMBbMq/aF73THazuhvcLHmyTSA==
X-Google-Smtp-Source: ACHHUZ46bnTv4fp7Jqwr00dopnJCmcDpYeZN2PzIZLASW0OP/E6OKDKyB66Uq90f9l+06/VSKbnd8w==
X-Received: by 2002:adf:fd51:0:b0:313:eeb0:224c with SMTP id h17-20020adffd51000000b00313eeb0224cmr3055104wrs.28.1688017861739;
        Wed, 28 Jun 2023 22:51:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4d10000000b00313eeca9f4asm11425249wrt.14.2023.06.28.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 22:50:59 -0700 (PDT)
Date:   Thu, 29 Jun 2023 08:50:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     yunchuan <yunchuan@nfschina.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        iyappan@os.amperecomputing.com, keyur@os.amperecomputing.com,
        quan@os.amperecomputing.com, andrew@lunn.ch, hkallweit1@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next 08/10] net: mdio: Remove unnecessary (void*)
 conversions
Message-ID: <3fda1d81-e350-42e9-8fec-6f107ae75932@kadam.mountain>
References: <ZJwCcWgi0d6kEepI@shell.armlinux.org.uk>
 <325f00e3-1dfd-f77b-9795-6f89e44c0417@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <325f00e3-1dfd-f77b-9795-6f89e44c0417@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 29, 2023 at 09:59:56AM +0800, yunchuan wrote:
> On 2023/6/28 17:50, Russell King (Oracle) wrote:
> > On Wed, Jun 28, 2023 at 10:45:17AM +0800, wuych wrote:
> > > @@ -211,7 +211,7 @@ static void xgene_enet_wr_mdio_csr(void __iomem *base_addr,
> > >   static int xgene_xfi_mdio_write(struct mii_bus *bus, int phy_id,
> > >   				int reg, u16 data)
> > >   {
> > > -	void __iomem *addr = (void __iomem *)bus->priv;
> > > +	void __iomem *addr = bus->priv;
> > >   	int timeout = 100;
> > >   	u32 status, val;
> > > @@ -234,7 +234,7 @@ static int xgene_xfi_mdio_write(struct mii_bus *bus, int phy_id,
> > >   static int xgene_xfi_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> > >   {
> > > -	void __iomem *addr = (void __iomem *)bus->priv;
> > > +	void __iomem *addr = bus->priv;
> > >   	u32 data, status, val;
> > >   	int timeout = 100;
> > These probably cause Sparse to warn whether or not the cast is there.
> 
> Hi, Russell King,
> 
> I didn't notice this Sparse warning.
> Should I remove this cast although it cause Sparse warning?

No.  Don't introduce new Sparse warnings.

regards,
dan carpenter

