Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CF2C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C56CE61263
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhFANn2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 09:43:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44777 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhFANn1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 09:43:27 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lo4eP-0005yE-QH
        for kernel-janitors@vger.kernel.org; Tue, 01 Jun 2021 13:41:45 +0000
Received: by mail-ed1-f72.google.com with SMTP id v18-20020a0564023492b029038d5ad7c8a8so7867590edc.11
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 06:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8D2cU9WIH4f91nUainalgp07qa8uXynan7ov41ItFDk=;
        b=TxnJuLVs9nbo8T4KfO5+gjlP3pY4WtCkgfwlL+tNCZ08yoj0niupFB62VB2KnHe4Tw
         Wz4CKHNVHEdFzpZIj9j+8nXYRP8oUTJVXwxkhBPa4GHxacWONPaWLsBWnttQFuNp8cGy
         6Y2ufvTyoodja1dl05wpo9I6k4CvWWYf0+TS6pIdjUur/aCl4E6WDZOjQ6DOyZpqIJTF
         urC/jmCYG1rZOz4Bioj09xTgz3bjEcWAS8qzH8zD5SAYxkOrVgvqeCfYJ9DeXVk8SnwN
         MShwedVGA2kdzDVdBNenrS6i3mIeN/EF/R2wADfZKmqyLanpMVEvuUr1su+oJAN2cPMw
         CCuQ==
X-Gm-Message-State: AOAM533qEifnSgjIHAZi6I7e30KE/PHnGcOVV5lsDeQMqDeQxKT24D8b
        yrEcKxeORgzbNeRN6vlS0RUod6eEzZYZcUpJ9Q+kS+99nVOvIasOFdDav/5HTp7G8AwbHm2Iarh
        jF4iJn1yXCx8L80US5IqLTxeDt6VALoR8dup8ZLitMFgCuw==
X-Received: by 2002:a17:906:b2d6:: with SMTP id cf22mr15717473ejb.29.1622554905367;
        Tue, 01 Jun 2021 06:41:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx9+gdpxkVKY3CEoYk/875InpWjxEeImRktiHYPYvqmpR6IVMcbrWVE/3CTLN0JX3pwP5fLg==
X-Received: by 2002:a17:906:b2d6:: with SMTP id cf22mr15717452ejb.29.1622554905191;
        Tue, 01 Jun 2021 06:41:45 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id dk9sm7224352ejb.91.2021.06.01.06.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 06:41:44 -0700 (PDT)
Subject: Re: [PATCH v2] NFC: microread: Remove redundant assignment to
 variable err
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YLY3pSMrpbQxIJxO@fedora>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e58ddaa5-1bc1-dba9-a038-06022e65da59@canonical.com>
Date:   Tue, 1 Jun 2021 15:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLY3pSMrpbQxIJxO@fedora>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/06/2021 15:35, Nigel Christian wrote:
> In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead code
> warning. The error code assigned to variable err is already passed
> to async_cb(). The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/nfc/microread/microread.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
> index 8d3988457c58..b1d3975e8a81 100644
> --- a/drivers/nfc/microread/microread.c
> +++ b/drivers/nfc/microread/microread.c
> @@ -364,7 +364,6 @@ static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
>  	case MICROREAD_CB_TYPE_READER_ALL:
>  		if (err == 0) {
>  			if (skb->len == 0) {
> -				err = -EPROTO;
>  				kfree_skb(skb);
>  				info->async_cb(info->async_cb_context, NULL,
>  					       -EPROTO);
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
