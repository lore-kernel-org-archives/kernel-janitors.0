Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3BD2DC762
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Sep 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757794615; cv=none; b=Rb5l0GpZ2OM9C3FqsvrnYQbs+sK5sqqGF9HT4u3SKiDOkEqDWHy1v6ixwIQn5U2569A9g7n9qNBVildEtxp+t6k5hl5N3Nn3EFFg6JJlcJss9ONjb90FDFOeMubJAdlt/+ykFacc1yqKjhme1AHUpCvfHsnkQqQ8NVeJGEupads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757794615; c=relaxed/simple;
	bh=FWdFpDZXgweIgfaXmSGMrKPTFYGwmCSWLoLB9qphSGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEz0MePbqsWYRZ549m/UWHvmRUFfBWB2oK7iNnyuorfF4ZsygQw1LiS2C6fhlOSXNTLv0uT5Gd2yfKuAyn7T3KnyyDjn2SPt1ndiP3rScIv9OY956kquJuauWBg7wWjfubC4V8oBsAWFcod4zwKDyPfDgjxLPUduXNWdERnKIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkH9y2yb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkH9y2yb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so20810745e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 13 Sep 2025 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757794612; x=1758399412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=FkH9y2ybKE18FNKhDndmsYxvTYUISKvPx3eEZ7WQVsHSgzAdAorQifVzsdSRggBIlA
         iIxScMSQ92KDtJeuWeEThjPFq8e6jqQTqkO0UCWvFzrVAjb0YE6w9v8QODeoltrHJqoJ
         +sOnxmxYS58h4zs6l7flow3rJxF4s7zvIjJvTJvqaiIvRyo0KC/drWpO5ZfeqAX8Hr8P
         9tYQVweKAdbC4+TgJMPZEQIh2Mul7f0LDGS/I5QljP39XqZgexQ0hRkneZ8r/CxEewJY
         hW8R6L6JTil/vlHHMTfdfTAcyQgZ/EnbVdKaE9QgHMwSao2VgkTtUgBpg4OA1vS+fOAr
         75XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757794612; x=1758399412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=vDoFTsHtR5V+5K/+C2yKLMUv3HP3Kc0g1amu761ieT7XyTuXGr2Z+QwIFdfmD6+Rmd
         c+kTwngvx/5nkUAqxI+umNB+ysCImajfIivAGnwNeT/vQDE1bGAmG4iIIHWHF+V6PXc4
         Qqvfr33rMhzj8TDDEi4lRjWYHRJJ66MzVt0qX0d/m0ncgaOlJj0N+rDGUSz7KjloHw4P
         beWmwbymdZRukh7LFuRUDqAR5cAXKOiIxHRfZiELe6aik6QaUgXa9PzMZT3RHd8zFC5k
         m8WgWL3hq/v0ZqMz8coO/TfqSzPX5lKXWBzERZRpU/fXT1rz9H8YDuVz/cE5XvGp0pgV
         Auzw==
X-Gm-Message-State: AOJu0Yw3ZKWeEpXPSCN/UTsR2Vs+Se/aC48zfpP+Myaku/h1jy3itGod
	Pu9DsmQQmCcBfxLtHWYuUy9lOK0MjPfje5DegORQR7YoBnqk6kGEdjBd
X-Gm-Gg: ASbGnctI5PL8I+dChEDRLjixgynOrJSznaPTJP/eQaxaLlUCj5xXiuPXyJUA3GKEQjZ
	I4pXvAYJi2nhZgLpD9E+3zWlV2d8MrxdKEnkBsbqPjN+HkWZdBxm42fCEVz4CYs/nt6rMUxlHbv
	zfWfI6+OSF+YB2dJb18wSsHbhyqixLK9lP9mHwwklDk8tNRt0sT3r8EXMM8cyDQIsoEGfXkN3US
	HiqhjIZXJInC5IuNg2uhqi+0B6pjaWHY1QLODZIVSEQekifN5g1ErYzV92gKT5kUbE8AA7AhIga
	gMJ+F5hvjrCKf/MxrFCHhWmW+m/k78gZitjobOY9VjFHK+3UxHmVAD5UdyXEokKEFMB20wUpPDO
	yiFlW0/Firc5EhNkdSq9kfnUwfcijeVL3
X-Google-Smtp-Source: AGHT+IHM94ZQbz7LSAD6t0BWLw0dw4XltmvObHjg9ikAWt94vPnfOCsjro/zNpc96RTnU6ULUDYJDg==
X-Received: by 2002:a05:600c:1d29:b0:45f:2aa0:cc07 with SMTP id 5b1f17b1804b1-45f2af44393mr1464885e9.29.1757794611659;
        Sat, 13 Sep 2025 13:16:51 -0700 (PDT)
Received: from localhost ([185.63.82.103])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015bf73csm57532735e9.11.2025.09.13.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 13:16:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: amlogic: Fix error checking on regmap_write call
Date: Sat, 13 Sep 2025 21:15:58 +0100
Message-ID: <20250913201558.1338180-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently a call to regmap_write is not being error checked because the
return checke is being performed on the variable ret and this variable
is not assigned the return value from the regmap_write call. Fix this
by adding in the missing assignment.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 4ca8e82fdc67..4338d00e56a6 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -420,7 +420,7 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 		goto out_map_data;
 
 	cmd = CMD_DATA_ADDRH(sfc->daddr);
-	regmap_write(sfc->regmap_base, SFC_CMD, cmd);
+	ret = regmap_write(sfc->regmap_base, SFC_CMD, cmd);
 	if (ret)
 		goto out_map_data;
 
-- 
2.51.0

