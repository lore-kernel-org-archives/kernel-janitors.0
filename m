Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3852727ED
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 04:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758859416; cv=none; b=u8lPDMNFB+24XOhwZNbHEk1lodGYpX3JGzWNoG1oatMZdEFIhffD4uNKNZGMxYNp2Hf2JG/zDjuLFLszwlDfWSDu5Fsf9LBINDlq2iZOsnpH5+2H7qWIm2bt4i5WBBu0+M7y1RryAm/CBiPEpmSQbP1aBFe4z5BMO00IfgaE8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758859416; c=relaxed/simple;
	bh=aDhxeCkC8fJ1lKK66xBz3OEbwpp7thZqdmHZS7jPnLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4vvu8a4bace6LMMaEyV7+NqQJUViEZ+D9AOZe6JY/xIvssTiouyZoBu7dkztNG/0TiDJN4yaQisfqGIoSTvo/G2+w8bYXvp+3ChqBvMM21Cku6gF+8FILaBCYFyJ3qvnsBHBBwy3t5JjlW4DVcSYctxbXbzaZ42CYsj9+dalVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uohg4VZy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uohg4VZy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1627742f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 21:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859413; x=1759464213; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAvxUIgiwZnoN4z0j99g7O5RjAHri0iT1cfvlyji2fc=;
        b=Uohg4VZySZa6WsDVV2omhDyY2sq4dHlJjpLPnFR0WZ/ZlCPIENZRYFszx7GJUsqNkH
         0J0Tf3Gv0brDRb8yogpe+WMhJ8tQ8gOCju5mMKuUgN1mAsq7U39It+1dWlZqqTtkT/Bj
         HRoQVstJHkZGIg3ddBmylNEx+fcgxhJQsIiyKZlhoRFNOc2M1u9u4zQMlUrILkOoX0Mu
         eV/KnAi9c+ijq3cvvwWoy0dBOWfxcOQ+hqaaP0m4Z0b3+Nv9hJPzaoRcbX+G7/cxDciz
         7Z2tjZ+6PFPeG2z7SimYbgAssrzbQUFgTJdqWLqbcu9E2YAOVYLm/O8FmukqRl+B/u51
         zC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859413; x=1759464213;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAvxUIgiwZnoN4z0j99g7O5RjAHri0iT1cfvlyji2fc=;
        b=D+0QK2gXE0oIAAHvUO9zH1FGFLTQ0Z7rHAqRKnEf9zw5RnJcxKLB+1vdFbuhFPOSZ1
         JqHCkRGMxYF4z0SYu9nNuLSjxXahuZln+Zt/os04Ff3YkdgdTW/xdXeOYm+jL+XhqMwn
         +RTfWIjLIEClrMTbLcKO5WBvN4cUzTdQHQF2OkqXyLSBWol0mPlOZo0slMUEbbfQwkQF
         gseS7BysLXXbZ4ch4MuHHZYtLQYozUBi+7tNkntckfmLDghg0wyZtTdoJ026/UOxdlUE
         dDJHBSY9M977iiaX996kbp2RTw7jbTFjKbmJWSx50KNCENBLMMj2QDvs9dUy3MwJUwDb
         F+sA==
X-Forwarded-Encrypted: i=1; AJvYcCV8p1CV7VfXUf5sRlKqVZ0eXnh7/3nAMkqn37jlIiy415xFW6q7fguCmbV4xD39OJ6flsKd5LjUhtRs7BcrnuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbUahy5LtUWk1N7wmRdBzrExC+p6lntWqw2OfQeEjTLogKxOw
	qgTaAJ6jVxqhCZWS1qvZb1plQa3zmxPlibEdEcs8yIKBcRZ2g5WDRfVG2kyOhpZ6Kqo=
X-Gm-Gg: ASbGncuEqQ0QraEXiPxZIFCrSsX0wfhlj6RhHKlWHF6boJU99/rfCwDzry+tt7qNrYT
	6e1thg1n/lcfkje6b+XcBH6tW5FbByrQiuASkEieWBYK92vRz72O7p0P8M46lwpymoTgv2FVW3B
	AzDgyVjAV7WMPt0W04Dto8mBetyoVsVURb1w5pXM9g22xo4SlkxLpUiRw/OoIIJsJB83nQC/tir
	Vk4kt5rqYa9zov2jsoQbE5KG9YN4C8p8v4Bmb3TrcoYSR9kXDn6TOLorRs8j8ANvNd+cmPly9l7
	4pfqYO38+s5BGK8nYD0VGjETVJwvb3cyoFRL6rLkm/VAbT6jBxfbS8P3oT4R/320lGEI1x4VelZ
	aQ1mM2uaiRsmaKlPF3zEYF3QfWuQujBDeRyIHp24+t0VV4TukdQ==
X-Google-Smtp-Source: AGHT+IG5qSGA+zLmaSVai6Z0wqDL5M4a9N7yHXLm/VuFTKV5wrkMZ8mE7n7IYfhWmV2EMBcPnVktpQ==
X-Received: by 2002:adf:9bce:0:b0:411:3c14:3aac with SMTP id ffacd0b85a97d-4113c1440f0mr2029219f8f.7.1758859412949;
        Thu, 25 Sep 2025 21:03:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e33bf70b5sm56361345e9.21.2025.09.25.21.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:32 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pmdomain: thead: Fix error pointer vs NULL bug in
 th1520_pd_reboot_init()
Message-ID: <aNYQkVuVpP3Daq7x@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_auxiliary_device_create() returns NULL on error.  It never
returns error pointers.  Using PTR_ERR_OR_ZERO() here means the function
always returns success.  Replace the PTR_ERR_OR_ZERO() call check with
a NULL check.

Fixes: 64581f41f4c4 ("pmdomain: thead: create auxiliary device for rebooting")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pmdomain/thead/th1520-pm-domains.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index 5213994101a5..d7cb9633c7c8 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -179,8 +179,10 @@ static int th1520_pd_reboot_init(struct device *dev,
 	struct auxiliary_device *adev;
 
 	adev = devm_auxiliary_device_create(dev, "reboot", aon_chan);
+	if (!adev)
+		return -ENODEV;
 
-	return PTR_ERR_OR_ZERO(adev);
+	return 0;
 }
 
 static int th1520_pd_probe(struct platform_device *pdev)
-- 
2.51.0

