Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD910959
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELL/tWmh"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC9DFD
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698836356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChCUMS4Z0zFJSSZC7NvVm2TXc5lFEMGFDVYjPFXyk18=;
	b=ELL/tWmhxAQgOJ/m9hitNjvjelxbTWrWU/1mM4gJFZwwqKkn9stzfK5EidG2DRs3MpeIqD
	TldgfAMNOdknEz0coA6trC/Xx4p1kikYnLIYaYKF3+V+Zu1D5MAw7xqidfgv/5JoL0HvlY
	mqsfbQnxaYVsqlhB36cPfl+MRLhdUqs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-eBZK1dIGM82uPw15Anpecg-1; Wed, 01 Nov 2023 06:59:13 -0400
X-MC-Unique: eBZK1dIGM82uPw15Anpecg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9d31e27d0bfso241698166b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Nov 2023 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836352; x=1699441152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChCUMS4Z0zFJSSZC7NvVm2TXc5lFEMGFDVYjPFXyk18=;
        b=pp9agNVNpIMhVgw+wi9SNX1BLDuGZOkdaE0yglfk4ssdj6Cg2fHcfC7q06TlWAF5NT
         i3GNZhDuafFqTSxXJBeU+f8LxhEKbnR7V364TPA18zAWAo2MjzxJ2DtSsqxUCbMzGtHC
         /LnydC8Fw7K38DbiBvyoBBu2HcyHRXEACPvyVol429AvJ4O3hvLfeNdKTKFJRgr3OYog
         ZNuQuzEEDzLbIeJnqOiVqM7dsC5B3GMv9MTGxsQuTzzBbamJ47bghaFho67zFDSJnxO3
         XUO4YZ4otfZzeNr2QNu4HdqLebPRRG+JJaqGYnm/4gE1xSsyFzg5QBHlj1wkE+huNNF2
         1nlg==
X-Gm-Message-State: AOJu0Yzxn+NSbEGBeDiXTRgSYFLGDgTAV0x7o9JEb/jZxIvbrO5v5ZMb
	rkECnIo0iujJOJwreF+k6ZQ5j8KktY9HTNPxObzVaRDqt9gj57bE5BFCdC5OK3OCf7kVckH6kuV
	dvhT0Lf4By5vZ7fQI2FZy89WsoByP
X-Received: by 2002:a17:907:a44:b0:9be:b668:5700 with SMTP id be4-20020a1709070a4400b009beb6685700mr1473978ejc.58.1698836352533;
        Wed, 01 Nov 2023 03:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN4iF493a6l6vf8pkc7Vcdp9JsgvmrZwNhMEkxLmF5mmGf3XNHFkTZfmDTINO03oYIYYz4pw==
X-Received: by 2002:a17:907:a44:b0:9be:b668:5700 with SMTP id be4-20020a1709070a4400b009beb6685700mr1473967ejc.58.1698836352277;
        Wed, 01 Nov 2023 03:59:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709062b1600b0099ddc81903asm2265963ejg.221.2023.11.01.03.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 03:59:11 -0700 (PDT)
Message-ID: <24e0ae5c-26bb-6efa-d59a-262541d2a452@redhat.com>
Date: Wed, 1 Nov 2023 11:59:10 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] vboxsf: Avoid an spurious warning if load_nls_xxx()
 fails
Content-Language: en-US, nl
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <d09eaaa4e2e08206c58a1a27ca9b3e81dc168773.1698835730.git.christophe.jaillet@wanadoo.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d09eaaa4e2e08206c58a1a27ca9b3e81dc168773.1698835730.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Christophe,

On 11/1/23 11:49, Christophe JAILLET wrote:
> If an load_nls_xxx() function fails a few lines above, the 'sbi->bdi_id' is
> still 0.
> So, in the error handling path, we will call ida_simple_remove(..., 0)
> which is not allocated yet.
> 
> In order to prevent a spurious "ida_free called for id=0 which is not
> allocated." message, tweak the error handling path and add a new label.
> 
> Fixes: 0fd169576648 ("fs: Add VirtualBox guest shared folder (vboxsf) support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thank you, both patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans



> ---
>  fs/vboxsf/super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> index 1fb8f4df60cb..9848af78215b 100644
> --- a/fs/vboxsf/super.c
> +++ b/fs/vboxsf/super.c
> @@ -151,7 +151,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  		if (!sbi->nls) {
>  			vbg_err("vboxsf: Count not load '%s' nls\n", nls_name);
>  			err = -EINVAL;
> -			goto fail_free;
> +			goto fail_destroy_idr;
>  		}
>  	}
>  
> @@ -224,6 +224,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
>  	if (sbi->nls)
>  		unload_nls(sbi->nls);
> +fail_destroy_idr:
>  	idr_destroy(&sbi->ino_idr);
>  	kfree(sbi);
>  	return err;

