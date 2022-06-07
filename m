Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38166C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 09:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbiFGJoI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239841AbiFGJoH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 05:44:07 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59295A98B8
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WPMIF/ZdRxQluuM5wA7vVcLt76yhP2zJUE48Bx4+TXU=;
  b=CFEjkSxqSEtZPhwU/wjPGo2Rwuu6at+vNQr+f81sBWgEjQ0b10H7KhT4
   DrE3M/QY8doV5s9Y6aTp6R9nMbMwAE8fgA7gt26hcTiGuaxhzfoNW2l1M
   SM7Q02bFLwfggSekvQ/Zwqo1R+Ny78tvEYuUvpRCFop62dlLFWvnSuadi
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,283,1647298800"; 
   d="scan'208";a="39783838"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 11:44:02 +0200
Date:   Tue, 7 Jun 2022 11:44:02 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     =?ISO-8859-15?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
cc:     Nicolas Palix <nicolas.palix@imag.fr>,
        "cocci@inria.fr" <cocci@inria.fr>,
        Markus Elfring <Markus.Elfring@web.de>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2206071143370.11966@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-699005149-1654595042=:11966"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-699005149-1654595042=:11966
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Tue, 7 Jun 2022, Jérémy LEFAURE wrote:

> The test of an expression's address does not necessarily represent the
> whole condition, it may only be a part of it.
> This change aims at detecting an address test in more complex conditions.
>
> Signed-off-by: Jérémy Lefaure <jeremy.lefaure@netatmo.com>
> ---
> v1 -> v2: Moved disjunction on the condition itself instead of being on the if statements

Thanks for the change.  It seems to cover all the cases.

julia

>
>  scripts/coccinelle/misc/ifaddr.cocci | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc/ifaddr.cocci
> index fc92e8fcbfcb..14dbf3131a3f 100644
> --- a/scripts/coccinelle/misc/ifaddr.cocci
> +++ b/scripts/coccinelle/misc/ifaddr.cocci
> @@ -18,7 +18,7 @@ statement S1,S2;
>  position p;
>  @@
>
> -*if@p (&x)
> +*if@p ( \(&x || ... \| &x && ... \) )
>   S1 else S2
>
>  @script:python depends on org@
> --
> 2.25.1
>
--8323329-699005149-1654595042=:11966--
