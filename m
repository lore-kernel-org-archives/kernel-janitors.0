Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9FAC25B48
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 04:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjJZE3V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 00:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJZE3U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 00:29:20 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E33186
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 21:29:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40790b0a224so3481585e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 21:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698294556; x=1698899356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMx657uezOJ5kmCTgoeA4HCR7tZ3spvjRGAv0FLPlKw=;
        b=ZRyZhns2GUG1+woQdnwgQBwbU1n/Aii9oZWFIsdmVnoKbHmKHDBnNtygumqkHYicUm
         +RfD1ctfrYUCIwrOFoPcb21YK8Ul17V7ZzebIcDRCUCrpXfs9106oXbHKvgeVqEUYn58
         4lFyx3r37OQEok3Q1CJ3OVylDT9wEyCoK3mQHzlyEm5LFnf48yA8SQDycMfPWKE3XLQf
         NV4JdK8M5nssQxiHzcolW0Y2S/FLOQ08UNL4per4FExWavQ4rDfX6f5A7oV9cOC34JB1
         g7sROE4QYSjWhs5hxReoWcWcIsToLXZ0sAbc0uQk9D0zEDfKrvo0Y/u4O/NP4ixQ+5vm
         5efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698294556; x=1698899356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMx657uezOJ5kmCTgoeA4HCR7tZ3spvjRGAv0FLPlKw=;
        b=c919IpeG7hY4Pt2ACEXKnSVQhM8YVXkRKvyGTDGgPX19oheMTaP9kbtb8ilsbukfkM
         MR+gqwRG0JEgaGP8gKyMBLsRLXkt2vRQOTCX1/UrmlsuxIVDUaXSloHzeF/f2Kzc+DuW
         OTxYKm5669OYOHeIcuN6FlXfyHOIo5YdtGzO0D/SL74uPJomY/whVm6zV7UyDewEwjfy
         jDTSQU9PcAnFW1ZEeXeFHXeqw3AF839551vHpJUE3WsKnUrfFD8ratjN8NAP73u9+kK3
         Im8NjNKQVZo5GCDV6LuFL8KmFk9XlaeqE6rMJ0oH2jcCfyfJSrH8JvIcFIB6RGpdnXfC
         ruCQ==
X-Gm-Message-State: AOJu0Yy4tHmgQGgGZ3Kq52Bf10pdj5Bztkf/2j1JloS1Fy/niFGC0JvF
        D0p311GjKDMUJ3GbePmUtrvKbQx5KKbc3bRY2FM=
X-Google-Smtp-Source: AGHT+IFtEu9JZd5Mj+phH40fmg2CCAygbMyK5FuzrXPcDZ5lzRVQggILIz8W6yil4r/Yml9tjv8P0w==
X-Received: by 2002:a05:600c:3b90:b0:408:37aa:4766 with SMTP id n16-20020a05600c3b9000b0040837aa4766mr13041643wms.5.1698294556619;
        Wed, 25 Oct 2023 21:29:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00407b93d8085sm1363441wml.27.2023.10.25.21.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 21:29:16 -0700 (PDT)
Date:   Thu, 26 Oct 2023 07:29:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     NeilBrown <neilb@suse.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
 <169826846576.20306.981035382886610843@noble.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169826846576.20306.981035382886610843@noble.neil.brown.name>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 26, 2023 at 08:14:25AM +1100, NeilBrown wrote:
> On Wed, 25 Oct 2023, Geert Uytterhoeven wrote:
> > 
> > Please compare the numbers:
> >   1. 1 sender removes irrelevant parts,
> >   2. N receivers skip irrelevant parts.
> 
> That is one way to look at the numbers.
> Another is:
> 
>   12 - fix about a dozen MUAs to summaries quotes properly
>   12000 - fix an unknownable number of people to quote just exactly the
>           amount that their particular audience is going to want
> 
> and when it comes to fixing-code versus fixing-people, I know which this
> community is better at.

We've historically been successful at enforcing LKML etiquette rules on
everyone.  This is just another rule to not quote the entire email when
you're replying to a patch.

If you're just adding a Reviewed-by tag then post some context but not
more than a page.

For a new driver, what I sometimes to is put a summary at the top.
"Thanks.  The only real bug is some missing error codes in probe.  I had
some other style nits as well.  See below for all the details."  I
normally write the email first and then chop out the "no comment"
functions at the end.  (Sometimes I chop out the no comment functions
at the begining and then I have to start over when I change my mind).

regards,
dan carpenter

