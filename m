Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D79C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Jun 2022 21:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345630AbiFOVnF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Jun 2022 17:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239542AbiFOVnD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jun 2022 17:43:03 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4917C30F42
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 14:43:03 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so3382204pjl.5
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WcjULP+xvRapFxRv0FaC6VPZV20BCthIO92kKFiQ9M0=;
        b=B0XNk6D8/gn8a9uQq6IA6wE3unW212NQNc1cQ7qD+JTjkn1rfYHx6zE0/3HjpiSkCg
         rkBrcV1VIEFW9BDgH3rI+yyJ6H0DNqc3yHSSy0SNBw1dCOMt9z1F/Hgek1me+rIr27IE
         +jrW4QVidiYd361KRdfwHeez+SO0MONybOf4004hnfcLT3P/4gmT7iEXkX+NbONX7xA2
         OR9FbegnF4PL9LZziDzPQaCytJfqj74oN6cEQh9iZhqlnVBBtZg6f2ZbL1G0sU3urVF/
         w9RbvMqy0gH+GAbxBRWj+9CAz9L2SnU2UMjZFVJsJP6QagspO5iu1laFW7/rvX4OhhJ8
         cZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WcjULP+xvRapFxRv0FaC6VPZV20BCthIO92kKFiQ9M0=;
        b=C9mYd/5JN0F8n8nUgvQUlULLXecWJeJdlQyYNUZrEuDZ6jch+CjzM5X/XdSSQulkqM
         gP5BoS25ArlNxmGJBBjBIItXTIctLIvQ8aeVX+/DBqBMIiHEMxlw2m9en8EOYPcZzkZX
         1KUprdZds0mggjow3lPYAuhtYhkuI+IFn7hfqQ+9Bb4CZaS4g0T8aJ/AJGn9PCjJcWHQ
         D/EMS3VdTHT0i9GDzzvfu5fp1hTHVtyomLw/7w2Rx+Jk65WNW60Wet6Q35TBuXHtdvEP
         5HFQbVWQHFppv7tl392rWBYLiwss5jpakw9zKOimqGk2fn5J7vtFv2w4tubTgcWaf2Av
         Si4g==
X-Gm-Message-State: AJIora9rshXLqA1KRwlzSQQQ+tMUIh7FCMc9hRwvBMIoH1m73TAyf62i
        H2DlBBQDxaV3/3gt5htkut/Mr7u2VO0VweOq
X-Google-Smtp-Source: AGRyM1vjV11bUqYxz/GH9vFdp7a7E9IJbTAEzFfMt7oHG+sL5zQpKHckTKh0WHupOxdErb81fpFqeQ==
X-Received: by 2002:a17:903:28c:b0:167:6127:ed99 with SMTP id j12-20020a170903028c00b001676127ed99mr1369342plr.94.1655329382784;
        Wed, 15 Jun 2022 14:43:02 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7948f000000b0050dc7628178sm111221pfk.82.2022.06.15.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:43:02 -0700 (PDT)
Date:   Wed, 15 Jun 2022 22:43:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust file entry for max77693 dt after
 merge conflict mess-up
Message-ID: <YqpSZPr0a1raTRm6@google.com>
References: <20220601073511.15721-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601073511.15721-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 01 Jun 2022, Lukas Bulwahn wrote:

> Commit b38213c6118b ("dt-bindings: mfd: maxim,max77693: Convert to
> dtschema") converts max77693.txt to maxim,max77693.yaml and adjusts the
> file entry in MAINTAINERS accordingly.
> 
> Unfortunately, the merge commit afb67df31a8c ("Merge branches [...] into
> ibs-for-mfd-merged") resolves some conflict in MAINTAINERS in such a way
> that the file entry for the converted text file max77693.txt, removed in
> the commit above, is added back into MAINTAINERS.
> 
> Remove the file entry to this converted text file in MAXIM PMIC AND MUIC
> DRIVERS FOR EXYNOS BASED BOARDS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Lee, please pick this minor non-urgent clean-up patch. Thanks.
> 
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
