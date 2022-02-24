Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BA3C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 24 Feb 2022 15:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbiBXP2N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 24 Feb 2022 10:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236314AbiBXP1S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Feb 2022 10:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 053D4331
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Feb 2022 07:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645716408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QRB/W7Ct6Fvwq8WNLWdOFSX0Quf6CZk21tMewLGkssY=;
        b=ZGOGx4MY6m1ZHKErWjqucZENe4Z4prThdMu+m2Wtrl7WwsByAmQGB1gWhwe9bGoLEtqV6L
        DUdBKiCwgEhiQZz0HY/2tJhqqRLUUVwHUGN28Rbpzq+mdYGE3+hTznd3JZw2QuP/tmGtWR
        zUaEnXTlZWQktoUZhgFTTPdPuS6aUQw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-O42x37dwMCeZppItH9M0Cg-1; Thu, 24 Feb 2022 10:26:44 -0500
X-MC-Unique: O42x37dwMCeZppItH9M0Cg-1
Received: by mail-qv1-f69.google.com with SMTP id q14-20020a0cf5ce000000b004326eec23acso3129728qvm.20
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Feb 2022 07:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QRB/W7Ct6Fvwq8WNLWdOFSX0Quf6CZk21tMewLGkssY=;
        b=O8cJQKkRpz9z67iqIgvJ4adohqeENC6txQL7OEC2DVO6RZQr7VYjn5Xa2f4qC+7z1g
         MduMW6P7J6tnhdPXLxVNuUEdM5aSW71YrdDt4jFP0tY6qxYRNgOJOmXFYArNqqtr88Ol
         Mka2H+iJMFQtsYyzjSfOPmNbxZoeEo70wBn/hLTTOxd4i7+nkJNZSNBdMIg7MgHAMGZI
         nf5R0KwtY9TK0FWAltqoMaoNJyuGoP2ehhNmTnV6GhOHo4itlELIqxbEeCk3udKftMZ0
         hcroHHEsLvMMkdjAdkUs6fWOzw7/5qvezXtHQ3caU9u74Em36e0sFOr9KOvbIkIFSg7J
         dlRw==
X-Gm-Message-State: AOAM530vlhzGyxJMh2sBZAdoanrck8o6Ncb50s5FDEXVhTeQJ1ZXhmEJ
        Q35RxEHdRVnFJJrDLYT7Y4Wrr0mrmD6ZDzQMaFaw1oJGHS4jdEAAx8HS9gAf8A/UCof0rfiVdbZ
        whPHUtYzc+rT7UhPORxL/TVtbYyd/
X-Received: by 2002:a05:622a:18b:b0:2de:8f67:b3e2 with SMTP id s11-20020a05622a018b00b002de8f67b3e2mr2793284qtw.104.1645716404331;
        Thu, 24 Feb 2022 07:26:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzp5vc0QNLAJZl2b5ZiFxc9Cr3aXdBPfffT7AqQZBnqifESVp3GReU8S1yBO6pNLWMguAaOzw==
X-Received: by 2002:a05:622a:18b:b0:2de:8f67:b3e2 with SMTP id s11-20020a05622a018b00b002de8f67b3e2mr2793263qtw.104.1645716404020;
        Thu, 24 Feb 2022 07:26:44 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171])
        by smtp.gmail.com with ESMTPSA id bp18sm1780832qtb.72.2022.02.24.07.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 07:26:43 -0800 (PST)
Message-ID: <a733fc64-0c59-f495-5f12-d90750fd32d7@redhat.com>
Date:   Thu, 24 Feb 2022 10:26:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH net] tipc: Fix end of loop tests for list_for_each_entry()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Richard Alpe <richard.alpe@ericsson.com>
Cc:     Ying Xue <ying.xue@windriver.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Erik Hugne <erik.hugne@ericsson.com>, netdev@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
References: <20220222134311.GA2716@kili>
From:   Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <20220222134311.GA2716@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2/22/22 08:43, Dan Carpenter wrote:
> These tests are supposed to check if the loop exited via a break or not.
> However the tests are wrong because if we did not exit via a break then
> "p" is not a valid pointer.  In that case, it's the equivalent of
> "if (*(u32 *)sr == *last_key) {".  That's going to work most of the time,
> but there is a potential for those to be equal.
>
> Fixes: 1593123a6a49 ("tipc: add name table dump to new netlink api")
> Fixes: 1a1a143daf84 ("tipc: add publication dump to new netlink api")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   net/tipc/name_table.c | 2 +-
>   net/tipc/socket.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
> index 01396dd1c899..1d8ba233d047 100644
> --- a/net/tipc/name_table.c
> +++ b/net/tipc/name_table.c
> @@ -967,7 +967,7 @@ static int __tipc_nl_add_nametable_publ(struct tipc_nl_msg *msg,
>   		list_for_each_entry(p, &sr->all_publ, all_publ)
>   			if (p->key == *last_key)
>   				break;
> -		if (p->key != *last_key)
> +		if (list_entry_is_head(p, &sr->all_publ, all_publ))
>   			return -EPIPE;
>   	} else {
>   		p = list_first_entry(&sr->all_publ,
> diff --git a/net/tipc/socket.c b/net/tipc/socket.c
> index 3e63c83e641c..7545321c3440 100644
> --- a/net/tipc/socket.c
> +++ b/net/tipc/socket.c
> @@ -3749,7 +3749,7 @@ static int __tipc_nl_list_sk_publ(struct sk_buff *skb,
>   			if (p->key == *last_publ)
>   				break;
>   		}
> -		if (p->key != *last_publ) {
> +		if (list_entry_is_head(p, &tsk->publications, binding_sock)) {
>   			/* We never set seq or call nl_dump_check_consistent()
>   			 * this means that setting prev_seq here will cause the
>   			 * consistence check to fail in the netlink callback
Acked-by: Jon Maloy <jmaloy@redhat.com>

