Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9322C636D4
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Feb 2023 15:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjBOPYe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Feb 2023 10:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjBOPYd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Feb 2023 10:24:33 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18605903A
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 07:24:32 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-16346330067so23312962fac.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TadElbv/yECNyRvG0Pa2vpl29upi4rkpMkJRcewsa7k=;
        b=suGbtRbva9mfsiS7LLNx13Qf0OsA9bc4rRjOkogLlK5PHAndCm/2000O593bVAfNf/
         xhOdda5c+ELAQMSxZTkfuSXJNR2+nRui+95nMQBWRQsz1Pi8XjPRsay1cW7L3ddi0x6N
         nfVr7EjSjgyyL/DdR2HlYEqRWaUGwit3MSkgYIDgXgBf+rb9zYfU5mBxMIVANBS/HjGT
         i9WzCuXmnCEJCv07wvufZUhXrFMu7OUSH9tWTM8KU+ykyrVa8OpBfXEjbEThDtys6Y87
         cli2MqN2J6bAscc++INea8g3hkk2xNtczFkn54zsnIZLswfmJiDuOSOc5QQn9f9Zigqw
         eVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TadElbv/yECNyRvG0Pa2vpl29upi4rkpMkJRcewsa7k=;
        b=I2OwYtTcKVCqhenK/BYejiMp+Wb+0uLE3Kc5Nx+swCqII6chBMysMKQFtnxKiERhKW
         YX3zop+SmUYKJ3k1GUADQUr65VmOfF9OjxLIccUnqMTPQqBSseP5y/slNQe49uWGyfxR
         4TQ8uGV0M7j7PTQ3VIp0DnhIf3Zs2rGMwgijFQlQVEFFsqfxjXETz79j1EQC3RQdiqrl
         ZOV211ReCx3mAkoEdbvnJSXttsn4eUWae0uKs2O2XU5TNfjI5vigE0LmNUAQgnFh9e27
         Dp23ITtk0PolAScxsx48/kxNwklHOPaUX3t4uzz3ScWQ/tE16uREuitEhPY5u64VrT+J
         /B7g==
X-Gm-Message-State: AO0yUKVbYlyzM0q3qo+4ofeUGBoOxxv5IUg5FiMxGXWtpZb0mNgluKQa
        kMoEPzlWEthFguTyJjVGsU7JiRIvxrQzndONcoaQpA==
X-Google-Smtp-Source: AK7set89dOBFzBa3roM7yTkRgWk8K9U1srlYYE4cn1E4jBK5Jx6T2MYTeWX22QqOnM8AabgZmdbBdRcqAPmxGXlBDHI=
X-Received: by 2002:a05:6871:9a:b0:16e:44ad:c9fb with SMTP id
 u26-20020a056871009a00b0016e44adc9fbmr362093oaa.82.1676474670678; Wed, 15 Feb
 2023 07:24:30 -0800 (PST)
MIME-Version: 1.0
References: <c2040bf3cfa201fd8890cfab14fa5a701ffeca14.1676466072.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <c2040bf3cfa201fd8890cfab14fa5a701ffeca14.1676466072.git.christophe.jaillet@wanadoo.fr>
From:   Jassi Brar <jaswinder.singh@linaro.org>
Date:   Wed, 15 Feb 2023 09:24:19 -0600
Message-ID: <CAJe_Zhf9E49MkySeqoSFsuy7=j8vmjngda60GEUzTTSNMjj0LA@mail.gmail.com>
Subject: Re: [PATCH] spi: synquacer: Fix timeout handling in synquacer_spi_transfer_one()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Masahisa Kojima <masahisa.kojima@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 Feb 2023 at 07:01, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> wait_for_completion_timeout() never returns a <0 value. It returns either
> on timeout or a positive value (at least 1, or number of jiffies left
> till timeout)
>
> So, fix the error handling path and return -ETIMEDOUT should a timeout
> occur.
>
> Fixes: b0823ee35cf9 ("spi: Add spi driver for Socionext SynQuacer platform")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/spi/spi-synquacer.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/spi/spi-synquacer.c b/drivers/spi/spi-synquacer.c
> index 47cbe73137c2..dc188f9202c9 100644
> --- a/drivers/spi/spi-synquacer.c
> +++ b/drivers/spi/spi-synquacer.c
> @@ -472,10 +472,9 @@ static int synquacer_spi_transfer_one(struct spi_master *master,
>                 read_fifo(sspi);
>         }
>
> -       if (status < 0) {
> -               dev_err(sspi->dev, "failed to transfer. status: 0x%x\n",
> -                       status);
> -               return status;
> +       if (status == 0) {
> +               dev_err(sspi->dev, "failed to transfer. Timeout.\n");
> +               return -ETIMEDOUT;
>         }
>
>         return 0;
>
Acked-by: Jassi Brar <jaswinder.singh@linaro.org>

thanks
