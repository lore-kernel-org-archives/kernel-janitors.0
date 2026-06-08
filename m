Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101937BE96
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921560; cv=none; b=qMx/IB2FR3TJSlqg3WQ4trmacZp4cwA9SFwA54v1kudoy6lIAqsRbjVG/a9vwlChWvJqllAZAlKwsR2rzFy4bZrwW/WEre02ejvuwva+H2JdQNbU7sCsJaxSePsk1IJLCBak0nK8qsCKFhdXFiquRa5nJysL6JlYJOQGXPr7r6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921560; c=relaxed/simple;
	bh=MWsgaJtgG2Cozntxy0sxcikOkG1G/1hY3SQFXFF+e0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=coV78wSQKsJTdEMjD3hlW3UNzuBQbp9dMP/sEDTRgyFbX9omvFAFmskSRXuw9/kbssd2Gj1QisHiUxzaCkpWNp1fyL8qh2BrLUUtF+h1X/h3F8uyZMCsr89zKpIRfWBRhkGfvI+EWdBzzXM6YA/bkUoyBpDMQZ0bqq968sIwACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK+koJs0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK+koJs0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so37659495e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780921558; x=1781526358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HToUuJ6es2zjFw8PTyZUYRF4Q9UIJtuonF67RdPYTL8=;
        b=RK+koJs08hL93jsKkVI/2MT0F2hxjwtDKskuWduC9unKWmIgOmpn1mN3H7LgZKksdA
         j63pQgXIKj4yGPYD7uZGIFSiupNzHRRuxQsQaT0JDpF1QiABQAbqRSi/5qMou9nB80jU
         yt8eBvjPVLseS9lN4j0mZ01nwr0lXtGJLL8B0L7CgoKl/Ev57+wHt7wkpWJsJr2/tVyt
         k+PE6Tr/VgNpU54LsIdS84lj2N6tyflIqv5lLAr+syxsz2QzoiuZ9Yw/P0va/7lwCNHi
         JsJpZBDjPSu2ToV2HJCDh6F3dcvfwyQlB2DWeNWY09jKXaO/VGaTE8pMKE7t80jGHbpc
         MeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921558; x=1781526358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HToUuJ6es2zjFw8PTyZUYRF4Q9UIJtuonF67RdPYTL8=;
        b=QsSECbxc/2VNwAIKaKEdSwXu9x8FEGpucz2RkcbmlKJSQGXdBCKEk4/KDFiwyARzgo
         /L22wHfzj9Xf8iflr/CbJ0MggubItYgvbK0y0RD8PgzX4jono4pdmvftsBfbIaHj0wIS
         mrAWAXd1XodfP9e96tU3Io/e8ykGI7mRJKi0XmMyq229xCcHLUhn7U3ZWyH175/aEg2a
         luWZlZUPSNWKXOeqsQiJRLz9/K8sqLZoYwtITBWk4mbZPywv9gCFqnIxXJoWOdC5Yzr4
         D4yNtVvEj7+NPLSYUm0Fi594rYIpkitmh2LVIy0wVnE7uw74hu0k0zWbhkZWP4SSxTs9
         5z2w==
X-Gm-Message-State: AOJu0YxO/3ieDfGxEjISllmrsLkku6Yphfq8dDTBFo8TblvVPdxV1nVK
	oTrRrIgzXLh/hGf6/y9WcQiRjCPjXvxStUDOeaKZ5qsVI/QcFKxdwIlA
X-Gm-Gg: Acq92OE5uEA43O/6dfmk+8mLiON6lda6sbzkatdfzHv0jE26MnqQ59DdPN1enTx0ez1
	ANzYmIY+jIH938mmwa0DmQC5zTrWRMKi5sdMniwBi2WUZJqdVF6MhqeHn/akAC0SyhNXrTZSCIl
	x2sgWgJxF2L5JWnXTRq/DI6szPbD5H3S1vd/2Q9OrB7N0vILcMjxXRzYABvjRaL9gTACpxwoez/
	HPhXMk6lgC2+0tqkWBN/FYV6ASp7aFXuIaivTgRLu5R8gvzDxguN++lBpA6b6xA6F6EmEoJN4dU
	1X8yFOMU6U3xa2X1PgUCfHUNWOWNnzLgbwPpGrEPSfUXYLRIalot2mNbQsex34Gjxo3Mxujkq6X
	4GFogWpdwh7HDeRtnvnf0YFqPy/4iZdYGoVoL03gqCa8lr8JigOLtSigkUQOv5cvoQzhqcepli1
	iqd2AK40ssiZHhnolr71UyqGzM3NtbKnoY
X-Received: by 2002:a05:600c:8208:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490c2cf6718mr190635455e9.9.1780921557568;
        Mon, 08 Jun 2026 05:25:57 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm94264837f8f.29.2026.06.08.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:25:57 -0700 (PDT)
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
Subject: [PATCH][next] drm/i915/display: make read-only array rates static const
Date: Mon,  8 Jun 2026 13:24:27 +0100
Message-ID: <20260608122427.48375-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array rates the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9076c2b176ec..351a62654a8d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -71,7 +71,7 @@
 
 bool intel_hdmi_is_frl(u32 clock)
 {
-	u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
+	static const u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(rates); i++)
-- 
2.53.0

