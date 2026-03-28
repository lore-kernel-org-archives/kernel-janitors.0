Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3C2DB78C
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Mar 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712443; cv=none; b=U99w4NhuY06YTI4Gaapdh6evh/Jnp38B+KmvfyRrVcQZjUUwnzkJEAQxxmQKPCMPolxrcPScz8Xt5p/w1H77ru+aHpMjkPm4+Xlv5Zpi9f0Vw4VmMO3GbI9YG3YKs/P6PnE6dGu27jt6Clv0gcfk8tHlsfRtY9ElSaSglsPR7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712443; c=relaxed/simple;
	bh=yf3DwBQd/qW8fuDkls3+B+pLlM7AVooziK1M1WkSdbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KASSMLreyrvYiOKftO7uY5ryw0OSzj+vETJA7ojkQGBN4HgjiZ1o2zuqisFuUAOBDWmeCfrA07feVOnupK5jGRBvBiAn40/KtkSYrZlNzFLeCPaWiVjOqweesuPjD4seQYQVV5YH1ctCjTQVU3iIoAi3GIatQ0hmtsyKP8Sbssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1fNpM/s; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1fNpM/s"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso487371466b.2
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Mar 2026 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774712441; x=1775317241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CG4lhxLbx+R7bqRxSPoGkcp0JFjB9yVrrjNFeLCyhCc=;
        b=R1fNpM/sWsJUajcJ0aJE5zeSWD4B8y0ca9a3a8oP8QPQ5WdifnQ1kS2vJlWDcpK1uZ
         CoDTZMSNVGjYz+nHy0tGwGJsNgodhiBFiTBLQMhORham/YCV7yCcZiAwA9PT/MgdXQi5
         uIN55k+y5gRXS7chUbpsMiD837g9EIVdwWxaIIBY2g8SZxjBxWWYcWo2M9z+yVcZZV+F
         xcvRONUEfbfpNFFuEfBtMpfrQTJ8enqVSASBSwWMn7hDaGeSilaEwGID6syfciC6fXjr
         Q2jXABsEFXL2YkHCWoMTV4mC06+y0Kr0x3+21Hsj1hXDZXfq76jUNKwJyQzCNmexx5zS
         tQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712441; x=1775317241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG4lhxLbx+R7bqRxSPoGkcp0JFjB9yVrrjNFeLCyhCc=;
        b=mFelq79DsrPztbs+XEpywPu1xqfcWjX2YUdHio2Eb0wyw8uJWKUcPBo+dCZbtZE3Sk
         hQr0tcUm2EjRiI404I6n9JrNseAT6Uv9cTqeK+eHxbHBFF4gD6277aYoME46SbiDf1z3
         2T4wP9kM1BFKTUtTtYStcTsne/YbHFKJy3gJRGJG5JsfyVC3NvI119dit4dh9CVZM/ux
         YXf18ZTi1u+kQEZjgWe07tPRuFoRr+03QHFiNw0Eqm6hxwlVOj8R2LynLbxd0IYGzTDF
         afBXemq3hLd+joY1Eutjm1kRrd/bafokZg3vUs/pKrqsbBrx2meWnJNEYFOShXoWJ8BV
         +bJw==
X-Gm-Message-State: AOJu0YzwO7mEF8JhqgqnysYQgI9MhRfwDB6qjTKI0YIGigX8aRbHYPrt
	FjHs82zdL7LblnU5VrTbseHf9KOtXG0lvhZlId4OG7yBcZyRjaxvsxYXlH/MUQ==
X-Gm-Gg: ATEYQzwF2GMI6jGy07jugH6zc3q2S1hrZhiXJGFP3UdI73/n9ABGm7Ma7QEjwpbaPPI
	C+eXrgMphcyLVklTr8kY46M8xyrGMMNgL/yj1itXdM+gQHnsJIu9yeWg3l8lzIGVXqqpa2Mg/C4
	ztFyfiv341+loCmGME8r8AJk12wxDaRm6jxzpEiWtUC74JMJI+TIKvQyEpuoFtsa8U+2xRpCVJp
	7uemj5yV9h392LWG5f+xAd8Ckumu3GXJU1Hk8zBdpg750kSTW6z1K2wnBAzgEPA7nL7eSTXZjRh
	DHe+EkXWfyMzSJsXx8cJ8CSwI2qN4UYmnM/F6tYt6TFHFtok8Aymt6irLkRt1tB1lw8yFopAZfk
	5/q+4ABGVcuGWp2/GnL/sQs3q883zmfMCddQCwmjUAKFCBSANcqP6k8skxRlBEBhmCpsIftJIqx
	C9RUMrOgvdQNO1+a5RlK0ZYcv0Jm2gO8cE
X-Received: by 2002:a05:6000:2409:b0:43b:87bf:89cc with SMTP id ffacd0b85a97d-43b9ea778admr9649428f8f.49.1774701283205;
        Sat, 28 Mar 2026 05:34:43 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm4616645f8f.35.2026.03.28.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 05:34:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matthew Sakai <msakai@redhat.com>,
	dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dm vdo: Fix spelling mistake "postive" -> "positive"
Date: Sat, 28 Mar 2026 12:33:20 +0000
Message-ID: <20260328123320.657837-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a vdo_log_error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
index 0135a6f941fd..1d8375cc3c3e 100644
--- a/drivers/md/dm-vdo/dm-vdo-target.c
+++ b/drivers/md/dm-vdo/dm-vdo-target.c
@@ -412,7 +412,7 @@ static int __must_check parse_memory(const char *memory_str,
 
 		result = kstrtouint(memory_str, 10, &value);
 		if (result) {
-			vdo_log_error("optional parameter error: invalid memory size, must be a postive integer");
+			vdo_log_error("optional parameter error: invalid memory size, must be a positive integer");
 			return -EINVAL;
 		}
 
-- 
2.53.0

