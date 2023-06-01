Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A100C7EE23
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jun 2023 15:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbjFAP7o (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jun 2023 11:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234464AbjFAP7j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 11:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F31137
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685635134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ol2VrA3MBxjSHCAQgCh55CsBJm+rZHfsDaePIVKvX14=;
        b=NrureafwFph1REpvtnxBnYaIgbFXcgh3QsbXLrkls/o52j4+mms1wLyQJRFMVINxJ7hW3v
        9EbnhF8xXAfVMbbQ0LX3/uSKnYp9DiISExCJ1TkTVieQWvuSAj8hdSpE4v58kqLhZzpMZD
        B4gM9FZnlm6R4tnCmJTDnylXW+q+p8M=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-QXqg2wrOPaGXoHokbdOvdw-1; Thu, 01 Jun 2023 11:58:53 -0400
X-MC-Unique: QXqg2wrOPaGXoHokbdOvdw-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-39a4811dbbbso793243b6e.2
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jun 2023 08:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685635133; x=1688227133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ol2VrA3MBxjSHCAQgCh55CsBJm+rZHfsDaePIVKvX14=;
        b=Nght7aDIBeM85HQuia7D2+8wBACzNLfpTAzrjjUm2Xi/XnrE45/bYCPCF/O5wI3CQd
         rwNCIcREJFa1exObBVpDmYQVOIVCnsYikRxG3HRzMpPjyeRMC+YWtbUc5ChEn1ftLaL8
         fKzKOae5AtTc2PO3/fwEXiS4F6sY6DCC630mUoYEHksp2JdE7OqAN/VMwFGEtCAyYDJ9
         h70ThvyTfs4hYXF2A2Jih4hoFM/4tkhRZNfgPvKcuvospZKAFjUBhTQbFgfvgZ8FCGRy
         NbTOOZiLsPMnUzT55EZazf6L5mG74HkC9BHgT9h6ggGVh7o9989ivDLAO3g7mPlHAPHQ
         XfFQ==
X-Gm-Message-State: AC+VfDwBUi+GsI5VUMxEm7CE3lWek97qJTSde+8Sf00ISKtMubLANhn3
        MgBf0yzsLC/sb0WERkt1cyDOrRKfcNyxwFBwZIG9MJgMnR3TkLC7MRGw/C0U7BI3IiG4vZ1CU7v
        NABWnZ8o80sOzUUrh4NnXi9GQmfw=
X-Received: by 2002:a05:6808:1526:b0:394:41e7:5719 with SMTP id u38-20020a056808152600b0039441e75719mr9088574oiw.40.1685635132990;
        Thu, 01 Jun 2023 08:58:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4o53SioLIxrQWbrVVF62wXGz1rBcPOl9Niil0Fjck0toG1YH6XCucHTghz0cHYxCDg9CGKLg==
X-Received: by 2002:a05:6808:1526:b0:394:41e7:5719 with SMTP id u38-20020a056808152600b0039441e75719mr9088558oiw.40.1685635132757;
        Thu, 01 Jun 2023 08:58:52 -0700 (PDT)
Received: from [192.168.9.16] (net-2-34-28-169.cust.vodafonedsl.it. [2.34.28.169])
        by smtp.gmail.com with ESMTPSA id v10-20020a0cf90a000000b0062627f71b07sm4446227qvn.125.2023.06.01.08.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 08:58:52 -0700 (PDT)
Message-ID: <3475be3b-11d5-96fe-6bc4-26d0e3a270df@redhat.com>
Date:   Thu, 1 Jun 2023 17:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] accel/ivpu: Use struct_size()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From:   Marco Pagani <marpagan@redhat.com>
In-Reply-To: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 2023-05-29 15:28, Christophe JAILLET wrote:
> Use struct_size() instead of hand-writing it. It is less verbose, more
> robust and more informative.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Marco Pagani <marpagan@redhat.com>

> ---
>  drivers/accel/ivpu/ivpu_job.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 3c6f1e16cf2f..0a09bba8da24 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -289,15 +289,13 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
>  {
>  	struct ivpu_device *vdev = file_priv->vdev;
>  	struct ivpu_job *job;
> -	size_t buf_size;
>  	int ret;
>  
>  	ret = ivpu_rpm_get(vdev);
>  	if (ret < 0)
>  		return NULL;
>  
> -	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
> -	job = kzalloc(buf_size, GFP_KERNEL);
> +	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
>  	if (!job)
>  		goto err_rpm_put;
>  

