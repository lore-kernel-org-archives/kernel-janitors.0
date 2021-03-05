Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D888DC433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 10:11:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A698E64F5B
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 10:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhCEKK7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:10:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:49536 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCEKKy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 05:10:54 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI7Q5-0005wG-79
        for kernel-janitors@vger.kernel.org; Fri, 05 Mar 2021 10:10:53 +0000
Received: by mail-wm1-f69.google.com with SMTP id n25so572822wmk.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dc1X7XD8sIPk/f9CtULIHpjeF451ceoNr0To1nwZ7Rk=;
        b=derJm2cno3SFP+sR1a6lZB+UNEgTQbYd35FMIaomm3mpws6RnZX9t/r/sF/gcdlVXc
         Wa6JgnhGGwB3U9YCvy2CHCNk8WWrwbaOftkX6ccZogMzAr5omnzT68xa6YCXqb/kAN6F
         drQ64i1ztmUOGez5wIEeZmq1dw5uwIfaihpkdqUymomXVCS8zAmtW3MniMQy2b4cYW/q
         YgPeCsOzoN/Jr9Apt7gZj2KFJwwdDz65vUuVUc+GcFl3hi236pSsd3xR4eSZqEgdnTdg
         iCPOZy3dIdDXQF2+J9601BHBQbsbKNpfcHe/AflkcPA8oN7ZChqI3chK7f5jOrJoX6RX
         DTOw==
X-Gm-Message-State: AOAM532XlFfuqPHvAaLsl2qJThpM64T+TaO32zTeSZMed0DYupYsFIQw
        ktyNBpzG+ilAqGAQF5mV4v8ajDNYmQD54mvHpmny6ZKHgVAVEzXSB915m2b9Ub0vOZsMtdWq5eN
        wgK3B6pwRRnegYZF0Ue0HwrsEjF9/8tm2mKwEaI4jbUpTVg==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029188wmb.155.1614939053018;
        Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJTFUqM4RWURTdZMPFSaLPGO6A85/2AN+p8IFVvZ8Jnf1yZlTvGqR63lFecZvTKp5HVZ2Rlg==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029170wmb.155.1614939052859;
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id o14sm3527991wri.48.2021.03.05.02.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Subject: Re: [PATCH -next] USB: gadget: udc: s3c2410_udc: fix return value
 check in s3c2410_udc_probe()
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210305034927.3232386-1-weiyongjun1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3cf7abbf-0dc8-495f-4737-2d84bbea8158@canonical.com>
Date:   Fri, 5 Mar 2021 11:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305034927.3232386-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05/03/2021 04:49, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> 
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
