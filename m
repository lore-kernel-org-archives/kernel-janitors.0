Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64126C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 Oct 2022 09:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiJMJFp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 Oct 2022 05:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJMJFn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Oct 2022 05:05:43 -0400
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A38CC827
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Oct 2022 02:05:40 -0700 (PDT)
Received: (qmail 7140 invoked from network); 13 Oct 2022 09:05:13 -0000
Received: from p200300cf070ada0076d435fffeb7be92.dip0.t-ipconnect.de ([2003:cf:70a:da00:76d4:35ff:feb7:be92]:48880 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <seanga2@gmail.com>; Thu, 13 Oct 2022 11:05:13 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Sean Anderson <seanga2@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] sunhme: fix an IS_ERR() vs NULL check in probe
Date:   Thu, 13 Oct 2022 11:05:26 +0200
Message-ID: <2742956.iHtyVlG1vj@eto.sf-tec.de>
In-Reply-To: <Y0bWzJL8JknX8MUf@kili>
References: <Y0bWzJL8JknX8MUf@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3409638.3JxYr5uNoe"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--nextPart3409638.3JxYr5uNoe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Thu, 13 Oct 2022 11:05:26 +0200
Message-ID: <2742956.iHtyVlG1vj@eto.sf-tec.de>
In-Reply-To: <Y0bWzJL8JknX8MUf@kili>
References: <Y0bWzJL8JknX8MUf@kili>
MIME-Version: 1.0

Am Mittwoch, 12. Oktober 2022, 17:01:32 CEST schrieb Dan Carpenter:
> The devm_request_region() function does not return error pointers, it
> returns NULL on error.
> 
> Fixes: 914d9b2711dd ("sunhme: switch to devres")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
--nextPart3409638.3JxYr5uNoe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCY0fU1gAKCRBcpIk+abn8
TjvOAJoDNkHjhhZWaenkrcuURA5qD1ikXACgp9gX0NRpoSzwbUD9UhQjL2gkEn4=
=WMbN
-----END PGP SIGNATURE-----

--nextPart3409638.3JxYr5uNoe--



