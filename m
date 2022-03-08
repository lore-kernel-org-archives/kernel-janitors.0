Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7D0C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 00:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240099AbiCHANO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 19:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239607AbiCHANO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 19:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A2E63818A
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 16:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646698287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MFrVezwVhJ+SZBQIzjB4A9UTX6BXwFx20i/3W4fbeS0=;
        b=KPubOxNDZwcBZhA+uGnz4PIEphCSMYvEC4E2WtIMm1FRNvN+QBWfBqvRNDp+zPXoi2JYI6
        /Ba3Th0F+DQ5mNna9zfo/2AKVC8RyV4a60dHuR7bRnx6Yz6F4jstmOSUIkQZPVpxaydIQT
        8VClP7dZuKoNN+CpABNVXOcrv9bLdB4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-aCv5l3PwOdmkZUEztVLA-Q-1; Mon, 07 Mar 2022 19:11:26 -0500
X-MC-Unique: aCv5l3PwOdmkZUEztVLA-Q-1
Received: by mail-pf1-f198.google.com with SMTP id d145-20020a621d97000000b004f7285f67e8so600705pfd.2
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Mar 2022 16:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MFrVezwVhJ+SZBQIzjB4A9UTX6BXwFx20i/3W4fbeS0=;
        b=BlCx3N+xIgnAL9cBPCgsWKMcEmTvrN0dyxVOPcOI/UrPN2sfvKO34l9s0GJ/l6EZ+V
         bSJwOFCx2XsXaNwK0kDf8OOXptc/yqTyFgc+QtQIMhOz3geDQSYiJIhFYoVShGKgg/Xn
         gwhcrMcD+vBU+0QRmZhl5Y//E0Tou3+wkHyAwmLQFLpInQhOCzZOHzbHmgHAZi50AA9M
         dL3iGct2kGd0XtJJyUZ1dNeGJKwZNXk5vv3d5ax5DUeq/qfRdkisqdvxOlzJjhQX0ovs
         q4M6+HuhjKuQJe3YapcjSlHcM1HXDpwWKNGxVNy48QV5SjTlGI62KsBlfw9V6t06INiU
         tXSQ==
X-Gm-Message-State: AOAM531s8hYtL45SFvL1hjrKubH2iW8NjbjkkakEo40sLEFWON9X84q1
        SoZgh4r2wYbsf9I5cFqqA38u9Rm2sz+bwG8btcKi04ni2hh0MMG+zIhx2P8PvFVjRzsZV78ilxd
        8yL8jxOekvphnhAQ2evKwa2xKO2M1Aoujh/4P5nEcAu5JKtTRQQYqwkVK5DgdGjQe+xAMcSHKPb
        ueww==
X-Received: by 2002:a63:224a:0:b0:368:e837:3262 with SMTP id t10-20020a63224a000000b00368e8373262mr11864492pgm.546.1646698285180;
        Mon, 07 Mar 2022 16:11:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMI7E0+LGSreWJe1Mlxya1Ol+gk3q2p9Fnofvveu46/ok8zfWOyMW3xGC9x0WhZjxjOdCaJg==
X-Received: by 2002:a63:224a:0:b0:368:e837:3262 with SMTP id t10-20020a63224a000000b00368e8373262mr11864465pgm.546.1646698284756;
        Mon, 07 Mar 2022 16:11:24 -0800 (PST)
Received: from [10.72.13.171] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id m79-20020a628c52000000b004f6f249d298sm6335571pfd.80.2022.03.07.16.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 16:11:24 -0800 (PST)
Subject: Re: [PATCH] ceph: uninitialized variable in debug output
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jeff Layton <jlayton@kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220307142121.GB19660@kili>
From:   Xiubo Li <xiubli@redhat.com>
Message-ID: <ca7956ad-5179-15bd-aa38-d14e0dc990ad@redhat.com>
Date:   Tue, 8 Mar 2022 08:11:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220307142121.GB19660@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 3/7/22 10:21 PM, Dan Carpenter wrote:
> If read_mapping_folio() fails then "inline_version" is printed without
> being initialized.
>
> Fixes: 083db6fd3e73 ("ceph: uninline the data on a file opened for writing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   fs/ceph/addr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 3c1257b09775..0d4120297ede 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1632,9 +1632,10 @@ int ceph_uninline_data(struct file *file)
>   	struct ceph_osd_request *req;
>   	struct ceph_cap_flush *prealloc_cf;
>   	struct folio *folio = NULL;
> +	u64 inline_version = -1;
>   	struct page *pages[1];
> -	u64 len, inline_version;
>   	int err = 0;
> +	u64 len;
>   
>   	prealloc_cf = ceph_alloc_cap_flush();
>   	if (!prealloc_cf)

Possibly we'd better format the 'inline_version' in hexadecimal ?

Reviewed-by: Xiubo Li<xiubli@redhat.com>

