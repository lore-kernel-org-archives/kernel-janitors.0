Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FA170A1D
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723458771; cv=none; b=nz///FSePii+URnL8vApfl7D/s2hj+jEUmN/iX6hw26QDHsl1fcTSV4SkhRXPxAtgtMqVIcbEzb5u/H3Xe+Z4d8ZoKNf5pUYZ0JsRO2XgAfIN82p6dGEBM047pCESQDV+qCy3EbgQLkQF7ioHpcWc6DRlx8EVfjboBCnNaT/PIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723458771; c=relaxed/simple;
	bh=rSCBaIXJPRajVS8xJXyFx6JrCeK2HqadPitU/xd6N7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoZB1ox1HQpTjvOYwclo2douxHc+o85/j+ZYq0SbUvXWElxM6BXonTWZgljbej5rx+eEJ18ZDTydA7RbjcY/d/ON3/AstV4rePkLcXdfWfpuHOHODltd9F9Hs3uhdOm5O6HvLuJzwU9LGSEdYnXJyD+w4McYUxuLqVaU4rz6tNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFneBiXq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFneBiXq"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f025bc147so4757385e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723458767; x=1724063567; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1IfJ9u3yUX0iZ4jMFGItrUi/pvd+46Zvfr+ViX5sCk=;
        b=YFneBiXqyMRD4q8pRqG5qxENFcul71xLC1DuNdGfKSUE9TsZkOrRUhuP4jHuD2x3Y6
         x0NRGs97rn9D5TrV7p29oUoMHFyGShc1H+y32pIiJwbqxzkRIgTUEjmjPpXPylKAl2/F
         A0zyV8p3ywc/ZPGB3geyFi+V4N4j94L8znNc5tZxfzH3bkO/Hp4c4ytCyu0Y2WtBhL8j
         V1AwEIp5h4kRGb2h8dwbktmEKwYTKQ4oUVKqXD1d7wiB7aRNUxZg4YyUB+baG2ZWplfc
         bj6cBbu5nBF3R+d4KPchJAtQ5jMb300PGLB8QeVbZ731DL4xt8hgdVo2PSAGkyQISpBZ
         FfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458767; x=1724063567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1IfJ9u3yUX0iZ4jMFGItrUi/pvd+46Zvfr+ViX5sCk=;
        b=H/AYliwE0HOHn7MgfgNynRmQMNYrFfgq1gnGh0e/BbgjbQipyDf2W6hnobYWTDYBr5
         QLQdpeWQRyt7pW5nK90uR2kcbsKslJhokNZS1DqUSHRnz/1ieDsf3VDI1GBfKuVK2r+5
         Webxu4dNMYYO/RBYRItwejj2Wfx1/1tE5TdL3Kdh9xYAT1+GhrlewqwLtkETOVD+LpyQ
         M3IHGQHmRv9fhnM4bNOnbxfChN5BW31DQ24cy2PBcj4Bl9jjH0Q+jlVmAv8LY/LzB1Yj
         D9ZVwOgQK/r8skq+qjVNNtYC04ENLObT/DdxMQuPYtg0RUxnDvg68Lr5L6LZvWdXKINQ
         KcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE+VhlWm/qFv6BGJVvBcVq4veSOU8DioD8g2X278pPwYz01lSv43rfk/eKNRg3Ww0U1vwMD9cU+dj91FiysGMRgcYzz9iqzmGp30v34Krc
X-Gm-Message-State: AOJu0YyLO6yKOjCo9hCNzpPVLDh8Kj3rIddWnciI6creHruiW3DeauUi
	F+XHQASkTdIFfo3QS9uj3KXSL+82K5APIRxPfSlntHcqENDwCnuJSaKrihcaMsY=
X-Google-Smtp-Source: AGHT+IHzgJxlWNmlpbcyADFmPoi5Gdg+YYXbOVyXdQhr3/VvVj6WyK6nEwaJnWhwJoNlT7DEw3b1qw==
X-Received: by 2002:a05:6512:ea5:b0:530:da95:b54c with SMTP id 2adb3069b0e04-530ee985dfdmr5817998e87.23.1723458766440;
        Mon, 12 Aug 2024 03:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a602da2sm2158926a12.93.2024.08.12.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:32:46 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:29:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3] drm/ast: astdp: fix loop timeout check
Message-ID: <1ba8da25-2d09-4924-a4ff-c0714bfbb192@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code has an issue because it loops until "i" is set to UINT_MAX but
the test for failure assumes that "i" is set to zero.  The result is that
it will only print an error message if we succeed on the very last try.
Reformat the loop to count forwards instead of backwards.

Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: V2 had the same bug but just without the always true if (i) statement.
    Remove the final sleep.
v2: In V1, I introduced a bug where it would msleep(100) after failure
    and that is a pointless thing to do.  Also change the loop to a for loop.
---
 drivers/gpu/drm/ast/ast_dp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..ca022c287785 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -146,18 +146,19 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
 void ast_dp_link_training(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	unsigned int i = 10;
+	int i;
 
-	while (i--) {
-		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
+	for (i = 0; i < 10; i++) {
+		u8 vgacrdc;
 
-		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
-			break;
 		if (i)
 			msleep(100);
+
+		vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
+		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
+			return;
 	}
-	if (!i)
-		drm_err(dev, "Link training failed\n");
+	drm_err(dev, "Link training failed\n");
 }
 
 void ast_dp_set_on_off(struct drm_device *dev, bool on)
-- 
2.43.0

