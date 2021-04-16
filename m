Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B849C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 15:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C22260FF1
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 15:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343667AbhDPPaF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243009AbhDPPaE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 11:30:04 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEB7C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u15so5615224plf.10
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+GVt4zFmKmqKxkmzGI4Q5a/DBpLPH80j/5btmM1LmY=;
        b=xoRW3IYe922zO/lzORn0p+Xob3qxvdX+UnZ3jGlz/goun4RYxt/xKdSMkm+ZcSFGvp
         OGQ+OJ4CFGN1ip7TcfW0wZVUd/evc/G8BPcQRXnDTmyAR2FyopuxFjIaEoIX2T2Bw2Xk
         2GLFDgRt8NR98KcfxBvnOE1Zqmq1BCWh7C7nPX2TdU0zB5oGUhLpARKaF6BmGLTyqJGd
         08+UDLagE5NHj4yQ538i0aEd/5p1dIghqOEpKJqOTyNo20j85WKmxtoCtPbSFhfWWjes
         7LNszsmrpa4UfiVOCU2CmH/340pfVuDOMDJ1j6mBSTbuRC5Ese40W4vyPcpgLK7GlaKx
         /RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+GVt4zFmKmqKxkmzGI4Q5a/DBpLPH80j/5btmM1LmY=;
        b=Ji8Ggn6ZCQk8j3G+903cKGp1dguX9GoPdMcFJhxTDgNSlNRMAfWLUoUu41Lqfzuf/q
         pcuMDimxmJ96OdgUYv3HApAa5DJ0bCvcvqfOuUTMxR6yPUHA8A8Lc4FeaQEd7jL2lHZX
         CPqYfdMqrQtzhTYPEhvYtnsGrzxg0NgtU8fQlVPKcZYHAkPB4+eElDc9sXzRhCKkTnEf
         YDMzkZGzwcRH4ONcD4BaV54mUpvo2bXLahfQPXreOq8h0x4G4xU8wZ46veuWGs6GLuvd
         GQyfKVw7UhNHFR7ko2wuhsLm/X15yOtNQsz9ynzjGSLsl3qAIgvMPj8JMr7n8oYGQfTD
         k1UQ==
X-Gm-Message-State: AOAM531qfyujEbRPWPvVyxtZm6S5ha+kscua6isjBPwFUsIBxv4L4q3L
        RvuC7Zwc2Z/MxU+u6wlFYn8GSAKYRqVjPKQr6BFxXw==
X-Google-Smtp-Source: ABdhPJyZtucPw7kU6E7JEzddw3OxyuG6Na85DhOxrZ1BNc/ZLcHmt799YZYyVsyNY88iS5vemCAFByqQ4FRtUsBe4ns=
X-Received: by 2002:a17:90a:b112:: with SMTP id z18mr10675954pjq.18.1618586979275;
 Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160318.2003699-1-weiyongjun1@huawei.com>
In-Reply-To: <20210413160318.2003699-1-weiyongjun1@huawei.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 16 Apr 2021 17:38:11 +0200
Message-ID: <CAMZdPi9c7L7_4Pzr82zfiYOXp128gnwMEpSex7S9-tQ=jWvNWA@mail.gmail.com>
Subject: Re: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 13 Apr 2021 at 17:54, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
>
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
>
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
