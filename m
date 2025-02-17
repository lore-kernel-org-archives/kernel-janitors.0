Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E31AA1D9
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777538; cv=none; b=Drvda0hrOvPdkDw5r0BMmJqrS+Sem9q3F/67mFmxMEQtLQAqSUuzvu6ilPyZQO9dtinmtmuvZaj257b9ooZHyRGUw7eG1SrofPRX74A32VKTWHtGViVviufux31P1YJX4tPUr/67xE0Mrf7xpRKd7Ctf9vu3v4cbOSZfDBVC+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777538; c=relaxed/simple;
	bh=D1P6HRkRSuWuGIyFa3FIxyItrNqE/YBTIxKXZkYDpZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erlegfQMno/ySjc4iiRAYMzSZu5xPH8XFHZLhC0FcFkGhH+AmwNh/gErJ2S8LaR7XioS+wWFS9u+NlbxTg1nb+O70LOyrDGpet9seLKqY+mVBRaYeCqpUShQlHCKEJXoNVp6s08dE5qHX80LHbt4QoyDIP+x7gQeym/zMu7n7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9KU0cwi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9KU0cwi"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb7f539c35so301334766b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 23:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777535; x=1740382335; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
        b=m9KU0cwiicIeYiizaiCHFyu2MmbjQPk2nn5VQp0Mdq20mf2kJ+F+9Lfe2cKph/Vo+R
         z33sb3x3NZVYSPD0d3Ab85S/88jJn1P+rHuRSSe+u2RO3sQ0//PPS3N/hu/9SajP6+6g
         MRrwf66gM31TmiU5RWwv7Z1GAU08Xjc4yXIwQtnYBO5IiCy3XDBlQbvR17I1UQL1ZHKn
         H/K24yVfO+v2RdkdcKC3MUJKfvbslQhc2pjwT6p0g1Itj9VVv2PLx9RRzc3PeMYa9E9+
         5fnGcrGldDNKaZbJfgmFrLP2ENhoxluMuHwk00katDPwEqUKZMlEMvQd706geiJZsNLB
         y1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777535; x=1740382335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
        b=vfU5w06w3jPBgUTNV5QaSCISVh/x3WmjYjnNqChp4kcTbwmxkGzzBFyQOeXfo7qFZH
         Ys49zqPQnh4MZacVoZgG2KA0aGRV0VdBSUWHcBlyBPoUi3clyFMzVmrYyjbN2BVbcL2N
         827Hs6VRTX0lKeVcsk7+gZMwfql1tp9zvysrcuwwlUGGvGYXSipG6dwLJlBoYKqMSlzA
         dAWhHqvPUJvYPmEGWGJrD43mCTNyiLd4YcX+4Q3fEHClKwqQaswevx1/DZi1sSFDUbnx
         vKkQeGHeG14X5rbIYKvgs49hBeNvSv1n54AYv20EFTTm08HxuevJHZS8K7/ql0OUemdv
         Ol+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQpzJ3CpJx3UiStlo3k40KHoRYyboxd+L8TDTUsWwbMc4N3gaIB1H6sd4seChwOoRC8yQv7gWTdav4+zcbCEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJui/+mr69p5f/MsZ6pWYXSLGFsk71EFLnVBk1DzXM5Z6QAkHv
	w0EpcMi1r6zKxLLcu+SqEyLgxiNue9TQiV0TESuzsm9whp435hTY8RZPokKwvaw=
X-Gm-Gg: ASbGnctyrR8C+NzIi40s3psmueX4f7m/XQRbm262PsGIjNbtZzebmlC9+Z9X9gvweyv
	RTIFyXfVTV7BafJuu2RcGDaN/Lco6vPh9CsSJiRy6venHVpQmksTKq0riKN71yfYgO6L1sczqv5
	UfYZO3PGLV8xk5dzOaYolVDqzeQDLDc2MTH5FDFUmijcAOtlmqO62EUXBubwqRUJObK3ZXXotEQ
	bjG53fZwv79S8wqCXuObB7Hz6NlEKRpoivJZzKGTrItbHlCFS98QTbbg+9++AzTSfe+gDYH7Ya5
	bu2DmTxGXjiy8sz6VD15
X-Google-Smtp-Source: AGHT+IEXChx9P0XiKZoNkZiSog2lL7kqWeWWaA+fbxmQW7+pyPDaxfCj2UqyTeAJOchNetAsSy3KVQ==
X-Received: by 2002:a17:907:c1f:b0:ab6:8bc1:9b5a with SMTP id a640c23a62f3a-abb70da2ad5mr751573366b.41.1739777534951;
        Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba910e8b11sm556516266b.21.2025.02.16.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/gem: Fix error code msm_parse_deps()
Message-ID: <75a78610-281b-458e-b703-57c7e7de573c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The SUBMIT_ERROR() macro turns the error code negative.  This extra '-'
operation turns it back to positive EINVAL again.  The error code is
passed to ERR_PTR() and since positive values are not an IS_ERR() it
eventually will lead to an oops.  Delete the '-'.

Fixes: 866e43b945bf ("drm/msm: UAPI error reporting")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..3e9aa2cc38ef 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -509,7 +509,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 		}
 
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
 			break;
 		}
 
-- 
2.47.2

