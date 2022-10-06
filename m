Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC62DC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Oct 2022 18:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbiJFSMc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Oct 2022 14:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiJFSMa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Oct 2022 14:12:30 -0400
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3739B86B
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Oct 2022 11:12:29 -0700 (PDT)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
        t=1665079944; bh=7ra4FxyMkrqZBjrGfQluuyoTdTJeQ8fbwvA0RTXTY1U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=vEbY2xBJV9JNAureEVzACRYpoGLB9tJBkLEZ7MxkQOBuezTLoAobrEF2Psk3es9Zt
         j3lGKDsWf3x1GdCmYkzzKbO/yDnP2xq0x1yWE60V2qqWM/BdCzkqTgEdktKoUkKbto
         QtnIOEk9d7fWX220sVHb22g6iDulzDd1liK5uhPWFBu0B9bOg74Ssm4MMHA5+1++hZ
         qesyhTgvaUubUdo7WHbyKaFIXjRnBDHXQWByCHIwJE++L30/aFDjPfqD2CNmwEFyKX
         IGs1tXA0N3LMfknvQ+yoUtCSz0FrNxAcG6lIcCNUIWQAgGgEYs2P47BFPh2XGKjWVb
         +JA/dkN64fTRQ==
To:     Colin Ian King <colin.i.king@gmail.com>,
        Kalle Valo <kvalo@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath9k: Make arrays prof_prio and channelmap static const
In-Reply-To: <20221005155558.320556-1-colin.i.king@gmail.com>
References: <20221005155558.320556-1-colin.i.king@gmail.com>
Date:   Thu, 06 Oct 2022 20:12:23 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87k05ces8o.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin Ian King <colin.i.king@gmail.com> writes:

> Don't populate the read-only arrays prof_prio and channelmap
> on the stack but instead make them static const. Also makes the
> object code a little smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
