Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230B9C43217
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Nov 2022 16:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiKGQK4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Nov 2022 11:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbiKGQKr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Nov 2022 11:10:47 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633361B1F5
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Nov 2022 08:10:45 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 95361100008;
        Mon,  7 Nov 2022 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667837443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=reKmzyV0zLY9jo0MbPCUMRWY04FYf/Kp2/Ch5dAccN8=;
        b=WmysRQowoZAFx0x1mjou05foke1N6Cm38lHaS0sS+7dSTfp3Nl4pEzYdiqKsI+WoeGgIHe
        DraaO+W6ggYpzxTPsn4uZTI2GacF1ArXF3tFFjDZVft2Ybuo/hH0b8E4P3DoNc4wRFqa/6
        uEuYYce6PqrkLHGm5pvpOVtdHvjpnO0i5lujLv0JcC50/NsgK+KBnyJ2dQRw9hrmICd4ra
        bsMUTllQTkkOsr3oy9K1LZlGTm3zE2l/lgevwT4xv3OY/yglB0E4WFJHrzzi6ygVstv6M9
        kxVaffYFdzhIyWOj0Aw+e4mkl7N+/NO0dsCdhftv/IPVTf8c8MdC7FZeSV45ZA==
Date:   Mon, 7 Nov 2022 17:10:41 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
Message-ID: <20221107171041.3eac0bbb@xps-13>
In-Reply-To: <4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
References: <Y1gCALFWXYYwqV1P@kili>
        <20221107165238.17bbc8fe@xps-13>
        <4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


rafal@milecki.pl wrote on Mon, 7 Nov 2022 17:01:04 +0100:

> On 7.11.2022 16:52, Miquel Raynal wrote:
> > Hi Dan,
> >=20
> > dan.carpenter@oracle.com wrote on Tue, 25 Oct 2022 18:34:24 +0300:
> >  =20
> >> On 64 bit systems, the highest 32 bits of the "offset" variable are
> >> not initialized.  Also the existing code is not endian safe (it will
> >> fail on big endian systems).  Change the type of "offset" to a u32.
> >>
> >> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions =
table parser")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> ---
> >>   drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/par=
sers/tplink_safeloader.c
> >> index 23584a477391..f601e7bd8627 100644
> >> --- a/drivers/mtd/parsers/tplink_safeloader.c
> >> +++ b/drivers/mtd/parsers/tplink_safeloader.c =20
> >=20
> > I am sorry but I don't have this file in my tree, what kernel are you
> > using? =20
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=3Dmt=
d/next
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=
=3Dmtd/next&id=3Daec4d5f5ffd0f0092bd9dc21ea90e0bc237d4b74
>=20
> (committer Miquel Raynal ;) )

Ah, I knew I was missing something: the right branch. :-)

Thanks,
Miqu=C3=A8l
