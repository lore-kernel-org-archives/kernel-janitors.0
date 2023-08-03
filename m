Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463BC001DF
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Aug 2023 10:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235258AbjHCKTE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Aug 2023 06:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbjHCKSf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Aug 2023 06:18:35 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A0F44B3
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Aug 2023 03:17:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcf2de59cso114229566b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Aug 2023 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691057873; x=1691662673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwPgmkkB31Arabtz8mgYtcF46W4x1m+DLr2workTFqA=;
        b=mOD6VCFSzDhDE5vqICogFnsKQn6Mp6FGh7gXnfHgCVBF7CEBWMPz4zrJ5CQhkOU4UL
         iFAItAWw2ZBsRWSbvXXkKDxryMbquO8rKaxQDSCKmBHtdevIhPZ/4retCk3wdeMrJUsX
         mYdHgX9uUu5zinergWmexDdRjMBdkS1Z5y/ZrvGwH8NABNpbJDNw9X/rz0whunahxOuN
         xPM1HlTiW1zUMqIQg39Avr6ynXoSiBRFZ/E0fnYFSBLmIbsUSbTlm5KmGaDfp8TMA0y4
         odBNbML8dUfP/+5ftWDfOfmKrCUPd4mIs3pbq35DDTxFdPqNuiNYRYltgWRBvNMLDkGb
         t/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691057873; x=1691662673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwPgmkkB31Arabtz8mgYtcF46W4x1m+DLr2workTFqA=;
        b=LB2YNSB1ZxSa3fYp1HFHYJENSZkdk6ou5RblXSzOVVwqeLMQ1gPyq0Qr7W0ZE0tD3l
         4HJmwAe6zagNlnutE8rOkakzpT0iwXIvlmj1hhrMRrYRSuFOyq34GG02+rnbZM5tDFNU
         Kl+qVxdnkvsCN4D4rQmxi+sRaripNHv2eaATQjJenPbgBtF1YqWhQGOlkiNqfVoGwxqG
         LpVm1aJWAoVhqCgqj+b9hbFXmucgbBbo+unP0VDvjmOvsoCNhm8TMmIAQVURKm8fgXTO
         fABfEaIRPAojpKaygqJ5t6HHSGEomFaU6vyHhi10VzQiMp4r1SBsYf/dcgn6RN6fJ2xc
         QtZw==
X-Gm-Message-State: ABy/qLZl+J9tU4ZYWWdZ+mdh5HWIEqmKQGRtwjNBAQNbpmzbAuZdICwd
        dJozvoSd6Rl5mLLfKRizxP/g8g==
X-Google-Smtp-Source: APBJJlH9IkNJHu2Khh3/GiTbRaLuHqjxLFT03bbdnvYbFOG3mFj9RHmzeDkw/unGxmIaO27MixXEGg==
X-Received: by 2002:a17:907:b09:b0:993:eef2:5d61 with SMTP id h9-20020a1709070b0900b00993eef25d61mr6789196ejl.27.1691057872792;
        Thu, 03 Aug 2023 03:17:52 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id oq26-20020a170906cc9a00b009888aa1da11sm10318221ejb.188.2023.08.03.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 03:17:52 -0700 (PDT)
Date:   Thu, 3 Aug 2023 13:17:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kernel-janitors@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [bug report] lockdep/selftests: Use SBRM APIs for wait context
 tests
Message-ID: <bb3e6fd6-9d1e-4399-9795-6f0f487948a9@kadam.mountain>
References: <c7b538a3-eb0b-4905-8ebf-8bda88e576fa@moroto.mountain>
 <ZMqLAUyMuiTKdLfS@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMqLAUyMuiTKdLfS@boqun-archlinux>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 02, 2023 at 09:57:37AM -0700, Boqun Feng wrote:
> 
> Thanks for reporting this. However the "bug" is by design,
> locking-selftest.c contains tests that trigger incorrect lock usages and
> see if lockdep can catch them, so it's supposed to work in that way.
> 
> Out of curiosity, could Smatch detect the same issue without the patch?
> The patch is simply a cleanup, so no functional change, in theory, the
> "bug" can be detected without that patch.
> 

Yeah.  It's just that the warnings show up as new to me when functions
are renamed.

regards
dan carpenter

