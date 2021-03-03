Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F25C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACA5464E12
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355249AbhCDAVr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbhCCQL5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 11:11:57 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F939C061760
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Mar 2021 08:03:04 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id c10so21821666ilo.8
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Mar 2021 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlCoHdrHwzFyKrGMLRWyNUHIOyPdF/GbZeImGDz8wq0=;
        b=cjQNm2CYodjavO8DTOBBmNVCObrgXF1DrthYCbp5n7yaDb5GFnh4C75DJT863fC6p5
         /q/7FAQCECdCA2YfWzpr4ivpCYy9ssaptU0g/GE5fhyusrfyB2U03unAMlvBMIY0H3zF
         Qze4WC0h9kaPldZaAbiuG1vJVKsp6SNIjFO9CEoruKp+VXjwozWuKsLDRfwGM1SHfTnr
         b/DSF6lu7uTo+MgrkQtNujqDztM2dh4JgBTqE/jrk+k/QkjyMSZ5Ufksc6DRf/XlFKwV
         fI9jX0yIww9a8md5w11AsfLgx2SuzaSbCAF31efbshqYO20fGHOHIR9nPra5XCKInpBm
         idvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlCoHdrHwzFyKrGMLRWyNUHIOyPdF/GbZeImGDz8wq0=;
        b=KtTNDo0EDUCGn74hXwtWIWnOlt7z/S4Bees9FMKjOWzxq4EKp+H6+Ht4sPWR1sqBY6
         f9J4IdQZnHy82vD8+cVy8lcZpBERtzciRf+jLr2rA+XvAW84P0tz9WD8lWdU/VTl14L+
         aD6+GIn+8E5BAm/kIJhilOWubrvbjEXD7RQvbEau4onTSlySVTqJ/tuB3L8jgjKLxR91
         OFcTPx0yMCq6nVRtdqrwSaR2V3Gl4W8l5dSjUsNtRCRqkqkENfJ0x6dGr68+Nn3WeN9w
         I3rlhOlaKD0wcCDn+ApYvQKj9yht65wNNbN+3WqH2wuhmf0PwSB5pQ8S8BiqLlh5/zhV
         JvvQ==
X-Gm-Message-State: AOAM530kx4XVXqO2DoRFcp9B0Es78FKdptatNEclKk/i/OZA+xDCq78G
        Lw/+f3jtwlo/Yi6Yf9QQWT6PEO3SpeGz+KaPpzGqug==
X-Google-Smtp-Source: ABdhPJzWkHyxJe0NzceF7XETf16b9fqLN4/ttrAqSVQHhs60VadqEDCFHTCSwfAGtHcxxc863jggycnhWNNy/tkOA40=
X-Received: by 2002:a05:6e02:e87:: with SMTP id t7mr22630570ilj.211.1614787383623;
 Wed, 03 Mar 2021 08:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303095826.6143-1-colin.king@canonical.com>
In-Reply-To: <20210303095826.6143-1-colin.king@canonical.com>
From:   Ray Chi <raychi@google.com>
Date:   Thu, 4 Mar 2021 00:02:51 +0800
Message-ID: <CAPBYUsCPj12enyMp9AMzFEAgd5MdKh7dYN5DNFpZwofBYnjG8A@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Fix dereferencing of null dwc->usb_psy
To:     Colin King <colin.king@canonical.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 3, 2021 at 6:00 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the null check logic on dwc->usb_psy is inverted as it allows
> calls to power_supply_put with a null dwc->usb_psy causing a null
> pointer dereference. Fix this by removing the ! operator.
>
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 59fa3def35de ("usb: dwc3: add a power supply for current control")

Acked-by: Ray Chi <raychi@google.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/dwc3/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index d15f065849cd..94fdbe502ce9 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1628,7 +1628,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  assert_reset:
>         reset_control_assert(dwc->reset);
>
> -       if (!dwc->usb_psy)
> +       if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>
>         return ret;
> @@ -1653,7 +1653,7 @@ static int dwc3_remove(struct platform_device *pdev)
>         dwc3_free_event_buffers(dwc);
>         dwc3_free_scratch_buffers(dwc);
>
> -       if (!dwc->usb_psy)
> +       if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>
>         return 0;
> --
> 2.30.0
>

Thanks for fixing this bug!

Regards,
Ray
