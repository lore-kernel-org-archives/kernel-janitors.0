Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A10C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Feb 2022 01:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346729AbiBKBTM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 10 Feb 2022 20:19:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346719AbiBKBTL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Feb 2022 20:19:11 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204252651
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 17:19:12 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id j2so20760567ybu.0
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 17:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
        b=AIRSI3cMzMaKni8HjGUVaMbZAhUVlceEUvM1TVFe3VPqQyWXLz2Ak+cDAO5nh25AUQ
         dQ3wE5W1pllDsx+K8PXA7t3fk+pbwx53ncl4DxX+P/sPCtfqhhCY3p7GAiLGMElEMBcT
         Rs8XBznNz1hO9TGGw0UyBDAxLBlsOUXgNThNiBBNFXT02GOdDU4CcMQpLmmNZtAIXMiP
         J2U67gmXjBPoFTZ3vC2aObwrtGXtzFhHXF5ryg5us7Gj9GfRYv6xoqaEfVp4BRY4OcPD
         OmITTZAdt5Pngu3Te8EFZT3oHj3uqqBgP3EASdlKQFgwu1voCxa7FR42hHWE70gz11wS
         uSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
        b=nvwojvNwaDdRG4oSn+aA5XU8Se1O1g6evGlsoCBUvOJ28UkaVjTjl+SExNGCHa65aD
         Xc17dBcfLX+OsLNqNhZnuyAAtpFv/OdpVDZxnrVOTa6ZGBD/etmnxTEcmlJYaiu2YG04
         TsHQKOmg+bxDaLkPpyWzqziHGVEK4Vjqn0WQ+aa2Rnb/JHE/7/vgW1hTyG0jJBpgJG9/
         DiZFArPxB7LFbMnjh4GjEbfirqrIg3iGxPlY9ozAaGtU6IHb2RrL81BTMPbRBsNy7VRo
         QX//fCbs48maZymM1UoWG+ijzjL8+bjJVtYNG5DvTGTafLMgnoT9KjEzoNsirXoqHhCs
         vIBw==
X-Gm-Message-State: AOAM530WkiVDGRVVgmrdNAy2elwKguPn8ldXEU8kr2Uw/+E2C7+nFZyq
        bDZLGoHfZWAL5DNGEnR9w4ZFGPBhimpkEvXO9B3MDg==
X-Google-Smtp-Source: ABdhPJxGv13LWL9egJMKkc/oNhbYkiByJArEzDE8gyZspHDoaexfLcX9zE0exXWR0/WRRRWmGDJt+Pt+o9nTlBDv9/M=
X-Received: by 2002:a81:4cc3:: with SMTP id z186mr10688352ywa.140.1644542351380;
 Thu, 10 Feb 2022 17:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20220209180804.GA18385@kili>
In-Reply-To: <20220209180804.GA18385@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 02:19:00 +0100
Message-ID: <CACRpkdbgbrHBO7JFAf9yUjdOfnfavDaDSoUDniHTJT=-im0+oQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 9, 2022 at 7:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
