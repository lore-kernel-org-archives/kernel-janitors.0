Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24C1E9B06
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713897; cv=none; b=qA0LC6d2FTF8IvKNGZ3BVmvehvyhsCYPEGQp6bRBX296+Drr10hkGKcH7QSMzWewt+s1354vWZe2UsFaPtse6oglMuh8mzoEZR9RUm6BbOLZJmdhMIZAxlsFIXwIIH1J2wm3QFKjtkhS2EH2UrSx6tQkJJLjHLgTzQw+deFh36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713897; c=relaxed/simple;
	bh=SSVPDq/BXaFrhLTbxEzi3l66eOM0a6vm/T2BPj4C/tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooy5YQsoi56Tp/V5ZC2GjuMFOHCtQaxsAKfinqA7pE4/qXe1FKKGvDZAN9G07L2bctMYbUxKc2SVN2Z06ofRnmocMAjrr9W3NUgB8WMaugKmUs/rUAQSaCtfYMb2p9HY7TGkxz3ezlVNDkXM2fD88kEZF2woFAR70XJ3qOxrfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XK8QoqY/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XK8QoqY/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4747621f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713894; x=1745318694; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
        b=XK8QoqY/MfMNuamODGUJFPtKToHVvyJTt2WL+hUCTXOV85dG8T8H8AJdYQkaijQGvb
         yHO2qZ+bBH5hnX9+m1Ra+6EjRrEAEVhCFjZexHOIfgSXR801V+IAmHj2yBDVPRP7yO5d
         hXQXIl2TLUIF5afE+Xezi3wuu/ZpQN0Z6J+cKFdbmjOJWh5BuU5LDQ8CJ+Msk4mOfDEh
         olr8JLDJwb94styb9VQi6KxpRcKP7Idep9tnhHEKbWoAqoG+ly+lv6LD9jyHEzw9/oFL
         6AGX4MUWONkoBW0pV2ml/bbVV5nLn5pGQAyi04RPMT7ReTDVK7WNS1myWueBCQ8PFGSH
         viAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713894; x=1745318694;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
        b=womZZxD7KmFyLxftzb0BNKL2tQb04drBRHiElNdbWbAoJGojk4mH0zLvgSMvjpg1vO
         EDpLMkfguwxuYBtAYZbvnZ2K9E0yGU3P2e7bJnf0gjXoPSL99ATqXs+xYNpjCQmbvd/J
         t5S8QYOzesDQ5TijD8w+sjfJDZFWAMtRwaaU5a+EiqnNzxuIzgl7z2TMgfGfUoojZ406
         3491/UWABgFV4PM+ARhtUV9e501ujdJUOrlr5hXg+KVK5Qut7G1YQhnDIrJpqdJmSJDJ
         C8W4cokVRRF9iOJiHICsEwJHto2CxIs5/V6k7I+tTltkoBT9Ng3LWaDBL25w0ozHQcDz
         FkJw==
X-Forwarded-Encrypted: i=1; AJvYcCVN53YbhgW8xZHw3i2IB+1u/K0Dch6TNPnggPgILkeR9+ddBOiOpaeNj7wExnzRvxDs7e0F4QxVP8w0DaM7G2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTOqRkQxULOuA241vRZQ4/5Dc6sNmZF+W+Ycky5ML9X+UqENH
	Syo85mN7wMJg3/FvgRnsCvvFg566t5FgzRdjWXOvz0u3+VKC0AcsUwYgjIUJSBk=
X-Gm-Gg: ASbGncvSOZX1K47wWb1xDND7M8YaE3S0H9WTcnVZLVYmXAEnTcZk1OWLh7HlsKp18fe
	MGpLtYB/Dg/BjfiVRhwF5+PRneaGaT1rFQQ1TNsWG1sNPdTlHdKe5A4MtuGjdkr7CYJjXpFbYAb
	LaqToAoRbUwoXgXNy+DWRVMPoKm9rXfAZFrj0BO7R6zRmQp9MATmHhN6UMWQG6mwP7jZMSlaPjp
	Yr6wg1Z5jdb1TLYDwZtpypabjs5ko+D5AuqXJwJ9Xtfbu99mx34gV9WUmZ4vWNvCyCiPIGnFSNm
	w10wsn+PLidM4eFtag/MNjmD92iWMxKsrHGAgW39+6bX0b/Hyf0P9igR
X-Google-Smtp-Source: AGHT+IGc9RW10knIr3MFj1Pzt4vKOq0H3enobQU/zlnoeN7SKpLX1yrOkCKkuW4z4l4oMeg39rDQgQ==
X-Received: by 2002:a05:6000:2403:b0:39c:30fd:ca7 with SMTP id ffacd0b85a97d-39ea51d10a1mr13006863f8f.7.1744713894209;
        Tue, 15 Apr 2025 03:44:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae977a7fsm13703803f8f.45.2025.04.15.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:44:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:44:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Huang <jinhuieric.huang@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdkfd: Fix kfd_smi_event_process()
Message-ID: <Z_44oq-aSZOsvxTN@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pdd->drm_priv" NULL check is reversed so it will lead to a NULL
dereference on the next line.

Fixes: 4172b556fd5b ("drm/amdkfd: add smi events for process start and end")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 727a4ce29fe6..c27fd7aec1c3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -350,7 +350,7 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
 	struct amdgpu_task_info *task_info;
 	struct amdgpu_vm *avm;
 
-	if (pdd->drm_priv)
+	if (!pdd->drm_priv)
 		return;
 
 	avm = drm_priv_to_vm(pdd->drm_priv);
-- 
2.47.2

