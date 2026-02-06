Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD4367F56
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Feb 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385139; cv=none; b=HW4yi7eYKMuq2WMfzKRDhLZz0DHGrS3couO22jpM1Z5D6SXaOHZWKJM+PeKZej8PYRAT3goDe3EqpyM+Mp3iRlvSS+0+7ru8ioeNqlIboRkEjvnFNK3fznf2Q11mKG28FZYsLpz4qye6E46Zcryc6fOFO3AJ+03BXsMm0LTwhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385139; c=relaxed/simple;
	bh=ERjqnIJQfjdU3wTboUi0s1ea02FFt7jl7kPzuva8f00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o44b4JaqgXNxZjx9pmYzh5alAfIFG1QC1wGVJR4qWtHWNcA4g4T3aIVDwEWbYOMKRGxUB4nu5r/IIb7eX6jqgOzO/Z7Zw5Vf5jL29RpU4t9zB9CeJhet2PpMytfDzp5klDVx8fb9bTeUXOVJB72Vq0Bs73KquCQ28SPdA8AeF7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uo+F0svK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uo+F0svK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso13911935e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Feb 2026 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385138; x=1770989938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xSVsGkI58CbZq2nCLU80bXxVw6qpW/ZiID0uMzovT90=;
        b=Uo+F0svK8uREZAuKkmyM0sYMsdB9PA1olouTZpljd7qFCkt2KtMglfhOk+PXQXuRQY
         8qL+KZxR08o3GIwYBnV5BXr4+emlyRJ7sDBGhwLnxqO2zzSY/Tf/FRTw+KutwZT+nuir
         kXV27Ej5APaJonJFUdQjyKzp99lp+mwMyVCXyovtMXElqKbt0+B0WQwICz4xaHIKZ3wa
         zfBsy8EsfP0EHcgc3sOIzJq8lDtzutNekz0QnwnLgK91kWBZItkM/dxY9aRL/78MwgdG
         1HSwbHT3r2LkL+E8E9P9R+viWi5kVBGmSvHD+BHtODU9ZpzdclrhExD2BL+x02rNZBC0
         lXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385138; x=1770989938;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSVsGkI58CbZq2nCLU80bXxVw6qpW/ZiID0uMzovT90=;
        b=EgK6DqEzQkVqsgTzQQI4Q36WppQzle3NQaxDyyjIsE6rjBcrIE6S4abrVPtDC5azeK
         KFBiltThKwkTvcXLLPSwXzFOs95vGtnI2gt9BHZnEHymhG7XkdcWvuYRb/Wxk1OtlzOl
         0Hlgc3BhIRDt2u0FiMxE7zYwhIDOe8/NwWELqGg/KfLhz4/bQhxvB6SHYtJAx1CAriZ2
         mOCwNz844UFDywOQ94O+8xgFKxccjIK2/NoHqypOmqD41p1bQMPM9u+C38h+nCpQ1IK3
         S1f0BwRzMT4J7unBcChQ8urXEKXXg+SB/Gb2FmW4Zk5LjtpAhkMuLijMUUHPBKPuX1qf
         chcA==
X-Forwarded-Encrypted: i=1; AJvYcCUlWctzsgokEZu5QIQnnGviFu9xE08EQwg33Wc1q6eEUt6qyE3zZr3kC06LsiATmEVckl2incnTXOj4wDCb+Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6PDGEP246+Nc1h7aX71o80VA+ZcvJ2yNvDkbRigGARrFjlo0o
	zr8+Ss6r5yEP1gW8aRaXYXovGlQJgnLBswVatTwLyuxc6fLaZgnVhfQ3/w4eAsl4+j4=
X-Gm-Gg: AZuq6aK+XeGW7uNK80z8WlnwBHXVHBPXw2YgEidL8w5x5FRJGYzBqWX5WUHRSIfbMup
	aTJlXmK2n/rh0+Gg3e9u6tgengKqrLWP8WCUgdJJLVXbSbyzTSEOOkzT+A35MdP46To0b8YzHhB
	4abITZFQHbaNzudn8+8ir/tiIuQKmlofsmH5Jmk/3vSFKTboY9Oz+ZRnB8pJPGh8/32/IfU4LcM
	xrN32YANNMMayH3x+D0hgmtqGx5mkeUUM5sgXH0CsydNHmN8ka+3Yos6aiAnOk3RJYR4GuMDHWg
	LL8IYKzqTboqoJgTpg4v0Jogg3Mu7/4AvkgF+InYIPbvQYIqsWQU8H9caF2D83vCuL+EisAQkHE
	HqAyYhHBJjUE2tQQp9W469ywz+UHgujLGTYQPTzqGBOO4zQlLZgLhSZZVqRYvdYMvDw/7IsJnnx
	alJDa5+y4+VAN8aB9N
X-Received: by 2002:a05:600c:470c:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-483201dab23mr42682665e9.8.1770385137793;
        Fri, 06 Feb 2026 05:38:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm145755e9.7.2026.02.06.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:38:57 -0800 (PST)
Date: Fri, 6 Feb 2026 16:38:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
Message-ID: <aYXu7uqMQdZRMmQF@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Mailer: git-send-email haha only kidding

This was converted to a _scoped() loop but this of_node_put() was
accidentally left behind which is a double free.

Fixes: aa8cb72c2018 ("mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 54c49a8423a2..6897ced2d57b 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -403,7 +403,6 @@ static int hisi_spi_nor_register_all(struct hifmc_host *host)
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-			of_node_put(np);
 			break;
 		}
 	}
-- 
2.51.0

