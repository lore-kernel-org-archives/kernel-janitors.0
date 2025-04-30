Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D525A32F
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017285; cv=none; b=HZMWtbPOgZIbPc7MM6Kc+wAKRxx7vHPuawQFgsIHYnJnboJ8pxUaLQN/EjCSYoQFrVQgntc9BTS75Xi/pUWTGZCFvSQq8UlhDHG4c+vE6aatfosHvkrmDyYu3sC6JkyOkFHAJFwv3Qri8qLPm93C0grRpgBvvXpFb4rM1fz7ueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017285; c=relaxed/simple;
	bh=tCKwb4cPFpmdPUcNn0T3KSrbEQ/sL4BgvyRp10kVntY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eyNF7+vFLdVoC8IxBkUWsVQDszBdfPDu6nOCD40UYbfbAErxqTxI9MPn4u0b4p7TMr3VcQnvwdAlfsO3ec1StUTcsuIOoD0R2E53JnMuBUAaamYmutny2Wm0Fl3U+ppSaVZu8aqzsoaVCItgeCMJuVGgHU9otGzezC562AqpzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQMdkhCx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQMdkhCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746017282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
	b=RQMdkhCxaJho49w3sYwZ1bY6UVizUu+hDdYVNhIxeW2zHm81Pzmh8I/9WfzuugQn4Yjjvj
	Iw1UM4dESPavi4REEwKTH0rJbsT4vcHB/PWAtcESjIizvQJIcBiyvy8fKQ5rMA+pyu9LRP
	GJPusyE7oUhg0+jsM/oaVylxuPdA2wQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-tx3P6qfXPxi3VuPmKIWZaQ-1; Wed, 30 Apr 2025 08:47:44 -0400
X-MC-Unique: tx3P6qfXPxi3VuPmKIWZaQ-1
X-Mimecast-MFC-AGG-ID: tx3P6qfXPxi3VuPmKIWZaQ_1746017263
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso2352194f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017263; x=1746622063;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zphvSnykN9OE07j6fXA0nKqE7w+RWIGW1d9po/7trWE=;
        b=PWTAgOGqehqaCeKDLh54YpULKh0BuPuHTtp2H912DXHVuZ/3weSvw1MA2BplHy867b
         Ma/ZjYRDtHath88PzGRk8zh65pywCyzboUsOP02rv+OmoVuy5xBJj7Y05Mnuv85Y4Y/P
         x+EqXboeu5Or+jI+U2xntPe8r2YgUOxSJm45+bmi2vi30lo5/eym+1V6crNwOxvOhbd4
         EqbfazwuK3pLXAjTbXP1acU4RfKDsnDuqdgSaDzZOu2LM/rRWfeQWCJe9Xb6B9pBzKO6
         XWO71RpozLrAjoxbx5JxDEO+HcoRgpIXxag/x1mRyPO8DlVlWd75+fKN84PwbZhSYVJA
         ywcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0l4e0AnOBZNljQ/6H+COxeU/Ech0GLXciBfXZ94R0wzifqMLI0mTRYxNLKlEkMm1w3BYjAlhZlZF9LcGCzfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYOGIpzRoT4cL85L1YcRMqJ5Zr0aokEcPTLab69gR2ubl5Bpn
	P2j26KjqDaFd4zmylzmAjsw/UcTAGPv3DxKMXB9sTTp/JrxfDiq56YAbA9vw4G3JilvkQ7F3Et/
	T+R3RbxwD17qEkJROVDzb5mgSGkNSI7HmOM97eCgwd/9zQpZtzy9vIgIrgoy5Bw4NVw==
X-Gm-Gg: ASbGncsVpxVhX6gpocvETB4Auz1JFaOb3KTMfgn2Hga7VvLY72/7MIYKo3jVWBA5BF5
	eWpTbYlRBhIo2KD1LD2imPrMtMG2sQhqESEePst4og7aQ6pX7rRx3u84L5MtVTFFxSFo3npkVbX
	3TKwYQO/dq8kNE0JPxtZIS4lnhB5a0BgaFQnvrmdBVz/4O4EDd4TEGkkAiAprMZKVbn5Hrtx+Jq
	rJQeCTtBZfVEcUjNJrjR+o3bZ0jUws2sj3vL5BxDW/r++fcZX2wsBJxBCXa14hlEVjOBJ0Kp1+N
	n9Z7mYSaccWmsJrm8MI2wpGaJpb6kG9a84xNVkMkj/bAMg3fyil89CfKESAxQRaUo4t4wA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b1f5bffamr23643515e9.25.1746017262827;
        Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM+ceGhOv4JKCvz5Fh82bRAJjwTkYhN8POhSnvp7s6BTnIqcTj6XXd3hkyknjVQdUMFaljyA==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b1f5bffamr23643345e9.25.1746017262451;
        Wed, 30 Apr 2025 05:47:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20b36sm24245465e9.25.2025.04.30.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:47:40 -0700 (PDT)
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
In-Reply-To: <aBHZYgPPPYY-J8Vd@stanley.mountain>
References: <aBHZYgPPPYY-J8Vd@stanley.mountain>
Date: Wed, 30 Apr 2025 14:47:38 +0200
Message-ID: <87msbxzuhh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> The devm_kzalloc() function returns NULL on failure, not error pointers.
> Also printing an error message for kmalloc() failures is against kernel
> style so just return -ENOMEM without printing a message.  (Kmalloc
> already prints a message).
>
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

