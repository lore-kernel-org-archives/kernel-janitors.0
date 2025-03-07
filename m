Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF8F20AF69
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Mar 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339823; cv=none; b=hLrNwN3NPbI6NtC2Jq8fHAI1v4qXU9pxwsgCMmwo6BFzFS2YoYSC1tnH/JQb0i+L5VeiSaiDC2LPraNZSnJ0mnHd9h5zbkv8s6LVzsMaMRp4scUksIjKN/cw0zVPo9NnTok2f+IWLzt5YE90lRLrFupbYtNKy9tHzWc5EC07oj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339823; c=relaxed/simple;
	bh=Ai4u6jucrFJEo5fiJus6WWtKhesRZx/NrT2YEqPhK3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZiV6Rdy9nWorVBKaQ4G8a+2nCJhjD2c55oqQ0Uxl7N2BTUYmex8jhyhVsPs29idBKpxPN5faSoQ1r4fETe66Xdf2zo94p9qvvEkhFpjR6n+pci0jH+PyGlW0PEn3nGoqCaUcUfq1oR4U4g7KSmfK+RvPbzGsZprO+N7GgcPkfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDsWTn4q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDsWTn4q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bdc607c16so12557205e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Mar 2025 01:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339820; x=1741944620; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93blEQmxjswWheyXHKesIB+wQzCMQvJ6bucP/eSHntw=;
        b=VDsWTn4qx/JCgvdN9+TYPTjaj1IZ+ww8uk5lWdsZfzUDSYO35B0i/UrnmwcpGuLlzq
         stNmTrMd+H8HdhIhGKIoIGCBBd4fM5cqfXSnHoZKmOreAgstZJKAwfgq5IpJ9DxjE6h2
         wcVK/EVXam2bnd7hN77O+idKL4VPLZeuhOyKx35EQijix/IZl1uqMnJrwZWDINkCQEi3
         1CacdI896HKUOHOMs4B/DupEi4O2zManKuxUt0dQh9s0qA7aE7eUap2T/iqT/j2h4peA
         tgTt1BSqYYUZlILhzX41d/Z9Lg5ajWUXVKBwFf0MpcW+F03WlcNqOTGiW+MAgedH5uJb
         bX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339820; x=1741944620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93blEQmxjswWheyXHKesIB+wQzCMQvJ6bucP/eSHntw=;
        b=UVL1tqSI1WbaOAWe13ImTVfNzD5UzpipfFYotfE1fKJHHuEddIJ/VvdSekQSvsnvrH
         67n849TZCrQdQgOq3vqLrucZT3msyjoamIEkpdJ/LUuOdB4dtbHIZhCr0PvrOmkjaRGu
         r+1bvqygn1m6rwMPZcpQ0XkHElhYvet+l9DpFrcjQakC8KMWiftHdFoS7uohjqTOFx3G
         wCqpWhm1Hi2H7dXgy9LDSv+KyPrbG6xZA1WqNt5bFI0HC2QLrGnP0GIsmvGAGAhL33e8
         JGj59TX25kTLMStMUj4Wye5ZT3zumLxTBNnAtewPkB43D4ygRNtW82zD5Ze4YyKe4rvG
         cDpg==
X-Forwarded-Encrypted: i=1; AJvYcCXSrTUKTDcnmK3oAqsgCPAaF77DB12OLPSzP0qTNupxc2tR6SFcReb1hbqsRyoDA8373HlrGUj/L+WIDPOOU88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2NGY4IGM1CKRPUTwlgQKXVCEranzYavXBUKO5026KNzdSsoE
	vErcPv+SwvlaLdFJnBRuFaH+kgtgSfgW75J3YaZP2Z9n56JSUzOVG3zEWQv/6gU=
X-Gm-Gg: ASbGncu56x4Rv702ovIscSQx8F4j/D5BBkCH0VrT4XdFK1vYAqIkQH8RbN/9JMOwOj1
	mHn9h06nLezqlQAKLwcEoS6yNiumaF1bQ8h4gJCTvDACZqwzpHLNhEA75/5d80OojNwDTMI4jRF
	+r9LflZuI/NLAcLLWqdWFrYuZZx2CvoVxtDxWzD3VXDoe5dmoecKNty+gd7epXKFqSvTQbdhK20
	VqjZnIwQLw/f1g+/FZDPVzZwkf5rItOYTti/iLfSOs3Ex49aSoqO328oN4jbLpPD64/wh9SMs+L
	6kE1jImOoF1NXi9hZzfNQgkbW6Lsubg+7hpctpoIzbmu7uefyQ==
X-Google-Smtp-Source: AGHT+IF7W0BZOmIMpa6aTO/bUCCYodrmELNE8zettIHxeBxOTGRaV6zmqbl8WqRyoPh3IyqfSxwMVQ==
X-Received: by 2002:a05:600c:8a8:b0:43b:ca39:a9ca with SMTP id 5b1f17b1804b1-43c5a60e07amr22236695e9.16.1741339820010;
        Fri, 07 Mar 2025 01:30:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfdb9sm4709196f8f.27.2025.03.07.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:30:19 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	linux-media@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
Message-ID: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The num_clks is set this way:

	hdmirx_dev->num_clks = devm_clk_bulk_get_all(dev, &hdmirx_dev->clks);
        if (hdmirx_dev->num_clks < 1)
                return -ENODEV;

The devm_clk_bulk_get_all() function returns negative error codes so the
hdmirx_dev->num_cks variable needs to be signed for the error handling to
work.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4ffc86ad6c35..e0d3fed87a92 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
 	bool hpd_trigger_level_high;
 	bool tmds_clk_ratio;
 	bool plugged;
-	u32 num_clks;
+	int num_clks;
 	u32 edid_blocks_written;
 	u32 cur_fmt_fourcc;
 	u32 color_depth;
-- 
2.47.2

