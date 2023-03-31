Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C28BC6FD18
	for <kernel-janitors@archiver.kernel.org>; Fri, 31 Mar 2023 10:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCaKfy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 31 Mar 2023 06:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCaKfx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 31 Mar 2023 06:35:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940DF6585
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Mar 2023 03:35:52 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso15027841wms.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Mar 2023 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680258951;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRS1yZDa445pmkdT/k2NYaIdVgXbgFhXBt04cKMFpkg=;
        b=OQjaL1iX0Axwlw10yT8cA9vKghsYHSnjieBx3C6xen+ND+9cJIRogQmbQMwgmSthr0
         lisv9qoe+Qr+RbmIkQ2RhahqULah4tnS7RXbcCGMB1e5FdfpPkKsHrGVKMW2eqoMfBkg
         BhkC8tdN6nrORFaiVPsAxfKTWxWSWotXaABkyeyJ46MN6Ub5EfIycwveZFFl118nXk3b
         mxQRfJReBw3oBFVkkfApH3cRNSv8MIkBUYaFAxKNfHigGV98cuQbqOItaiCWGUr1UfSs
         CncSxP6HIZh/8uhcvfs9GbJgnpLlG50je6t8EUWZ0Zn1X1SM2gAQnqDlbYDfUMtI2IQ1
         QEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680258951;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRS1yZDa445pmkdT/k2NYaIdVgXbgFhXBt04cKMFpkg=;
        b=3vEmom2aR71V5MqyTb0TgyKcPdjuqDAKQNiWE3vb3YazC1GvSET2xU6S65NHm82SS3
         Go6DagOizIOxDmOcjf0TutH1BGnrpoq7o1FfMPVcb30oS99OMpPf4bB3W4yMeM4wEbCJ
         deR2QryMUhRIM44GP9FQg/2He8rO8EOjEpCMrX5gpmKKoaRyQDzP5eXj5lsvgr109WPm
         +29e3tJXw+JQmgkMuOuZ9bwxOXh6q/lFSJExndr4HboHtVmU9BFjUSbi40LvGEfj2geL
         zfZz2dlv0Ph5MQ6bzxSE6TF3TLBoULoMlryFsi2WnVXQg8Mb04Ru2vj9OM8Nf9++xkkA
         qrXQ==
X-Gm-Message-State: AO0yUKXI/Th6tnxmMmhSFgkmvBS72UNJWiMGUfWjyP2gbvWw7yRloK+u
        dG3ERwi6q+4oS62PFzA2F0z/CbLWSCQ=
X-Google-Smtp-Source: AK7set9Z6MTEdY1tvO1z3tuj8A3Au6bEMTh3DNsVJhMotzvntPOCgE1IZrr/hjfqdUoXc6FjjLWdvA==
X-Received: by 2002:a7b:cd0b:0:b0:3ed:2f1a:883c with SMTP id f11-20020a7bcd0b000000b003ed2f1a883cmr21929899wmj.14.1680258951014;
        Fri, 31 Mar 2023 03:35:51 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm9351452wmb.28.2023.03.31.03.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:35:48 -0700 (PDT)
Subject: Re: [bug report] sfc: add functions to insert encap matches into the
 MAE
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
References: <e7b69fbb-370d-4b3d-a2a0-3762700fd175@kili.mountain>
From:   Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <f155a6f7-0f8e-3c2b-0d0b-1822422f8d20@gmail.com>
Date:   Fri, 31 Mar 2023 11:35:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e7b69fbb-370d-4b3d-a2a0-3762700fd175@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 31/03/2023 07:54, Dan Carpenter wrote:
> Hello Edward Cree,
> 
> The patch 2245eb0086d8: "sfc: add functions to insert encap matches
> into the MAE" from Mar 27, 2023, leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/ethernet/sfc/mae.c:1002 efx_mae_register_encap_match()
> 	warn: this cast is a no-op
...
>     998         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_ETHER_TYPE_BE_MASK,
>     999                                 ~(__be16)0);
> 
> But for these ones the u16 is type promoted to int and so ~0 is negative
> one and will be sign extended.  The cast does nothing.
> 
>     1000         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE,
>     1001                                 encap->udp_dport);
> --> 1002         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE_MASK,
>     1003                                 ~(__be16)0);
> 
> Same.

The casts are there for Sparse reasons (endianness), rather than
 particularly caring about the size (although that conveniently
 documents to the reader the width of the MCDI field).
We could instead use (__be16)~0 but I believe some versions of
 sparse will warn on this (I forget the details).

To the compiler (i.e. outside of sparse) the cast is indeed a
 no-op, but this is fine.  I would consider this Smatch warning
 a false positive; lmk if you disagree.

-ed
