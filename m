Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AC0ECAAA1
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Oct 2022 14:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbiJ0O3L (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Oct 2022 10:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbiJ0O3J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Oct 2022 10:29:09 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAFC17E216
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Oct 2022 07:29:08 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id y16so2447088wrt.12
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Oct 2022 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OORxkzxhRiVQmefWxx+m4EW6qDQg+UZlwTx4gGuL6fw=;
        b=Gt0hsXy6IhM2Xz0cAy2sjDP+ep236BBJmDfYxoU/L7NmYRMzmrVfTGk9k9rg7DzUZe
         5OKZfZC/Qp29fi9lOanXpwri3qHpEX3NoMPYsyJxWGt1Oxu0Mijugabh2dikNHmgg31H
         mftu9bhfPodB+rmzOe+K8r/blOOo6pSkS8vOSty7OWEKRxgXZV+16TGTsZJqE6hQH4CS
         nLdkCzxYZcDJ19j+kdx3Cmey8Qav+vqN4V6NNihCKyuVSOoA94arzK2CqZVntzKNoQWO
         R6ammiHS+W3a9DUA1F16QklQfjvO3Sky+psFPJ3Ow4f+0qpAVQLOM1t7YSxfNDT/rTDN
         +fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OORxkzxhRiVQmefWxx+m4EW6qDQg+UZlwTx4gGuL6fw=;
        b=3xKVxTg39Y35BlDBgupjRmxXjXRyGYoMQZwu3rGk2SRfQccTqw10PyhfrORih5rBgn
         d9uVrG6OsI/yu+E4wt5jwIjwrpVSeFiVXzKioB10D2gsloRdc3GH3TeeQdhR0E/iKh5R
         v+Svoz7x3YlhkURjKl/mbbHMMEz5awleinUWCFY99K7ApR9OCbLoIUi0EJD5baV+OTPv
         H674fMt+BjDOCHmeM3cEItLxqVAlYliCgfB6AaqeRGr80UMDSown1J0DlXOsXtLYDpS+
         ttmkRuf6tvk3Wfy/vlYhaTeBDbN6yNu5O/268+EmK7k8Uk2H125OB9bE1080NXNa9ySU
         2v6A==
X-Gm-Message-State: ACrzQf0ByRvTTKa80oDXQheBEcx8l4Mpdjx8V40E0ge87TD7mA0FzSeh
        oF6Z2Q+71BQxViIt/pDpcKM48p5Ewh80V/0jSWFGI5hjSqk=
X-Google-Smtp-Source: AMsMyM4SLiiSPLbOG0e5gD9YKxgRMhvjNQlF8UG9tcl/GwkgO8DmNw1JoTOlvStoJz9H8B7i2QQVyA8WZmGhDa6Z7VQ=
X-Received: by 2002:a05:6000:2aa:b0:231:ac4f:196d with SMTP id
 l10-20020a05600002aa00b00231ac4f196dmr30922773wry.121.1666880946500; Thu, 27
 Oct 2022 07:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <Y1aCiReTZDbPp/rS@kadam> <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam> <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
 <CADiBU38JKzq9ngiaZWTse3eMdH_fTcUCdanea7uQAU7NxZrzZg@mail.gmail.com> <Y1qOwO11z0Wvcz6O@kadam>
In-Reply-To: <Y1qOwO11z0Wvcz6O@kadam>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Thu, 27 Oct 2022 22:28:54 +0800
Message-ID: <CADiBU39d4xykc3sXH8ZSM3pe-urbjqvcNf+k5BbORnzXMcpeng@mail.gmail.com>
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=88=
27=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:59=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Thu, Oct 27, 2022 at 09:59:46AM +0800, ChiYuan Huang wrote:
> > ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=
=9C=8826=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > >
> > > > On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > > > > 2) normal register access with negative length
> > > > > Unable to handle kernel paging request at virtual address ffffffc=
009cefff2
> > > > > pc : __memcpy+0x1dc/0x260
> > > > > lr : _regmap_raw_write_impl+0x6d4/0x828
> > > > > Call trace:
> > > > >  __memcpy+0x1dc/0x260
> > > > >  _regmap_raw_write+0xb4/0x130a
> > > > >  regmap_raw_write+0x74/0xb0
> > > > >
> > > > >
> > > > > After applying the patch, the first case is cleared.
> > > > > But for the case 2, the root cause is not the mt6370_regmap_write=
() size
> > > > > check. It's in __memcpy() before mt6370_regmap_write().
> > > > >
> > > > > I'm wondering 'is it reasonable to give the negative value as the=
 size?'
> > > > >
> > > >
> > > > Thanks for testing!
> > > >
> > > > I'm not sure I understand exactly which code you're talking about.
> > > > Could you just create a diff with the check for negative just so I =
can
> > > > understand where the issue is?  We can re-work it into a proper pat=
ch
> > > > from there.
> > > >
> > > Here.
> > > https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/=
regmap.c#L1860
> > >
> > > From my experiment, I try to access 0x00 reg for size (-1).
> > > Testing code is like as below
> > > regmap_raw_write(regmap, 0, &val, -1);
> > >
> > > That's why I think if the size check is needed, it may put into
> > > regmap_raw_write() like as regmap_raw_read().
> > >
> > It seems c99 already  said size_t is an unsigned integer type.
> > My experiment for (-1) size is not reasonable.
> > (-1) means it will be converted as the UINT_MAX or ULONG_MAX.
> > This will cause any unknown error like as memory violation or stack
> > protection,...etc.
> >
> > let's check whether the negative size is reasonable or not.
> > If this case dost not exist, to keep the boundary check is enough.
>
> I thought you were testing this from user space but it sounds like
> you're doing a unit test?
>
Yes, with the device attribute to test regmap_raw_read() and regmap_raw_wri=
te().
I think It should be the same as the usage in kernel space.
> regards,
> dan carpenter
>
