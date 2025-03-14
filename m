Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7F1F3BB4
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947110; cv=none; b=al3N3LeC/37RLXMQCCF/2rqgmVTDyWLW1FC394P+hMmvpb57Li+1PSFZOuicpeWF/vrBP8uXEBOWuIBXEGVFIRf0ON+Ta11MJTNiQDTE6+MoKP1d8+UGvaAol1QIYjHawMB9Yn9w/xO5P0E4RuSuRjbJXwpXsj4VZ3XlgxXPWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947110; c=relaxed/simple;
	bh=1Vi0CajOHRKeNKzH6avY9kIwFZ/TezpCqJGypsjuUds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUwQNQqvoHdGa5IteGxyVerEHLzxgaFXUlgR2OPrpJh/JN6+7RiRSon27cmKeJ6x0BaSgjHIzcoyPe9QlEaNcEkr/1BZoYnGGT1rTdfzSfT5xFaWYAXOV8sutQAUHyRIo0wvc7YqGBQq0SJlJfY6NsgnLW4V9fekugNyGa7Vtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/BlHhQI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/BlHhQI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso12171685e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947107; x=1742551907; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXrdPdZYVwV2bWnv1UKchMA+tMF9lSgD0HH6znImayo=;
        b=f/BlHhQIdTYqTmPA/b5rXE/Z/Uwi37jn73qTlU30S6DYZNhAu/o5Gbd4w3GHON9ZI/
         fq9Wj4Lt3PLeD4mZKrxRpQghy07pQWxwsGPMEo/P9warcLMx+GcDF5xxbWzDZWEysjyZ
         ljBZzVros80DZIjd65x8TX5sZ8yMHVjOPDJCyXmMJN4YZL5YM01fJoqLOmzb4pWkz1pi
         ipvKJj68NGqq9GRer9n9MXwC5Ou2eQJUEnV0ZmG2oR1eFBftJrtgj7umYfNvFb+mToJk
         42mdbVEhTWL6qkCxmmn+VMF9DydsuAFds1sqUSajijuPmEO4bJf9fUQp87/6SqZS/mZK
         KikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947107; x=1742551907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXrdPdZYVwV2bWnv1UKchMA+tMF9lSgD0HH6znImayo=;
        b=GlbhHGC6J66FdwQxq9GhR+0gGoeP2vdq7Mjiv5gCfAlflXvFbPI57S8fQW9/m99oHa
         67PJQvqtuet6jfukN13rY+BGU3u68IfAjXNx/hogWYjAcbFvfkKxKvAEa6IT9FQErJNO
         4kM9CYoClf90uNpg0gqdB7KOH3ZFq7Lq9a9PL9fNGDs3pU51Cu3KW88VIuDu4K2nBrQ3
         1g8L2JjXMHkNO+iGyzeJOpqNYXOVuU7cdgjKhfANEtugZbdgvdHMEX7B+Syk/6d8FHFW
         +P1xRWgWeDhQ9Cw1Fdd4bAkdApirZn9ceW+xN82UtdOHLhaxNw49hNiCu3uJBZN+xr5g
         UoyA==
X-Forwarded-Encrypted: i=1; AJvYcCXivQi3JnPX7HHjcr7dJpEHWM7/Oq5Du4PT8Fq/BBH7p5ps1MOMycTzt5W9u1VhpWSvz5lDoC6O2H7R+kBOqk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyun0zCm8XWM0A8hUZpTaFDNtYugAPnVYSQPX1tXDKSs9OLXzZw
	7Oc7cbJqHOwCWHCJuKJ2VVG/BO2sfVPh+GuEDeYwjH2YSZ5u94SejbyCbrO5/kE=
X-Gm-Gg: ASbGnctkXFP9wzyVARB/Bd4j47SYiP/a/cuSVu5ODbtXkChhDYfOqTeGCZ8f1+nWTqS
	TK3WSRYxJX6juHgTo+e6NtTaXGlHEB9UfchfauCPGPdT6b0uRsRFuVzBfUNgWjxhEmYRV2alfUs
	wvayqbTcyqZppxfc629vp0QflBz4L+osPhem4Bk5dUlEwHto33eiQvOJ7yGlj7y5PUr2h1ToQh0
	kTj07PCF6ry2M2zZtsnrpKZnyIKpJTQRjB6/lT9Zf9XDD6+UV8gK2USl+/NU+jlvOZtOK1wxfgM
	7vXkrHb1yBrp/yzQcxI19UGPpSWP9du34REJwAbOriT8IXJ4hQ==
X-Google-Smtp-Source: AGHT+IFu33nlZq8eDE9nkYaBwVTjMj37ygSLQh0y3dybArIim3lL6otY1GCHq+RK2eeNyDGoSAttHg==
X-Received: by 2002:a05:600c:3108:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d1ec66daamr22153745e9.4.1741947106739;
        Fri, 14 Mar 2025 03:11:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d2010e2a2sm12352535e9.39.2025.03.14.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:11:46 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:11:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: amd: acp: Fix leak in acp_pci_probe()
Message-ID: <3dad80cb-e177-45aa-97ac-df9c98a47d94@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There needs to be some cleanup on this error path.  We can't just
return directly.

Fixes: aaf7a668bb38 ("ASoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 9322379cb36f..123524f90d6c 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -183,7 +183,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 			       IRQF_SHARED, "ACP_I2S_IRQ", chip);
 	if (ret) {
 		dev_err(&pci->dev, "ACP I2S IRQ request failed %d\n", ret);
-		return ret;
+		goto de_init;
 	}
 
 	check_acp_config(pci, chip);
-- 
2.47.2

