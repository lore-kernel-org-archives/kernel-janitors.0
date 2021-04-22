Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C252C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 11:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EC1661452
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 11:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhDVLEd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Apr 2021 07:04:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:33794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230285AbhDVLEc (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 07:04:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7E08613C2;
        Thu, 22 Apr 2021 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619089437;
        bh=Ug67xf4sAZoT+t7tvOpFzhVkyHygukWWZi62Oc8MbT0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nfY6kRKN1KrWhcH2ovJGuoy/ZJaCuIsWkTeNN07v2QOwffeOZiRG+ys73/pdVNXd5
         HF+GYBuFxjepf6x7sa0TbGe3l92oenCk9p3jUsikC0uiD5UwFr6g1L/qYAkED83yJG
         FIk3vyRmtthc78sHx/Q4qoL5NCc5hYjmXY3tq68BEq5TzGlBiD8d3bIFL1/M0p6ZdO
         Z0AVzBoWBlJknSmV2kE7elreh6Na7Pzzd6/0yKEDpDxFjEs1HqUgkyu4Sj7KzGktuS
         74+8rFnUs5oc2p49CsRsMq0bztAyHoIuBu8/EdIDE2Usf1AIgQZsy6iBpezsg6eJFl
         R/b1lgvzKk+xQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jens Axboe <axboe@kernel.dk>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: prevent a ternary sign expansion bug
In-Reply-To: <YIE7RrBPLWc3XtMg@mwanda>
References: <YIE7RrBPLWc3XtMg@mwanda>
Date:   Thu, 22 Apr 2021 14:03:49 +0300
Message-ID: <87im4emvhm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The problem is that "req->actual" is a u32, "req->status" is an int, and
> iocb->ki_complete() takes a long.  We would expect that a negative error
> code in "req->status" would translate to a negative long value.
>
> But what actually happens is that because "req->actual" is a u32, the
> error codes is type promoted to a high positive value and then remains
> a positive value when it is cast to long.  (No sign expansion).
>
> We can fix this by casting "req->status" to long.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'm just going to assume your type promotion rank is correct :-)

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCBWBURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYx6w/+Py/HPvuGhdSzyKkaLoCoZfzX+h1RwGMy
zjhH1vTq+5wFLGPtfF9n2dXKmeS/mT584Zdis1J7bZloUxPk8sPfkel581pfPdR+
Ti7g5JgTY2h8Jizidq+435cKlSXLNnubJCP8dcXUkk6IVFsny2I2IhOFm4cwt79Y
zWqwtByhMFOPCSMLO/01Psuemv9aQLV42Du8kR9HZgIMixEiEyiSCa5Ad6WpbL2T
VkSK1STs6N0n9h46O/2iOlfPdAMTqOW8MvkANGtugRBqlmIAWoZGWEx/rXDxogvK
XWIohCUhr+PvO16ztiNEAT9gsrBkVq/5bCStW2HI8wxBUI9E7q+kKHzrUNDiz20F
CHax9DNJOFcuP/0OUCV/a+qFBAymc5R2ADLFS7xOKj6taXMA+rhiOrd4htQMhfof
FG5QWK6XkiPYgD5UhoWd2FsP5M0/7KI34lNi1miCLXrIhov5oKhf5L3RoUO7fzFa
BzSbh8xT5GwHRukMaJym/NwgEEyt1A5mXDx43Q2HXLepxg47+qJADkTHgwcJ8YQU
JLpGH3kxfKVBR/w4PtTyaaLnZglbQBCaMnTZ919Was7RMZm+8zNd9RXl77LGpPAI
9acykfYZz2ajg1J4o8VI3jdAXonZDmDxSEicoxcv4dPbqn1fuPMI2LeDmz4MjyEz
17Obpk231OM=
=TCW6
-----END PGP SIGNATURE-----
--=-=-=--
