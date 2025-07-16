Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA776026
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752695029; cv=none; b=nUkoVQcpl++9RETouX3TXOuexySXLzQ+7mRXGBnWcc6x/leVYkgShQ/SJxaR5TgT5Ms6dkXT/juajniqTir/imq46OKcXr5rak/TNgnFENijmMukPTz8x3k15D6x9SKZr/aWACSuwh22Qiu+Y1KIFYh6JcUTFixCLASQ5je2Xto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752695029; c=relaxed/simple;
	bh=pXfjGryhHsXaEwigYLwe/P3+EpFLiYB6sbYadjHApPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOMfQwKJX0oVkWmFhLSQT9KNv1ai8ztJDMko0kt2HK7gNVBZjWeAk3MiRtmdtDIOH+6EYba0NA2sm+ZYT0pN9+ZEa7zXACrNpeDITyV94CJCf5HDT3tmKhTX6iSSoWMdCXP+ELr+we7W9MRVNKYLvyvYFASOysQy4W2TYmrIMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGZqs069; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGZqs069"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2e95ab2704fso192444fac.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752695027; x=1753299827; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmJZX6J1qRoq7AzSQMCUC8rTJXTuje9Df69FamNPBRM=;
        b=RGZqs0692df34ugkghm93d1RCzV7NdjrQSOhfeM6oogPG5+7Ay9OprEHChizk16PPr
         /tjnIM6T5sHHJVcO5QTQGCshX9zUtP76xPNJR2DD1ngtvaSSoLyhO8OJxPcOtfOOT2cy
         H6/Kexs9yHN2qj35Nb9irIxsLrPGBsXrGUgOOoRyo895dJynKlJVKdQ8KzQuFBZ2z5pW
         UJ+rI1XleO0Q13QTP+wg0BHU93gOmxlhxFT7KLQHg7bzuouC0vc2Rh5KukEmKH3ixfAt
         165x5bg6G35PBwKlSXFg4hQ2RbNAxOBTJjRuFaFPyEmR/e12VG97QCA6byVfUllNIzkM
         WpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695027; x=1753299827;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmJZX6J1qRoq7AzSQMCUC8rTJXTuje9Df69FamNPBRM=;
        b=Pmj28nPFhNinDp0NsTyfdTnmaU8WCuMUTpDNzoxnUYOolwPaQwZiWa9bs+ypZSJP3R
         tsbgWFhtoC7cluJWm/yvPJ3bdMQV2+O+QA6+QDH/fhj4q3taHptBUMzL1lFi4G9aI03/
         cPfPIb2nQtCtdmzPI6xDujJfDsmHW+alLZVslQmPWp7TY/r3wPQ+gURTnYwP8ElPFRwX
         gCnHGtWCQpo923rnkPigz5FcdOJ+Q2DszWeiURpm2Si6spxoxLm1A4uX3quApDd3hntX
         twh3Y5GFNw9LgkSaFYQjykAG73Hh9FCgpMu8Nu8id3kTL9+vdvnAVx73kAx+SkNDELfn
         T1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXZtGd86OcyViQIc9tB7Ze3jH/RvuTm0HfFeilZkuSqbsq3KcpSa5wiccvs6N6qunI3ABGMg9MQI0Y5u91eoZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3AhCdoWzNCXVt4o0VcFQXct5JxEs+Zbf+dzq0yQpY4Vi+Vwmx
	CWMGW8nKjUZZhSgnb373kE/Sn6a4X33OLaUxKNINdTWDuDZMVsJGJ6aez2SpAB5sf7I=
X-Gm-Gg: ASbGncv+BncJOjOqM7wvlH6ukIvqQfP5mn2krkkNBU8Z4/G5Se/jQN9EIeUKCaqTqhW
	fPR1aagj+mpdNSDypLGMZjyByob76bVYNHzFh+sIzno7mq7vzjoU7FanNHizPCbQv3nc2KRjye7
	0zomGz0osFxKuN43eH4T/EnGxw1BiTDEhJ5d6lI4UsdzkMBvcDl22YOlk29ixqgnxPi6+5mXERn
	fnYwVIBUX6yo7blhCRkJZ8YSWieacPX70YTourFt2NF+EDhI3W/o4ms/RuEv2Y2nLHrOKm38lQy
	b3e012rRpft0m1y63h7MS2HnY2gmOwktjVaBrHOjUGd40hKSYWhnHq7exiQl8HVmNqxJXiTWaaM
	NzH+y9vmNmD7myUBfiTc8CAeUCDzHL8QaVNZOfP8S
X-Google-Smtp-Source: AGHT+IF8DC41wViyGCjPZEkIppmrGRXKouyjvgC2Rel1VCsq4higRnI+57N6atyy6zVPo8lzk9b3mQ==
X-Received: by 2002:a05:6870:9f06:b0:2d5:ba2d:80dd with SMTP id 586e51a60fabf-2ffb22506aamr3182710fac.12.1752695027100;
        Wed, 16 Jul 2025 12:43:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff111c36b8sm3753163fac.10.2025.07.16.12.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:43:46 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:43:45 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] irqchip/ls-scfg-msi: Fix NULL dereference in error
 handling
Message-ID: <15059507-6422-4333-94ca-e8e8840bd289@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The call to irq_domain_remove(msi_data->parent); was accidentally left
behind during a code refactor.  It's not necessary to free
"msi_data->parent" because it is NULL and, in fact, trying to free it
will lead to a NULL pointer dereference.  Delete the unnecessary code.

Fixes: 94b59d5f567a ("irqchip/ls-scfg-msi: Switch to use msi_create_parent_irq_domain()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-ls-scfg-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 7eca751d6548..4910f364e568 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -226,7 +226,6 @@ static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
 	msi_data->parent = msi_create_parent_irq_domain(&info, &ls_scfg_msi_parent_ops);
 	if (!msi_data->parent) {
 		dev_err(&msi_data->pdev->dev, "failed to create MSI domain\n");
-		irq_domain_remove(msi_data->parent);
 		return -ENOMEM;
 	}
 
-- 
2.47.2

