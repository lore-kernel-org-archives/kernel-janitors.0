Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60B0C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat,  9 Apr 2022 21:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiDIVsK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 9 Apr 2022 17:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiDIVsJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 9 Apr 2022 17:48:09 -0400
X-Greylist: delayed 515 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Apr 2022 14:46:01 PDT
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C32C70
        for <kernel-janitors@vger.kernel.org>; Sat,  9 Apr 2022 14:46:01 -0700 (PDT)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
        t=1649540241; bh=vgHyx9BgxzG0UUENvbI1qWkuRKnGIRcnPb2rw2vPhac=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=hzIw18JJEu/uR3fjBa5QErIhy8JdKEc//GE+ftX+gw0dxf7BlJK5HF46iyfzQp+eh
         PUOnW8WZnud0l/ONM3GQks2gwaOZp+W63FLZUrr7pfBXxfx/BQQyj02c76Olmm1vik
         Grie5b1hj/aDWxV/IN7455ZrLkR/nY/LpGuQycwCTStbaQUu30sfk1yIr5dVRRL2Je
         KFAjfGxMPHXEoPN73uozsHrx+9txpc7gkBT2GWvnIwVo4C32mHxKNFsgUX/AKmS71V
         O9AuiF+BIXRg5ceUs1WtmuEcByuKtmka2iYBkPgKJpYHa09tlQqGWide/pQLkRf6G4
         zN+gn/3jONl3w==
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Oleksij Rempel <linux@rempel-privat.de>
Cc:     Kalle Valo <kvalo@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "John W. Linville" <linville@tuxdriver.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ath9k_htc: fix potential out of bounds access with
 invalid rxstatus->rs_keyix
In-Reply-To: <20220409061225.GA5447@kili>
References: <20220409061225.GA5447@kili>
Date:   Sat, 09 Apr 2022 23:37:21 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87tub26ir2.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "rxstatus->rs_keyix" eventually gets passed to test_bit() so we need =
to
> ensure that it is within than bitmap.

s/than/the/ ?

This I think Kalle can fix up when applying :)

> drivers/net/wireless/ath/ath9k/common.c:46 ath9k_cmn_rx_accept()
> error: passing untrusted data 'rx_stats->rs_keyix' to 'test_bit()'
>
> Fixes: 4ed1a8d4a257 ("ath9k_htc: use ath9k_cmn_rx_accept")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
