Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6128EC4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 02:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47CD861056
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 02:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhHJCFy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 Aug 2021 22:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhHJCFy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Aug 2021 22:05:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C971C0613D3
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Aug 2021 19:05:33 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so3007678pjb.3
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Aug 2021 19:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4obz9WkqAEaS3SU/Ft8ZVbZx29A5UvHIZHpNuPkmvSk=;
        b=kZGou/+ar6VkGad2l0SxaqeFt1SKZRIzP9scQKzNs4UWQkTcp9RFq2j7DzVxV5KgyK
         5TlRRQZiF84syxutswoRu9al2wgA6RIdYNPOBxcnTDzmobwr5KimozZFSDPrq4diHXeX
         ipKAui0LFbQLJxIpk5KS/wFGdunbQWFii1rXT4wS1I8XQZsesNjv4HPv3iAD3ea+upBS
         JSg6AlDBdu61OSsdQuXUhveKPb1AmEK5XcKA36O+/DwyPCvucbwUCa4b3wIe+ypj3GQo
         a62adTZ9xmyyPOvuM6rVkvObTb2FdTjAK6ijP2kom0N55yhlEBTjNlqSbSS+QSc+1saE
         805Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4obz9WkqAEaS3SU/Ft8ZVbZx29A5UvHIZHpNuPkmvSk=;
        b=NgNbsb0zi63bgZ9zBdxTblZw8ETTryeSr1JsYSwEPcDn5BIlwEdlDmpcnOJW1cc/aK
         geNGcx8gABicD3bjRHqjLIVMmwYqcAQd5tEXNUBWc9nrxDO/Dh3a4enCxZqiaNAdt/hE
         72kAOWiv9npQNqekTpLdfN2Alo4mEV2ufRw0KErFt/iOwjx9sL1/BrA6m2kq3CuoOouj
         WnTs0S1hPh8DN/3355VoN4xCVmg0MT840Y4BRhwAbacesI7JioU5jzsdm+5G151xX4Zi
         B15YK1Kmeekzfvzv5WuM4GiFaEVojVxAUPkiukgtSh7WpGIz4enFP+DrJkJ5M0idBEJG
         9SEQ==
X-Gm-Message-State: AOAM531Je7Fy9iIO/WRfSNQ8h3mMQRulRpBapL2ySZnDymQBbh3FMdVR
        QPUOGmxFMTey0FUazGhQSW8+aA==
X-Google-Smtp-Source: ABdhPJwMjMG5NuvlBdsJwiOAWKSMNKV4GrcOGftPPG58i6c5kNWYn1StXNhVEiq6b+QLIyTgFs/jww==
X-Received: by 2002:a17:90b:17c3:: with SMTP id me3mr2143130pjb.203.1628561132632;
        Mon, 09 Aug 2021 19:05:32 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id u3sm18289827pfn.76.2021.08.09.19.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 19:05:32 -0700 (PDT)
Subject: Re: [PATCH] xen-blkfront: Remove redundant assignment to variable err
To:     Colin King <colin.king@canonical.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210806110601.11386-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f87ecb57-12f7-71cd-29a7-9cecd6605c88@kernel.dk>
Date:   Mon, 9 Aug 2021 20:05:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210806110601.11386-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/6/21 5:06 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being assigned a value that is never read, the
> assignment is redundant and can be removed.

Added for 5.15, thanks.

-- 
Jens Axboe

