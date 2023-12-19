Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B714274
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KuR2rHsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702978765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gcH9WS2tVG3ovLiBypnFZ2jVXWEukuXIC7hmC0v5Ihs=;
	b=KuR2rHspOaclWiHN7L4nqOfEWffJ/993sXGDOCBw8OsF9QFtfFGJPWKsKQpSkt2kQeygzC
	FuS5m3TDaWlpAQJZZoA2cU6325tTBQrWFCDFULnvef+QD2ByQb7Tjb6DWvlPPmWcK4Ldy9
	aToJT87g1wt5ypOKYIJg4P/QzXu4MuQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-j1NAgwfvOF2ZziX3c5kpvQ-1; Tue, 19 Dec 2023 04:39:23 -0500
X-MC-Unique: j1NAgwfvOF2ZziX3c5kpvQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-553a7468be9so99930a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 01:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978762; x=1703583562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcH9WS2tVG3ovLiBypnFZ2jVXWEukuXIC7hmC0v5Ihs=;
        b=OlU9TsbAGCbrlGQFWzDA1F7wmQ/UK3gw6BXE/1mK4qOLI36lePfsBCD8ICKhed02O1
         RWR6mlwSydqJhTscCsqq9e5GBgZToBXD8SPZ+oacVUNeKoPSOOzEay6PQWYiTqbJqqq+
         u4tgJXVhI7HuujYGbmmtDT94UW6WPYlKiMJmWMWI6WpzvSqAWRLcTFcrEJ/COrYlrmD4
         Y4ScpbcaHfwClDLZD+3X/4LGY6qWQbk08oX0/l3ijlcuN9Dwtz8Dety+JffOyTFFjWwz
         55zfYyqAPgolKCu18l9lTdmYglVreMxZxkuHp95C2oNqOXYPpxWl0/eAwU0prBnrOB64
         VMmw==
X-Gm-Message-State: AOJu0YwY/6/wCzoIUgIEbdpUTygzIinWVicmAfxJokKhjDWTrCq2I85f
	kv7NHJkrDpBHFAduL6yPY4WaSRxdvjB/xq48tNX+MjqTBgXgoTmWboUScGXQ2vQ5WJQaPJJ1xke
	MugdyYUwXpWjn5QsSNrboeNmPIpzR
X-Received: by 2002:a50:85cc:0:b0:551:9675:53c2 with SMTP id q12-20020a5085cc000000b00551967553c2mr5808131edh.49.1702978762225;
        Tue, 19 Dec 2023 01:39:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKfnNFd7LXTG5/FqkrDtnXygjq8cbwnZ4/FHh5lYrk4L380+jZTKSy80sPESk36D0Ocow0sg==
X-Received: by 2002:a50:85cc:0:b0:551:9675:53c2 with SMTP id q12-20020a5085cc000000b00551967553c2mr5808125edh.49.1702978761947;
        Tue, 19 Dec 2023 01:39:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d32-20020a056402402000b0055380bc3b4bsm847680eda.90.2023.12.19.01.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 01:39:20 -0800 (PST)
Message-ID: <b4c96284-1ae8-498b-84ae-34a9f65e9da8@redhat.com>
Date: Tue, 19 Dec 2023 10:39:19 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vboxsf: Remove usage of the deprecated ida_simple_xx()
 API
Content-Language: en-US, nl
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <2752888783edaed8576777e1763dc0489fd07000.1702963000.git.christophe.jaillet@wanadoo.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2752888783edaed8576777e1763dc0489fd07000.1702963000.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/19/23 06:17, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

vboxsf is not really undergoing any active development,
if there is a tree which is collecting other ida related
patches feel free to route this through that tree.

Regards,

Hans







> ---
>  fs/vboxsf/super.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> index 1fb8f4df60cb..cd8486bc91bd 100644
> --- a/fs/vboxsf/super.c
> +++ b/fs/vboxsf/super.c
> @@ -155,7 +155,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  		}
>  	}
>  
> -	sbi->bdi_id = ida_simple_get(&vboxsf_bdi_ida, 0, 0, GFP_KERNEL);
> +	sbi->bdi_id = ida_alloc(&vboxsf_bdi_ida, GFP_KERNEL);
>  	if (sbi->bdi_id < 0) {
>  		err = sbi->bdi_id;
>  		goto fail_free;
> @@ -221,7 +221,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  	vboxsf_unmap_folder(sbi->root);
>  fail_free:
>  	if (sbi->bdi_id >= 0)
> -		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
> +		ida_free(&vboxsf_bdi_ida, sbi->bdi_id);
>  	if (sbi->nls)
>  		unload_nls(sbi->nls);
>  	idr_destroy(&sbi->ino_idr);
> @@ -268,7 +268,7 @@ static void vboxsf_put_super(struct super_block *sb)
>  
>  	vboxsf_unmap_folder(sbi->root);
>  	if (sbi->bdi_id >= 0)
> -		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
> +		ida_free(&vboxsf_bdi_ida, sbi->bdi_id);
>  	if (sbi->nls)
>  		unload_nls(sbi->nls);
>  

