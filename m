Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1C270EC5
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596454; cv=none; b=pvZCEAOT92lb0ywKrvTmgi7/ktkIqUtYIq+zjPucXKwhBPuRqCryuCrQ8X8fOtYalNOw1CxFLSxxvRg/wMm3oToPaZVqvEDjeMrxTLiwa4XCsO5XVkkvfMltE/C3VbWywRmr5jzJ3ohm5AnEKTQ0qy3PzjiCZ8i8c6hkEqT5v24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596454; c=relaxed/simple;
	bh=vDQ6sv4CI1XEeY6KKn5PmWXhWFLpuy/IbsCbzwNKGoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuWTgCE60auUO4H12X5bbquaFPVwQrhs25xniyzim0rOaTlOcVLgM7Y82OkOU0IF29b6JiMeG5VJeWIcvDT21OpO6RRD7pWuYl+omzxJRHo1aazW4sfpFk4WC8siECYefl3MCr/tN0I+yISBCWyOqaPNAKOrCIXOHiIJGMMOc3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBLFkH2l; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBLFkH2l"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so34501725e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596450; x=1756201250; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYrVte0dUC6jFntJ2Z5yq1u0byPHu3c4Sgjim0w6WbU=;
        b=jBLFkH2lncK0oYLdiz+zkvISWkebxbuxkA9l6O1B8gh032j0FX8EZ7WnQLXcGpQOFH
         GDDSfv85MSSkcvRVabFi+VQ70740qn7me1T0jqDg/1lrPoLqgB6k7yDH4rJxHDVy2z0L
         96iy+k6oc2AJzYmwwWvI4zqVY4NE+dMwmfUF06w0lioJTWPcVfx98oI2QxPu35/bPhu8
         mgD48tlzcPfsnNxxINwE2ZLDA+MAOmQMD2lnsWPxfOs1RLGmgTRSjZycf/1Y59z6QGB3
         6sNHpRFLhETmQZ9DcStGjeXShX1DZ8yLQj2UIiltR+WDbXCmSwKWznvSGI+Fq2hERDQC
         3TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596450; x=1756201250;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYrVte0dUC6jFntJ2Z5yq1u0byPHu3c4Sgjim0w6WbU=;
        b=A1vwefDqYZeaYaF+1MabKLF1hhpcOg4Z3KeNdqoZAJPSzet8KB0iu5/cpdj7oj+r6P
         UGzQ9oaD+aE7R5+1iWCXw7CtcjGZlLdAPEKTwA9dHZSNBlhawu8+gtOlhPDHYgJ2oNPH
         f6TBJf6W1Fz//Ax5NFAQY9U2ABZxLe6p+pMd0tasQ/fVG8bGkCUjcKvBDnXQ1AKE0O1U
         0e1tcvrjo1XjeklUQdyiYMygLfaB7tuBV8bumDXeXrf9VRLOxXfTYHWrPz6kpzpfC4+b
         KUFOpSYRwy3oOjUoCib/NmGKtcKxaetdisL/JCtdb4SrQtRlhDuH8Hl95XRPlRIjG5Og
         i/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXo20MWbrGxhe2SGAXPs2XSBr5hIAO8oLjXBUp3yt5aVsbUHg0pmMdNbncfVquj/ZBrWQUI3q+I9l4mq3Tvtoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56aBosk4+0GuPuGaogzivPFnzmRy4ugYvqzjRfhVtPDfj8OSj
	YPzWKqQrkEbH/7GJS3eN4VcSfufj4Q/wMfdWxcQdux+jvldlsv79o+zm3d7tDtYhMTo=
X-Gm-Gg: ASbGnctjJHNyqVJJuxiodntkg2ZtrUD25+gBdQlFnyG71ChHXQIIp+mdsiPqDx5mhzn
	SOtQc4XAA9QH+GJrRW+IwT9H3o37j4R9qD/DcDT4CEEffLcIFlcJ792IMyUXrRNDDgAUGb/hYpu
	Fa3vynbzdi/g8/mmKU4Hz6uNRc/ZlYuM/qakokTT+aVFIYOd7E0Ug8jT30jPwHgKcg3BL//hQDo
	1AE9vP9GtoyzMVfd2r95WD7lVsSqwUxQYUl9CvJm1TMOUNmlLCDgYvmXqthH5hQ6SUBpsNwJtvD
	xyhoF1QqveCboRaDZZ1MnUwFRT4mSTO0i6/e/HvMMDY8ujwFDWsCiwBhhPEa675KXQZnduT/tNQ
	CZS4sGLoG1bg4ytCj0U9I/8TbJhI=
X-Google-Smtp-Source: AGHT+IFeIOC78J3eSW8tZNbbpFmELZjsM5rbvzIym6l834NalJLewkysKiN5BeWd7Q9DHgnPdSL+tg==
X-Received: by 2002:a05:600c:c0d2:20b0:459:dfde:3324 with SMTP id 5b1f17b1804b1-45b442bf27emr8207155e9.29.1755596445141;
        Tue, 19 Aug 2025 02:40:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm201653985e9.1.2025.08.19.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:40:44 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:40:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: tps65219: regulator: tps65219: Fix error codes in
 probe()
Message-ID: <aKRGmVdbvT1HBvm8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
instead of "error".  The "rdev" pointer is valid at this point.

Also there is no need to print the error code in the error message
because dev_err_probe() already prints that.  So clean up the error
message a bit.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is a rebase of a patch I sent earlier:
https://lore.kernel.org/all/aB3hiEM0CB8m_X8m@stanley.mountain/
---
 drivers/regulator/tps65219-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 5e67fdc88f49..d77ca486879f 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,9 +454,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  irq_data);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	for (i = 0; i < pmic->dev_irq_size; ++i) {
@@ -477,9 +477,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  irq_data);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					     "Failed to request %s IRQ %d: %d\n",
-					     irq_type->irq_name, irq, error);
+			return dev_err_probe(tps->dev, error,
+					     "Failed to request %s IRQ %d\n",
+					     irq_type->irq_name, irq);
 	}
 
 	return 0;
-- 
2.47.2

