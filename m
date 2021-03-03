Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C61C433E9
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A47764E12
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235784AbhCDAVh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347857AbhCCNwn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 08:52:43 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6879CC061797
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Mar 2021 05:49:35 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id i14so4184726pjz.4
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Mar 2021 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+P5PA6F/xv0ug4/O/dd/kkDv2kA9O3dbirrGi+yQBcE=;
        b=KVj58zmD4vVcP45HzjrJnvqZmHxTxJd/QDVVHINViPLqNt8zVm4NbO5XrlrcpU5BUU
         A/RiXNqIJgjZ8y9yKt0NvLGD9DmVVJm7OuREOYcjii6AYuBcepaYBrcr/yk+PYJRmoFv
         TtpSSivPzijP6nqcLt9P6okLyYkXIw53ug6JZyjWzl93BCyJR62jVX2hX7zk3HZO2Yiz
         /ikx4s1cXEaqNTHlcvqGOX6DwcYTZzBPhrgeQgLGRCm4Uw2y1hFM4oGAiAzwqT8OWUv8
         yf6bxPmqCjYHnSGgL+Zia5NiigQKZ+EEP9JjFcCLnNzcOCu9H6end/c2fMWGjUlmB8OQ
         srcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+P5PA6F/xv0ug4/O/dd/kkDv2kA9O3dbirrGi+yQBcE=;
        b=HU8u2dJorvqkltVsrMRn3yNrc7Ovu+UYHGa+UbaoIVupmKZ+QYuDPMlgQhPy4cw3Jh
         iVV2gLHPC0PMIqmKXLYrczYQISRAXnRqRcWhi2UxzPqcDS1F5roiX8k4ZrCLyzHYUapB
         YINafZSz40quuy6z+aafAuC+rQjIWHAT28PVos3gst3bFoyTGr7Y/a6XM94HCT0KvXu1
         z6gVaYxvQawfK4l5zM7GfAU4DsMscA9O9d1nGRYTVyBf6dYhmnMyPnql2DoG39id8nny
         Nz1v7OhLW8A7bJ/PEG0KG2SyZSZSQ9/egWS10k9rlPfe0/CnlmW8oAiyhG3QKlc5Cjbc
         soLw==
X-Gm-Message-State: AOAM533V4nZsfFMoY23OE96AFmPHGab2BJP4V5+bWbP0lxgYJmus/c/m
        jldV5oqhiCp0ikHr+y/FjORlhl3XXYA7QA==
X-Google-Smtp-Source: ABdhPJxStOZuuF5WCJNbeubaT2iUv66NtiARKGwV2jlN1wxLw1mNbTST3CFURi/V3Rz+MkyFT72UcA==
X-Received: by 2002:a17:903:2283:b029:e4:8a:d7cb with SMTP id b3-20020a1709032283b02900e4008ad7cbmr8369263plh.5.1614779374776;
        Wed, 03 Mar 2021 05:49:34 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id w203sm3018766pfc.185.2021.03.03.05.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 05:49:34 -0800 (PST)
Subject: Re: [PATCH RESEND] rsxx: Return -EFAULT if copy_to_user() fails
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Joshua Morris <josh.h.morris@us.ibm.com>,
        Philip Kelleher <pjk1939@linux.ibm.com>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210303105912.GZ2222@kadam>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7b5e3720-70a4-caa4-1709-e95f2dc94233@kernel.dk>
Date:   Wed, 3 Mar 2021 06:49:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210303105912.GZ2222@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/3/21 3:59 AM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining but
> we want to return -EFAULT to the user if it can't complete the copy.
> The "st" variable only holds zero on success or negative error codes on
> failure so the type should be int.
> 
> Fixes: 36f988e978f8 ("rsxx: Adding in debugfs entries.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I sent this last June as part of a 2 patch series.  No one responded
> to the patches.  The first patch was a NULL derefence fix but I now
> think that the correct fix for that is to remove the "enable_blkdev"
> module option...  Anyway, this patch is uncontroversial so I'm going to
> resend it.

Thanks Dan, applied.

-- 
Jens Axboe

