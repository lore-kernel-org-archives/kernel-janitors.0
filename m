Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8A2FD7C8
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Sep 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059342; cv=none; b=imedPPibDqNcjaV2DwV2yeT+jRclNIRyVkuXa6ECGAJlR54NBjcubLccbCDb3GzQSL4J4+D+TzcB5WhlG00YFuSlUfz0Tn4dazunmihKFm/1l8xUgjbeJq9xZF7vWpJgQc9orBXN9YH+bl9tNjh5GgIsPqkxc2NapZijsWxbSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059342; c=relaxed/simple;
	bh=tMuqMy9KNqQl8d8FLz0h9ghs2eY5SyYIDshjqoFiulg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAdznT1oZVhoHcVk0CJJ8jwxZUKwFiNBOh4i1MUPtPKDjy+H1Hi1ObLC0KLWs47mnN4+mewp+S3BoR6GBj7Cg6g++urj5Rdh7yWLEdo4iV89sIdoxwmseqLx32cNab1gaES8AIIKjZaHWNawbyIAMVJqpe//6ypt3BEY4najGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mrc+hBEi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mrc+hBEi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3d19699240dso1749055f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Sep 2025 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757059338; x=1757664138; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o68AReBijMNMDf41J3JdN/+EDwW+zsISsfZcVm5zD3Y=;
        b=Mrc+hBEiG74vKaynjbz8krYMALHTRR60CijT/+LLbnr7QO/XrQ8LiLGjmXMc6PS2hT
         jmMkR6rc2gm5p8S/ZtIVZyFcb8UIT22QO4LK6l1iseybtCGpSc6FCeAAFkS1vP3U3t5n
         NGeaLl7jGqZHapKgTycAGx7m+baDVF5pZSLkjflaZ4JgqSDMOAyeN6A8VbOTbnEKhIKw
         615v5RXlb6yPl3hwtiKSFlDh8/OgTtgmCgZ00Htv591QlQw2Rn5FX7F+wOKtXa4eMmar
         H+l9/4z/YVJPpessGNH2kcuy+uJFZ1dMu8RstX8RxnLZhd22Q4IZLkSmTJyAJIHUfNcg
         6l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059338; x=1757664138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o68AReBijMNMDf41J3JdN/+EDwW+zsISsfZcVm5zD3Y=;
        b=r3SBfh2ohuisU6s9FZaXk4kkcHJpS7G5e8QbOIqrEiUPk7GybkHDZd9Ow+dthZMwGI
         HjWnLYWwqk2NgwPsKU0nAPGSGLNOWkilRDIJ7o/nBm/gKMaqDvNoq+UK4FHrOMIPlmDv
         8B1Z4BznzxLm261ZbrpovofkPFhBjBKh5WSX+2cbGOGVPodt5QUYwBsVn1BRiDKKXPOU
         yzoR4nVfXZnV8/1OjkSE101jtNR3RJqP6Tgb0a1y6mJyCiOUUOZy5FeZasD98xFEPUkQ
         OXqEMFdkwlNM5Wq+Oi6B8sBr1+9QyUYAaVutj5nJSs5OS/K78W7uxv4jP7m8NaAGangE
         w4ww==
X-Forwarded-Encrypted: i=1; AJvYcCVJVhRF9mpS8VJgJdSuFfevIYF9EnVPqSXsLw1706+C3zSuv3L/MZ0Mt5bZbBLQLyDYrsP83/MWjsLNnrIu+1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6e3wQu2c7cT22n2VxVTI3BQwCDV/I4IYDAMhjBGHazZFOrWEC
	/NNe03SCTG/n/5dHWvv6b2DGatssW/EeFJNAEnIzOrhlRKLvNJ3NyykpEaIc0OqfwuQ=
X-Gm-Gg: ASbGncuYnA81RYvdJi+yL5jYesFeqSRpffHa62LQ8NTYTmcBXHGZtepc3JlGwLoj3zS
	sQC5QkyY2Y+6lhCbEMnD/oeM2MDgO3FcvmSRH97+bTKWSwgTWqUMWSe3dlzh73h4bWds7ib0n5/
	rN09mdKCBUjPgjNM9RqcQUJXG5i+Mzd3ym6TExr9TpuNanwdf/PtFTbwP9Ew7c4fRxK0Ov9ze6D
	7go90PmVW1fCz/XTe/Fb3oKON/leEhqtGhkKSSZgHbDIZ25Nwet4ALuLQgAjDU4dNwjntvKhUfO
	ebp8gTSeApGVGoCvgUsT3h4/Pf6gF+Oa5ZN32Cjk/VXCfXZX1oOYIi0RZ5IIq7e/Zw5gqn2d+vr
	5jPgxzuKQqCKt24tKpVwBa41aCaPIutTsHnPXbw==
X-Google-Smtp-Source: AGHT+IEUmVHJbjR7C3oIB7RSAsoVRqWkfah8MYKFJmKmkTEM7dD+VYHIgQjg9wCazj41X3C/wF8/tA==
X-Received: by 2002:a05:6000:4285:b0:3d4:13c4:af73 with SMTP id ffacd0b85a97d-3e301d1807bmr1931877f8f.12.1757059338196;
        Fri, 05 Sep 2025 01:02:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf34494776sm30331604f8f.61.2025.09.05.01.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:02:17 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:02:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes.berg@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jeff Chen <jeff.chen_1@nxp.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mwifiex: fix double free in
 mwifiex_send_rgpower_table()
Message-ID: <aLqZBh5_dSHUb4AE@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "hostcmd" is freed using cleanup.h, so calling kfree() will lead to
a double free.  Delete the kfree().

Fixes: 7b6f16a25806 ("wifi: mwifiex: add rgpower table loading support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
index 6d9e2af29a69..91d5098081e8 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
@@ -1521,10 +1521,8 @@ int mwifiex_send_rgpower_table(struct mwifiex_private *priv, const u8 *data,
 		return -ENOMEM;
 
 	_data = kmemdup(data, size, GFP_KERNEL);
-	if (!_data) {
-		kfree(hostcmd);
+	if (!_data)
 		return -ENOMEM;
-	}
 
 	pos = _data;
 	ptr = hostcmd->cmd;
-- 
2.47.2

