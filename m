Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D5605B2
	for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847813; cv=none; b=CH66LKFYXtX3kbCz//up2DrXl4+DEk7rTecLxoRplODoNSsg084FubyYGwAL2b48sTW4qbQiNK82QegI99e1dkzIgG4J9MAMvfTzX8RcmZm6svDplAP6qEe39JNQPw9Hp0Z7e2mr5JY1c+iq53HqjWDxO5xaPQiXq4kqSGkGY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847813; c=relaxed/simple;
	bh=UNgcle+d9r14K8JpjkfYo0Rz2jZg7GDPQvbA5DnyHIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhMZNWKUVuA/Jmyf0BpnqCuEcui8QvbCMySurHaoYHj3KsTgc4GLny1ulHIwSWPZOx5RA4yiNbEgEm8gm+0M5FRXSF2EDQslImXcOP0U3pCTVHV+xOyHirANRFgbljdIV4lEO7MECliJ25ayblMBCi/qz7oiUyk7e/cRGQ9uQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4zBG6bU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4zBG6bU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so7379217a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847808; x=1708452608; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziAomXuWT8MH5zr/8s5imuynSnI7dntU0jZc1Z9tS6w=;
        b=W4zBG6bU2FvscZnF/LLJSIHajEUGwC1vc+FSoQi5TriqhYmN98o7Sr/xlHE9pUwlfp
         6KkjTqgqhkgQX/nEIHGgqUAaF7VpAO4DoprpWFSU8YP4Eu/S8uvqa67+zDMm9Ym0hIAK
         /fUwrxAFV3MuVFQ4WvG2Bo/EfUlTncZS/VEyG/UwS+EYIxuUM3Q+aAO0EiBxdk37j6Rr
         kvCLqZbZxVtpEQdu277HyQtLMBkKA2ip+8Zy5x8bU5eKGrIFwUw29RndP0eI+HQrZUh/
         FTwaINLBc43EsEq/Vn6Ojf8vp9rMNjohWvs4WMIH7ikUQ+Cajuh3tEoc+mBCq/4M9/dI
         WZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847808; x=1708452608;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziAomXuWT8MH5zr/8s5imuynSnI7dntU0jZc1Z9tS6w=;
        b=hERiw3MCGdQcjPL7rZqCC9OZBKVzjj8v+Z36y5C//X5QuGViEBSdK2sHheJ1HOCFAz
         PA32QNynLSr/9F6QpJGIKx8JpPMHlnG81UZilc1iaqk9Y8E6GQ258mZ0O/Pf5Z+CywWo
         5rPUKzH7HRvNyGs1Bw3LdS/JtKNS0fA/KneC7GiAWjQMWs9FYSZJZ9dH30uX7jY+DloP
         Hp6T3tz7QzcTenYMRj9aL0vwHuFaB0z2soJ4BOGJtkVk1Wb22q0ky5/QDF0VtRmKDHhu
         rmQzYlieAow8pG7f/4AaKyfN3SG+jBhWFPBeJsrjn5WlexWLvnmSnzN9QNec72dAWX0n
         AzTg==
X-Forwarded-Encrypted: i=1; AJvYcCUFDjvwvmCC6hPp8DYETXiGTXolYcZoeNUDJvuutob8Cia1P82A5AtP30+befCdJ752IaYi+L+Ua5tCZPwYXLYR7pwMavv9iAj8PoO44aIh
X-Gm-Message-State: AOJu0Yw9gE2IPX+2+NM7OmqAw8macxwQEG3eKB0B9ycFI6MJBx+sIdOz
	tyG0sTC8liC2YG4CJCHZudVQmIxqFaGylAg8FnL/a7umPIKkLeQpU885PD5xuSQ=
X-Google-Smtp-Source: AGHT+IEEYP79160/4gREQSMT99NQJR66fKb5tUCe7r25eVUrmQpy2NIZzr9MrcCjSU/z8yF+NtlVDg==
X-Received: by 2002:a05:6402:2c9:b0:561:a444:8e49 with SMTP id b9-20020a05640202c900b00561a4448e49mr321854edx.0.1707847807927;
        Tue, 13 Feb 2024 10:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKqe9LXaXCTJL+0+XDewhVE3YzUr7ESGe3puDPcSskby8iGkPYz0oTenO+aCQtAlemdNeKRkzKYJlPZOsdV/bkrYnGTABsLqMej8xFl5Venr0cVbu+kUwioToW0tuN37GrnXm1zl8RNNt+PmS9NRMOlig5wSYbq4nHSKJpn1Gxs+/FrLQnUB+R+1pZL8dayot7Z/MxtO8CbqlbZbNekuTO8DqhNqGbw5LLLxeAvovKEdJcQctLm/+1+ctUpF5TT2LAMp/333ubfflOQkXZxMefbY8cKqI/KPZcGSN/N9/5Knu6C059CGx3T0q9AbJAMzqc4sRCchCipGb6gWHlYZ6n/fkcMtUhnfoy5BIRRfR6rQ==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y24-20020a056402135800b005606b3d835fsm3935468edw.50.2024.02.13.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 10:10:07 -0800 (PST)
Date: Tue, 13 Feb 2024 21:09:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/mmu/r535: uninitialized variable in
 r535_bar_new_()
Message-ID: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If gf100_bar_new_() fails then "bar" is not initialized.

Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It looks like this was intended to handle a failure from the "rm" func
but "rm" can't actually fail so it's easier to write the error handling
for the code as-is.

 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
index 4135690326f4..3a30bea30e36 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
@@ -168,12 +168,11 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	rm->flush = r535_bar_flush;
 
 	ret = gf100_bar_new_(rm, device, type, inst, &bar);
-	*pbar = bar;
 	if (ret) {
-		if (!bar)
-			kfree(rm);
+		kfree(rm);
 		return ret;
 	}
+	*pbar = bar;
 
 	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
 	if (!bar->flushBAR2PhysMode)
-- 
2.43.0

