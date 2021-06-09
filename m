Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8BFC48BE0
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99440613B1
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237846AbhFIO0O (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237997AbhFIO0E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 10:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RctbnkCJ0hkm48G2SuISc1IfcoEWeO6UvDG8UIpRugQ=;
        b=QbvgEtNg2M11M9UcOcWxJA54kTaSBwTs9xxAbx5b+sXOHpQYDNFOHDtXiUkVPGYTCQr1qE
        AXa9wqa7z4L5g8o9+jq9QN2xIBLtsiSCtPSszbfLhZjgnxG7WZNAO/qrJrUS/T9HuKvRHe
        lr3QvcMmQpIAlJMitgp2oj24K/wfBd0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-9RvYbXo8Psuu3h9SIGnhtg-1; Wed, 09 Jun 2021 10:24:07 -0400
X-MC-Unique: 9RvYbXo8Psuu3h9SIGnhtg-1
Received: by mail-ed1-f71.google.com with SMTP id df3-20020a05640230a3b029039179c0f290so10766564edb.13
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 07:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RctbnkCJ0hkm48G2SuISc1IfcoEWeO6UvDG8UIpRugQ=;
        b=ThroXQ3VDzw/tjFc/yUecsFbQtz8WsJkasUKYMp0rYbwzTrbEouRCFZucRqSNfnos1
         kBL+vPpEvlnpSvg6HgK0AFZxue9DnWdD5ZedUmPbiSTsZUtLm53556dIUvIDbIlWRMno
         tSDwOWNc7QJRd6bcNvVeAiJ3Q+E3HTdE6FvJa/IfwMxOAVYjjf7R3vLJcPi0AJ06lk/U
         HItEb+lC+LNmcNjrQizVC0L2HkkkTjtPRhhxjftFmfPkR1V6onp+1pTHSDJQiNNE6rLb
         yaKANbw5C1eh/NtjXYtOp7EDGQglq1kTPbMM15Zaur3cyO3RvR/+SW0Wh65oh3D6RiX2
         eiEA==
X-Gm-Message-State: AOAM532erqm4z6oKtyoqjFjQpGvbybzlrGIabG6esgBUz0cjeDjXy5t/
        F31uxn7DnzHG0TAIVFkpKdSK07QehL/5tyVaiVRR0FnwMnNby/lV9qJh1XZMwnxj9tz72UEKGn+
        VV0SoBoihAsOSF5knLdpOgw+SpNSZ
X-Received: by 2002:a17:906:5947:: with SMTP id g7mr105713ejr.351.1623248646520;
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1a1ZSnpCGddbbiL3MnOdj7UHS4rfq0Y3xTdakZNWCOgKTUC0MmDC0Ku9SWerLR/cY++x1LA==
X-Received: by 2002:a17:906:5947:: with SMTP id g7mr105702ejr.351.1623248646367;
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id au11sm1217249ejc.88.2021.06.09.07.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
Subject: Re: [PATCH -next v2] platform/surface: aggregator: Use list_move_tail
 instead of list_del/list_add_tail in ssh_request_layer.c
To:     Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210609072638.1358174-1-libaokun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ebe9e952-9938-adfd-7f52-658aec2cd466@redhat.com>
Date:   Wed, 9 Jun 2021 16:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609072638.1358174-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 6/9/21 9:26 AM, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in ssh_request_layer.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

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
> V1->V2:
> 	CC mailist
> 
>  .../surface/aggregator/ssh_request_layer.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
> index 52a83a8fcf82..fec2d7af2646 100644
> --- a/drivers/platform/surface/aggregator/ssh_request_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
> @@ -863,9 +863,7 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)
>  		clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
>  
>  		atomic_dec(&rtl->pending.count);
> -		list_del(&r->node);
> -
> -		list_add_tail(&r->node, &claimed);
> +		list_move_tail(&r->node, &claimed);
>  	}
>  	spin_unlock(&rtl->pending.lock);
>  
> @@ -1204,8 +1202,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
>  		smp_mb__before_atomic();
>  		clear_bit(SSH_REQUEST_SF_QUEUED_BIT, &r->state);
>  
> -		list_del(&r->node);
> -		list_add_tail(&r->node, &claimed);
> +		list_move_tail(&r->node, &claimed);
>  	}
>  	spin_unlock(&rtl->queue.lock);
>  
> @@ -1238,8 +1235,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
>  			smp_mb__before_atomic();
>  			clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
>  
> -			list_del(&r->node);
> -			list_add_tail(&r->node, &claimed);
> +			list_move_tail(&r->node, &claimed);
>  		}
>  		spin_unlock(&rtl->pending.lock);
>  	}
> 

