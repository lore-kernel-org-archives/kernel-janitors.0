Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCEAC4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DDD8613B4
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbhFANZl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 09:25:41 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:46967 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhFANZk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 09:25:40 -0400
Received: by mail-wr1-f47.google.com with SMTP id g17so14256501wrs.13;
        Tue, 01 Jun 2021 06:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=dHDFcGOv0gyGzcefhyBlPVxsuDdsPQqoEiYApnCNS5s=;
        b=Slb2+8xTuJKSQFyhNr8s3apfxaQhBCjJwFClcZgctj9pNnh5qHVAuYdTuLWaPGt5k7
         0CwPmnKfJZdzVNOU/r1umPgM7aSwXv3LlObAEHC0S3YZvTDfu9t80hQArL4de8Oz26Nq
         t7VXdyTeu1rtFEwJY2Wbu5fVsN4obdiXOONkqzAmxjkXpeqj5JadnXt+elnSkKnKsSbv
         rH9NbcDIG4RzyoRz8u0vJndoejdj0aDalR/yJeF0NHfPt0/xB54qS0rgMsvBQe0FaDY1
         soVe9Rq1kv/sXjBZu9C2VgdrqGwaGFuSo7e7DnlKlT88qUo6CgjXxTGFbxn0xJvZlHil
         mkDA==
X-Gm-Message-State: AOAM530BH57O5mrx1JRnscikBVng8Z2bwQP90BsLfnFLf5YqtExcpgBt
        RLBN5KDDfEn+1x9B+5bueBlWngHlHWmMW1f9
X-Google-Smtp-Source: ABdhPJxBhz07L+hcv3/S8Ik8bcnVTmg2e8HO6LKVquSEWEOxQZNwOXodsOMWFUKgqmw/Tqi32cUrKQ==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr20949355wrp.195.1622553836693;
        Tue, 01 Jun 2021 06:23:56 -0700 (PDT)
Received: from Johanness-MBP.fritz.box ([2001:a62:141b:f301:fcc0:44c6:21e1:ed3])
        by smtp.gmail.com with ESMTPSA id s128sm16323545wme.6.2021.06.01.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 06:23:56 -0700 (PDT)
Subject: Re: [PATCH] mcb: fix error handling in mcb_alloc_bus()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Werner <andreas.werner@men.de>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YLX7bAD4UPCpIBmq@mwanda>
From:   Johannes Thumshirn <jth@kernel.org>
Message-ID: <c4cffc84-be11-6558-60aa-a5217963b1f6@kernel.org>
Date:   Tue, 1 Jun 2021 15:23:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YLX7bAD4UPCpIBmq@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Am 01.06.21 um 11:18 schrieb Dan Carpenter:
> There are two bugs:
> 1) If ida_simple_get() fails then this code calls put_device(carrier)
>    but we haven't yet called get_device(carrier) and probably that
>    leads to a use after free.
> 2) After device_initialize() then we need to use put_device() to
>    release the bus.  This will free the internal resources tied to the
>    device and call mcb_free_bus() which will free the rest.
>
> Fixes: 5d9e2ab9fea4 ("mcb: Implement bus->dev.release callback")
> Fixes: 18d288198099 ("mcb: Correctly initialize the bus's device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Thanks applied
