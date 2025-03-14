Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F21FA272
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949718; cv=none; b=APWNsyXs2yb9lmkAomkXTQflDvPdTekgiJKvYFisBwETT4wJUJYyCNOVyyufUniVrmp8RMxtnkZSBl1PYxQ+z4Oxviu1yIsby9IS71qi8uka5geyOjAl5ZXdSYUpskVDXXWAE4v17C0WqZ6iBS7m2FTYwE2gtUnO5hkMtZO46Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949718; c=relaxed/simple;
	bh=ccFYrjDHawpi7ROYlL+jckLgHRxPsFrLvnEoHLaQLEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfiZ/ekkJw69FCnHkfo2nsvcoA90ZXpD+dLDfameGXDKQMgy0GkvFPzw5uT6YZbI56w369iQxI4pH9aJHmnBsY5LEirvyKK5o4PxcNgXlAZGMJEXT0XWZVBksJ+R+dFpxkyMRf17Srgb/aXyc0YSlMg8kRa0LOS3N4oZ/9ucHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/dulUEW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/dulUEW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-394780e98easo1263080f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949715; x=1742554515; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69QxnrDX+ARIIKroQoEvmFo1SyKWNr0b2to7TUKNckk=;
        b=e/dulUEWjQd9h0veqi38XinKvxBQAMOOAQ6TNia9b7rteouJl1QkBI8NtFqF2rVyJ3
         1FrLd/O97ZtVKqOxvXrJjyrvlFCSz98irBnQijikeWlEcJEBJxg/MhqOtq2nxNrKBon6
         tx5XcZMPiw5/FIy6MOn4I/sEE8/9ddcD8YBuwz1PM51+MTVdLLZKxQez+2m219qvYJGT
         pgfKDFnPgYXdMI/INZ9IhjuEhX0tjyfYl5SrArY2p9Eti84GXLn4T3sQTWyZ/up0bV3Q
         GRT+jO1IReHIOXo30v0DhjWW6fNHfUGb/rgQU21Of0zivriO56goaqnlnEOlCYB2+juE
         5/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949715; x=1742554515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69QxnrDX+ARIIKroQoEvmFo1SyKWNr0b2to7TUKNckk=;
        b=M1e8G16hGZYHKlY503f4nzgDcPbXqzNSGf4DomEtBTV3AjdhkxEp8YoGRgQVnSDzlc
         rZt24Jg4fxb5iZ52cye2UkXGl9zDk2T401U5+0wESeuQIPw3QF2NINfjTTfZNBLNaGS+
         IIEQux138q3xbsLCNV7cZCbsof4XO2Byy8tbPDEdEjPmn42NCf74tDM1qQMW4xxtIPB9
         /t+Zyc61qhNHz5HXQGfe/FWe9OszsqhNlM+jPClXc6Ozrwik22cHQ4tgKIyZfkL5LD1R
         JWLqgWHo92wl+5K7fOwwmkRZx/Eb3ipuEZ84g3yYn5fb5h93u318SuHxMNHUsnK2tLuq
         Kv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnlhG/hUR8S25zCLhkGXFn03h+ClbinKoTeks2sS4lAdTnAHsAAXuf23Ppve8N0EgNrHuqALxkoTX0Uak7w/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxEtZtUQ8nKlKmCF/PHSytmcp0a2IBUgZnUaGDGMl6icdjB7B
	xFCAPNlt3OUTJB0uG8RsupGyBa4cKRtGTyM4kOLcD3GAv7FZi62pipMry7YzfIk=
X-Gm-Gg: ASbGnctjAfuzsKlPjRpA2hNtmNtJsYNn85uX2f1Ch5k1SHlubt3eHtTFikUNf+1H42I
	jGMYBuDS7nut7uBchoAwz6XNXat0HGcuLV0RNGIs7hHneyRgYG/+SKxV09KWLmYtybjqySimaUU
	LDQHm6a4xKkw51qj7PaLdk80trw2rdXwdxl6WnBcClPWSeQHloG833EwOrayI4Uoc8ClAg15c+f
	slI1OZS8jguPtCgSyZYLkAPI8WRYKqnwjzvYN9ZlR8Cox81rNPWQ8dfP7Mj4QpMAYRuRaJtB/An
	w1XWthEvhsCwRtopUqgVG7BN8bsMnYwJnvYpEb8Ki9yFz0jZVA==
X-Google-Smtp-Source: AGHT+IFIUbmEzg8hVlyMnrgTdM6eNUAOtW5/W1qBKD80PS2iZfgCvSTaSkNrtRfyXIH2NLPpshVzkw==
X-Received: by 2002:a5d:47a3:0:b0:390:e9ea:59a with SMTP id ffacd0b85a97d-3971d03e612mr2341760f8f.5.1741949715472;
        Fri, 14 Mar 2025 03:55:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1fe74f4asm8461655e9.1.2025.03.14.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:55:15 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:55:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] Coresight: Fix a NULL vs IS_ERR() bug in probe
Message-ID: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_get_and_ioremap_resource() function doesn't
return NULL, it returns error pointers.  Update the checking to
match.

Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index da35d8b4d579..c6bafc96db96 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -204,8 +204,8 @@ static int ctcu_probe(struct platform_device *pdev)
 	dev->platform_data = pdata;
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (!base)
-		return -ENOMEM;
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->apb_clk))
-- 
2.47.2

