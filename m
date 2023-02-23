Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D69C636D7
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 07:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjBWHAz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 02:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjBWHAx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 02:00:53 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A04A49886
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 23:00:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id ec43so38444111edb.8
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 23:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6V1kgFkz+2nmuQRL3q8czZyEspOUTUcUgYJRLDxG5Jo=;
        b=h8jtJEetutWZ+CFqdIFBLdMLgBt/HsmmoreRRsSiEFyjsfNAQ+2h3Jogr0VJZDiz71
         SdBLFosZ61lDdEzPyUFgJOjv+HB1IMwTFn+FZT2WefFyvUwp1m9CtMVaObnZEZ6lV6PG
         LP2oAkOPgSJcAYaWIdt3HSWCrcp6qUdrcBYgl9O4QwdWHmsv2UlDp6hinz2OaEmrAqiR
         AAUrQEoBC4TzbfUblLFrgEoVvp8DhnZjXhG0ZCqQJVByWtu8OkT7CvLxxPjbdxCwmnZ5
         Tfedo+dmciYzcX9EmSJ70cd0IbGv1hkKcvxJnP3g3+k0M8qjhKkiRz2X5fAs9q3iNzI0
         L9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6V1kgFkz+2nmuQRL3q8czZyEspOUTUcUgYJRLDxG5Jo=;
        b=y6HdAtlYFf+o5nTwUmdNojLr7RytGiaaAkrLRzdIBRJB9JBdSR+8GUtZSp5HYpfww5
         2UV5HeotVpZFORydxl3ZZ02ll9TIRcYVft/cVlr9S/llD1zlR7++LMvJu7uOzQgvzbP2
         YENJU4TgbdIjGHu3Ag2OAvEhUgWkq5HuzNtF/Nv9X3M+3QbOjf/bnzPLrfUF4bVLI8ep
         Q3BVIH4slHaufVuuGGeQMN8gdAVCcYXZz4YFbtjwZFWNmHVr8j+3kAth/W3sBZoYvcHm
         oYgmmfNRxa2qLDGthoN0v08/SqOICaROkuFK5s0cSi/347wiN8yVtrUyF4J3/u3+cHrH
         gN1A==
X-Gm-Message-State: AO0yUKV7guACWvJ2T7O0CwE6UqX2cq0P8qi9ffi0JTQSHXBAnysQsoUj
        ResI4qMtHOOaBrCN55/eiW1JPBgbMd4=
X-Google-Smtp-Source: AK7set8ZuKaSbrQBJ3a8M+xYxT2z6oxVHpwoR5gtoCZW2lx53fTy63X3CNCbD1dMJt4V9SMvFl3Phg==
X-Received: by 2002:a17:906:7394:b0:8b1:2614:dea6 with SMTP id f20-20020a170906739400b008b12614dea6mr17645055ejl.1.1677135651535;
        Wed, 22 Feb 2023 23:00:51 -0800 (PST)
Received: from [192.168.0.100] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id me19-20020a170906aed300b008b17662e1f7sm8764897ejb.53.2023.02.22.23.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 23:00:50 -0800 (PST)
Message-ID: <0893bcc8-a06d-1f99-8887-3731b8e5a9f8@gmail.com>
Date:   Thu, 23 Feb 2023 08:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
To:     Dan Carpenter <error27@gmail.com>,
        Phillip Potter <phil@philpotter.co.uk>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <drv@mailo.com>,
        Charlie Sands <sandsch@northvilleschools.net>,
        Mahak Gupta <mahak_g@cs.iitr.ac.in>,
        Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <Y/YfzZeFCAPiZ6RV@kili>
Content-Language: en-US
From:   Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/22/23 14:59, Dan Carpenter wrote:
> Here the code is testing to see if skb->len meets a minimum size
> requirement.  However if skb->len is very small then the ETH_HLEN
> subtraction will result in a negative which is then type promoted
> to an unsigned int and the condition will be true.
> 
> Generally, when you have an untrusted variable like skb->len, you
> should move all the math to the other side of the comparison.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  This is basic algebra of moving parts of the
> equation from one side to the other and I am surprisingly bad at
> something that I was supposed to have learned in 9th grade.
> 
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..f49e32c33372 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   		/*------------------------------------------------*/
>   		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
>   
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
>   			return -1;
>   
>   		switch (method) {

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
