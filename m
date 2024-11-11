Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38D15AD9C
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315977; cv=none; b=G9OyCxFfXak2jT0yXJXrcn5gWwlpFYdSs06/G5ZWyiMqQG99jlKIHhDFD0ISyo79NktBand1n5UWhwdZbrkB/dmmYkEfE6zZVik6TQHc2KANMhl7Px4pucmtBLVRKwGaX8T1TpzH6Ygp6ax9FAIQMcxDZ5XYyxpDl4vpZp+i0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315977; c=relaxed/simple;
	bh=u5rSxTlaJbSxS6EV4TLb3I+LXVVN2oQUtHH9/BiBiYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVOFfblX7YXPO37M/LfAbnHfeeNx2pvoh/awGnAJ9VO4omsNx+H+0+uTTCjArusQ144ZPdkfc4LZ0bhXZlC8uu8d0tpj/OGmdWiPrWHyUhtzk1il+l0fHKvEiu+3MCJ/iB4FYsrJjVgK4OQL5O3BvZvH6AQQrNCmmnTZsXJELiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsIpSadc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsIpSadc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so557817366b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 01:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731315974; x=1731920774; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
        b=rsIpSadcdHT/SZwQ4RUjEhHL97pjyFmiuQ8Hs6J1dxaQ8r9Z+eqgtwq6DG5EDY9Y94
         p9KeIIUY8v6ADR3K3WeFaHPCqv0MMeNQqQMo7p0kzsJuXiRreKK8ig4rZL10FyTQnDUl
         4R5XYRx/HkLhBjoYGS9o/y0JdCTb1GRr/JxBX1NB3gZEtA1IxhXe7IOUQjmD85xIeFpK
         n4v9FKenWCdyT3k8HfpPHOnYJjzIK6NKSbx+8e1sgP2jWuEWHG0R6ByzcBvxqfu1gxyk
         /4L7i7BgyaeqC+/El85QA4GPNx/6wGvnIQF6TU4lGim0tU5vy1A0MATqYngXjpLE5HsR
         QH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731315974; x=1731920774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
        b=uIoLnJks2e8kifLhuh4ypM6w4TPqtsxhsPzHlcEWcbPHFRDxEiYYTa30tfPFzKSeNR
         RmfJ7uES4wJPGB62uAT4A1QCrZnAFFBLqcGVnZPKUcqHSUYxQlUKCnU1PNGPjRhLlBbB
         QtCduiO54CkMucNmIhCJa0sLnFbeALBhAMP3OPt9r6CIAyuViYBXsZMIO720T05XpHKf
         3OPWaaKHuuTk4iJwq4ScwPby3SucFdaxVgb77vb46w0FfchqXKXPZtjS+SydqIWEsYi9
         1cTC3UQGSfkMHsamTyTFHBC+W8qKdzdcLJDDpIcmFx/kjVnCbrpQlCQp4EM/le5bOvJ+
         E0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU3B56Xhzzglv/EPIT60r5e9Fu+Cv4NtNjVFIIyksGXD02HOPHdd4X3CzE0ZzfykochfCBF19Bg++pF6nAgsD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4m6CGLIM49ypSl3EAG86uAUIXofXPIUv0qzEMr/0aFzou2vT
	MeHYWKiW0L3MnqlSM1pM5YNfpd8SDhVKBGKXP4Gpt30S6XQiSuqfAmem30kR2uE=
X-Google-Smtp-Source: AGHT+IG01DvV4fVYHey4p2gLJdP8gIwgetBzZShx8jJbLbuJv9DbED9jmrm294gcWaav324B9xGGuw==
X-Received: by 2002:a17:907:c15:b0:a99:8a0e:8710 with SMTP id a640c23a62f3a-a9eefee6682mr1056624666b.14.1731315974411;
        Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b82csm579023566b.67.2024.11.11.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Date: Mon, 11 Nov 2024 12:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We added some locking to this function, but accidentally forgot to unlock
if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.

Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61ee88..0bea908b281e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dp->dev);
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	zynqmp_dp_disp_enable(dp, old_bridge_state);
 
 	/*
@@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
 			ZYNQMP_DP_SOFTWARE_RESET_ALL);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
-	mutex_unlock(&dp->lock);
 }
 
 static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-- 
2.45.2

