Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB3DC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Nov 2022 15:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbiKGPwr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Nov 2022 10:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbiKGPwq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Nov 2022 10:52:46 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470FDD9
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Nov 2022 07:52:44 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 47712E0007;
        Mon,  7 Nov 2022 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667836363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ChW92xrvfRGeQ1TQkOkts3EAp2uw56WxTOyQ2yBOYxU=;
        b=pfCSH7XmgV9GCgrC4qdc60s+hCDk/gIhQ6SovYcI+dvzqPXlEo1mTZjOr0iN3uyLIqRo/m
        7rynvPpvzXQ5Zu3CL3Yo/qhkP2SkDIDGHf67dBOqIEVTOdeMsj5Yeg/Au31w0e53n0W8JS
        etyg6irZTWU5flPcnxQwSJqvdt0o358Fh2ArPybYHkYZuJLBUYN3RF92878XTD1ww+lZwd
        RjgcM1YtpKlhNboNc+Vriq6oWv0bCghW9V3fF4OkTYPw3HWPM2/kEbseb9llMQbhmwddgi
        I6CCmfFpU5TxW6qGXhwbLeAaoLS7NX7s6hf1VZjcxXl+259rmIkAifqVC7UhCw==
Date:   Mon, 7 Nov 2022 16:52:38 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
Message-ID: <20221107165238.17bbc8fe@xps-13>
In-Reply-To: <Y1gCALFWXYYwqV1P@kili>
References: <Y1gCALFWXYYwqV1P@kili>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

dan.carpenter@oracle.com wrote on Tue, 25 Oct 2022 18:34:24 +0300:

> On 64 bit systems, the highest 32 bits of the "offset" variable are
> not initialized.  Also the existing code is not endian safe (it will
> fail on big endian systems).  Change the type of "offset" to a u32.
>=20
> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions tab=
le parser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parser=
s/tplink_safeloader.c
> index 23584a477391..f601e7bd8627 100644
> --- a/drivers/mtd/parsers/tplink_safeloader.c
> +++ b/drivers/mtd/parsers/tplink_safeloader.c

I am sorry but I don't have this file in my tree, what kernel are you
using?

> @@ -23,8 +23,8 @@ static void *mtd_parser_tplink_safeloader_read_table(st=
ruct mtd_info *mtd)
>  	struct safeloader_cmn_header hdr;
>  	struct device_node *np;
>  	size_t bytes_read;
> -	size_t offset;
>  	size_t size;
> +	u32 offset;
>  	char *buf;
>  	int err;
> =20
> @@ -34,14 +34,14 @@ static void *mtd_parser_tplink_safeloader_read_table(=
struct mtd_info *mtd)
>  	else
>  		np =3D of_get_child_by_name(np, "partitions");
> =20
> -	if (of_property_read_u32(np, "partitions-table-offset", (u32 *)&offset)=
) {
> +	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
>  		pr_err("Failed to get partitions table offset\n");
>  		goto err_put;
>  	}
> =20
>  	err =3D mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr=
);
>  	if (err && !mtd_is_bitflip(err)) {
> -		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
> +		pr_err("Failed to read from %s at 0x%x\n", mtd->name, offset);
>  		goto err_put;
>  	}
> =20


Thanks,
Miqu=C3=A8l
