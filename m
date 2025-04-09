Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1125DAE3
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Apr 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196329; cv=none; b=D3QeSy4dFUSsu8i7rGIwksfoF63Sa7oONTujaT0lMNAkMuiSrw6V8M01VqUsCaBEoPuDz+N2aHvZRpF1fonJkqNbLepP+p8jfjM5G2PRXjAhgbmuB6ZTxcxuPrrb52EqV0gAN65DxxBuWbD3AgNrE02mc+0UU4o1/LLDqscYRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196329; c=relaxed/simple;
	bh=Beq6p0A0Aj03j7AtotcrQhblg6FIC8rtviizuSi6oIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOV8/Qhks+4WwdyUJ4/TlAfsrODJm6eWPJ9c3Y/qIDNb0R5RkE0y1WDo09xyDDEZyaB8Rwg3Q98Cpqa/i1HNYKa0hdMJQvFJAAKFHMUZ5o94VdndDeDfpn0Jre4vo/InMSHN5SK+yMs7VAsXFJ2+aNQdAc8UIN0znwIHTjptb4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMIaZK4m; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMIaZK4m"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4048817f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Apr 2025 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196326; x=1744801126; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiF3hItZ0UAK/f8Cj3X61O/0nheHKx3BwiQHqAtvtCQ=;
        b=KMIaZK4m2AB+tusrYpYso1uIarovmI17rvC5mYPkUTH2fA3gKybefldLMpqUbuuqHQ
         t+k/BH8dVdTIBQUl+jfluK45wdrdc9luf5lRBzt1v4PxUlEPTv3YxE2HMsagh/h7jaDY
         vl3K6BclRbmdSU5BbmJu4hoUDL4CAnmsrO2X3DtvbuHeTTbo8vCG4V0zG5x6PDTjmAhP
         ms1C7HIP2SqAUiw9BH3PgzGGeKdjK0MEDV6YdixiR3p24RtZGoYbTacQVcW2/B/97PpY
         dgu4FUJnHGafQXZc6iAYkHNMhrpBOt8epHuOc9iK57LaG1LSqShoSCoFe3n/xqSR3OL2
         6p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196326; x=1744801126;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiF3hItZ0UAK/f8Cj3X61O/0nheHKx3BwiQHqAtvtCQ=;
        b=ucI0rrrVioL3lrNVnOvgve0rne1DWQ68F+8IhyBOnqh2ACsMrhrrzdGxsoIqP8249Y
         5Fr9Krr4tUsyIz+Bw7PKRrS5MH2nS4D8+MxUwh5d7FhuKkSkCs0KJ+PSDUKAP07mKXLf
         caYgkgxFlz1GtJPmRDc8loRfxVRPUd9Va3CQ/DZm0VjCNPTmwan3u2QYOjott7qzff0P
         7UdfnJWnLLqTEgFR5lLqPJNdULPoWGsCS5cyVb1MltzZmryMyTrgWL5ZJcnmybzQ9wHq
         0Bf5ajKvqVJ9xA0Ne1DLHzDj3p9OJc1S+YGxhE8LYvbV72kw1iQnbERg0PTSBa+4ig2d
         QZsw==
X-Forwarded-Encrypted: i=1; AJvYcCWmASHPCBLcRPqJlot+ujorfk+QBW13z7RrL/5/Q6IpCINFxjU5bLbTj77xog/QYg5pxVz+cLipXm3OPpLzCYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgUzS/MRYDB0STCfScH31kKxjDv+w1cTTB6chgoix8u21rKLs
	ajFw0nKEIV2gwfPxE1qrCj5yZLOxvmwdYpolgzmReG0HtFy3Fe2hlMFTgy54Ogw=
X-Gm-Gg: ASbGncuadKwXYANtZ94j0R3R39FhMr/+1+7fsAEwNbWB8+jLMkmXffZrS+hqEMN5Gag
	vZ39oEiXbDX6cSuF7UMAdlXe7esryZ45bUe7zVkxmFaHf3aqdoo5sGj/JLJMta1DCSqLTRYTOCm
	lFo62MymrVxkEDJsXot4wly8ThgVrCE7oUUPyl+tSXXk77R06Umz3dnjWX9Buytq+j9W0xUDZd0
	+XI5e7qEFp+X0Jo9kNqJKzRlRSYp8Af5y3gs62vXnSSQ4PCpadoYGTX4v5Y5jA9sdqa4I7MEC0r
	WvEf/yzggN9DvTk31rtv6lkEbRAi3SDosKiiEjR8tGSejA==
X-Google-Smtp-Source: AGHT+IFqdSFJblVZ7boxxxINoAK4ozoRnpThv+xWoaahnbfo9IExrYdlTmE3N6jSm+EyLm0u1m1MSw==
X-Received: by 2002:a5d:6d86:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39d87aa837dmr2381147f8f.16.1744196326323;
        Wed, 09 Apr 2025 03:58:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89378daasm1308967f8f.38.2025.04.09.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:58:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] zram: Fix uninitialized variable in
 zram_writeback_slots()
Message-ID: <02b8e156-e04f-4ab3-9322-b740c1f95284@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable is only initialized on errors and not on success.
Initialize it to zero.

Fixes: 4529d2d13fd1 ("zram: modernize writeback interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/block/zram/zram_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2133488dbfd4..94e6e9b80bf0 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -741,7 +741,7 @@ static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
 	struct zram_pp_slot *pps;
 	struct bio_vec bio_vec;
 	struct bio bio;
-	int ret, err;
+	int ret = 0, err;
 	u32 index;
 
 	page = alloc_page(GFP_KERNEL);
-- 
2.47.2

