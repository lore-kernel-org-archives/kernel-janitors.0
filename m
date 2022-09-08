Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42408ECAAD5
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Sep 2022 07:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiIHHyn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 03:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiIHHym (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 03:54:42 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33D713D61
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Sep 2022 00:54:39 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id s22so12304124qkj.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Sep 2022 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=P7QJckYHfQwgitlIa4fG9VvM/7DgqgL5ob2UbtTxt+g=;
        b=nZpnmUeuYkLB/UZcdQdqTJfcOGeCfKdJjqpqUXHIkWTitN/FL7CFmMExTnxbW2Li4Z
         5cY+KPyH3JAAcSOOBn9rQqi4TsUFjP9juX4R9vWdV+llvioUaWYg+OV0PuFRNYLnzH5y
         3uMmP2oARIVgVBudecdLunDG8ZWDA8Dr4z+FaiwRlTigNeKOhrnhVpZiq8ynchCf2rMf
         iB7xomzse/T+/VSEyp4RXs6eRF3nAaNW9grid1ir2FwB41pUsV+oFdxXmG1X43m0xyAB
         09oh2pRq3y88H7Io6MiztJZwTkiSAqp5mZDgjz2/0N5Q85RZ+Wi6FJlZ0A0wDbx0NaL+
         nm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=P7QJckYHfQwgitlIa4fG9VvM/7DgqgL5ob2UbtTxt+g=;
        b=Zf8N67PELpFZOZtv4I6dAsZMeRBkE/sYp0GfBysLk8FzVwuKH7D3rROh1w6XBow7hC
         sOk+Op7juPwXXt0fQenhHzqVMWj7Id777EsGrUzw/ea84zrOHkfomEVUKI/xZlFkx3Y3
         Ofv1/Lq9Ttif0Q+P9AYJGlc2OiU/6EB4+kkEJC1mUhazQy2qE2WWIuZy5WzQUzbGyNKH
         /T1oUAIyBH54+/TzPKOmZsDAneP0FW3zDn7xk2/CfqOBVaDz23apwTsA8CFAXP7w/xkD
         MAgBSxgcII/evXQ9YIncwHNjIjK8IRWZ/mZaYf34Ktt3jw3z1FXMshBGMHERASoOaM/Q
         JWnA==
X-Gm-Message-State: ACgBeo21Fvq0CfTfdloVvgYId4Z5vKEwQtgICiud+DxQPAaatiMtHKkA
        v2mB1w9NNWht4lB+f+46w5dXFXfJ/VxVv8wF4Zg=
X-Google-Smtp-Source: AA6agR7UWtA+s2qtZryD2Or2q9oVtlOm566IlOUwu9dQJoQJuRnmMrQ+EJuOdwhcqVqGpfuockZlK6Lm01yDZP8/nNQ=
X-Received: by 2002:a37:a80b:0:b0:6cb:dc5f:2ded with SMTP id
 r11-20020a37a80b000000b006cbdc5f2dedmr165175qke.320.1662623678848; Thu, 08
 Sep 2022 00:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili> <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam> <YxmSTH5ETSC0D3Rp@google.com>
In-Reply-To: <YxmSTH5ETSC0D3Rp@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Sep 2022 10:54:02 +0300
Message-ID: <CAHp75Vc+fGiSw-CZ-A=2Apy7MeQ7W72-LZyCNN_LaxvpnAKAjA@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write functions
To:     Lee Jones <lee@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 8, 2022 at 9:57 AM Lee Jones <lee@kernel.org> wrote:
> On Mon, 22 Aug 2022, Dan Carpenter wrote:
> > On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:

...

> > I spent a long time looking at this code before I sent it and I've
> > spent a long time looking at it today.
> >
> > Smatch said that these values come from the user, but now it seems
> > less clear to me and I have rebuilt the DB so I don't have the same
> > information I was looking at earlier.
> >
> > So I can't see if these come from the user but neither can I find any
> > bounds checking.
>
> What's the consensus please?

From my point of view it's not needed, and we may fix it later when a
real problem happens / revised analysis done. But OTOH it is harmless,
if you think it worth applying. I have no objections to the way Dan
and you choose.

-- 
With Best Regards,
Andy Shevchenko
