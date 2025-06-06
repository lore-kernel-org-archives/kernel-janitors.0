Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C9E2857EA
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Jun 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200697; cv=none; b=fih5WeKhq6BoRiOkfOW/CplKmy52BmXqiF37do44+8eOIxCmufOSkMyNpDrbAmfzS1Joc9T15MXCYmPysFGSn6/sIEOdk4MjROSZjBGGEXhkL09y8LdHLhOSyIh2f7NIEbBgvScw7Yx+obl+MwrCSqcWymZJyd7UEXHaV/lHRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200697; c=relaxed/simple;
	bh=CfGvj7ncrPabLetrwNG8k5H0Ppg5o++CXB29qT1hAiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kdc7gEKr3Wu4dFhRPrhgbkLxBl9L3XT9tb6CXdnQDLExszagwtCv/xVeGuIgqcvtmKneVqbkdI+1wlRsHHtEI42yTacQfCfYOxLnU/6kCJkugPEo73PuIe5D+2gjD7skw8Y7L7qW+uuDI05a/hrzGXYIPt+5h2o8cSArSAQI/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6zJ9Djs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6zJ9Djs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so21395325e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jun 2025 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200694; x=1749805494; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
        b=X6zJ9DjsF5qprN7O0M0TfvQOs54j8gyvmlXk/7OcFqnIPBI01jJKfiC4e8olzgZBJ9
         8CnmAv5efzcoJbQWvlht/gGiRl87WVonpbNq8s0Bs/1IbrStza1jfLhyOXVYgFoV0o9m
         pqZY1hygRvmllFBPGz3snbK3ZmLkraNdr2KZTjU+xYu0RNLE/R69exeKNCdP33qfUHz8
         oL3BCnXNdioKtd0/eIE/1jbDj7x7zL3y/obJ2Rf0+BhECKGb4Dam8YI5nMrxAGlB8gsj
         rT0het3qF0XIoUGiqvxQOP1iAwiRW1pZbpn7IhtDtd+Ik2kD71L6kheF6RWYbAe0AvF8
         WDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200694; x=1749805494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
        b=jtpUnTFzwXCTGrHLtHWSkBUaNmZFnf1RNPCOLY1B8iopAW8EIEKJ+UvCNzL0sWjPss
         KwY9bDkCQ6+eqNHeIgFK+Y0oPe2YmfwFhPkeTP5ta8SkSc+U+IpsRP3rWgjetiWUF1Es
         HsWVmW8d70hgPj9pTx26rv27AvbHdI9XMb//cVvMtpOpA9gbp4S4Y71YhlQTRboWlEaV
         /9yulSc9Y1lnRBGUFpyZW1ZO81yHapGTKt/ntL6HuxKi81JLqk7Yri6Zb+8KaUitI67P
         ZKTHIqZpGLfoeLMlJo4xHgmf40YubJltdb8VLPSLt9LxOyWjdO4iFWoV8MtxPrrs5A3G
         bOTg==
X-Forwarded-Encrypted: i=1; AJvYcCUPuiyR1iXAnB++/dq+Y100XH3bE8KNPFP+M6UOAeYvuLT4uBWr+L3OMPupESsmp2zuoDSpim6oa3vPL67ciMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRReHYyFCb5T8tr7IUEqwmatPwo81681T3eL/91P8wmEu/zmI
	yo9wP3U6LXyWfUxux9FZ/VC/PfJJELR0H+2EA7FFLLs2GwETaKruJFWPhPC1ZJLrFUk=
X-Gm-Gg: ASbGncsIKwEgU2ficRXoFQWZ/jDdeg+PCDGKtYhwB8kBN0St/xgWh90Id3NRorpuR71
	ThjvxfeV3J2hBLeVn5O60uEcIAD0nKOGFzDJGhXBNI9n1tUzM2alwtQ71E8D151WrASeav2iLYo
	YrXj2+WRxLK5g4+aFABFOVh8enlZk5nlSzDqK1I9gg6LlzQV+iINYqfCxzt97MrTMe9bxsev2Va
	z0zrIjb0qPpIuh6t+uBs8XV0HiWoV493tN3kh4YIrFtCWIzzPvAcfbgI5LitDvvYaLWF1Q6Ph6j
	vaXYPIMdpZT3gCf4adrCGjfkrWS/mPuc8vn0fsApckp6dPwlIAifNen/
X-Google-Smtp-Source: AGHT+IGH8f3CnE94XpqqdfYVCG9k/7hxNJbSdjv+c/qZQ3TVj4IPHFuU+kXHjf6bXNo01qdvKdGN4w==
X-Received: by 2002:a05:600c:871a:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-4520135f5cemr25871865e9.11.1749200693818;
        Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45203e6e424sm17461325e9.0.2025.06.06.02.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frederic Weisbecker <frederic@kernel.org>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <aEKvMfJ63V7i-6xU@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __mock_request_alloc() implements the smoketest->request_alloc()
function pointer.  It's called from __igt_breadcrumbs_smoketest().
It's supposed to return error pointers, and returning NULL will lead to
a NULL pointer dereference.

Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..e349244a5fba 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -290,7 +290,12 @@ struct smoketest {
 static struct i915_request *
 __mock_request_alloc(struct intel_context *ce)
 {
-	return mock_request(ce, 0);
+	struct i915_request *rq;
+
+	rq = mock_request(ce, 0);
+	if (!rq)
+		return ERR_PTR(-ENOMEM);
+	return rq;
 }
 
 static struct i915_request *
-- 
2.47.2

