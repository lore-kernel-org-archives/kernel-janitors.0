Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD0CC7EE2A
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 May 2023 04:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239015AbjEXErg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 May 2023 00:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239005AbjEXEra (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 May 2023 00:47:30 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED82E42
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 21:47:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3093d10442aso167247f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684903642; x=1687495642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MF3zjzyqLKusdnLu2cFV58+HdPXe0H0Lh5vvV2VNIwg=;
        b=sln8cXJ8qzy5HVSd8Co9u/U0nEkGx2RLR6GaZEpOVVeeBnqkkP6Z/XI/0Ae95Zktrz
         wzx3Uzt7BGAA+G4jPsza3Dv2I2kM95jeeuQiDfWtlxbHrm+BgYeVNBHbZnMWyzoWOiBf
         VdicnhAkbtrMrmuX34fZTOLGg27Ezp0pfAjzDljs4ulib3rUYgybCNK+xEMKjC9tSsGP
         gVqdXMTdNQ2grXPbupRX/ez8u83eZM66hYy7bflUIrAfC1To4CeQVG1nVihgLFk4HfxL
         nRfddk/qsHtnnfI2YXvhXDZyy1KKsPAOsx+Bv6gktbnZz/gvpComWQO0qHMcDvhL7SxE
         MB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684903642; x=1687495642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF3zjzyqLKusdnLu2cFV58+HdPXe0H0Lh5vvV2VNIwg=;
        b=dW32EtUdZQpuID3y2HmwlQ7N8GhU+BrAokSJX1V6VQ5mhX0SSbnCTQxQUbLai81eqp
         99pR924poa5vuLKbLPKhahola+MxrsmT7oJsUoHgGeiwH/YkG8xvGMLxYG48xOxr2p+W
         2orQg91/vWjqowFf+NG3TLOCG+FZnEXSiDcrEkwLEL1RQlMWzAmcSBZvcVV4izW3CfzU
         +kphDXZxRVoWCv+g0Mb7TMGfjDPyN6pQW2ZZGNrhMd3RcLWX9Stln2Zde39Q3T92+fSQ
         NDK3rU4c+F1oC0gEJhpPntk6L5/bYrRxcu9HQ0JlYKTL3ylOYQBz33rhi/w8YeDvPdW/
         JUlw==
X-Gm-Message-State: AC+VfDwYUNx8+eUEvuHd7r5dbxl4xrTgAlLWM3brleLmld8oDT57Ji6A
        62bhCweOpmutKrCUk9rPrIIfEf7XLSgc2sjN0xA=
X-Google-Smtp-Source: ACHHUZ4eCiAL3KATuxU8f4+GToIRF03ne11cy3xDVyM5Qtn8KrlLw5lsTgOrCzlRlAuxhWACDwueSA==
X-Received: by 2002:adf:e4c5:0:b0:305:e8db:37df with SMTP id v5-20020adfe4c5000000b00305e8db37dfmr11652178wrm.22.1684903641894;
        Tue, 23 May 2023 21:47:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d5190000000b003078c535277sm12921492wrv.91.2023.05.23.21.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 21:47:19 -0700 (PDT)
Date:   Wed, 24 May 2023 07:47:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        YongSu Yoo <yongsuyoo0215@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: dvb_ringbuffer: Return -EFAULT if copy fails
Message-ID: <41a9c6a6-4b9a-4d84-9e32-09bf64c65b6c@kili.mountain>
References: <20230524012733.414441-1-suhui@nfschina.com>
 <7af16b9a-09d1-46ff-b9f9-c178173cf940@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7af16b9a-09d1-46ff-b9f9-c178173cf940@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 24, 2023 at 07:23:45AM +0300, Dan Carpenter wrote:
> On Wed, May 24, 2023 at 09:27:33AM +0800, Su Hui wrote:
> > The copy_to/from_user() functions return the number of bytes remaining
> > to be copied, but we want to return -EFAULT to the user.
> > 

So basically these bugs are caused because people are used to functions
returning negative error codes and they write some form of:

	ret = copy_from_user();
	if (ret)
		return ret;

If you look at the code and you think, "They author thinks 'ret' is
negative" then probably it is a bug.  The common false positives are
in the core kernel where it does:

	return copy_from_user();

and the caller checks:

	if (function_one() || function_two() || function_three())
		return -EFAULT;

Those are done because it's a fast path and adding a lot of if
statements would slow things down.  Driver code tends not to do this
because normally drivers are not so performance sensitive and it's more
important to be readable.

So you have to look at the context a bit.

regards,
dan carpenter

