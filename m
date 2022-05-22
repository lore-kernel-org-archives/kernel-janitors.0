Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802BEC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 22 May 2022 20:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344082AbiEVU5y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 May 2022 16:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242846AbiEVU5x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 May 2022 16:57:53 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D73D38DB3
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 13:57:51 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id p139so22262274ybc.11
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NDRtCt5IKvrD75rRnXcuTW8iRXjJ/s5YNzt05pMQFc=;
        b=DtY/tZ/S/a4gtZJC3fElPoyFJfvl2m3F3LvHtQGgfyG623p97p9BSoIipaI8oQES9D
         hcGg4yM2FV+bvl0iHVBGzpt0u+ozsRBcY9EOzcCeUTcX4pQfmiWvJLjmO+HtWTei8iYQ
         uGO7+wYy5VNBlRN7TFauG7DzUXnu+uiFE6unoU6C5n+MJlriQxiCJnxjXbzbpQwf3HK3
         JKl8kj7l2fO6CFbnxHlfhSbfJqbFzWf/bg8E6RAEJixnfu4cYCdZdq7yMe9SyCHw+p0d
         1W5xLB9J8f/7EAf9dEWCDVeKEQfeIB13Wi0KwB8gAmU2uDkk+5fHaB3INM7dMOCEpfBG
         BfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NDRtCt5IKvrD75rRnXcuTW8iRXjJ/s5YNzt05pMQFc=;
        b=aV5lcKECPj8tKiV3/wq6pu0EKK5jmSWAooR82X+5oE/Ci2pTwXgf7ElYteuGuqB4Qt
         pCpnpRFLJOGLWGCOzo3TlQXr/GwiHauu4d5SWbJR5OHKSNBs3tpIl8RPK0VI9OlxZrpR
         EMILeoDwLGiyIJ8fvyhIlcOHTQVmnY2TUArz1JWhGVm4hbMQZjxma+OYco05UGYp+R5k
         QTKovQ3A/ufxqyNthqA5t3cVZKCbdWoF+HURoaGuCSJQ4guuKE3XycE8m9Dnxd0cTkp7
         hftFyqWf64BKtUnzaL1i515uti/xCaK+YyHeCPiPzyAgNoQ2Zut++Nd87Mn0a+kS/BkS
         tJnA==
X-Gm-Message-State: AOAM53255c4SwXQK9A9KDvDLUkSQAeXrmffTk3A3fEEVeRPhHh+s/ZzA
        F6nQ3Q21AOEyovMBcqwCYAg/6xSos8q9YyYleAKQKA==
X-Google-Smtp-Source: ABdhPJx/ekEjROZtlx4zO2rTZDqWJXb55TJCuZIiQvSwU8m6RMcAhb++WSUaqowRDibkhPUXxwRZLb/YXDf6rORlip4=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr18769020ybq.533.1653253070562; Sun, 22
 May 2022 13:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220521111145.81697-17-Julia.Lawall@inria.fr>
In-Reply-To: <20220521111145.81697-17-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 22 May 2022 22:57:39 +0200
Message-ID: <CACRpkdZBvfyCBzPsD1S2RWKy1eUhiQDeaFb2xuF5VgFnY3rGOA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix typo in comment
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 21, 2022 at 1:11 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
