Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E2C761A6
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Apr 2023 11:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjDCLZA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Apr 2023 07:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjDCLYx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Apr 2023 07:24:53 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206233C34
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Apr 2023 04:24:52 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-545cb3c9898so469973927b3.7
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Apr 2023 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680521091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tzK7du5TzgY9xSJq4SiAHiRgK3xy6VrwABQVZJYzTK0=;
        b=zVJU6LNlYaSpvCUIHnOgOVXtOlaxsf3C0wZbQloD3xis0IqXn/sJokO5erOor6k+C9
         VZWl3YLU4GlGOFit5YCHrAELmJjzpBs+7KBP9aJtFoWkxLMdowjQueZishRWA72OyJsE
         ssxaCiskpLpCoDrVyj3fGO2e/SRdRlMeLFgmmv6C8/o9kYelqYLo2EK7MOAwNAPmwdbl
         blCyH0gyKEVuR6l5u9yUyDS6Xg+lM5a6CyiY/vPeMU3HBsb9nMoXncJbIk5I6LsvS+ty
         mdAlrenX3JRK+pLj6XWX3yoAzLn3qxFgYuht6VLCoFDMbkyF/8rwYlT1wy78bLrD2ld1
         rbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680521091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzK7du5TzgY9xSJq4SiAHiRgK3xy6VrwABQVZJYzTK0=;
        b=BrlC3trOOxLe2YdUSYiQ4dIkffrzTarKHWiRkXPg63TvEDiPhDXw+03Z+FjGK/Kz7Z
         1AAtZxTP+LodhWamj7JQLVmXFNYVBgD+uh5uIMumEcgaZQxbGJVDyk2zPQ8pHullEXge
         bnBlzOW6rBm7Pa+svnXWHc24Rl9PvgIu3iD09V/WWbTNI+cP7SR9J+UIKe4YDjMEoDVz
         YSCnQ13GoipbYe+rEqYS+KiIUJB0JyJTWGnAIKXZHDDP8x0RCx2Ons4yCX1d8giSdV1K
         XsRqlbM10wtN6nZNswxskO5ESzZiHwMgNJxNaYfdmBEPInYSiJMqxO1i/nMLaIv4Puvt
         bNHw==
X-Gm-Message-State: AAQBX9ceyuxFifNKKpUxk8S9CxwNqLO1XhmBoqWOwK8JLpIgtPnCX59d
        5uMVcDm7ttO2QFxEHBQ83z/Ovw6KojdQ20TZrxctn4Uvp8rGzQBH
X-Google-Smtp-Source: AKy350aGuEBwRp65ybZjN0yySO/u0tnwI5OlcHo0wq/NRgZxYKQBmrBMe7idXT/X80GBQBhfimFhBsVrBi3HV2NrA4E=
X-Received: by 2002:a81:aa05:0:b0:53c:6fda:835f with SMTP id
 i5-20020a81aa05000000b0053c6fda835fmr6278526ywh.0.1680521091251; Mon, 03 Apr
 2023 04:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230317064729.24407-1-yuzhe@nfschina.com> <20230328031049.22749-1-yuzhe@nfschina.com>
In-Reply-To: <20230328031049.22749-1-yuzhe@nfschina.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 3 Apr 2023 13:24:15 +0200
Message-ID: <CAPDyKFrVuQwLfQZKx9x3PNKTYctWi7=e=vnUsdJgJLJ6=1o2iA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: core: remove unnecessary (void*) conversions
To:     Yu Zhe <yuzhe@nfschina.com>
Cc:     adrian.hunter@intel.com, quic_sayalil@quicinc.com,
        quic_c_sbhanu@quicinc.com, quic_luliang@quicinc.com,
        m.szyprowski@samsung.com, wsa+renesas@sang-engineering.com,
        yebin10@huawei.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        liqiong@nfschina.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 28 Mar 2023 at 05:11, Yu Zhe <yuzhe@nfschina.com> wrote:
>
> Pointer variables of void * type do not require type cast.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

Did Marek give his reviewed-by tag offlist? I couldn't find his reply,
just to make sure this is correct?

Kind regards
Uffe

> ---
>  drivers/mmc/core/debugfs.c  | 2 +-
>  drivers/mmc/core/mmc_test.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
> index fe6808771bc7..2c97b94aab23 100644
> --- a/drivers/mmc/core/debugfs.c
> +++ b/drivers/mmc/core/debugfs.c
> @@ -246,7 +246,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(mmc_err_state, mmc_err_state_get, NULL, "%llu\n");
>
>  static int mmc_err_stats_show(struct seq_file *file, void *data)
>  {
> -       struct mmc_host *host = (struct mmc_host *)file->private;
> +       struct mmc_host *host = file->private;
>         const char *desc[MMC_ERR_MAX] = {
>                 [MMC_ERR_CMD_TIMEOUT] = "Command Timeout Occurred",
>                 [MMC_ERR_CMD_CRC] = "Command CRC Errors Occurred",
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index 156d34b2ed4d..0f6a563103fd 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -3045,7 +3045,7 @@ static LIST_HEAD(mmc_test_file_test);
>
>  static int mtf_test_show(struct seq_file *sf, void *data)
>  {
> -       struct mmc_card *card = (struct mmc_card *)sf->private;
> +       struct mmc_card *card = sf->private;
>         struct mmc_test_general_result *gr;
>
>         mutex_lock(&mmc_test_lock);
> @@ -3079,8 +3079,8 @@ static int mtf_test_open(struct inode *inode, struct file *file)
>  static ssize_t mtf_test_write(struct file *file, const char __user *buf,
>         size_t count, loff_t *pos)
>  {
> -       struct seq_file *sf = (struct seq_file *)file->private_data;
> -       struct mmc_card *card = (struct mmc_card *)sf->private;
> +       struct seq_file *sf = file->private_data;
> +       struct mmc_card *card = sf->private;
>         struct mmc_test_card *test;
>         long testcase;
>         int ret;
> --
> 2.11.0
>
