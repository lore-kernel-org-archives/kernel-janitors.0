Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE612DC768
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018042; cv=none; b=DOfzxh6bePXutt1RppTLjcG9SRpOFTlMBLfVn8O8epeFAZjJ1Uj5ytRlo0rL4aMNk+DI7JUA8K9MX1KfJMoyuxl2GxW+176JLoyRHRYOxIG4/GTuwV+uaD9KLV6FDELU1TSWXzg5LG85xHC01OFesas35rBu9KZa+vhcy+qRCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018042; c=relaxed/simple;
	bh=syXoLLXHr977EGJnWjj8cAMJU/MDa2l+qntNRkfaxW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lgNrNTT3jEHM1i8cpR4+nMG6iXxn3nPbQR9ybXy0/5hj2vYQ26gm1YbGZtA6NHT5OhEx8xmT740U488wKYqI3Y03rjlcbx89Svt35OsKcp0aIov3iEMJ5aZ7EfUpefyi9ULpNt0B8Lik8fjsIyQU0MP38klJjTav56GRyX6d1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0FG+1I0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0FG+1I0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746018039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
	b=K0FG+1I0vuumc5LDJluH695pdyG7BkQemxX/aMqGBqj6vVaZ8eF4KEggrFdUAbYw78HFMH
	fAuffnTcotFVo/PIAX9KFErTijbPX134h4wiayQGDpSqDSXTb+jDU3yQyHxNoS73H/Rtun
	/SBai6evarpOye5SkQ5RHmD2LsoME/Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-RfyMZ0ImNpyybQL2wVmXsg-1; Wed, 30 Apr 2025 09:00:38 -0400
X-MC-Unique: RfyMZ0ImNpyybQL2wVmXsg-1
X-Mimecast-MFC-AGG-ID: RfyMZ0ImNpyybQL2wVmXsg_1746018037
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so3133444f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 06:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018037; x=1746622837;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/BSZJgZ5YRpAxetTo3M4XK6veqR7rUZVtf0IcGSTdo=;
        b=Oh4qZcmAApdNdCvZXTej/4cLaaR3Lm5uZlcHqI65jgW93BAIwtGxSX6wZDfdK7CnWM
         kyApAX9N8eVWwVgpOoCodkHV85hK2frD7vy4sCWv/VJz7ppPBj60QUDkBclkbNtvPWg1
         JJRUJmG/v+ANR7BS0q2Wj0ke8NFILn0zz6oQRCiP8Gt6/o+09Jnyd0F7LAcxbRMVOiVA
         7o0cGonHCtT5F4baBgPVzWndf68A507WPJ8IC9KiGJEKMoSEl4Uysq1ZwEW2qY+26+fw
         d2c+DCPFQVBlESjl6sKRE1AisyP2gBywpuTFvx2cDbIerLl5fgoS+ttBljPZofNYKjza
         f6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT8zbx8BKcy8gcoCEHMGxD6ndgiK+XKVFKB/aTmUEQhACvreg27+ZNEE1fUiUFTJ7o7bB4uP6ZWgX+aLrV/TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGz4XwZFi1pvQr9DZYYZeselvLlp59/rWCphPVuAaiV9J4Vf4
	Y/RuE8OdvdHvdQ0Ru9rOowS1bgaiWLsIcup5+KTh51PAYcgvpJ1RnnqbouK2UbxmBAIWnd2UA36
	G7kb1sf6Wv+sehh+sY2fI1qz2J/G19yaoNYfyHfSBVrE0JR7g6Dmb98YMczPA+Xx2uw==
X-Gm-Gg: ASbGncsWo6RwcSoiLfRFHyW80qzWGZZE8mpVjqlamYeigmJdtGAaAfXfuUa/gVPmOtO
	FO+Fab0LT5h7U1+hvTKOw3mamWGx/zv+kobrFOK75WKUxCF1pXFq+joYQQnjRhdXKjLQibH4We4
	snb+ukmAw7QJidEb2mLb/gHqwvf6bZOMkbczx8tvrFMjDavj8H1PqLVN8FUku6UnCwwJJsasAx2
	jCJGEnhOddccydRg7JMS+Ze3PVW2BPF7WhX2ts+L9a8fSDArgir6La/D0s1syGbPh2OqrDEkjcj
	C+4zGnEZtSq2ieZ3fI9Sr24nO/O6Kc0hP3Q5m2nbxZ4WpVwZ3joiMu5oclGgVdXCa5nD9A==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id ffacd0b85a97d-3a08f752666mr2847940f8f.7.1746018035228;
        Wed, 30 Apr 2025 06:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH00zIXR/QJpX2r62x/BnijgtG/melnBE3UE7Sv8nmaQkGLGVWABf71hYp4Wd9Pcm+gpDIP2g==
X-Received: by 2002:a5d:598c:0:b0:3a0:7a5d:bbff with SMTP id ffacd0b85a97d-3a08f752666mr2847668f8f.7.1746018032433;
        Wed, 30 Apr 2025 06:00:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5cffasm17192690f8f.96.2025.04.30.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:00:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in
 probe()
In-Reply-To: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
 <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 30 Apr 2025 15:00:30 +0200
Message-ID: <87jz71ztw1.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Dan Carpenter <dan.carpenter@linaro.org> writes:
>
> Hello Dan,
>
>> The devm_kzalloc() function returns NULL on failure, not error pointers.
>> Also printing an error message for kmalloc() failures is against kernel
>> style so just return -ENOMEM without printing a message.  (Kmalloc
>> already prints a message).
>>
>> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

