Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD09EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 09:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjFSJdC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbjFSJci (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 05:32:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E7C297A
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:31:03 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-311167ba376so2925243f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167062; x=1689759062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RalpslVZc2FQG+5YgH7hd3vxpCutTY0S3rDmPYgx9FI=;
        b=mPFnvw0vkeKji1lWrj49QPjRhlGnUVdB1CU1Tk51aw4iLfaJU3SWF+uta7TgKrfyvN
         7sQtnaO8fybIMTeePz6bVleuUDkDObOTz3RxdbmvDswH1Uz+KXrmzapsH4nN3GDI3Lu1
         7J5ydxUtAgnrsIO4IY+pxiKJ6I52KbY1pJ/dzJMQdT7x5y9uO0QHcFg/UvB/IZLSbagv
         Sq//qz/BOTTk9ImpsMOvdtTChffB+bpXKawY7shiVSehIqHD4Fzp2+VVQtnXF94ebCIT
         ikFn5gZy4+Wn2fIZZOoHAfZR1oGKKQ0OzAidtNoRZ0Om2Ypd2k/s8aildk2gSLqRJbJF
         3y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167062; x=1689759062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RalpslVZc2FQG+5YgH7hd3vxpCutTY0S3rDmPYgx9FI=;
        b=WXTwVCAayd2eFCSYq7WLxFojNnYdjfsLmCoEYbpa0NZZVgm1iPtfwOPD5lxBK3c7AL
         rRkDhEGTBvdKA5wy0XK+wxIThMQ1MgzGio68lhXVdtoBEHblCO5soE1zeGIPMn7BFatG
         mOMcJbcVt+7/oAwOxiEqzALW9TnmGY33GunKy3SNNW4tV+8HOF+XHrFlcmZorVpKlvcp
         g9/MSNo7VkB1lbc9iRZBt1DhULxwghGwPNMt3W4+BoKtNE1RXKtSB6Kfx8qS62sh0eI4
         eaKC53dZD+I6pwYpmaZbz0NogZGtiWhzJ/DsLHvnV6Lfej0UBdumJEfrStRHjktALnR2
         OGFQ==
X-Gm-Message-State: AC+VfDx6aBdLR1a+Y1WSp58yOTAYTxKPhvvRXAIqUOWvBBcCshPe0Zpu
        oIIZYy8sdwdwmsR6GlTiy4/d3C5qrKlxQKMTos0=
X-Google-Smtp-Source: ACHHUZ76gOgtGmTO6zfU1oiguTxmRVnFRw94zFTBW3Yv6TmypahinGuI+i9HEHzl5qKzwAOIT28rhQ==
X-Received: by 2002:adf:ef50:0:b0:30e:45a5:9476 with SMTP id c16-20020adfef50000000b0030e45a59476mr7095098wrp.1.1687167061962;
        Mon, 19 Jun 2023 02:31:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d50cb000000b0030fb828511csm24309331wrt.100.2023.06.19.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:31:00 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:30:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Fei Shao <fshao@chromium.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: clk: Fix memory leak in devm_clk_notifier_register()
Message-ID: <8352fe9a-f76d-4ddb-aec4-d2c443f2fb2a@kadam.mountain>
References: <20230617160901.1.I2b151cdf7a72d9e3ecc7ab2ff38409ebe6d65d6b@changeid>
 <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
 <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
 <8366a35f-bc2c-4aee-b2bb-5fc9b2a7072b@kadam.mountain>
 <ea5c0b0b-7aa5-d4eb-def9-fa279d69cd44@web.de>
 <56998d04-7f09-4982-b0f1-20ef917aa524@kadam.mountain>
 <6e1071ec-f19a-454c-215a-b5193984bc6b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e1071ec-f19a-454c-215a-b5193984bc6b@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Markus you always answer every email with more questions instead of
just listening to what I am saying.  This is why you were banned.

Even though you are banned, I encourage people to merge your patches
if they fix bugs.  And if your review comments are about bugs then they
are welcome.  If they are about coding style or grammar then they are
distracting.

I know that you are going to ask more questions but I am not going to
respond further.

regards,
dan carpenter

