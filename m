Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297F1D4351
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731682217; cv=none; b=fu27f518QpcX75uZBhr28QK/wefUW9KKB4wbRvZsuKXlhoh6Fr0DI0F4zcN/vnDcR12Sk9Lmo9nrfMZ7KRjulRex3ED0VhstrjeyOC59r6+UHqdkHbEKCA0blxqJBcaTGjwNpNE1gKunIXNtIKG1QpUGoQtzkDuI1vw6GdisnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731682217; c=relaxed/simple;
	bh=4Lsb2aNaRxUx71jlMDwJrQPkOjGidkS7CHXpbHyZ9f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIO2UFfKgBodDeTNpAE8T5jMFzBieJaSVNcfYI33+eYrcAQO0LXe+gRCUcz3K+nVL74M5Tnjj3xPdGxyLJwWWm2qgkUmvzAydulUn+ChPvTSlsiYFk8GB6ug+QAvzfzUoa22pCzsQae6oG0mIx619JAm63VpdZguu8quyF7/kTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFhfGCzP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFhfGCzP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314b316495so6481645e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731682213; x=1732287013; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3InoUXqD6T6uxxkojh3IT3+QQg3Pub9UoRpvavO2qI=;
        b=iFhfGCzPaezPQtaNY9U9pPFJtBMcYHrwq1sqbUVh921p++9MMGfkaGFuuQS3Hb4kvh
         ZT2rjAGsYI5oiH13MFBYckdhLLcnPWwIdbcMBd9k2LnLM9HkOhmv1/HOFJw/ss4YDF05
         dth/o91Te3OPgiaWljtkZDqQnyKxIHdfl4uvvRxW7yC6DDL7ScH8x1uz9F6CRjC2fNnc
         2cyCv70ZkzrLwAlBaw4uWkWw1+LEIVUn1KjLmFiylcMEmGzxQJo1VZnEzZxiPgBEMcHM
         9ySi7nnZmdgSY6ISdW4GfuWgLqF5zZ+gO7jlFHchtdznMZRT2+DngZsw3RA9kaGy7Isw
         VTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682213; x=1732287013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3InoUXqD6T6uxxkojh3IT3+QQg3Pub9UoRpvavO2qI=;
        b=oGnUrSlC7mabQPoCOOmszEoOgZAxXF6nNjWS7BuSKBReD05k+RMBeBSvaEoVMimPCv
         CleDTfAi0Y9TWklK0x+1tRdRn4PoDGoM/l3OJNvavTvUg+bsIN5OKI6JO1zwxc7+pdXa
         VpaxeIzp7b9Xjd57WDZa3k++4jj0vx+LMejMX/Na8HemQAnJRLO0yfwgW8EUQxWnOY8h
         zMq+WXSCfVUUhUznhaIdqPd5Obr6D3LjFCiEKJECcbiuPkIKRBwepBJ3Kck5A0cmGT25
         NlN+TYs2m33PtPoD7Sa8osYqQWiGzJyDeGgiTcw48cYLmaUsUpYwrTEHl1eUQjVbek/l
         5E9A==
X-Forwarded-Encrypted: i=1; AJvYcCUvlNBcdUU+PvY/T8ms3jBtdkjATW0QxFPo52K2Di5R5yaLQvcBwbQJTXpaczVpZ/02McHWdB7PwatXQAJhNuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXURfheMMhNsJsdG2Vix5RDlN7K/IAk55H7U/tVKOvdBzeVwmf
	WjPcgalKWJgOQaYWyYxWuNDA2+0fQmUQ7N1eI6czvWJOMZb93cUphzh0nmkKeKk=
X-Google-Smtp-Source: AGHT+IELTncAcPS4YEQroY4QuEM9WQoaNiEMcLaa5qSj7F8nR5Z0m/BEZVxNXK2sXlfnW7v/XbGFkg==
X-Received: by 2002:a05:600c:1548:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-432df792d1fmr27540505e9.30.1731682212985;
        Fri, 15 Nov 2024 06:50:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27ffafsm59247175e9.22.2024.11.15.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:50:12 -0800 (PST)
Date: Fri, 15 Nov 2024 17:50:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/gem: prevent integer overflow in
 msm_ioctl_gem_submit()
Message-ID: <7c1e6300-8eb3-4d10-8ec5-51df5d9149a0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "submit->cmd[i].size" and "submit->cmd[i].offset" variables are u32
values that come from the user via the submit_lookup_cmds() function.
This addition could lead to an integer wrapping bug so use size_add()
to prevent that.

Fixes: 198725337ef1 ("drm/msm: fix cmdstream size check")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..f775638d239a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -787,8 +787,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 
 		if (!submit->cmd[i].size ||
-			((submit->cmd[i].size + submit->cmd[i].offset) >
-				obj->size / 4)) {
+		    (size_add(submit->cmd[i].size, submit->cmd[i].offset) > obj->size / 4)) {
 			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
-- 
2.45.2

