Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB5CC433E9
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 20:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A484964EAD
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 20:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhBPUxj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Feb 2021 15:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhBPUxi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Feb 2021 15:53:38 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F794C061574
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Feb 2021 12:52:57 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id g5so15288443ejt.2
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Feb 2021 12:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YFshz0e56kZ+qQSxqouSNCJV43gofQ0AnIxpI0Z2FsM=;
        b=BhUw3SJkYjGoMCMl/NP6DA3khVYOouIHGxo9KByiOKCADD2ds440N2P1NZ6Zhyl0Au
         1FnlyPFmkZFoayIO9K3JEFGfjoE2B+7GZKsTBxe+HPRxQm44NaGEgPBUt5xDAxbWJ2qm
         EA4ucRuGXcJGtTCJgL7ioctJc6SPahzKXFpS/i7d9TQoAa54QKf24Z18Fj9slVMHb6Cn
         UEGmTU6U9CKFWnE0/4Ujz/bk82BFUf9F/H0cBTgknKtzAOWdHdCUOoVHp9pjSdHLGGCa
         7+PNchMClFu+MM2n7AbPWzLfIRp8SFt75WUv4f5S+C0Lf+Q4B2KvAKjh3qCjHxVxCib1
         ikEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YFshz0e56kZ+qQSxqouSNCJV43gofQ0AnIxpI0Z2FsM=;
        b=C2v2sj+MRIFV0p0kqzj3bDH/qxazwoen9k8PAlHQQihl48+S7hm91NgbtuJIU4SFgw
         FXkEi1il2qlWMRfO+oejte3TTzBegC75j4m/lDSPn7SmVaUqMGO/2n8YjdfILDwxSEMY
         NwJwg8YGYQy+/uPo1AFZkR/W9a4Te8T/1A66Fazto8tWAhy7uCMX9wnb7W0tht8w9jqg
         WiTYlGjBCR69qfOrDaORu56iDo0hqRLD8hMEIBWccKzCfsCSDoiBEH0srbf1y4UmdIdO
         kXpLCU2ACI+fNoJsDofeBRo8fKLLpn0nzb8U6K6Nz/hUMxvKMd/OG+3um6chqdZ6EsWy
         fUMw==
X-Gm-Message-State: AOAM530rM/MofwINR0jIVDt8DCsLz+0VY3kcugnglE+Z3tYXlv0O7mft
        PqbN9ddh0e3NEGOppHxKfzOC60cnASvX6iDna97XWQ==
X-Google-Smtp-Source: ABdhPJzM7peO8ohllzmQBORMfOZqGf2IYJVv2j8uOsEwFR7TCY/QIkxO7ZTDOkUbS0Eaf1rQsGC9Z0dXaXtdkFey1Us=
X-Received: by 2002:a17:906:fad4:: with SMTP id lu20mr11327016ejb.341.1613508776303;
 Tue, 16 Feb 2021 12:52:56 -0800 (PST)
MIME-Version: 1.0
References: <YCwaIGPd9ktMoYPu@mwanda>
In-Reply-To: <YCwaIGPd9ktMoYPu@mwanda>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 16 Feb 2021 12:52:46 -0800
Message-ID: <CAPcyv4jKL7J0XoXE=uz-DOowYg888A5ajhQUxuFC2x8x5JoL3g@mail.gmail.com>
Subject: Re: [PATCH] cxl/mem: Fix an error code in cxl_mem_mbox_get()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alison Schofield <alison.schofield@intel.com>,
        Ben Widawsky <ben.widawsky@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>, linux-cxl@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 16, 2021 at 11:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that sometimes when we return success we are holding
> the mutex and sometimes we have released the mutex.  It turns out that
> the bug is a missing error code if the mbox is not ready.  It should
> return -EBUSY instead of success.
>
> Fixes: cc1967ac93ab ("cxl/mem: Find device capabilities")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/cxl/mem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> index 3bca8451348a..2ebc84e4d202 100644
> --- a/drivers/cxl/mem.c
> +++ b/drivers/cxl/mem.c
> @@ -383,8 +383,8 @@ static int __cxl_mem_mbox_send_cmd(struct cxl_mem *cxlm,
>  static int cxl_mem_mbox_get(struct cxl_mem *cxlm)
>  {
>         struct device *dev = &cxlm->pdev->dev;
> -       int rc = -EBUSY;
>         u64 md_status;
> +       int rc;
>
>         mutex_lock_io(&cxlm->mbox_mutex);
>
> @@ -414,6 +414,7 @@ static int cxl_mem_mbox_get(struct cxl_mem *cxlm)
>         md_status = readq(cxlm->memdev_regs + CXLMDEV_STATUS_OFFSET);
>         if (!(md_status & CXLMDEV_MBOX_IF_READY && CXLMDEV_READY(md_status))) {
>                 dev_err(dev, "mbox: reported doorbell ready, but not mbox ready\n");
> +               rc = -EBUSY;
>                 goto out;

Hey, Smatch gave a more thorough report than Coverity:

http://lore.kernel.org/r/20210215195313.90231-1-colin.king@canonical.com
