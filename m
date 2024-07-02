Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99516158A17
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jul 2024 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916807; cv=none; b=rJMRzaSXGRNCPRdWZ1nJgNpKLdWEqsxuuwgKoNqcaO5u79srhRZQXIYnJN+kzXJDpj1YUi9RoCUGXNUao8t5bSg5avXr/IL8NafhoPqH7w+UW/bvsX3YgmQOAhwRGIwfASWZxiT4/z49kL487r7TnCJFHNnjX0w3MFBgGyj5iWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916807; c=relaxed/simple;
	bh=TDppq3QndM8JNkDjO8u2RbRC5OpWh1V4tH234IJdXFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxRlUgQqJsLzdZAkd6tlZGUSCihfJWXnaqhE+FI4ogndiWR3NgSndGs4bfQys3By6LhibZsjd2Z1Ucc6a20yFDBtJlQYLSOk/HzoeD9orBKRaxOqGm0N+TmJlhHa67vTalBYYieIamMVJl+HN2UlaLMQ+CJrXvYrHglyJiWeuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7egtoHO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7egtoHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719916804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
	b=E7egtoHOpMqp2B8J0k3FfvCQO39yipQs+OlzdagVk5sFt8XB+L/Nl2/tbi8VKE8q6s9enf
	7dIA4IBE2HupSzqf4wtoaAStLD5joX/TUMIsd7C9khacZBHDnFDJmh7fUVhHNTmhmIqaRp
	Pri8iRvbAOClJK2EYWwLr9Fjp5elino=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-bK2NWPNWMLO0hnMnMu880Q-1; Tue, 02 Jul 2024 06:40:03 -0400
X-MC-Unique: bK2NWPNWMLO0hnMnMu880Q-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ee4d3091b6so43069271fa.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916801; x=1720521601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
        b=WAuw0EAoTQUIArChMOyvU8O5KJ2a27N9nj99ltyGT2TmvDEEfHVo8o5KKDP538te+b
         zfm8pLKJcQu9zOHPmPi4Pl7OPs59F9SY1k6csCAvJ4MiP5nMx/RLH+zQv8isugeiu43S
         j4qOwVEDBXgfc+jjkCoOShAozZA4GVFX+F8+oVtezBvT+lSBzaPN9bfPBmTJjGhXAUbD
         EybXKZZV4o8x34fObu71Ea2MvgUhN6leRXF0/tJwGlgFCW7WStj85aJzNBr6MeCfMzYj
         8Fw2GlfpFSUOU8YA7gPVvNkHS3Hj/P2Keu4FS3M0gaQuaFXWQTZnAhz8dR4hRNMJOToi
         unmA==
X-Gm-Message-State: AOJu0YwOZ8jzi/jzV9lqrJ8Yl88Xlti1tcPSdiaKYStQDytZbPkA1z7a
	QoaCNUZoEKWsM5CuSNGMQcphK9kaWe9DoHHfbSSc3ZzKwTgWxxnmnpCb0zzahON4pZqBr9sCaAF
	syRvVzCecgeGMevVNW0ruLelaZSktsxHk5vvrrbSE1GC0BtfRdJjzTTGZLgEZ/STASQ==
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944971fa.7.1719916801659;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA9HFaqbpR5DiqdWlJr4mBoVmkGsxDa/lEzaGV1FtuE5tObmfGOuCe6wTUqiDmvlGM/Qax6w==
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944751fa.7.1719916801202;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324eb41sm5532223a12.30.2024.07.02.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:40:00 -0700 (PDT)
Message-ID: <2ac685f1-d46d-4639-b045-605bf95ed2ba@redhat.com>
Date: Tue, 2 Jul 2024 12:40:00 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: atomisp: Fix spelling mistake "pipline" ->
 "pipeline"
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240429075146.1073869-1-colin.i.king@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240429075146.1073869-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/29/24 9:51 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index effc71b5a439..d7e8a9871522 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -894,7 +894,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	ret = __media_pipeline_start(&asd->video_out.vdev.entity.pads[0], &asd->video_out.pipe);
>  	mutex_unlock(&isp->media_dev.graph_mutex);
>  	if (ret) {
> -		dev_err(isp->dev, "Error starting mc pipline: %d\n", ret);
> +		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
>  		goto out_unlock;
>  	}
>  

