Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D027EB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 14:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjFSOPC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjFSOPB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 10:15:01 -0400
X-Greylist: delayed 470 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 19 Jun 2023 07:14:59 PDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F350B8E;
        Mon, 19 Jun 2023 07:14:59 -0700 (PDT)
Received: from sparky.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7386320153;
        Mon, 19 Jun 2023 22:07:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1687183622;
        bh=Zi8Q3+lSjvBrfrM3SdqJlbZi4/Rc2YBaeBye3BWAkN0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=VCafOUSti/j8wBPaEI67oO15YsgZjEm8lvA8i00E8kVkjSQC2gg6e0k7fcOr78eH8
         RcP5euhw5himZZ+NVUyMKF+Qk2el1Ql6Je+xB34vThMA7gNY6jrbMkDnUn3Mlse1gp
         hJXhlxfIn/aZZuajiyGL7qJ+uZ54EajOyFwJYtf8GJg3mzFnsOCjWLzDmchMokMtMh
         6r5a88Eo+yVd9MAOL9fvMT5Ir+Vt5cg6HH4cBKy6B24OjxZWGOqvdvsD8X5pyb0VHP
         eOMeZZnX23dc+pFTO+Pb8LeqSafyRZUlgzXhtfY7hQP4XqjdbK94QQ/4r/eqSrOXSg
         F5Wm3c49BnheA==
Message-ID: <c83bb6cf8f0d1ea8f5e3da690cda5e9742498a39.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next] mctp: Reorder fields in 'struct mctp_route'
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Matt Johnston <matt@codeconstruct.com.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Date:   Mon, 19 Jun 2023 22:06:59 +0800
In-Reply-To: <393ad1a5aef0aa28d839eeb3d7477da0e0eeb0b0.1687080803.git.christophe.jaillet@wanadoo.fr>
References: <393ad1a5aef0aa28d839eeb3d7477da0e0eeb0b0.1687080803.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christoph,

> Group some variables based on their sizes to reduce hole and avoid
> padding. On x86_64, this shrinks the size of 'struct mctp_route' from
> 72 to 64 bytes.
>=20
> It saves a few bytes of memory and is more cache-line friendly.

The savings will be fairly minimal, but this doesn't affect readability
for the route struct. LGTM.

Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>

Thanks!


Jeremy
