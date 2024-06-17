Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E448DDDA
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638046; cv=none; b=XK5nzSkCwfoDkTm5O5fOelTrHgNW36iYMbIXdcXSV545KxWZEh308tcyzdZ3UgiHepLZ62XmEaV+/PaqWjm9QfudVx6Ylkl6kzY7WtgOJJLWel6X6BO8qqZBTP3wjNzw5bqsAYAb0vJ2AplyqFmNfF+MoQzZpfNPtAk4vibvlJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638046; c=relaxed/simple;
	bh=dFfnPY2LQuHSLUvCh4VkFkCM0jwP4XrN51PLoGp0vlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTaCBScz8yWOyz5tQjHlVP5eBeGHxRek2wNH+1t4BzaV5TlNY0YYC+Owyujmwj6TvdCH5X4yyZtlu3nvKjUv99zKypkDLOKwl8bTs5aZr5PaRlrFVzfcaRj1eqWS7MLUxPWtyRQRR+8YLV05KwE/A6fReAL5dSgxVauIkMJh96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8DPm6jd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8DPm6jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718638043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3yNOohsWGaypNKhl1iDB1/cvtnFfZJdux3KpEMAOgs=;
	b=D8DPm6jdpzE+gL5PfX+vhX5hU4BOun+pV7ELoNVa7UV31uoJ8doOPj+tLRYH9k23630iYb
	YGHWi+V5rB3AGVK48DScFnw7LdB5J5GNsOkD41pJkaKgMuUocC6XXk/eDrQmpM8+dwbPkg
	bG1720A6/PdaIbLNXqj2dIYT49+KrrM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-Pm1BLq4TPfOQ8gnCIY64Kw-1; Mon, 17 Jun 2024 11:27:21 -0400
X-MC-Unique: Pm1BLq4TPfOQ8gnCIY64Kw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3608fb58acaso1228326f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 08:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638040; x=1719242840;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3yNOohsWGaypNKhl1iDB1/cvtnFfZJdux3KpEMAOgs=;
        b=ZM2GjO8VrMrJJigSSA5C/pi5FOLsVGWptpfc7gHtGx1YsINN9SN2QIEiCtBjw+10v8
         TQNlf0Z0QfWcmdcZnirwsTkSZO3S/ZsGiU9RTXzk+oNtn/MfOyNmmCqcAb3U0Q9g/mMb
         dt0ryiZu8IEUyw+iQNXpv8XoAnrJd12sR+mZSVp3oyWslZRGCHbLAoE3Gg+gGIIi+dRX
         CGXS1HhA4WTsrecMrSuCxdTkeopO9LSKbvq2T7Fa9LDUj9CpFUxwy4nJ3FxePk/YVWAg
         m7QXYCrvVoMQURzmXp92XX7hbWXhKAJxcVNQeB9qRmsx8hU/lxgOtrurWOdJHNM+Akbr
         odMA==
X-Forwarded-Encrypted: i=1; AJvYcCXuwPb5c5GV7zcEBGshfLfCrqFMe89LZFWA6SfRMR28xZRf1BsDNESzh2eSNhlxyObPqvqzP8ztXhxb9WX6A8hfKjg8TaSWpMs++kBqAfe0
X-Gm-Message-State: AOJu0YxDwWh+g6blePk+vEe05Wyp8Abi3GQYqCSvsHVg4hQPxbwsUDaD
	Ff12ojHHGGq34MSdFfVzx9LsZZoeCSPtG9HfYFIumXhgJg2Ir3UFG4VsBSUNfMLElhRiJ+9TK/s
	DE8DDylx8OX5qBlb7DKjTn6QznnHc24F+ztRZXZO3e35s3ccJiG17192gcvvRQ7M5mg==
X-Received: by 2002:a05:6000:82:b0:35f:e4d:f3dc with SMTP id ffacd0b85a97d-3607a741964mr9404279f8f.9.1718638040652;
        Mon, 17 Jun 2024 08:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjNmUohArz1oiIJJtmkoA2K/cMFwDCp/vUBbIHNHAgBY0QFm8dKaVEvyDta7bhr4F1pF9tg==
X-Received: by 2002:a05:6000:82:b0:35f:e4d:f3dc with SMTP id ffacd0b85a97d-3607a741964mr9404262f8f.9.1718638040302;
        Mon, 17 Jun 2024 08:27:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104954sm12066178f8f.99.2024.06.17.08.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 08:27:19 -0700 (PDT)
Message-ID: <cd389206-88a6-4e6f-9fca-491fb186ed5e@redhat.com>
Date: Mon, 17 Jun 2024 17:27:18 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Constify struct nouveau_job_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <860e9753d7867aa46b003bb3d0497f1b04065b24.1718381285.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <860e9753d7867aa46b003bb3d0497f1b04065b24.1718381285.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/24 18:08, Christophe JAILLET wrote:
> "struct nouveau_job_ops" is not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> In order to do it, "struct nouveau_job" and "struct nouveau_job_args" also
> need to be adjusted to this new const qualifier.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     5570	    152	      0	   5722	   165a	drivers/gpu/drm/nouveau/nouveau_exec.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     5630	    112	      0	   5742	   166e	drivers/gpu/drm/nouveau/nouveau_exec.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nouveau_exec.c  | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.h | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index e65c0ef23bc7..a0b5f1b16e8b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -188,7 +188,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> -static struct nouveau_job_ops nouveau_exec_job_ops = {
> +static const struct nouveau_job_ops nouveau_exec_job_ops = {
>   	.submit = nouveau_exec_job_submit,
>   	.armed_submit = nouveau_exec_job_armed_submit,
>   	.run = nouveau_exec_job_run,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index e1f01a23e6f6..20cd1da8db73 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -42,7 +42,7 @@ struct nouveau_job_args {
>   		u32 count;
>   	} out_sync;
>   
> -	struct nouveau_job_ops *ops;
> +	const struct nouveau_job_ops *ops;
>   };
>   
>   struct nouveau_job {
> @@ -73,7 +73,7 @@ struct nouveau_job {
>   		u32 count;
>   	} out_sync;
>   
> -	struct nouveau_job_ops {
> +	const struct nouveau_job_ops {
>   		/* If .submit() returns without any error, it is guaranteed that
>   		 * armed_submit() is called.
>   		 */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index ee02cd833c5e..9402fa320a7e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1534,7 +1534,7 @@ nouveau_uvmm_bind_job_cleanup(struct nouveau_job *job)
>   	nouveau_uvmm_bind_job_put(bind_job);
>   }
>   
> -static struct nouveau_job_ops nouveau_bind_job_ops = {
> +static const struct nouveau_job_ops nouveau_bind_job_ops = {
>   	.submit = nouveau_uvmm_bind_job_submit,
>   	.armed_submit = nouveau_uvmm_bind_job_armed_submit,
>   	.run = nouveau_uvmm_bind_job_run,

