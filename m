Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA2BC77B7F
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 May 2023 04:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjESEQY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 May 2023 00:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjESEQW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 May 2023 00:16:22 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24E610EF
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 21:16:20 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so2099125e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 21:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684469779; x=1687061779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOiBfpLle6Gi5Vqn7d5zcbeqcAGVB/cx7aZwFnLEQjE=;
        b=M4LfsQRfZLH8eZr583rnEXDxZ1YR2akpiiNlcESNINRmRUVnIKwJ1EXPb/QYYNn/If
         8VXV5eCwWFZzcstNvnO4lcW7ZPl5koeph7YJvTU7Js2Ya6XlpojAJe+YXq7Dq6QgLuGh
         reVgrz+2T1GljEAeuTWCsthUWBz/QZl9g/WGYIF/gVs7OLXegfWnBPVb8WHu3XOsWeGU
         Fq2LMnom73QdwcH0zA5IQNufz/NAxYkmqGYeZlHLGLjvYO2jI4N8daCwFqld8wAFTB3r
         oMNGUtbTP9oTppZJvvlBj1RkfNbe5IxHrcBiBbYkEX0lEAfEsnU6+iReQZ4wIR28/abZ
         1T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684469779; x=1687061779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOiBfpLle6Gi5Vqn7d5zcbeqcAGVB/cx7aZwFnLEQjE=;
        b=brkKXzU4cZyF0gokeGa5cHKB+3caL2GtVf8aGWCcPTGdbSbgoNMVUuXneWrDSMD9M1
         c++ewVx85ZQ3C14DoYz6RNVd0Qmuoh5s8Wf3EOMR0dtbedDHcOGNVoYDcr1iGjChvKe1
         KH3b4PZCRz5GLflbBqCaT0eglDruN1Pts3rP58PW/rcxApi8M6vg1t/jn5OsRpOHmg7x
         XCw0Ad1kIMZW/lupyQmn6ziJfxUUeLg1dNNMC+Y597cydtZnwnNYnzhPRdkpEUdL0I57
         XUNkkpSIIezGOczEFH/D+kJPSFI8Nxtv+VvhLg460x+XToyXMgghj5nE9mepQfZFXyN7
         0gpA==
X-Gm-Message-State: AC+VfDwz9nHJNxo83sT9JThZmpPR9fYOAVLtspA3w91aIUAiZEJSGmFd
        07LQxoOFF7VjXlSZK2KZHojTSg==
X-Google-Smtp-Source: ACHHUZ6lvEClvnoZ6W7RJTr48PMCFljHZrwfZW3qRwcdTtyy43WymSlg+dChSeNU8i3tIs2Ew+mchA==
X-Received: by 2002:a5d:534d:0:b0:304:7bbf:7c1e with SMTP id t13-20020a5d534d000000b003047bbf7c1emr2822166wrv.4.1684469779096;
        Thu, 18 May 2023 21:16:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4ec2000000b0030647d1f34bsm3967241wrv.1.2023.05.18.21.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 21:16:17 -0700 (PDT)
Date:   Fri, 19 May 2023 07:16:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sukrut Bellary <sukrut.bellary@linux.com>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <28c6814d-1863-41fa-a471-35a3ccf4447c@kili.mountain>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
 <ZGbiwqMxnFFvS7y8@dev-linux.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGbiwqMxnFFvS7y8@dev-linux.lan>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 18, 2023 at 07:45:22PM -0700, Sukrut Bellary wrote:
> > > 
> > > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> > > Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> > > ---
> >   ^^^
> > Put testing caveats here instead, where it will be removed from the
> > git log.
> >
> 
> Shall I add "This is based on static analysis only. Compilation tested"
> here 
> or 
> is it not required to mention this for all the fixes?
> Can you please recommend what's is the preferred method I need to follow?

You can't go wrong with always adding it.  The untested part is useful
to know.  Also it's good to know how a bug is found so we can say if
it's affecting user and so we can improve our processes going forward.

regards,
dan carpenter

