Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F549C41513
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Aug 2023 14:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjHGOsd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Aug 2023 10:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbjHGOsc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Aug 2023 10:48:32 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7921910CC
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Aug 2023 07:48:31 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5227e5d9d96so6125805a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Aug 2023 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691419710; x=1692024510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
        b=LAGX7jbG6F4fq0qqXNzbtH86Na7x01qv3FacE1USHXDEuPJpTPvENMIlED/2GBOsJh
         6Altx05H7uymr/LpYE47VAUyns0iHv6/eW9j+xnJkl/WLNPzU18B/VX5CZdpu0+KGAbo
         g5ymBhw+YfaA3o56MEAbZZ3bint0HoWQ94wAejTZCBnAiEeVeIo1JfaRwdq6uof2OraY
         0YtT+Ksc/EgkkHyUS9A2ZhBRbnJJgn67c9lJo7TWxXutCMBQlVi87Hew6c1UnLG/+p5G
         2SWr/80LrE3N9Cp7fu8ZdgYJuQ6uc1cwSa5Q5aa+Ap96J6eNodixg8bEBlI8qqEEZ6bO
         yPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691419710; x=1692024510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
        b=ffhncwJjiAU7u8lP3AbkXv9hunykOYhuc6GTm6H6lsAg5L2sj7VHRGmTK2DDzFmrWM
         3at657I/t09QCyTpCpJqJYw472C7pkHf7RB7A+2SUowoKVb5BwHjI8wzqr8OX1GYPvO2
         ASie9eqOpZriTuoy1NSaUrfH9NRtsLzUiYeNgRPI7BKEogrSGV0Is7tl5OVl36eAZo9i
         VCLzaO9K0RtLKHfUAVFRoxmRftU/d36Z7coJSNkgYT+2TwWVSn2a+fLMIJheADHV8A6Q
         wAKLrO/2FLJ+K1TIcSNXZPxnMiss9QfyhIuTZL269rBKIv+cxkWYXEGQexYP7Pkj21Kj
         se/w==
X-Gm-Message-State: AOJu0YzZaPYbox1oNmkWhgH60xHh8dQP4BNV1PR58ECBDLBCZ5dG5h3u
        4m1uED4SiYIc8/ouBgfRni0eGg==
X-Google-Smtp-Source: AGHT+IEcB9lOnU5D7LUku7kKOfGjfkNp21TKAM5wlwjqT1tboFCW53K/DMPnWxEHWTDQKAQwNEvonA==
X-Received: by 2002:a05:6402:54:b0:523:366b:9cb4 with SMTP id f20-20020a056402005400b00523366b9cb4mr3454238edu.1.1691419710016;
        Mon, 07 Aug 2023 07:48:30 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id bq1-20020a056402214100b005222c6fb512sm5355657edb.1.2023.08.07.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 07:48:29 -0700 (PDT)
Date:   Mon, 7 Aug 2023 17:48:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <e42f15f4-d1a7-4e4d-8efe-e7636634278b@kadam.mountain>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
> +	remaining = in_trans->size - resources->xferred_dma_size;
> +	total = in_trans->size + offset_in_page(xfer_start_addr);
> +	if (total >= SIZE_MAX)

Btw, I wrote it >= instead of > to silence some idiotic static analysis.
On a 64bit system U64_MAX can't be greater than SIZE_MAX so Gcc will
complain.

However this test only affect 32bit systems and > and >= SIZE_MAX on a
32bit system are effecitively the same.  Neither one is ever going to
happen.

regards,
dan carpenter

