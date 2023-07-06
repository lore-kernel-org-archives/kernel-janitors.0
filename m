Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44841EB64D9
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jul 2023 12:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbjGFMiU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jul 2023 08:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGFMiT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jul 2023 08:38:19 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0425E72
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Jul 2023 05:38:18 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so9527751fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jul 2023 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688647097; x=1691239097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
        b=jykPrMUJAY4xBJwbGQgO7s7ViTgCEdjaK8p8r2Hl31f/ME81nnrE/qSUvaYDs3GbCr
         INRyrEdsVpysqBZs5wiJiqbcqwckhRRknydKNYKrnZEcWk1h3fMMLHHsIeI6LzztFReE
         wp3ExGqP7Rv7GbrrYqG8yUTxrSw2fbJQ5BXkzXUmJwDbG839K+prDf3VKbcHmNZ0rCkS
         S/2XxhGghDnDJT/J+XpXk4ChuISHxazpOGEganlOb+rViR2g8kLLCCZVzTIOe8zbI45w
         AMSdB6z/sVGEyN05Mc4nxMAj21opnQYAzzlKRX0lAhov6DNcH7i7yhyNQuejDj15w8UH
         tz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647097; x=1691239097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
        b=k4rlphhAIcmVQ1i7MSTgzvMPrasi9aoa/nuu7CPlHwQYkss7pX+6eIFsqSod2KLeqx
         sJzSYqqRVLQPZTIMDRmVynodl6pYmG5cUxyu6zgHdftH74UtJ01SsulxSedama7PdW4w
         vUmex2TusCjB8xtta21Z2Bt4LJrQvJKrg+MgR3C5nrAlLYL7dlkRcvmVqjJLQZTo5B5Q
         +sCV08oTvFg/RSIRBvUy4dxNcRINm4Pp3rvRvaUbn3b9IQaOipKlz4YlbdZI5ADQSjrL
         OOiNBCIECRYT0AVcirWBD8m0v79VdPABPvjDLOTLDuCGEK8wwOU4nuO/6PuYU1HAYeoS
         I/6A==
X-Gm-Message-State: ABy/qLYVAEkUdYB0csoSuzWRKf3crH8CUp+wzr51Uj5vuAAHlboAeehh
        6O0AWOMXKm/kG+2yHo1vTyYuXw==
X-Google-Smtp-Source: APBJJlF7wnRSHF3/ATn3A9Kl9VBqBuZ1BW8ExsnFLaT6PZ0SXIHbr52DrsYzDXswnOwKrpEZC0n+4g==
X-Received: by 2002:a19:434a:0:b0:4f8:6833:b13c with SMTP id m10-20020a19434a000000b004f86833b13cmr1275916lfj.14.1688647096863;
        Thu, 06 Jul 2023 05:38:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l25-20020a1ced19000000b003faef96ee78sm5006920wmh.33.2023.07.06.05.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:38:15 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:38:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix an error pointer vs NULL bug
Message-ID: <534fcba2-2303-4e53-aafd-9668413fbf9d@kadam.mountain>
References: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
 <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 06, 2023 at 08:21:35AM +0200, Christian König wrote:
> Am 06.07.23 um 07:52 schrieb Dan Carpenter:
> > The __dma_fence_unwrap_merge() function is supposed to return NULL on
> > error.  But the dma_fence_allocate_private_stub() returns error pointers
> > so check for that and covert the error pointers to NULL returns.
> > Otherwise, the callers do not expect error pointers and it leads to an
> > Oops.
> 
> Oh, good catch.
> 
> But I think we should probably change dma_fence_allocate_private_stub()
> instead, that this function returns an ERR_PTR doesn't seem to make to much
> sense.

Sure, I've sent v2.

regards,
dan carpenter

