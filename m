Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44D9C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Mar 2022 08:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiCCIix (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiCCIiw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Mar 2022 03:38:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E6B8148926
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Mar 2022 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646296687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
        b=X6hNB79T/AP8VlAWg15d9IveEEkZKNhsAeiO9I6craiqet1W8RrTPyfV5gZ9nJKXHgQPPl
        TBRWekikCjQwAjodNsYphOZlFRzCV6Pcl0HNESx98t5F2G5sXeOjhzKAv006v4Z+aEwxhT
        gNd3ewXtXz1jVrkxqXHaIePQQAm/jbQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-yHYRTj_yMYG5A_8iGP_7ag-1; Thu, 03 Mar 2022 03:38:05 -0500
X-MC-Unique: yHYRTj_yMYG5A_8iGP_7ag-1
Received: by mail-wr1-f72.google.com with SMTP id a16-20020adff7d0000000b001f0473a6b25so1456641wrq.1
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Mar 2022 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
        b=c20Xj01k8dRjCjTW0dp2geYtkUU2obdaOQFsKRDlf48+ApyQ94kl1VkNrVEi1UOPHe
         cfgJzTnTmw0jsveh4ExbgyN/lBK6F3d0i8l/dF2oApvThu2LrbmReLob6BLZSUA/NKyt
         M86f04LlRFYUvqB6/ZXpt6D6GmkMFpkilVBS1mJFIHnssbaL9D8wf5kevWMoTl1ctxAR
         mB5dE3pbltVAnassqyFrYp/cihecxRqkdEsGIxovIxFGe9l+87ehjqFzB3QKu63hcRZV
         KZFL8v0Jg6CL8jRIa9svc+CJC/b/OMaKrWLd6qbN36fEHgiNUi88bzwZ/+RjOV6mFmuV
         FydA==
X-Gm-Message-State: AOAM530VBi0WepEQEw7rfLbEeRpppUHjR2YRi48PcChPTljLql9VJdf2
        w/g9F+1DZodQ5kDItkJ82HIEMycC6GQ7XDGirzjrw6zjHePhfyboc4X5taNDFIxselzp0d8nkAg
        M5C2JUZVa0qOwi5b6GwMTLwsp8y7W
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id 4-20020a5d47a4000000b001f046e419bcmr4066497wrb.601.1646296684784;
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/AOr9kcfSCL6dEmzp2KPAxB6X5N/u/fMMDoNJCyjfqcaaRT42zcBqSgBSliGMWF1kL7ADpA==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id 4-20020a5d47a4000000b001f046e419bcmr4066475wrb.601.1646296684567;
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b001f04b96f9a9sm1338936wrd.42.2022.03.03.00.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Message-ID: <8cef7451-ac6a-9ca5-b521-1eec53d30880@redhat.com>
Date:   Thu, 3 Mar 2022 09:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
 <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
In-Reply-To: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/2/22 19:29, Javier Martinez Canillas wrote:
> Hello Colin,
> 
> Thanks for the patch.
> 
> On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>>
>> Pointer mode is being assigned a value that is never read, it is
>> being re-assigned later with a new value. The initialization is
>> redundant and can be removed.
>>
> 
> Indeed.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc-next (with fixed drm/ssd130x subject prefix).

Thanks!
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

