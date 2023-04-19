Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F36C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 15:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbjDSPp0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 11:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbjDSPpN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 11:45:13 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BD1A24D
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 08:45:03 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54fe82d8bf5so5531737b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681919102; x=1684511102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eyhlWMXoH44WDstFWiTA4QlzY4pBtmy2mH012w04/m8=;
        b=zMgMa3F5wCIWgTcXboKeQEH2xooiIA+A3HHznMvqCbE4hQx2VN/KJ5K6zwjuDmHZM9
         gPCy+9kbmrRqcgvttueq2TE6q4yeoBLf3lb8TZTqa6XV2fLmTBXU8rhJMcI0hfYmVf4q
         OcRrhQ/MJQss6esYwt7g9s3shoL56cAqkaXbIw93zYaUnS6Gnzc/nazJZTc+/P/EbqOE
         +klF3dV9ood0DAa+IzjSEikAtzawZ3oNjA8wGIM++y+X4VkMnR2UBjgW+Ekk3vZxqOl0
         YS6mT6vQKEmRFwGyNUBlf8sU75So7mGlHc5u5VNutwaHhAW+szdMQrmPnptar9DAwUTx
         ausA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681919102; x=1684511102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyhlWMXoH44WDstFWiTA4QlzY4pBtmy2mH012w04/m8=;
        b=OTEaA/7ZaM8hoKzX+eHAcIHaemMVrcUy1v6Lj5O8KfuNGtgyo5gVHhBcrqo4dH3ScC
         BWyb0EBenbPxldAD7k37A3ycBqCV38n15+mPf7xJiczxyeUNj061XlN1IXV+H5q0cBxn
         h/cybN4wPh0+Y7g7daoGTFIx8fmbhFoPTmKVIRSKuNEpSyobOIEHbbZvVXYurPsE6efa
         cahHOv2lLZoKDDRssP86qU7u2V/4Xi0A1449mtnBTPcZALDALpcKKW+13erzX7VAX6ot
         kvxzLKUhKpjfSXMV65r7ETSfKbx/N4H4qnAQmZQZQs9PGyXo4XP7QHAtfN2otX55Wt5R
         0pww==
X-Gm-Message-State: AAQBX9dRIeRcK/sUqLY/mr19KXzHl45aMmAq+/ksquqgEF5yf/Or/CXs
        ao/BnfsEQpKpVq1Ie441VdLXig==
X-Google-Smtp-Source: AKy350bDSmYOlc3GxuAgCRs2h5bnpeXsTOIvKCvY5+GheSwGnGIdeXMRzrI27tuFwGXTfg4HeE4u0w==
X-Received: by 2002:a81:80c6:0:b0:54f:b4cc:cdb7 with SMTP id q189-20020a8180c6000000b0054fb4cccdb7mr3538915ywf.29.1681919102594;
        Wed, 19 Apr 2023 08:45:02 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id d123-20020a811d81000000b0054f856bdc4dsm4592785ywd.38.2023.04.19.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:45:02 -0700 (PDT)
Date:   Wed, 19 Apr 2023 11:30:30 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_write()
Message-ID: <ZEAJFnNiAE+L5ht4@fedora>
References: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
 <ZD/8gbcin4RQYd+A@fedora>
 <0859b9d5-c504-4f46-83ad-dcd7ada6b81b@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ts09cfLE1/4Fjsr2"
Content-Disposition: inline
In-Reply-To: <0859b9d5-c504-4f46-83ad-dcd7ada6b81b@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--Ts09cfLE1/4Fjsr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 06:37:05PM +0300, Dan Carpenter wrote:
> On Wed, Apr 19, 2023 at 10:36:49AM -0400, William Breathitt Gray wrote:
> > The lock is acquired by rz_mtu3_lock_if_counter_is_valid(), so that
> > function needs a sparse __acquires(&priv->lock) annotation too.
>=20
> I found this bug using Smatch.  It's a competing static checker which
> uses Sparse as a parser.  I am the author of Smatch so I am naturally
> biased.
>=20
> I don't think it's as simple as that.  I don't think Sparse has
> annotations for mutexes, only for spinlocks?  Also it's really
> complicated to annotate something as taking the lock on the success path
> but not on the failure path.  You have to set up a wrapper and use
> __cond_lock().
>=20
> Every other feature in Sparse is awesome, but for locking, it's better
> to just use Smatch.
>=20
> regards,
> dan carpenter

Ah that's a fair point, I can see how involved that would be to set up a
wrapper and handle the various paths correctly. The marginal benefit
just doesn't seem worth the effort afterall.

William Breathitt Gray

--Ts09cfLE1/4Fjsr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZEAJFgAKCRC1SFbKvhIj
K31tAP9rMkos8pM/xo/eC8/rsg/aV7L0nWCz6RhKw+wwQ0S+LgD/X8uFj8/AomGa
yh5ld/VSceAZnU6YNCxbszieEMUe8gk=
=dWsD
-----END PGP SIGNATURE-----

--Ts09cfLE1/4Fjsr2--
