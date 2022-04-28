Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E62C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Apr 2022 15:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349726AbiD1QC3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349434AbiD1QC2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Apr 2022 12:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9CA6ADD78
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651161552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VQMXv7RE+tSrsEiXu9oPdAko7Kypf8QV9+1AqOxvV5U=;
        b=QP4jkXKNcqhqVOgp8Iw9TTpuRQHntpOo3lHAm4fWsLk8vjpxZUyey5bCgN09AAV+dQqdxu
        uA6+sCVk610BYvtJ1idPCDLe+jkjldMjJOr/nUDIHOqefLw0MvJHvIgIDDYcz1I65SqvTk
        BLvHBr63mpUQP6RoENqXAmHZL/r/Sh4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-gD1NtGceP4m781vIYiqPjg-1; Thu, 28 Apr 2022 11:59:11 -0400
X-MC-Unique: gD1NtGceP4m781vIYiqPjg-1
Received: by mail-wm1-f70.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439so1706649wmj.0
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 08:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=VQMXv7RE+tSrsEiXu9oPdAko7Kypf8QV9+1AqOxvV5U=;
        b=FtyDIkrWIr8cuU1JvrwpewXwIwetsWLhti4eVuG18fYXYzeLmYc5spu4oqYLq3HhIu
         kTb95b3M+t7pGz8VoAiEoft81VUfnlDRzbjNv5CZADtuFagWYaCmdhD6UuPHQIQ4QQp7
         U5DWo33nSv8m4pWShnxT1NKNVbeeHrA3fEV7Bat0/qmZBlCtO9h1GMzAKxQFELr9OVjK
         P32vac2fSK8836TjRvHOEB+Jdbjx7kBGhaprk/6twgTAnWfz5YeJPeEahg81uNtKhpHy
         UGljoKTVZB6p1oGhyXnhxmd6bah9zzfy2MCfyPOTkOUnJlOYJUDF9AOqJINnBuNIRNIc
         /c9Q==
X-Gm-Message-State: AOAM533AU9BuxKlss4TiTfJQ+ONIlvORLhHczJAPLPc7zauR1jbw8vWo
        F22w9XJKB2VXILiVQkW10woWHJAlSIQ/9DXHGRVC/VaEU3M+BqUk4B6fTL3U8h1vVUbN+nlednC
        Chog8WdIO91bptJ5+uoGcYGrR0UYj
X-Received: by 2002:adf:e186:0:b0:20a:e185:df02 with SMTP id az6-20020adfe186000000b0020ae185df02mr12884313wrb.302.1651161550110;
        Thu, 28 Apr 2022 08:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyolnK2ZCawgd4Z5hCPbEz2B22QQgEY0gWXnEwTpfIP6y5c0Gw6xc5e7CUCwFfDaAE73H23IA==
X-Received: by 2002:adf:e186:0:b0:20a:e185:df02 with SMTP id az6-20020adfe186000000b0020ae185df02mr12884299wrb.302.1651161549896;
        Thu, 28 Apr 2022 08:59:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:ef00:7443:a23c:26b8:b96? (p200300cbc708ef007443a23c26b80b96.dip0.t-ipconnect.de. [2003:cb:c708:ef00:7443:a23c:26b8:b96])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d604e000000b0020af46b0ffbsm253727wrt.9.2022.04.28.08.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 08:59:09 -0700 (PDT)
Message-ID: <90ab7f5c-8ca9-6bb5-cb1a-626e7310c019@redhat.com>
Date:   Thu, 28 Apr 2022 17:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] mm/mmap: delete dead code in do_brk_flags()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
References: <YmqHrpo/cBBq6lHf@kili>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YmqHrpo/cBBq6lHf@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 28.04.22 14:25, Dan Carpenter wrote:
> This code can't be reached.  It's harmless but it leads to a Smatch
> warning:
> 
>     mm/mmap.c:3040 do_brk_flags() warn: ignoring unreachable code.
> 
> Fixes: d2bbe46ab3b9 ("mm/mmap: change do_brk_flags() to expand existing VMA and add do_brk_munmap()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

