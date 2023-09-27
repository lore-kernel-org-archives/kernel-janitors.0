Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709C9CD37B3
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 13:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjI0NAe convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 09:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjI0NAd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 09:00:33 -0400
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBD89F;
        Wed, 27 Sep 2023 06:00:32 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57be74614c0so439055eaf.1;
        Wed, 27 Sep 2023 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819631; x=1696424431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UowtY9Y57ZHYtV50QD+m/C2BoRLwstcWDx8SsaL2Xk=;
        b=LiNfg38k1b8Wsn+r5Bxh+TepygphhumQq4vQtAiyHyxmQuc8P55fE3QR5ygs+ax+Jf
         sgTIIKqiusbE9V2Yrp24//wXJplKvE1VAAtpUz0t7LKSTwQwvItGYuiMqp5GOhpjh9yU
         BdPfriPoCslpLb0g0lM0Yae4JvnhXdlecKYE0h5eEij5mNFwqQUYNXRCvKxKKnyeB4qv
         DUemAjbzUn15JzqWGJl+z8tyb6a+WdkndhhDSpwYWxufpSd97Mv5+h2F1j53BXhmcd9F
         Tp7ZeIryMx147Ou20K6fOSEJsAeqQByoyahA/YUJx9VbFh1r5Z041+ijv3NJOhv5nIjM
         ZjNQ==
X-Gm-Message-State: AOJu0YzLGbw3CCw6Cw9UAgOoy4ysuHXmWa2tcb7ryvP7tC7qLTBQOtei
        7rf3PNUuJkC4EKRq/Uc+GKVhOEd2hrsHCdTe1JQ=
X-Google-Smtp-Source: AGHT+IE7jZEvC22EjnPYoZA8DpH3DSvAtrBQSQS7hvSbjup+O/6tl3gJ7uJ9LDcxGygit7dzkZ0cGCoZNYT4BhmXVs4=
X-Received: by 2002:a4a:e687:0:b0:57b:3b64:7ea5 with SMTP id
 u7-20020a4ae687000000b0057b3b647ea5mr2182482oot.1.1695819631322; Wed, 27 Sep
 2023 06:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <37eb30ba-1dc9-42e7-a22e-af44f6270e67@moroto.mountain>
In-Reply-To: <37eb30ba-1dc9-42e7-a22e-af44f6270e67@moroto.mountain>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 27 Sep 2023 15:00:20 +0200
Message-ID: <CAJZ5v0gQ38rFaYuHdFBhjf+S-BGeWj8kWf_M6WUSYwwOrcP-Tw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: thermal: Fix a small leak in acpi_thermal_add()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 27, 2023 at 2:37 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Free "tz" if the "trip" allocation fails.
>
> Fixes: 5fc2189f9335 ("ACPI: thermal: Create and populate trip points table earlier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/acpi/thermal.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
> index 10720a038846..f8a95939c88d 100644
> --- a/drivers/acpi/thermal.c
> +++ b/drivers/acpi/thermal.c
> @@ -928,8 +928,10 @@ static int acpi_thermal_add(struct acpi_device *device)
>         acpi_thermal_guess_offset(tz, crit_temp);
>
>         trip = kcalloc(trip_count, sizeof(*trip), GFP_KERNEL);
> -       if (!trip)
> -               return -ENOMEM;
> +       if (!trip) {
> +               result = -ENOMEM;
> +               goto free_memory;
> +       }
>
>         tz->trip_table = trip;
>
> --

Applied, thanks!
