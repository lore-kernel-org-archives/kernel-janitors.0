Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A68C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 14:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbiKOOPd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 09:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiKOOPc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 09:15:32 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09F7B67
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:15:30 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id w10so9858864qvr.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmCortd4X07eaHsaVrw2gTAngPKvClGjD0Ma0coZZ+w=;
        b=hA81zEgYkoCvvLzGBWtKslpJBNtJsrMzfgzLIB4SYaQ+CuNw4I540lOLF9vLU/rHmV
         lB5oRXcJqlaWg/2HiQ7eljuCpiIfY1S7IhQAOV8DENMUqb6tUlo7o5GHynDOn7/fO+Hk
         QmiRRcZh6o101+sWJZHp8tAg3LE+IQLQYhxrm1zMrkYkFp6Z8CsQ1FVc3N1LLMytYdgi
         m/lIS//b5dErFBmHtvPyHxrFho0dopwHN8fwjQKvi3xfrDWRWQinIoE4z50mO+9KHQ9U
         zZ2fGAHNLHXfTiyJ5+V90TybLmoVJSfqf9n2oG6gf+Cn3Vw9Y+vcncrUfb7mXEixnZKK
         xh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmCortd4X07eaHsaVrw2gTAngPKvClGjD0Ma0coZZ+w=;
        b=V8M5GY67bvdOdHix/42L94R2ZZshDXkSInp4h9sZhlw8C4AjWXOV2Vopv5ycRgxYCf
         PFCVlZgYus6BO6aBfBIrOa22sNml8j24nwt0jDFDKCUaemZV4WAUdWCT3G6FpB5K7tEh
         JsjC7f5uKNIAh8e49PtktdYC1HrDhyboeo0jqGVg+j6RsAH3KQzIDdzaMg345vIQsYKa
         ir6lPFHtjgZBaeWDUeL1j7VX30AGulv8vNr9Zl2Pe4ZYgzO/g4d1EY8Dw0TFaD4QQDTw
         rB/h8HzLtHQIIK4JOWJ67QHJAPcCl0JDv82jcWmn4Mk233ym1PiiPDmEXC1w9Vk2goLT
         UXNg==
X-Gm-Message-State: ANoB5pk7CdSKz3uMaeh20g8FSGb1j24unT+vccnv+S9Ku4O7YpEGgaYX
        pkAKPPJf/J0Kg3eduxgxiw==
X-Google-Smtp-Source: AA0mqf4VpZRSL5eJUMiINzc/4a/zmp7QAJt7MIpW3sNl5VEIR1VsJrqZbd99YXHOCyF7b6C984NfDQ==
X-Received: by 2002:a0c:f98b:0:b0:4bb:93b8:ef1c with SMTP id t11-20020a0cf98b000000b004bb93b8ef1cmr16908333qvn.103.1668521729834;
        Tue, 15 Nov 2022 06:15:29 -0800 (PST)
Received: from serve.minyard.net ([47.184.147.45])
        by smtp.gmail.com with ESMTPSA id x81-20020a376354000000b006cfc9846594sm8031820qkb.93.2022.11.15.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:15:29 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2bd8:1330:9bfe:f1cd])
        by serve.minyard.net (Postfix) with ESMTPSA id D9A7C180044;
        Tue, 15 Nov 2022 14:15:27 +0000 (UTC)
Date:   Tue, 15 Nov 2022 08:15:26 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: fix use after free in _ipmi_destroy_user()
Message-ID: <Y3Oe6KcXabXlwdbx@minyard.net>
Reply-To: minyard@acm.org
References: <Y3M8xa1drZv4CToE@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3M8xa1drZv4CToE@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 15, 2022 at 04:17:43PM +0300, Dan Carpenter wrote:
> The intf_free() function frees the "intf" pointer so we cannot
> dereference it again on the next line.

Thanks.  I will request a backport for 5.5 and later.

> 
> Fixes: cbb79863fc31 ("ipmi: Don't allow device module unload when in use")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index f6b8ca6df9b5..186f1fee7534 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1330,6 +1330,7 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
>  	unsigned long    flags;
>  	struct cmd_rcvr  *rcvr;
>  	struct cmd_rcvr  *rcvrs = NULL;
> +	struct module    *owner;
>  
>  	if (!acquire_ipmi_user(user, &i)) {
>  		/*
> @@ -1392,8 +1393,9 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
>  		kfree(rcvr);
>  	}
>  
> +	owner = intf->owner;
>  	kref_put(&intf->refcount, intf_free);
> -	module_put(intf->owner);
> +	module_put(owner);
>  }
>  
>  int ipmi_destroy_user(struct ipmi_user *user)
> -- 
> 2.35.1
> 
