Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D256752
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709115905; cv=none; b=AJf4lm5Imw9JN5cQEdsrZvau2C2FU4k2N4108HuO0dO9lf1auCV0POnuAvnFSuF1Snkz6NmiQVhlA8MCEwEUQXkoUqGgFlmR6LL00JKOb0QTjjji4DK7j8IzFfLDP2UFwqKA9iLwoj5cwtCmmQmZOre2JWpkGk+fUQUfKp/aJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709115905; c=relaxed/simple;
	bh=RJWvUgHr8awlOHf5f+a2KBnaO6oNMg4fY/qdVUnzznE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMLXmeoQ2fFnIl2vL6+x6EYq9trYs2U1Zjx3ZszTl268matIYnLp6DrQCVZX/L6l7Sv0JuoYWcj2q9pOQ7yv5nDBQmiZDmXao0UlgmLsOk72nLSdOzA7ijQcB9IBsG2PgB5GZoKvMJQUfk+4fQzJ7hKcgNBQ4nHrTx5w5MgVWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=VHLB0nZS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="VHLB0nZS"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d28464c554so50468581fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 02:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1709115900; x=1709720700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJWvUgHr8awlOHf5f+a2KBnaO6oNMg4fY/qdVUnzznE=;
        b=VHLB0nZSyQaFKtZcmkt3np1G94/kCMT4QEtZ1pFMUERk0xrpuIB/cFHO3fGjlRzOP2
         oPzD+8DH9HrM6ThX/bOOsq6ol5+/fZ4EzAiMfjD7TN2bC2b4a0f9oSIYEidetc7dvYXm
         LHmy3iZ85hsllimJ56Q4XeIdZRw+4XtGJCOlFSddkUfu8pJ7hsEkC8YrBoB8ClXV9FyZ
         rnVg9lleA486hOl6cyZb52Sw1VtTF9Cn+lIANYJUmkeF22AC7rs3muACZfI5sj6NmLL4
         Bc6THhkHYFJce4Qv++qsTkeDdqTkLuYtS6pVv2T1Fq+0D9kckt0TssylpV33o8mP3aM+
         5xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709115900; x=1709720700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJWvUgHr8awlOHf5f+a2KBnaO6oNMg4fY/qdVUnzznE=;
        b=nQgqfIJo2eZ/xFioemWd1m2BLLEGYNc2H1f9/aC1S77vUQg8ZZXFowsFJtcNds1r+/
         kfHy/JZwa3khqtDDdj8w04OD2naPqMnOGU2dLLRqnkjN6fveIeGGO8CFfXgG8a+uh8pC
         t5pFp8oDGDwFvNilZjLBmvuJyBfcjDj3uW/5QTlLVPaM/1aeaIfwicLEKUNzapQcZvAJ
         s+23cg1V3mMNI5d58Yo7N7rHGPZVccg2LlJ/g/hKqBD8YwL+GX7aUTaomki5XzD6BuRn
         5Ym0DG8PrVueqj3Rzs3fHP+zp3F+ZxLGPeLVAPp1bN5CMWxvH1h9+cq0Vd3qI+SouXCd
         vRQA==
X-Forwarded-Encrypted: i=1; AJvYcCVs3yt0APaGBXL4KpaaTKz8Ci0CDgPCaYmC59eZxhK0Xi1HuWfKkLjoX7o1wTaSlgQfnPONQTpPG8SzqjVeGVAzRTGbSV2VYsSH8Hj8RRfS
X-Gm-Message-State: AOJu0Yzj35cJYdXkDTz2eZBMhdJdWVVBOnLbooRVtUfP+HXWa+0c+mty
	Yq+cAXCgSYezgPTcpl6JjODG42PtZlgm6ROuQnoTlTFoXOM77IJc42IEqSkiL2k=
X-Google-Smtp-Source: AGHT+IE1v8GX4KnuPAkO6ZzFb7IevBYvi4p+fVrf0lN07SaeF+mCEndEdGtR/o1KHfLMa4I/j6BhoA==
X-Received: by 2002:a05:651c:b0b:b0:2d2:d449:6425 with SMTP id b11-20020a05651c0b0b00b002d2d4496425mr633734ljr.35.1709115900049;
        Wed, 28 Feb 2024 02:25:00 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id jj2-20020a05600c6a0200b004120537210esm1621345wmb.46.2024.02.28.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 02:24:59 -0800 (PST)
Date: Wed, 28 Feb 2024 11:24:56 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andy@greyhouse.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: tehuti: Fix leaks in the error handling
 path of bdx_probe()
Message-ID: <Zd8J-F1SEyZwF5Mv@nanopsycho>
References: <cover.1709066709.git.christophe.jaillet@wanadoo.fr>
 <9090b599c7574892b77a9521e3ddb3a52a154205.1709066709.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9090b599c7574892b77a9521e3ddb3a52a154205.1709066709.git.christophe.jaillet@wanadoo.fr>

Tue, Feb 27, 2024 at 09:50:56PM CET, christophe.jaillet@wanadoo.fr wrote:
>If an error occurs when allocating the net_device, all the one already
>allocated and registered should be released, as already done in the remove
>function.
>
>Add a new label, remove the now useless 'err_out_disable_msi' label and
>adjust the error handling path accordingly.
>
>Fixes: 1a348ccc1047 ("[NET]: Add Tehuti network driver.")
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---
>Compile tested only.


Looks okay.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
