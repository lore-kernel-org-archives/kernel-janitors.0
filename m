Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F62DEA7E
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710069; cv=none; b=ZjfxCvmbGX2MbjT2zVFihe1nTDuDWjhIKDMyG45nemgx8KegfM4RzpowB18IYf+1ejdgOeA4jFtXElrspVMH5kAilLDwCbCgIzG/shWqka9b07x6P+Jx5arOiiibtmALdHG3fl3uYNUPoG8utzVliL6MgNnUUdqUX8HCx6VSnh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710069; c=relaxed/simple;
	bh=iCZecmGO+STxbUbkpqNdKtXsZ7KCXVwG0poykSFvFX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fCu4NHT4Py4DEldvieVPuxIr79ZhuphqyKLrsLLtJcNLgrWWIpomMQ1eeAq2GX0yq6SaStrRUhXBzfLWFoMBWpPTSARZiiFLnjIASpBHLBgBkcOR9VnvsLTzKAx7jceaGGpDjz7LBUUC9U0FzAGS+E7q+CO4vkkdLGL6DrpSU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIfdVrrF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIfdVrrF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ef166e625aso3798748f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758710063; x=1759314863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dyqsmjj5lpyVJoV+oaHjMaHdvJL32WXjX0ymuQZAuU=;
        b=LIfdVrrFyzETP/wQuwKKYXe6P8Te4IltzXFRAtw8obSsuQfebLnLSTaQaLJ+IqkWku
         XFF0zmpYghGY9VJdb7x3AnTERiE3eY9K6m4FxP6M/2niMm5s3+aW+wxQtqcH2iRUHqIT
         TXnpyspReaZrPf+qZ8I1a+bHVtwYnCwVnwne2pF78iRd4GqvB9AW+0U+X4t1Aur+LtOD
         Gk6KTcdKFQOFsttqZDuAqfZEvD1wRl1EjnTxK4zoJoDSfNuUk70tSvRXIomcMxHsZWHv
         o3zvRe6AKrXx+wza5OG6Nc/0M8Kz4DE39LM856FraXNKL47ltHCoRWwEUkgneBwYaS2h
         ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710063; x=1759314863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Dyqsmjj5lpyVJoV+oaHjMaHdvJL32WXjX0ymuQZAuU=;
        b=D1d3ntqfKefUNAFs9ujW5HNvdKxNeVVrd33ZGIq7bToYZRqxjv/wXNFZ+zpClWzxI3
         t4JP/BPSp3xJBW+VjgyDj7CqVz9NHIgMtStsXTnJACB+w7KAx8d9H0eCJKxB/22NKvUA
         BLImUdbWMDaZzkFBC4O7hbK1nbqKpXCc4PnZs3nqfwIXZQ3hjV3W5XJl40wwUYg/qMM5
         np4wW33a0k8RwbpQd9zcmpUx4v/YrXeFR/M44IQabkdhyKLf9P/6axAqOlm+cQUciFKp
         DoudQdwrZaV/xutE17al2/tL102fUnUyZaQHd43iGW1vvfrGSJdbDe8GJABZu9LF2rc3
         iGpA==
X-Gm-Message-State: AOJu0Yw8AZyMGhI/Ky56hAhc0NlzQ8570DCNG67eInES1dbRFVMjsrwl
	qRm2alMMO8n5i+tUyrDpvhlITvr/fT2vrk09hBWXKO+fDokzmluDzJVh
X-Gm-Gg: ASbGnct2RMqhUNY51ZfWah7eX0Q6I8HkZC2c8M/vSU4SasLqGP7PtoycQTlhku3uVsq
	JPdRwdm1CTg8KvwpCOFttpBJQkeNujnDuIzzcuL6hYpN8piTVunL1rH2WHEx0Vdd5RLtG+oGCyZ
	FGi8i5lQhq2yiunjmsjjZC/+vrAO2m3jK+DEmLQ5RIvd9HZfcLv+e3CWRVZI5L6ryvck3vqRgCn
	Q8/+yAq0acYyMLtBAGL8nkg5GODsadXzSBm+/ZJw+8XEsuKFeA6rsVLWl3GxRnB86TtbUyFQtE0
	zT9I9t2/e91nGHp6YraRDp3Oc8ZU9jhSLX9vvFoju3ILN8K2gx+pcVwbOZXlYdPLIumzWyJhznw
	N/wqb/kNAs28pjN+F0d7xGA==
X-Google-Smtp-Source: AGHT+IEA4Y4Oswnv4lzMacht4nwo2IDihzUjlV2YSxZ6/wz2OAJZ/oXm6ngVsSDWYTRVwUEndg4jVg==
X-Received: by 2002:a05:6000:1a89:b0:3fe:efa8:7f17 with SMTP id ffacd0b85a97d-405cba9c47amr4576595f8f.61.1758710062608;
        Wed, 24 Sep 2025 03:34:22 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee1227cc37sm25825584f8f.7.2025.09.24.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:34:22 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: codecs: wcd: Fix a less than zero check on an u32 array element
Date: Wed, 24 Sep 2025 11:33:34 +0100
Message-ID: <20250924103334.9832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the error check from the call to wcd_get_micbias_val is always
false because an u32 unsigned int in common->micb_vout[i] is being used to
to perform the less than zero error check. Fix this by using the int
variable ret to perform the check.

Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/wcd-common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9bbfda828377..9fd3965ed540 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -65,9 +65,12 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
 	int i;
 
 	for (i = 0; i < common->max_bias; i++) {
-		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
-		if (common->micb_vout[i] < 0)
+		int ret;
+
+		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
+		if (ret < 0)
 			return -EINVAL;
+		common->micb_vout[i] = ret;
 	}
 
 	return 0;
-- 
2.51.0

