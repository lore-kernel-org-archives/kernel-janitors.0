Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FBCEE14A9
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Sep 2023 22:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242351AbjIFW6h (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Sep 2023 18:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjIFW6g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Sep 2023 18:58:36 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54EC19AA
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Sep 2023 15:58:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31c7912416bso427332f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Sep 2023 15:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694041111; x=1694645911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMQvtql8Sp/h+TnATh538oxsK26N18AkCrtAS+Vcyl8=;
        b=DiqPUdqnrFXt6peIbT0UmINrhWNfiDQvXATOsSPEFFt87qtityY1bOVvY5XL/vZd3z
         0Ij1DH0RWXQg5b19X6BPsI/opGbsJeeYKE4brvhMGlek7GkoEuYT+JhHW45OCRW5SWs3
         2cfmcTEjqDWRdHC+RUXBaF/NXkuOrOU6XM1LjHlo+FDQXeoiO6V/VMOiCNAD76RpF9uq
         4mEDRpgs/AeW/IPmXwQk91JL2nzFUYeHyH+b9wDGBwiHXBlxy9z36Mu2N/IcF/zTC0RO
         sPnQDw6FfXRdCbGVoJGcFL+323UUOagNtE9vQtzD+tf4H65Ko0NcaUutuocbOc14SYSO
         3Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694041111; x=1694645911;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMQvtql8Sp/h+TnATh538oxsK26N18AkCrtAS+Vcyl8=;
        b=KquieuiUr5AS3fkkkVinc9AYt9Y7PmAb5ci/tEMKb+N7g3t+Kik7S3kONTKCZwJbXC
         uBoBP7kWla68MadYNrifatdaEC6bWP2jmFR3YYgJqhR2ADmZrbjo8Z01oX63RHGvLya0
         z1If3dJ+phOfgv01EXn6hy7ezLwglRrWRh7EKyBZyfJdSkv/da5j+Mby2w+J1I5fyD7H
         q5iS84QuFaFwOUPtpNNgjfgnHH0pnkIeBJj7M4xU7OvJ7FzEaquAkZTyuSsYBzOsknKJ
         kwJgeO62eKqswDtYbaCPZ6XNybST3UGSPYePHvZx3IqV79eLw9Y5AnTFZQGuaB6RbDrG
         onqg==
X-Gm-Message-State: AOJu0YxbEj55l24DHuM1f+wM5drx4+T4h/1iyLIvNyWGMEaky7JVcG+H
        o9uqZX9A67CSc2MViRHIK+P/WNOgLJI=
X-Google-Smtp-Source: AGHT+IF0+sv85gn8s4H64/6BXcMTwKOgA9ITCsamd7eUR3Yl6UWIS8Sdu9hxQKSDXKBprum/5x9o2w==
X-Received: by 2002:a5d:6142:0:b0:315:a1d5:a3d5 with SMTP id y2-20020a5d6142000000b00315a1d5a3d5mr3732373wrt.22.1694041110845;
        Wed, 06 Sep 2023 15:58:30 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4844000000b0031ad5470f89sm21593929wrs.18.2023.09.06.15.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 15:58:30 -0700 (PDT)
Subject: Re: [bug report] sfc: functions to register for conntrack zone
 offload
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-net-drivers@amd.com, kernel-janitors@vger.kernel.org
References: <ede55fab-c74d-4594-9c71-0165b9460d22@moroto.mountain>
From:   Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <d80bf2ed-e91e-1f8b-fb38-e164ec7b5704@gmail.com>
Date:   Wed, 6 Sep 2023 23:58:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ede55fab-c74d-4594-9c71-0165b9460d22@moroto.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/09/2023 12:55, Dan Carpenter wrote:
> rhashtable_lookup_get_insert_fast() can return NULL or error pointers.

So it can!  Thanks for catching this.
Looking at the rest of the driver, it appears quite a few other calls
 to this function also assume it returns only valid ptr or NULL.
I'll audit them all and produce a patch, with your Reported-by if
 that's okay?

-ed
