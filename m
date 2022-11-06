Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1088C43219
	for <kernel-janitors@archiver.kernel.org>; Sun,  6 Nov 2022 13:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiKFNlY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 6 Nov 2022 08:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiKFNlX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 6 Nov 2022 08:41:23 -0500
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADD4FE2
        for <kernel-janitors@vger.kernel.org>; Sun,  6 Nov 2022 05:41:23 -0800 (PST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
        t=1667742078; bh=aUOYGA9pv0POAmhkVtLEouxDQRru4Xvvzl+Vbu3jKUo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=vaTOjF4hVyzTQrc2Sg6HH7wLypEDOni4oMxrSPQGMRVLd6Z/yJioCrmuLySqn85ls
         FXpC8t+iWyt7F66Awp/Sk4MkgrKac/9Dz69mHSb/EMRfIQ9Ts/JN25n2qrMvTQm2Cw
         P8lDDPEbOr8PCpuBL1tSPJhTVIYEElEDo9Z3siHpiAFzASy5QK/srSnYUijWXK+cos
         xz/3EmhOGHyTUQvgUFlQk5r9zn1oFz40NlPrvxczhRmmuzOgQI0HNNWBjCHOPDazBc
         ZgO4+DJUBxysvc97JasA/yM17Jc3m4Lwyoxs1hdn7rnJ9NlFDhnb7AD/JoHGREzrmT
         Lb5H2ltACXQAA==
To:     Colin Ian King <colin.i.king@gmail.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath9k: Remove unused variable mismatch
In-Reply-To: <20221104140723.226857-1-colin.i.king@gmail.com>
References: <20221104140723.226857-1-colin.i.king@gmail.com>
Date:   Sun, 06 Nov 2022 14:41:18 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <875yfsw681.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin Ian King <colin.i.king@gmail.com> writes:

> Variable mismatch is just being incremented and it's never used anywhere
> else. The variable and the increment are redundant so remove it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
