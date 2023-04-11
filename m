Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10147C7619A
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Apr 2023 06:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjDKGlL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjDKGlC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Apr 2023 02:41:02 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9EB10CE
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Apr 2023 23:40:55 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2467729fbc4so421660a91.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Apr 2023 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681195255; x=1683787255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9E3QUvAQUl3o+y94u92fiPsX7FeUqAvp4hYEOQvbNI=;
        b=bwSwwNrwlSHWxctuiILVq87IWdaCXi4nEQhZKXaFKHGDV/tZDxpAQPzI+p6nuAZ9oG
         n1bGcDq6OmaIFf4BQ0LvKfD3Sci1+HNPwXeZR0+OBAbB4KcqUumNf/FomVxTcM5mTv+X
         U+gGK4q/s7oHdLvaIguwGGZNi6Vu4uBzRO/7q8ZxfUuf4FlS/D26aoriZzdzM0kLOMLq
         hIpZgKcLXDwwgf9rqcRDE5C68WH45Nzr5xchIIECs8/4QL8284IRb9FR0zfEF+yGY473
         DhZNzPwfq6EM5wGOPi/L7GvR6Q36+NW1KHS4uhqNAkD6KpzaPr5t354cEGzZzKLmCtns
         JxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681195255; x=1683787255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9E3QUvAQUl3o+y94u92fiPsX7FeUqAvp4hYEOQvbNI=;
        b=PCNNiTawAZDvsMeM1Gh9swDoclZIoEnJp8zcROClJd4hOiz1GCGmcbq+4P6xCBzgla
         Abfjj45tdLvo/uLsSzwFWs3ooaKZ5EJSXyChJDo4WzJJyMra5LCijyNkbhR4rrjfyGub
         7sOSF4GrM2icctxj6LV1flR+BDKpqNj0zchVvqrWoYX3fC9o3NiRcR0IGSK/jfkca/SG
         uN36J8VZ75/2KV9HMsVzz01/ooy2Y6B1rc7JyDDrRurLQf586dxexxYmrMv3zNER1oiA
         Jqin4ATxft/tdbs5/RTHRK50euDk+pNToVHc3n+UhoWjbsFTHoud+BNNn+0VnYcyni0L
         SGcw==
X-Gm-Message-State: AAQBX9eKHPgZT6v1fd9f+kMyJM4gRqC02BndXnk3iiispWdJtfbAy9Vh
        PazyYCRKtM3jsG4iSkF2g7Gydg==
X-Google-Smtp-Source: AKy350bAlb+cDbia8QKfCMxPUZQ30JZAbWebYQ1BSofjHaVQ6jNlpGiW52J3dB+BLo3Ik/HcvQl1ug==
X-Received: by 2002:a62:3802:0:b0:633:5c46:5a68 with SMTP id f2-20020a623802000000b006335c465a68mr9465898pfa.10.1681195254722;
        Mon, 10 Apr 2023 23:40:54 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id d21-20020aa78155000000b0062e0010c6c1sm8836856pfn.164.2023.04.10.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 23:40:53 -0700 (PDT)
Date:   Tue, 11 Apr 2023 12:10:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [v2] cpufreq: sparc: Fix exception handling in two functions
Message-ID: <20230411064051.qyioheeoectj2lv3@vireshk-i7>
References: <b3cce5b3-2e68-180c-c293-74d4d9d4032c@web.de>
 <2d125f3e-4de6-cfb4-2d21-6e1ec04bc412@web.de>
 <20230403033529.x6n3ihhkypwizq3b@vireshk-i7>
 <39342542-9353-6a7b-0aa9-f9c294b158cb@web.de>
 <20230403230432.xeubpa3cc2gt4mw3@vireshk-i7>
 <68b1988b-987f-fa2b-111e-b1b42f9767ab@web.de>
 <20230409235511.7xxqdxsqtflrhifk@vireshk-i7>
 <f9f40c8a-a392-27e3-b19c-c8985a163159@web.de>
 <20230411033048.zwsijlyiksjcmgcc@vireshk-i7>
 <e53bfa4f-c4b0-ee80-a64c-be8e9af76230@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e53bfa4f-c4b0-ee80-a64c-be8e9af76230@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11-04-23, 08:15, Markus Elfring wrote:
> >> The setting of the variables “cpufreq_us…_driver” influences the need
> >> to reset them to null pointers for the desired exception handling,
> >> doesn't it?
> >
> > This is what all should be done for these drivers I guess. There is no
> > points doing the dance of {de}allocating resources unnecessarily.
> 
> Are you going to integrate your source code adjustment according to
> reduced dynamic memory allocation?

You can prepare and send a patch for this if you want, else I will do
it.

-- 
viresh
