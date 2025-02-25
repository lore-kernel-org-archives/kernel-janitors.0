Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0724C80
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740468634; cv=none; b=MbpPTKaQ/OX76lojnisHxTEYgVXxGJApPIa0TRdIlxbaEjFNdW0sMQ4wiP6yZWnzIsX3wzBFYbNaR0oYWU2BJrR4c+FAqHZS1jQDhyfrZPD73VgcIELlcrfzcfXElToqqxzY5CZSmDbEQu6MwcT/RUYByycyYejCeAhBBh/pw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740468634; c=relaxed/simple;
	bh=lLY/y7/44+oHF/HGys9GOAGZNYPIN8tsHz48KOcoOlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0gZPnvM+UVz29bYAUUERJLoOPuzwIW9GF+LyIa1aQEWryX1H/1ELUe9/6A3Bt59bbrLuUEXGSwNehOQI5dgFJyd2veDd4te+V/WZDsTXG3l3Vm06STTGJNV4R7aMFxfd8hpxJ5GlgB5sZR1M9GEHc0i0An8eNDqmPraIAbGB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeLtH51u; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeLtH51u"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso8447478a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Feb 2025 23:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740468631; x=1741073431; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
        b=YeLtH51uj2ZMwpsbrjGousjmJApJDXWareRt2wehq5iJM8azmSSebwmFhbJuwAmxbn
         xMH/gK3mnTSpJJIFtxqcIIOlxBCIMTcDLpH5XJcEXz3tl2l+QlJgnH29PWvIdZW923E9
         /0ZWy1q2fZRjCkBiCF93nW2rjZ6KWoXWweVq5U8iESuDiXBOVhhQp3YkBcD7nQjoONJ/
         eb/JxOpYogOLipxHKpboNqF8BUrpFbHpvn1t1APitjY17D34nQGVlEWBNKKMErLg0LjN
         3t0PnyENuKcaxRZcK4mx7hbhl3cFWCxemgOzghErkN9A9RZMLOz4t0Ex0YBBptbseZU+
         pcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740468631; x=1741073431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
        b=Kn4FTnfzxUXOC68n7qwl8OwpOhom77d4CSDZAfg/ze0hzqf0o0O+8sG+N4wZ0ATroK
         AJPMg2BPOqGBp1Db69efsH0CHA2nqTLdVZBxi2US/nllcW0muVAwpYVhBPyvQFVRzHNH
         Za58LQeyuoKqOcCzmfkcY1HAJ0iKvoTlPEL6ko2BJpmqcBivCF3klK+3/nYdQiPIW6Z4
         7cCrEvGNHNQFNLNFi17XzHmaz/HUv2AVnkdRQI+54C2RoLfZLzr9rYkd8LZABKbX7F2/
         pVViCb+bw8xIyahshZG1d25aJEdj48JCalLpe9Vu87KH4jIynSUVENzpKhOeZuBjBWQo
         Zgkg==
X-Forwarded-Encrypted: i=1; AJvYcCVkjvNyPT9yQa5d5q+KTVo6uzlzko4RROfA+pT7yth4sAROExyPh74BG9iZFcYlTbs29rKqZHi3kbXA8hWqp/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6UwHw/fwIbgxohgMl2L4GHV0VOOoUWOVdPjYjmY6dqqgcUTW
	uQyiIG+OezYaKjvfJbq+G5P8OwIwrxI6zcbvTQoNIGSQqoDVD3aDzbD0oh3P10E=
X-Gm-Gg: ASbGncsssIY7HkIUFJf5gqX5kxWN+w5ycKIs5OZnqtzbxQO1nDVKyWNDaEe09Gw5h4W
	AWlBKenGi/kQigNCyR5cNlweCuTNz/lYwIR4D8IhROxE2SzSo8Bb7rQOSegQOKC8P46hF1MJ1xH
	9FbuaUFJYAjTDVde18yJHMFNxqGarGVasLAmANZhatZAJrn8lhT3QlnIhFZ5wfJhARnzqQoz1eN
	/GDiJjMb27Rhyv8Rz4v2X/4rWxYONvuoSZnW91WGQ8o+NfJVA5DgDBassN5IYKVprimg95a2W/P
	ICAmXedisgw9xcJuBHxGochm5RxfTBY=
X-Google-Smtp-Source: AGHT+IF1jD1nIi0UqQ/yrLSB611MTk3aZB/2hvtf9cDDpXVP93eDIhNTWNWnPWPNHZu27Gv83YTAhQ==
X-Received: by 2002:a05:6402:27c8:b0:5e0:8261:ebb2 with SMTP id 4fb4d7f45d1cf-5e0b70d6598mr16065265a12.12.1740468631260;
        Mon, 24 Feb 2025 23:30:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e461f3e7f8sm788694a12.69.2025.02.24.23.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:30:30 -0800 (PST)
Date: Tue, 25 Feb 2025 10:30:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If msm_gem_address_space_create() fails, then return right away.
Otherwise it leads to a Oops when we dereference "aspace" on the next
line.

Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index b877278888e6..35d5397e73b4 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -209,6 +209,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	if (IS_ERR(aspace)) {
 		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+		return aspace;
 	}
 
 	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
-- 
2.47.2

