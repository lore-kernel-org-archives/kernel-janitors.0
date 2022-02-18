Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00413C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Feb 2022 05:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiBRF76 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Feb 2022 00:59:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiBRF74 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Feb 2022 00:59:56 -0500
X-Greylist: delayed 1303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 21:59:40 PST
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C0525FE5D
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Feb 2022 21:59:39 -0800 (PST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1nKvxm-0005Fg-Mk; Fri, 18 Feb 2022 16:37:51 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Feb 2022 16:37:50 +1100
Date:   Fri, 18 Feb 2022 16:37:50 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] crypto: use GFP_KERNEL
Message-ID: <Yg8wrk+U1N4HAPvn@gondor.apana.org.au>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-5-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210204223.104181-5-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 10, 2022 at 09:42:18PM +0100, Julia Lawall wrote:
> Platform_driver probe functions aren't called with locks held
> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> Problem found with Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/crypto/ux500/cryp/cryp_core.c |    2 +-
>  drivers/crypto/ux500/hash/hash_core.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
