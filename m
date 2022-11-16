Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F35C4332F
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Nov 2022 10:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238909AbiKPKp5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbiKPKpK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Nov 2022 05:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF5E31F82
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Nov 2022 02:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668594734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EUFIXYNzk8yDs3KImNG3AOVj6XZ3qyNFB3i2C1O73aQ=;
        b=S0KEC+c92ZXfFv8u0m85OaibTBOaAcCExzjgG0JaK442JxYxvaH5pKmL7raKcxB0lfK3qL
        Z+OL7EjeNbQGzt6/fwyW4q18CTNyIcTCO8woTXE2hDzs8QOhqG7nLk2wvg7Mr+XNXDYOSO
        EG7VCXIgnyAmHveUwtxgBxwlpmtrXGg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-h_b7t0GzNoWbcKZ7dRCpSg-1; Wed, 16 Nov 2022 05:32:12 -0500
X-MC-Unique: h_b7t0GzNoWbcKZ7dRCpSg-1
Received: by mail-io1-f70.google.com with SMTP id bx19-20020a056602419300b006bcbf3b91fdso8481738iob.13
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Nov 2022 02:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUFIXYNzk8yDs3KImNG3AOVj6XZ3qyNFB3i2C1O73aQ=;
        b=7hLwLmMciqJ/jJ7PmfazXdaboZNcVxWdR6FZtON2htEsS1accQY+ZV8IK2P79i607c
         paJTe5r3MuJ2cfr2mewSbQMPjCPzbkyfULTqpbg4/w2e6FT6A877CCuj91f9PMrHk/R1
         LaMCb6SXQRgpy+Pu/8GB3G851fH7OpYNTIosNNTLjBTs5xnYy3aX8jsXTkrqD5LGOsYC
         RO5b0TT3mOj2V+K67ReWnPPicYc+YYgRfheR2xq1Wtq5FRMcpV3yksUjlTqSJoz614Gp
         0u16WhWE5CW/5AdALBPMYBjhHGK9PStZwKP485WdqpzbmpFho3dz5p5XNpGvqIzwbNQS
         hINw==
X-Gm-Message-State: ANoB5pnZNmkeyPUIcgb1bBIjj8NmMlfgoc2Y3L1aVOq605Diede3MLGO
        JeJbVyr8SpbVbjBfuXWA2Cf1iEfA+1A8nMXVJiYCZw+H8/UwbXD1KXqtncxpBc35KBPNkbc/Hub
        RB8Dnka2Uc2zMvR/uj1Zn9gzdeAcb/kQpJ081WAF6XUPu
X-Received: by 2002:a92:d281:0:b0:302:4a3a:f480 with SMTP id p1-20020a92d281000000b003024a3af480mr8236516ilp.61.1668594732271;
        Wed, 16 Nov 2022 02:32:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mDl6NLRXK3YUpDUDuMeH6TsB9CuSDyqczVUpHLVsgCk66OVWh+1FvOcD/MF7WRurpXNijbn91pIu0F/lzRq8=
X-Received: by 2002:a92:d281:0:b0:302:4a3a:f480 with SMTP id
 p1-20020a92d281000000b003024a3af480mr8236510ilp.61.1668594732003; Wed, 16 Nov
 2022 02:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20221116093943.597572-1-colin.i.king@gmail.com>
In-Reply-To: <20221116093943.597572-1-colin.i.king@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 16 Nov 2022 11:32:00 +0100
Message-ID: <CAO-hwJK4fn6eqMDdt7ZPe3e1tc54vQXQk9L6F7gY_QZCmGobGA@mail.gmail.com>
Subject: Re: [PATCH][next] samples/hid: Fix spelling mistake "wihout" -> "without"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 16, 2022 at 10:39 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a comment and a usage message. Fix them.

Good catch

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  samples/hid/hid_surface_dial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/samples/hid/hid_surface_dial.c b/samples/hid/hid_surface_dial.c
> index bceea53d39b0..4bc97373a708 100644
> --- a/samples/hid/hid_surface_dial.c
> +++ b/samples/hid/hid_surface_dial.c
> @@ -4,7 +4,7 @@
>   * This program will morph the Microsoft Surface Dial into a mouse,
>   * and depending on the chosen resolution enable or not the haptic feedback:
>   * - a resolution (-r) of 3600 will report 3600 "ticks" in one full rotation
> - *   wihout haptic feedback
> + *   without haptic feedback
>   * - any other resolution will report N "ticks" in a full rotation with haptic
>   *   feedback
>   *
> @@ -57,7 +57,7 @@ static void usage(const char *prog)
>                 "This program will morph the Microsoft Surface Dial into a mouse,\n"
>                 "and depending on the chosen resolution enable or not the haptic feedback:\n"
>                 "- a resolution (-r) of 3600 will report 3600 'ticks' in one full rotation\n"
> -               "  wihout haptic feedback\n"
> +               "  without haptic feedback\n"
>                 "- any other resolution will report N 'ticks' in a full rotation with haptic\n"
>                 "  feedback\n"
>                 "\n"
> --
> 2.38.1
>

