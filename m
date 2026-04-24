Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1792391840
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Apr 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029954; cv=none; b=ojMDrTSCgAkWzjKolTB13zNmhGDeDWAwsoEfGe8OuHJNcsJsT3vwNQaoQz8h4RPfyPUos8R4mISYoG+iBSLNPn8brTcp1YoI7NKRRxBfKDf3MSEDnhMEq3c1afF4k/OCu+bggcZ5P31DzMoAETzi2vBIF+ghP91n1xqGhh+1CIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029954; c=relaxed/simple;
	bh=lABDuFnz+YwQcCiLQofnNy8gDQ2d43kUKsMbKEpkLwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WWLUonqrOiLSI3gdeLte9BaX2wpaI9nMcL0gskl5e3sh8uusrJA9UWwduD6P9kXw/zi+8t2mn6gaGPV9fVG5GiZDW7ZhCbqRWPyqbLEZNG+OaoTUM4kfZa3W/PxkT36O6hmepuLK6+7WxE3S4d47o2Em/GeBVStdl9ML+3BkD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njDUbA+P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njDUbA+P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so75376205e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Apr 2026 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029951; x=1777634751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMNZYVpC/xQvt6usePtF/pIytAbShuPrQ+BZzTgAqEA=;
        b=njDUbA+PO3P5y4Z2Kr55Bvq2Lr33zZwPoEUXxvBQGTVGSqq6BM8lWxzfpXZ42+qvJt
         +MbqE/tXrO2z+RVC8NF6azrdKZ6IZvF89zjSSt7CFAHqrpGCF89Oc0tV31200ZLQ54FH
         lYc5DDlLhi92KVnSoOPzAL8W/N52kNW3Y/4+JTMZCOD1v431/gvfnAyJTRdkaXDePsMQ
         PoEHeN9XxJO1eBKPic1CLrX+iFOA+i6Ap8Fb9CLYrUNuH9EZUMJqrt/gbIUHJ+Y+ZWoX
         /tRPqkXwdN6kd8YU6/PZyQ3uWp2LAygQZJ/ukKj3gNHt4DV1fnaXtcAbUgpjC8aMSmZV
         fNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029951; x=1777634751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMNZYVpC/xQvt6usePtF/pIytAbShuPrQ+BZzTgAqEA=;
        b=QU1JMTtasdNe2v1NK88ws7MMZjmRQJkJ3BaF5hah6RH571qwqEfSjAQ+4VyVRAO+Yd
         r9MA4Zk5gtg7WpkIGvoan9FarKDxR4sjeiGW20/OLeBRGUK8kg8t2GqqpwHLvZ3A9OJc
         ltEtUhth9iDvlSDgHYetempPTi2wsstmDhlpqyU0fcwGC8Jt7WYDaQJX2BZGY+Ss80tI
         9YiEAuwkhrRTNubg71C09jTRVQN6q9BN6BgLJXilHs68OtIXJY3iGM+eg9A2Cgt3hoCX
         cdIrHYxr82ccDa5wSvsC5bHcZs5NlPfEF9ITBNjLYPCWjSNMQoLY+byBpfH/chOCRoz4
         HBsA==
X-Gm-Message-State: AOJu0YwKvK6ClISuNLC0eSiVZU4Z5omaHSWIZoklT7b/nJO9aT4BOivi
	aQu8IGJxQQKvlDUOzCcOBXqcerq6NkyblC/82UD2dUisflXPuqaqCfPW
X-Gm-Gg: AeBDievB0lDtaV4KLNf3zDxRtSiXV+5pfs2/dDJbVrEVF50Uplgtap/s8lG/TmVSUx/
	/kD/Lr9r2MvvXCeXsbSuxT3d2TAi/6KRaxr7lNFbIJ9oxi+2oSbygjZ2xO+CqMd9JboGU4BUW6q
	AfogLAY5/t55Uz1Ysf4Q+DSzmPQm0gIEtgq4Odxhk94tJugjGKbDPxzu5Av6Liva+4z2/UQ6kMr
	iJAxuTnBiOJwvv+IZHV+TmKdxwbAGHabW7rqX5Q+Mu6WtHaNNlrM5r20Vs4b1VG/RPHmfSBXnaX
	mZLOwptf6/yLBt8IHtoxeyFOFo9Q/iJuuMwa3zIA7Dd+vnDKLNaIkCCtBqGtyzim2EGKlSBiXMC
	B/y+yJrJxGt/dh5M+PaReBa6nk/O7io2Tk0b4bzi3X406kfAHqyYRGX37tVrvRacbGs5euVtvWO
	4NRRCrk+aqNdIAljiXaNvbhh0Z7hT9tky9
X-Received: by 2002:a05:600c:8284:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-4891f3e629bmr296268375e9.18.1777029951134;
        Fri, 24 Apr 2026 04:25:51 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm406834355e9.13.2026.04.24.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:25:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] regmap: sdw-mbq: Fix spelling mistake "undeferable" -> "undeferrable"
Date: Fri, 24 Apr 2026 12:24:25 +0100
Message-ID: <20260424112425.32129-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 4533fe793c5f..2585933d4946 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -172,7 +172,7 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 	ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size);
 	if (ret == -ENODATA) {
 		if (!deferrable)
-			dev_warn(dev, "Defer on undeferable control: %x\n", reg);
+			dev_warn(dev, "Defer on undeferrable control: %x\n", reg);
 
 		ret = regmap_sdw_mbq_poll_busy(slave, reg, ctx);
 		if (ret)
-- 
2.53.0

