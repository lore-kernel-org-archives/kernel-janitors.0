Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0EF43B4BC
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564301; cv=none; b=PBQd5jomAeSlEhjyfTu0mWi5DC2n1e6pZTTRj/Gi4VIDQpC9YpmsfyfjBKMUS5+qgmT3ukDITlwyEw8c4ZjcOxEfhFMJsz5tVwBoAc/Z8xnoGS7m3UaU6HV4fPsehsiPGIJtPc3NF2cU+pG1AsqjtjUV0hVRyVhbrbn10zUBtVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564301; c=relaxed/simple;
	bh=Kq4wffCgczmxpkvQ+z21Uur2QovylqnOMd7I7Oy+mJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fQf4fsyhxtVz6ij8tinNJ/JiGsdB4X18cWrRZeAKyphrsvNMNINLz06j/2cRtTFR+nnzHBwa/a53B+zO52kjdGgHaTXsH8ifGhoBoCBoLcSdHQ8F3TvTKBrlWLNp1VjqGCe+mA4VtmXIzpGk3SbyssJMRTXvOnu0QVrlQnDAJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/ug9Mn2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/ug9Mn2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso17466205e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564298; x=1785169098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGVMU58DedF0lFl2nbNJfL9G9Ib4nLG39lz05m1JVHI=;
        b=Y/ug9Mn2fx8tc9jDla9fRTKznHsHY2ugJBwZ6Xv/KPf/7mL4XxdMmdAQ55zbgaWgXb
         R+Qzye0zW8wOJe52wuGqAaFldoIeYeL2IgSVnex76zGYbwfLFaZeugC5FsJ2Y4b5Ov34
         ph/BZCEh9U4gjDwmJqvhQgpATU1bq2YTOJucJiB94/PB3Ch9jDT2g5Im2pJI5jg/qGyp
         DIW++fixHfpV1oTMk7fQpO8O29JUrJCdH81mAJXmrLnv1u9qrJEVe+4eh8pHVg19SqSM
         GZQe2EDEJXjO4310Tr9rzsIhY1BWHJI+OV8/TZMh00f3Cby/EE0Es61aYOTwHnJwbgR9
         9tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564298; x=1785169098;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGVMU58DedF0lFl2nbNJfL9G9Ib4nLG39lz05m1JVHI=;
        b=lzxc396OPjNVXh5Th9WpCSCWE23Ebudn0ueTsdXi4ZAmCOuTlYW1WUuDa0mJiLLd55
         rv3hQXREd78VUNeLKd7oULnl2U9EgCbNy58rTOJQeBpv9iVrI8g/pBAnvhKWF1dT9YcC
         Yg3NtsxcjYnS4TCxSa6bcoxhtfeE+2yoJuTHwSyMKenlKxSchAOQ33+isdAE0ZuWL5Rh
         dQLlVyGvvg2B+ogycGIyYpaZfYpDbjJZ8g0fFJFvaTPkw/C1lrE8VyBuWGXC5zVToCiN
         EThkEUJ60DgpAzRIH6cGhpZsg2kifaoexFJk1R0WT/6bkm/HW+cxBGUogshD3vppW6M6
         T+WA==
X-Gm-Message-State: AOJu0YwTvWInA4VWRSrrSq9qSyLhsM+VdwiODkANcuG3tV6cguY7hQoK
	Pb3qLUiq4GxLsGZEdXehdpmasyT9FzTDj8dph85gVnzld0pRhNhrAaY1
X-Gm-Gg: AfdE7cnzbctNHaKIy60ZvnjrnIgUlaMrQdYK0MSXzhDo0gG0h9UGDRU94L3+c/EJRhi
	6KJmsphK69kREZ3anJY62qZKA5YFTZT74BRHyuur0VPI7NGsXWYyrXcfOlI2RTrZe8u8DpX0Ujy
	tErv9TRk3W31eiK6/WBweCkeSfJfZ/6qzcujiZUcvmgxrT/JtsISPQ/2tXWJCrpWhSPcBWKevt7
	jv/Z5sOwx4Db8TfOrYoa/Kq2QhM4NvGWGndNAj+8h/aPfCzubtNDdJkt3onCId/K06ERpT62CeJ
	qplmvDxqZRXkT9jPSa7fO3ptP+GyOxX93WQ3zbDRwsTJcUcwz4LaV856vqyHO7NOVZTuzaIyrEf
	ODbkByr0iMiFLCd9VE4MjE6/0QiVrITZeNuncp4XZRKfrti+nRJG5ZhvwB2PXOhYl5cxDG3Uat9
	3h
X-Received: by 2002:a05:600c:4fc2:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-4955b0224c7mr82155365e9.26.1784564298066;
        Mon, 20 Jul 2026 09:18:18 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed2313sm30862995f8f.23.2026.07.20.09.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:18:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/bw: Fix spelling mistake "threshod" -> "threshold"
Date: Mon, 20 Jul 2026 17:16:30 +0100
Message-ID: <20260720161630.326016-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a drm_dbg_kms message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 546d5ccbe052..c71082852cfa 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -625,7 +625,7 @@ static void xe3_add_peakbw_threshold(struct intel_display *display)
 	for (int i = 0; i < ARRAY_SIZE(display->bw.max); i++)
 		display->bw.max[i].deratedbw[qgv_points] = PEAK_BW_THRESHOLD;
 
-	drm_dbg_kms(display->drm, "An extra QGV point %d added for Peak bw threshod of %d\n",
+	drm_dbg_kms(display->drm, "An extra QGV point %d added for Peak bw threshold of %d\n",
 		    qgv_points, PEAK_BW_THRESHOLD);
 }
 
-- 
2.53.0

