Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4560DC433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 088D261108
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhIRFyT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 01:54:19 -0400
Received: from dvalin.narfation.org ([213.160.73.56]:41352 "EHLO
        dvalin.narfation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhIRFyT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 01:54:19 -0400
X-Greylist: delayed 583 seconds by postgrey-1.27 at vger.kernel.org; Sat, 18 Sep 2021 01:54:18 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1631943791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kp085LL4iFnWlC96iyB4ml/XhWlQt8+LvH1200gL2l0=;
        b=BAwErYBYHVhDsCRBUxsIVTQMZpsWjlKU0kO26faGFaDLbryKg125k7/ByiQlljhdlPsfQ4
        kzv7QLQ3nvFkFYha/5xSPA5rGRWSgd4PrbK06vVb+Z6RK4bRRM6+RzdTBXiCd8ngwHg0mB
        r1cis3x8GOGjWf3IBz490doyODBGwZ4=
From:   Sven Eckelmann <sven@narfation.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spelling.txt: add more spellings to spelling.txt
Date:   Sat, 18 Sep 2021 07:43:09 +0200
Message-ID: <1930750.yhyOXdeGKK@sven-l14>
In-Reply-To: <20210907072941.7033-1-colin.king@canonical.com>
References: <20210907072941.7033-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2863865.2SAAmTFaoX"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--nextPart2863865.2SAAmTFaoX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Andrew Morton <akpm@linux-foundation.org>, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spelling.txt: add more spellings to spelling.txt
Date: Sat, 18 Sep 2021 07:43:09 +0200
Message-ID: <1930750.yhyOXdeGKK@sven-l14>
In-Reply-To: <20210907072941.7033-1-colin.king@canonical.com>
References: <20210907072941.7033-1-colin.king@canonical.com>

On Tuesday, 7 September 2021 09:29:41 CEST Colin King wrote:
> @@ -1439,6 +1450,7 @@ syfs||sysfs
>  symetric||symmetric
>  synax||syntax
>  synchonized||synchronized
> +synchronization||synchronization
>  synchronuously||synchronously
>  syncronize||synchronize
>  syncronized||synchronized

The erroneous version is equal to the correctly written version

    CHECK: 'synchronization' may be misspelled - perhaps 'synchronization'?
    #3967: FILE: ./net/batman-adv/translation-table.c:3967:
    +   /* commit these changes immediately, to avoid synchronization problem
                                                      ^^^^^^^^^^^^^^^
:D

Kind regards,
	Sven
--nextPart2863865.2SAAmTFaoX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmFFfG0ACgkQXYcKB8Em
e0akAhAAvvCKxwNxKN+yfUefCfzZtMdwsXGb5sFRiN1oBrjsKWOD4d6z+j1KXsLm
Isr0H/V2IYM82FOHrfVn6ILGhlC9/b+yzGIbCWZQ3pc26jQViY4zbJSQmqxxPCnl
UBFlya7Z894hHVFVf0ZQZC57vWRV2Fmpcpsemn7Mg6/zlTB2Wh8wZpzq/KUONVV9
AmC0e3YyvuOuik1toukkl63Au2G1VX0OjJTEXZEGpWnKyd41Qaxz8e0KAtWkdoYG
uL1En8cc/dGGNeOdeRqsCNg2WO38azGdLJqCxdoyPpoTKeIbKcTAxSKZYynDgxjn
GzjWlVn6voZHShMfqGnpGxpcl/4oNuYBUYyfmpeagIW7IWwivxNCBC2FzzaZsE6c
CDCbbuAOGH/RAhgxU2ocpTmThb/HUljbR6fOzX8/zIhm4Cbiu9EwjHcZ2lUViGrc
WTR6LUydUgXfFm1dZffoAgz3oZ2i2W9z9eKEEsPi/qtukziuua+xvJvB9sL4nwbK
ngYxGo/MNykWBLG3mM1IO2qXdGJ3lfZ1YVsXmp8jRNHGiSQnf8nlnlWhxwjwGhrQ
m6SZ/eo3Ln3bhz6FfAhUWGrDzZTBIQ/8obLWF8mmPTVBGx6L7CXSEmJIx6FbyYii
kxrbKQy2yLAvlkzO4+KcNOBGX44nyXpWWlOOnHTST0T3/gizrlg=
=ltq3
-----END PGP SIGNATURE-----

--nextPart2863865.2SAAmTFaoX--



