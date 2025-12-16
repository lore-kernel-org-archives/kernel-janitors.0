Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336A2EBB98
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Dec 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898957; cv=none; b=HAjg5OmtCy/IzQ4v8jN9yRpBTGOWWvYcv1gGPpyUUK+l+WdAHB6p5MaS2BjTkUTFpMjYZgBrAjR0x3AHy6GfeAlCZGBFAeht5zew+15iTdI80wtkbLyh2oqijjsRFacfhU5tTzoSB3giAtWNcPzCzN+49/jTbkjDxnEeL6Ty0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898957; c=relaxed/simple;
	bh=vwDFUYvsCNqJMP0vjXS2tVbvCp1Jq8R1ZVQNJG9YU14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdvGJtYhjQ1KPUjtOykaUu+xemy09khKB5GsVEYmk/DvM2ilJJQry4AnaI9rtSe0uSQR2EqQUX0kK+oPnRSfDma9TADIovdAINB4Uf4/gXCmDosINCHZto/FwC9X55uem9ylO0besdwG81/pW3Rbp9DAvwtctDflvI5UCX7/Tlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQV0n763; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQV0n763"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a08ced9a36so8331945ad.2
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Dec 2025 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898955; x=1766503755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zr3Gof58u9YJPfboarrtkfLOPQXqGnwnePKk7JXxizs=;
        b=UQV0n763pPBWXAI9rgOzpKxfTeQ5g1f33XbtebI85sg0UDsml0n+QbaucypnB5/Py0
         ShPTkrr8buep+u/Mh+8Jt+VLa9ZCMTZ8mrOEg8pvEGQTqsW1FbUSEKb3L6JrQqfOZ2i0
         LRoufsQKLJ6Jojd65LYTaWkefZFBuJ3q/kccgviyuf8bpvJ5vxF9vUpcGYfkUstcqT3k
         YVjgtmwy8XhhPVQnFyY3uvPxIYZVlNJqr+mpTsv/Wl7HNBy3KWNvQCJJRC4QDEsLh+H/
         vBiYllBCdfooZ6kRjbooJ5KiV/HJKFnRkSQT2OhYaEspO0pQsGvkt71dpdTQ2KF6mxsa
         hScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898955; x=1766503755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zr3Gof58u9YJPfboarrtkfLOPQXqGnwnePKk7JXxizs=;
        b=hgUNWBEGJldSzUc0Dg2qHv+INFTorC1H0HW67nEn1l/ILdN1tOr2WsNlStWxWUq7oR
         +mRdfPsEx/X2+a876pKsKmgY3NZA8dPjVnhoIZ5IL2B+gV9yBg1aZSJDXqnR3bGT+oSX
         QsqlmAIkNZ/AB2qkEJ+EbtOoli7533UrDDgNLe72Ekt0axZJzPYxfc0mtPgjYmFokz1h
         2RFnM2FlpJq/9PmxDOLnOEaZEpU6xr4MAu88hrTA1AfqFiWSnPQzoaYYcAoAiZVGKqqG
         sqf4SYXVG9+1vI6P3eW/3qaeIyr2MVduk+St1TCC4CuOfOQ/w0HclAuKNzLZEfd3augw
         VyAw==
X-Forwarded-Encrypted: i=1; AJvYcCV58nmpvkBEIK3Gn9ahV//j9GBQu1bE24I8YmsgSzniOOGO/VXoyUPA6KzA2ET/7dqS96EUM6uMNm9RwCpoQcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdgvrz2vKx/g9yJF4J5VIAuSGQTCNix9l9NQm+yUQxMx+qW/b
	cWstiRdhJBPnDZhmOOD479S0LjV3Qb1pi5IzHYc4tThhuxsnBYMFLk6vpXP87m1gYSZ86xcDfWi
	hryaQV+GNPoMbldKWh/ldIg9r6L2IBEE=
X-Gm-Gg: AY/fxX6tPWwE8ykCQDBI3738RQ3YwV3iW061qXKIP+wJQz+xK4NUx9qLNZXXHJeM+vp
	UODeS2V3zv3ORIRA8ytL0dshYA8HlsrZ71gzi2+PrX+H6e3IYIayj5MPdrYV4S8wrLLRPJcAm3W
	AN6cwtTh8rj+gDJH7r20i6dzoodICeoZ2a2shdVYQe8XPwxGNVryw69btn6ilcRpvfU8rpMpkfY
	SIz0763MAAbpnuvWEyJ/p9+uZOrqSeV+3NMOvrxbXbx3FvW9b5E/jDljlM8VNzise70/x3B
X-Google-Smtp-Source: AGHT+IG9kcUP8Pi9U9VCe9+jqy+e35rih9Qd+GyQTJbDh/dChPu3EK/0GXGO9bipWaTXTvNU+Tefi0oHy/HN/K4UjYE=
X-Received: by 2002:a05:7301:2e32:b0:2ab:ca55:89bd with SMTP id
 5a478bee46e88-2ac30218330mr3818312eec.4.1765898955375; Tue, 16 Dec 2025
 07:29:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215115150.3581277-1-colin.i.king@gmail.com>
In-Reply-To: <20251215115150.3581277-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:29:02 -0500
X-Gm-Features: AQt7F2pxZJSCVbxZ9Qp5L5e3UwMyuAGBb-cNval3Rs_27mmLOu4PrjQHbXJDINc
Message-ID: <CADnq5_NRO5KqMq33yK4Bc04yC2wAPbhb0FvL+9D5T4PFDW6i_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix a couple of spelling mistakes
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Dec 15, 2025 at 12:51=E2=80=AFPM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There are a couple of spelling mistakes, one in a pr_warn message
> and one in a seq_printf message. Fix these.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c               | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index 2f66ebb5b029..adffa44fff2c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -830,7 +830,7 @@ int kfd_create_process_sysfs(struct kfd_process *proc=
ess)
>         int ret;
>
>         if (process->kobj) {
> -               pr_warn("kobject already exsists for the kfd_process\n");
> +               pr_warn("kobject already exists for the kfd_process\n");
>                 return -EINVAL;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 5f8cda4733f9..d7d37f01f51c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -1115,7 +1115,7 @@ int pqm_debugfs_mqds(struct seq_file *m, void *data=
)
>                                 break;
>                         default:
>                                 seq_printf(m,
> -                               "  Qeueu node with bad user queue type %d=
 on device %x\n",
> +                               "  Queue node with bad user queue type %d=
 on device %x\n",
>                                            q->properties.type, q->device-=
>id);
>                                 continue;
>                         }
> --
> 2.51.0
>
