Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679AEC43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Jun 2022 13:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376779AbiFPNIQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Jun 2022 09:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376764AbiFPNIQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Jun 2022 09:08:16 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4AA22B08
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jun 2022 06:08:14 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id p13so2119733ybm.1
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jun 2022 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aM7W+IbTZllbP9bwce2OF7b7/jySkDE1I5FfH7XqgI8=;
        b=UTLscLa01r4NO1+RKlggp8DofMmfPmN4Lzkv0wYG/b2NhhS5SvPkgr8eEGMEF0mA6A
         G9++dkrA4kLgQj3DYQ5drnMY2r8f5JCd3JP0odAnSldrWIVm9RzLfK7Kp1LXRtxgZNAQ
         AetaZIC5JTDM9ey+zcceqkQmKyQfbXrdgk+q00+yoLhu1W9DbB3BVTXN3qjvBpNDG0cQ
         sON6MwzCZVdRx3Amg0Xnf0SpnJQLEWg9zMpR6A65BCErCoSpJ7kY3j/uD25nATZnCJR+
         VOMAUlWh5q1aN9SvTQwsBoRu9jy2QB0enXth95XdWSWfAq6jHa4M1oMpOcHUgVn8AaXG
         o7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aM7W+IbTZllbP9bwce2OF7b7/jySkDE1I5FfH7XqgI8=;
        b=iwHUHuhKy2mEMJe+5/RGUauDcwwd1sxBYDscdIsrIAkW965l+PKKtyB5v5Ae3E+qiZ
         cyQTbNc5VOH0T1WOGilSJCb3IdxaEdlUoVSkVhctF4JVs6e0VMtzjO3LmvtLbGeQsiXZ
         358afLu4txfVaxB0DBMMQkQdMTV0bBRWkMPp125UAJjt2rNz08zP2I6p5TjGiev7pEes
         wO55vs2kdVRsXs2jrauAhvdfj6ZycmiTOFwoKaktC/zZkyzTk4rrhwY/pNu/7g5nQMnE
         6pEeLg2LXjX3O3Y05Y11pLP1SJGlMAxc+s0/c/nIMYpxwpBT/6FuP/LpXnJooYsrCkWp
         7pxQ==
X-Gm-Message-State: AJIora+tUXEaUYZDxlUMQohURv7QFWhvgzzaPftEdk+yZTCE8zVu0O8p
        jvA6EdK58JBdvXlWCB1ed7wkpwFiepZRMwTYHVv31w==
X-Google-Smtp-Source: AGRyM1sBxZbJmj9a876qlle2c/oXPEieXxih42drJWPUKceAzphyazmenHwI16MLVIVXYgZ0/mh2wxhlduQHve8rsUM=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr5242155ybk.291.1655384893665; Thu, 16
 Jun 2022 06:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <YqrhsKcjEA7B2pC4@kili>
In-Reply-To: <YqrhsKcjEA7B2pC4@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jun 2022 15:08:02 +0200
Message-ID: <CACRpkdYpzGJ7Q4jp4R_cozRVfQBnY2vnEmDbChKLQYUBWjiz5A@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: use strreplace() in brcmf_of_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arend van Spriel <aspriel@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Len Baker <len.baker@gmx.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 16, 2022 at 9:54 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The for loop in brcmf_of_probe() would ideally end with something like
> "i <= strlen(board_type)" instead of "i < board_type[i]".  But
> fortunately, the two are equivalent.
>
> Anyway, it's simpler to use strreplace() instead.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Johannes Berg <johannes@sipsolutions.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
