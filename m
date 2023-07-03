Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF32EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 12:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjGCMyy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 08:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjGCMyx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 08:54:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F9DE62
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 05:54:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso6982244e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688388887; x=1690980887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5vg9Foed0fGCLC6fQJ5romEdNjTvzK0Z22HuX4YlC8=;
        b=ygKIo91z1/P+BIySSrpClLc3H42+uNOqyHBDRliREHJmsL3Y+/JwFDNhG/9agp16Go
         MBXAMfk6WX796GJagY8JIeBITY611anmlMZl6gyu5/YOYOCDfqrLSVikHnmnZQsyYZCd
         9jWJsuoEPQ7eVjVdhyR2s+qsN3dIG/e8YsSh6TXlYI+Tm5UP3C7eVr4TC5s50Ghr1kbU
         V86G3M+NNER1+P4sulAH06zpVroor+hu5b5kBgmhJy5xcr6QjM9wLqKJ1eg3NUchXXsy
         o/Gk3akM2S7yRuUlAwucRhezb4zesIGfsJioOc4IJXBno7VBJi9rrBbBpigQEX/89VHf
         +oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388887; x=1690980887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5vg9Foed0fGCLC6fQJ5romEdNjTvzK0Z22HuX4YlC8=;
        b=SzSJ/IgfIfXVE54hHDcn+DIpcj3HOkRjjV3Ar9gU1E0xxiwM3geNlWnvVY07qpCABP
         +GQutG9usIR5GYFIb+KTJXWB4UPIi6SNvjvEYA/8g8D8Iw4ZH69VT0yRhMjtJxy1vQBd
         tN8IDieYW9z46MA0ta3opmIld09ZsFlefgLgVGnlA2BMLNr8qC82zPzAL/1FLddy81Cp
         N3uYXEBJ1QQoGLI1BtViOUEM9efBdM8iRmKVXtyqWAx3UJPga31v3vjUWIRxIVjFUQOR
         cEiUwvb8BaxVLBDyEHE3PBphApbdsLp6PGZeXIhe4ynoe37LR7FZasbotKmx2xyj7HSi
         wrrQ==
X-Gm-Message-State: ABy/qLa633kikxQqnrbzpOkVbvB3OKgGSkHhyr07XyHDRExqIIx0CWkg
        xtKZwDpMsi/A8CSU5dat50duvA==
X-Google-Smtp-Source: APBJJlHM1frPemlXRN9IjBwImUu2ICaLNU9ZsDkBq1O2R5IQ80yEgdN0B+79v6mSaJM1VkkZNzRCjA==
X-Received: by 2002:a05:6512:33c9:b0:4f8:7325:bcd4 with SMTP id d9-20020a05651233c900b004f87325bcd4mr7993114lfg.0.1688388887459;
        Mon, 03 Jul 2023 05:54:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003f90b9b2c31sm30179834wmq.28.2023.07.03.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:54:45 -0700 (PDT)
Date:   Mon, 3 Jul 2023 15:54:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     wsa@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: busses: i2c-nomadik: Remove a useless call in
 the remove function
Message-ID: <885ee9fa-f56c-4e21-b648-866dd4e1dc0f@kadam.mountain>
References: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2023 at 11:23:28PM +0200, Christophe JAILLET wrote:
> Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
> git://git.pengutronix.de/git/wsa/linux"), there is no more
> request_mem_region() call in this driver.
> 
> So remove the release_mem_region() call from the remove function which is
> likely a left over.
> 
> There is no details in the above commit log, but at its end we can read:
>    Conflicts:
> 	   drivers/i2c/busses/i2c-nomadik.c
> 
> This may explain why this call has been left here.
> 
> Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux

The reason why you're so confused about this Merge commit is because
it's completely unrelated to the bug.  :P  It should be:

Fixes: 235602146ec9 (i2c-nomadik: turn the platform driver to an amba driver)

When you look at that commit, you'll see that your patch is correct.

regards,
dan carpenter

