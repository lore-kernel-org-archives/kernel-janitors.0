Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238627280B
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759093331; cv=none; b=Pl9ebvTkoC6O3H3zM0/azJ5R+LCVos2VqmG1Jj3BLlhbchJD2INnJfeY2UdtQEGS35cL8wWJ6UVi+ouSR1GgCeO50SCz8tsbTn31xObHr730iehT+g66GkBwfP2t2vwL/9i7aAkZUX4AqmmASl65wWnM54708OoFl87FU41kNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759093331; c=relaxed/simple;
	bh=7gRqA1lzDomVvZ9HdJ5xM3tJEYy4qZM4Tf1HKy4xaKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YsYmCUgsxGQLSTUPJbWiYQJF547x3EMNihmz3zgAzxVkz3TTIBKu/See3+rf/zpikfFx8qlbOdQ8P1aFZaIW7eYxcAaRL2TT4qzsQNZsMY8oKZaCiet16Repea6OnnkuLfz9b+LPvqkHHl32nd/v8HkcX61ljYbn/xicowOp/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDp6O9gc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDp6O9gc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e30ef74b0so27949255e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759093328; x=1759698128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxkm8jE9ToiUS31/wtNowypDOUu8isLYkTQLRPslSVU=;
        b=MDp6O9gctyCkzhG2JANeh0QornOvlUp1gnGb91FKsoLnB93AVLOQ73QBg47oZKhnlM
         +G+QHc2RaGPDfZ0WW9RxUnX8fgOT8boLlthN0zCjsaeE7D5W8b4dYBA5PcmY2mCVj4cq
         bHMw1xiY8ccffu8engHLoR3tBGQNbWZbD0e2CwAAh6jZuO0Q7AgTvSY9moANdqzxQ7DQ
         m0YfbLsCWXxxzRZnxsUEO6UFfD2AxJFead2y0Ks/koaydi8c8w1RhqjMBkl5Ykd9nCqL
         TkQAu4QMtI0x9onMWM9uNZuT01TM/NTDoEBLn+EoupWM012lwTVKMzIu0B5zrUeyn5Jg
         s9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093328; x=1759698128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxkm8jE9ToiUS31/wtNowypDOUu8isLYkTQLRPslSVU=;
        b=Qk4R3zH3T/PE7wxhJ5ZKgKmzjBNlxLlmT8Sz/bT0tteIV+Cotw8XFC8hP+LqTIDxTh
         HmSoQeVGBH1HR1fYW1zQ/bmQlWgS2SgtxWoclGiixUy+OSUJwps71y2B6o8uyKCXvomE
         +awdWfKcEQgieYYZNCVVDsue5bKNnW7WlNm8raanhRKGJOd7Sa+vSviKTF6klrqzHNbO
         UFwFdSkSLLm0OGgbr8xKfV30sdNH/QWrBNp8WRM76+Q6JN1NTxmQxl55f1J3pbX1+3Fl
         bxlP5Uv6R8TcA/15Y0yr+xPoNf1Y0ts7sVz4Bv3EDs6ruA9SbmtkXoo/UYU7Us6Y3bGD
         J+8Q==
X-Gm-Message-State: AOJu0Yw3fQF/MkBMlPtvJhw38ei2fv9c31W2vxTnJ87O/q70k7PbpUoF
	BezXWiQcFxWSblMVdbxZQEsznrivpE9200cwP6x116m2jXBVxuzpYkXV
X-Gm-Gg: ASbGnctU9Jt6ad4lwIosfEi1MdoE+EiJFrRXzf3Sn8nZp/vf6/fN7KLhnN1hTn8AhMI
	cMPa0L0poX1NsRlwM93PptxbNPkK7QyohVxAqDV3uT2738EombFXoJsL1o9VfwG69eZdns5aA+R
	hWOagM7AtF9jvqO2268UbemQjQk0CJu7BlheOdCvdpNfa8MV/tjDCukceYr8+ZxigJ2FgQZVL7e
	rBFf+zOJPR+URiM/3lYLrsrsYwyTqb/PY1GeJ5WFogEDky3nFX2alQMx/kOc00RCNpnjV7tgshS
	iiq/pgNf9QvOpmpabnLCbTipvQ6Q1XdLoNfSY1Ksx6IvI4VfjTZ6Q8h2U7jqutjjSHv9oE/1E0B
	hxh+OYktya3MphV/SzYzEcw==
X-Google-Smtp-Source: AGHT+IE9CTRtnxkm6JMDZSimOuYV/5weeNvzrjUJ+0Z0yRZI1GfxssHnK7NaXTSzkYrHfFKdvuTsjw==
X-Received: by 2002:adf:e6ce:0:b0:411:f07a:67fb with SMTP id ffacd0b85a97d-411f07a6bb4mr7969797f8f.55.1759093328488;
        Sun, 28 Sep 2025 14:02:08 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb89fb2fcsm16366786f8f.22.2025.09.28.14.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 14:02:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: hid-debug: Fix spelling mistake "Rechargable" -> "Rechargeable"
Date: Sun, 28 Sep 2025 22:01:18 +0100
Message-ID: <20250928210118.242631-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in HID description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7107071c7c51..438a12046e86 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -2523,7 +2523,7 @@ static const struct hid_usage_entry hid_usage_table[] = {
 		{ 0x85, 0x0088, "iDeviceName" },
 		{ 0x85, 0x0089, "iDeviceChemistry" },
 		{ 0x85, 0x008a, "ManufacturerData" },
-		{ 0x85, 0x008b, "Rechargable" },
+		{ 0x85, 0x008b, "Rechargeable" },
 		{ 0x85, 0x008c, "WarningCapacityLimit" },
 		{ 0x85, 0x008d, "CapacityGranularity1" },
 		{ 0x85, 0x008e, "CapacityGranularity2" },
-- 
2.51.0

