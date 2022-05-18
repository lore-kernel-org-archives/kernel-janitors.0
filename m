Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A89C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 May 2022 14:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238583AbiEROXi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 May 2022 10:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238586AbiEROXg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 May 2022 10:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8B1F25C42
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652883815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xEnVe+thJMrj0C89/i9QBXS8K26hkY9sQCbQCmrjIxg=;
        b=OdQbKfywOyzta/j1VppW2zhYsDu+k72C9GMd/micGjizrs+wBZWZM3b0VmMAFLXn8dZau4
        27wYSAOVnAebJuq1xbnQCo13aHM8LHWws5zyG+4dVJTdgpucw4UVtiA7CXfSQvi+76CVSa
        Mc13VQsOlvAtV9VXqh5t4qTEywHYrG0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-lNkA7ghhNt-mD80mZvFLwA-1; Wed, 18 May 2022 10:23:34 -0400
X-MC-Unique: lNkA7ghhNt-mD80mZvFLwA-1
Received: by mail-pj1-f69.google.com with SMTP id o14-20020a17090a4e8e00b001df68155c58so1301815pjh.3
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 07:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xEnVe+thJMrj0C89/i9QBXS8K26hkY9sQCbQCmrjIxg=;
        b=u+T29wTO5X9/4a+vWOM12eYZkt3iAFnBJrs91ukWijM/ALNMQWga9My+/TscxgSNOA
         AkR7o2Sv85+SCwdVYG3dTWElafOgKYWxwhI3nvApA29b8CxyY0d42Rx9+8PU4hMjhYeY
         URfW51PKuPi12iKR7RP0lfXQs94FvIjc1ydI/Ri3n6ZKKAFSENJ7UGUtGn03V29kk0Py
         MhdfFTp+bHQWFgiNnBo4AmVCfzlqDoDFa6NzA8vBaNDkuMpH33TL1tQo76DrTnWBtXwD
         bYURVh0iPX+R8/lpEcidPhT8F5jyRxrr2VlpzGW7YbBMF+JUtQavu5EzZyu9CfetjAj9
         uhTw==
X-Gm-Message-State: AOAM533tXaK+rAxwgagNgvpwdYVqn3sJlPp1bhEd6nBBNi/DRzZTjLaM
        jEfqMcZpXWxNYG5r/1OcwlbH+mDgVmcXNB7lf8B6XSgx54Z40+8h1ZhnL1cW07K2l2e8d1ZueOB
        dbFGN3pvjzy5TA6TzebbaupMJxVmV
X-Received: by 2002:a17:90b:1c8e:b0:1bf:364c:dd7a with SMTP id oo14-20020a17090b1c8e00b001bf364cdd7amr225171pjb.103.1652883811483;
        Wed, 18 May 2022 07:23:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7BLP1J1H8f7oD1TY5TGuF+QDjgPJtGJ1rzPMQGjEi3Mxt4eMzgGqbzqjFJq4C8NXIHPKx2A==
X-Received: by 2002:a17:90b:1c8e:b0:1bf:364c:dd7a with SMTP id oo14-20020a17090b1c8e00b001bf364cdd7amr225147pjb.103.1652883811225;
        Wed, 18 May 2022 07:23:31 -0700 (PDT)
Received: from [10.72.12.136] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id r19-20020a63ce53000000b003c6a80e54cfsm1620634pgi.75.2022.05.18.07.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 07:23:30 -0700 (PDT)
Subject: Re: [PATCH] ceph: remove redundant variable ino
To:     Colin Ian King <colin.i.king@gmail.com>,
        Jeff Layton <jlayton@kernel.org>,
        Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220518085508.509104-1-colin.i.king@gmail.com>
From:   Xiubo Li <xiubli@redhat.com>
Message-ID: <5398e036-8150-ffd0-844e-719257c6e2f7@redhat.com>
Date:   Wed, 18 May 2022 22:23:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220518085508.509104-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 5/18/22 4:55 PM, Colin Ian King wrote:
> Variable ino is being assigned a value that is never read. The variable
> and assignment are redundant, remove it.
>
> Cleans up clang scan build warning:
> warning: Although the value stored to 'ino' is used in the enclosing
> expression, the value is never actually read from 'ino'
> [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   fs/ceph/mds_client.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index 00c3de177dd6..20197f05faec 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -437,7 +437,7 @@ static int ceph_parse_deleg_inos(void **p, void *end,
>   	ceph_decode_32_safe(p, end, sets, bad);
>   	dout("got %u sets of delegated inodes\n", sets);
>   	while (sets--) {
> -		u64 start, len, ino;
> +		u64 start, len;
>   
>   		ceph_decode_64_safe(p, end, start, bad);
>   		ceph_decode_64_safe(p, end, len, bad);
> @@ -449,7 +449,7 @@ static int ceph_parse_deleg_inos(void **p, void *end,
>   			continue;
>   		}
>   		while (len--) {
> -			int err = xa_insert(&s->s_delegated_inos, ino = start++,
> +			int err = xa_insert(&s->s_delegated_inos, start++,
>   					    DELEGATED_INO_AVAILABLE,
>   					    GFP_KERNEL);
>   			if (!err) {

Merged into ceph-client/testing branch. Thanks!

-- Xiubo


