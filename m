Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA504C04A68
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Jul 2022 18:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbiG1So2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiG1So1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jul 2022 14:44:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B60ED75385
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659033865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b7dTmgPtZXQqvc5c6Q14IRmW3vkBPMQYrjrYTcj93lc=;
        b=DaEsJHUgpr2AbCrwCfSLFHEf1pzoC8o/R1cAM2YU6SvoCwQ5VtMR/QnOUH0r25fIpe9GGg
        9NJmiRQbLMg8W3XnciQ1BbsNCdoTtzqkAQX4Wi3wo+eCixjB67/CBX/CxdDzs4ovE1kgoi
        amu9g35/mCjcMxu2JgRr1746Lx+C6FE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-en1TJjYJPZuerlNvQ_Lwow-1; Thu, 28 Jul 2022 14:44:24 -0400
X-MC-Unique: en1TJjYJPZuerlNvQ_Lwow-1
Received: by mail-ed1-f70.google.com with SMTP id c9-20020a05640227c900b0043ad14b1fa0so1620683ede.1
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 11:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b7dTmgPtZXQqvc5c6Q14IRmW3vkBPMQYrjrYTcj93lc=;
        b=UYaqx66XAOwoj3CRef6AAqAD/OYIjHjXpRcVSPDIDgEe8ULVzsTSi78G7ra/CPQ6nz
         vhS8hc/7peEXDY8qRY3+e0y4gy8pN7UfCJooQ/E3Es3gdtmTptw7UIImuOcs6PcGBKKm
         G4lMXnQI9c+b4s87rYpRIgt16RzRcwFwySyBGlRwzipDUbX6I08AvlNFsI2B0CVx1imD
         jyTkCKBTXqURCJeflk6QsXNwZi/Xlieh/yazGSGmh4R522hdoV/A3L4sZxhGseDL6XVN
         AH4OYi7TG9p07+hmCMrJguLpfrYXPN0O3usGMDrCoRzKmCFgprvOMHh6MEPK+CBjoGWm
         nK9w==
X-Gm-Message-State: AJIora/4QwQG8pt/CO+LqwQyDDTHrfCV6VhqgkATtRrrOwStmKSXbg36
        62VsuG0FS6Rnt7gmXbJ5QaBY6XtXEiT/oQJUNB8jBHLxvZ0xq9/ZidzQlautAN1wuS0zs3zuq7O
        pajnqVIJg+WCoUKqVjOFKcTFDLBDP
X-Received: by 2002:a17:906:8a5a:b0:72b:6b60:2d9f with SMTP id gx26-20020a1709068a5a00b0072b6b602d9fmr211645ejc.324.1659033863153;
        Thu, 28 Jul 2022 11:44:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7GkaGt5t7PvxdshXwGC3B18zEaXdGQOwh9j2wKDM2PAka5sH7b4qypH8pjYUty+XOcMCgcA==
X-Received: by 2002:a17:906:8a5a:b0:72b:6b60:2d9f with SMTP id gx26-20020a1709068a5a00b0072b6b602d9fmr211626ejc.324.1659033862788;
        Thu, 28 Jul 2022 11:44:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id mr42-20020a17090782aa00b00722fc0779e3sm679725ejc.85.2022.07.28.11.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:44:22 -0700 (PDT)
Message-ID: <e365793f-02ff-9746-c03d-f2ed7127817a@redhat.com>
Date:   Thu, 28 Jul 2022 20:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Platform: OLPC: uninitialized data in debugfs write
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andres Salomon <dilinger@queued.net>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YthIKn+TfZSZMEcM@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YthIKn+TfZSZMEcM@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 7/20/22 20:23, Dan Carpenter wrote:
> The call to:
> 
> 	size = simple_write_to_buffer(cmdbuf, sizeof(cmdbuf), ppos, buf, size);
> 
> will succeed if at least one byte is written to the "cmdbuf" buffer.
> The "*ppos" value controls which byte is written.  Another problem is
> that this code does not check for errors so it's possible for the entire
> buffer to be unintialized.
> 
> Inintialize the struct to zero to prevent reading uninitialized stack
> data.
> 
> Debugfs is normally only writable by root so the impact of this bug is
> very minimal.
> 
> Fixes: 6cca83d498bd ("Platform: OLPC: move debugfs support from x86 EC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> The ec_dbgfs_cmd_write() function is not great.  We could copy the data
> outside the lock for example.  But that's outside the scope of this
> patch.
> 
>  drivers/platform/olpc/olpc-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
> index 4ff5c3a12991..921520475ff6 100644
> --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -264,7 +264,7 @@ static ssize_t ec_dbgfs_cmd_write(struct file *file, const char __user *buf,
>  	int i, m;
>  	unsigned char ec_cmd[EC_MAX_CMD_ARGS];
>  	unsigned int ec_cmd_int[EC_MAX_CMD_ARGS];
> -	char cmdbuf[64];
> +	char cmdbuf[64] = "";
>  	int ec_cmd_bytes;
>  
>  	mutex_lock(&ec_dbgfs_lock);

