Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A29C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 May 2022 21:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385943AbiEEV5T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 May 2022 17:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245484AbiEEV5S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 May 2022 17:57:18 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805EA5373C
        for <kernel-janitors@vger.kernel.org>; Thu,  5 May 2022 14:53:37 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id h10so9899130ybc.4
        for <kernel-janitors@vger.kernel.org>; Thu, 05 May 2022 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCoDgmddTtLI0GdQtfmKUixQsE6y5QSv0lEy17c3ipQ=;
        b=A3GWTybPmCx3FISILTMAMvbsp71fP2NKB9pVjjCmQTH1WsiHhNpPOttu6hz+NcvTkI
         lYylu1w8CbkzEOlJ9p0zHVhTZ4KO4cK/blbEW1yMqQ/zt9ozOQ3KEdIv1A9TizdkSvw0
         doZ4aZ3IXigf2UODRTDyZPQF5+u0bhnqWE9LHN/XiOsmw7BSo98wjRR9ah+EesKgQBxM
         maJCG/z3NUdygYqVFxGZOhQBMA3cZDkTSnWUfJiYUqLcri1YI1MAmhaGWob8C/Eo6k5V
         J6rGRilzFC76EcPxHNtRP3616ucWIl3HAq3fXfcYHihmazTKP096Syk2I633lxnZjnHp
         YX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCoDgmddTtLI0GdQtfmKUixQsE6y5QSv0lEy17c3ipQ=;
        b=H+kNDoObhT4Y/ruCpDB13NlvDl4m90X2do7XSvvVXV50BCxM30igfj8qE8w2N6w72d
         tU++08oOlKVzheIAE4ofyxXoyVMOW8eQRfJvrOj0awiPFZtbpIhO5YecygaK9IuD+ONI
         4FWVe9p17aqZ5lvnccOy0JXrvDnWuWF+TXCVaLoafY4J0j+FjgUFAoh+X1c6MHkNOa6W
         QhyMbgWom4vaeZ7YRJgmWkEhxdUdIBFtqw/Wqpym0voqI3XVQpkMCVtiJLI+yMJDmOk8
         QGnnxh4VEiJcUrnHYmYpxUDr2C7YwsHm+mcSN3ajh0QD7oNfSDs3ODOTX6X8U/JEaYUT
         lYFg==
X-Gm-Message-State: AOAM532R7c92wJrKxxwpSBx9CaGkn+/kitac5lOpD0RVFJ4NNXMBH0BV
        zaSLspj61OsTjpa4H1R9pI21nOJV6Fzd+J8Gah8fEQ==
X-Google-Smtp-Source: ABdhPJxBkrbDKRoetUh3zQUrvDTTWSIxWCrEP3DoxVTsAJqLZGfgHgccPdMURtafA2RAtc5Ooi28YRmCvzqeKVmKy7w=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr215055ybm.514.1651787616791; Thu, 05 May
 2022 14:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220318103729.157574-26-Julia.Lawall@inria.fr>
In-Reply-To: <20220318103729.157574-26-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 23:53:25 +0200
Message-ID: <CACRpkdZ1a5qhy8M0ATNij4HeF9usVgktfPRb6JOfJ0XFc30svA@mail.gmail.com>
Subject: Re: [PATCH] ARM/ixp4xx: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Linus Walleij <linusw@kernel.org>, kernel-janitors@vger.kernel.org,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2022 at 11:37 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied!

Yours,
Linus Walleij
