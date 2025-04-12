Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337D1519B8
	for <kernel-janitors@vger.kernel.org>; Sat, 12 Apr 2025 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468127; cv=none; b=cW0fZ3glx5PJQIozGu0UR6wo3msnfyQFrnPIgkM5trVkhyGm7g6AKNvo2YuD/8WohypYHZ0ulUSjdqMzX2lWoKhWS/uJP0Bafqa2SuTC3zD8YUdkTYeqSy3ytsZRdFCC2COsc+clgQN1W4zh8vNzdtCdH51KRyuQcksj1MYWCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468127; c=relaxed/simple;
	bh=Q4Xi4+EuBWmatlDXOmN20GwswDKxKmLUhLfT7gpY0hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtbDZXOMnSdLER97DGPfoDCjMlIl00BmImZi4rVtN/+ZM5ZtnF8EWAbqoFpf+1a2IsQjikcLUEdCWdJ3Pn/6NsRB7kTD6nq+Xf+VmuVL74y8W//Txx2EhK3Y6QkRaOpZZX+NK9q3Fw1I1bGWWD86wwX2wLzaxZzJeY3AeLpjg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djrcA9oJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djrcA9oJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39129fc51f8so2365643f8f.0
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Apr 2025 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744468124; x=1745072924; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
        b=djrcA9oJvz9bClgvpxto1kzf6YLvfDHxBu2JwvylLQVg4ANvAt26mricfETIIaDmBc
         Smz0anvwR1+2bRG97KkarvBg+1zlnV2IPSGx7Os558R/ua5sy18E2T+wxQn+HL477iB5
         TqME0tIqJDrq3jSj5LhgK80IM8tCpN0Lgv4efP6FzGRL3WbXsHP+eHgUUt+BnD5MWPOl
         eEcGflERTq2eKTfzd7uMPdexc8Rj86nL4FRXQjorjvoOopSLLHRxWbQ1ERla2zD4rmCM
         TdYhLL8cN2ZbqfBLfOiPyFIcD97tByoiU7YH18gVlbht42FvCDkvospAU/SzojiCDu1g
         3LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468124; x=1745072924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
        b=w8KgtAJUouO53rM6sGusflpB6J6/PMiHAem3K6/x/L2bjplcu1jOR4dfbhGekIrV2I
         ETom97WJkHyIMIufa6AI5l9dmrKXUbzaRtesi1mbUB4koVFVvR0FaASz3QNwMO09CYK/
         kNx5CCXCtbPiEYq9VEVjUhJvOgzMG522ZqLt7k/PxcKnYyN9fm1h7lP+tXG7AW7UqthB
         D6qt8Sovy/2YXNb+1LojzZEMmKTgF/MO6uWuidhg6Omo5zWNwr1oMfXPGxL0VTtnoMGZ
         Sm2uWF311m5NXqU/YuBSevsjD72jyfyaFq8xrVlJKs+g/Q6Bp3ri7unYT1AqX2ntrRoE
         sGVg==
X-Forwarded-Encrypted: i=1; AJvYcCWg/9TNy8J1+Ed6O7LGDQDPpzFDFfZuJlMqlPXwvvsgKTvTgZ86btTFJVad6rVT7q+zNfjCghSSdNer9RTp1A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHc6e+mtrVQn7QKNtyf6rloqR251FBQtp3xhQ1OT2K+D2dJ65L
	Gs9O1QdsknsjP0EWOuYxT0LD02zNVYAXtt27rpQ4FE3iIX+P38FVPIhmIhiBzxY=
X-Gm-Gg: ASbGnct7qobssy7nfz6OuYtL0aca+EneqWMl0PIRlwyMbcReMtS8SyQkFphazAcWIGY
	tTk3zV/hG5DRLVGnHFWI2KcksnHu11Wlri/AtcMiUjrWBY4Pmpjt85aZ7vfwuYRsKsRwTitScr4
	uLNizIOogT/9A1AfXufI4jLShioTOIfbn7rMhy5dda9FuJDQFtvDY8KqyywJQQWC0ihbPsAFDao
	tyFPNr2a6tLM5OWqkZSFCtEo8jYm9C3uMxVz3D0BDqgxvcJvOpFv1ufsSD1QctYQhLJFMrOcO8+
	Wkr9bPzg3U5Czns8pfCwp0iRbKoW0aPj6W3R9kOdEJgXfgX2d7oM8nRu
X-Google-Smtp-Source: AGHT+IH34D5glm0+0TkKdRd2QqYl+pfjKMVxmTngaZruRkPsk03mWnWy81pDX8UHh5AZeQmoxzxDVQ==
X-Received: by 2002:a05:6000:2507:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-39ea51ecbecmr5651152f8f.5.1744468123668;
        Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96c074sm5086157f8f.28.2025.04.12.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Yadav, Arvind" <arvyadav@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <344bcc64-bf13-4726-8530-48eca7d643d1@stanley.mountain>
References: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
 <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>

On Thu, Apr 10, 2025 at 10:29:31PM +0530, Yadav, Arvind wrote:
> Please change this also instead of 'goto free_fence_drv' just return err.
> 
>         fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
>         if (!fence_drv) {
>                 DRM_ERROR("Failed to allocate memory for fence driver\n");
>                 r = -ENOMEM;
>                 goto free_fence_drv; // this should be replace by return.
>         }
> 
> ~arvind

I noticed that when I was writing my patch as well.  I'm always in favor
of direct returns, but it makes the patch confusing to add this unrelated
cleanup...  I'll send it as a separate patch.

regards,
dan carpenter

