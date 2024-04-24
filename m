Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD951E480
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958821; cv=none; b=VeU5c5wpU74aq7TW7LGtBeszl36DtIZeLUcAlJLq4ku+XeOL7adI9MGi3V7UsLDtOdkt8b/pf5yXyKruAI+eW/yCuyKoYGrVRjr3H/gXVsSS66xO/DPXYAm+2YeKUmMs6qZ2aJDFq5ag8yvPw6LonHz+LXjOnnUQCP3pc0PMXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958821; c=relaxed/simple;
	bh=uPxQKTFjx1OojfL3XIvuRwqZqEHhetjhGQ/QNoCE0cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=exOvcDr0Qc8lbxrcPEaLc96XJRmi/MWLXfIRL4xEQR0hl5NfAjOikn2oe2ddN/JB0Gcb51LyV6ZeZQJZGq6NZVyUhMe0uRrcCn7kFsE9RU+Oqadq4Ig0OX3Z8M8I1BSfRohTdjqclL1W3EYNyQPJcrMYFzRNdYOYqi8DZ9DP/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edKYD9Dn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edKYD9Dn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-346b146199eso5347276f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713958817; x=1714563617; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWMfbfXnYK3fqv0yrgeedC9giNqOZfecY/EM1i6Y9pw=;
        b=edKYD9Dn7FaCWOBjpHdZh4kLOcScK13PKLKG9a8zuh+rux5j/0bEp7lbhlhu+P27pk
         SujBXnQa7jgAn4MzXbVLXsYf0nkEzHgn7hbwkuDpFnxLmwq2lD47B6/yxtRTBIJD/sK0
         NDCPjDHmye2Cfg8oVuOs6YYRu1h6sfuxvdTr1ruM6+8jFNjFCCAFWqt3Ss4iD4yTfCy6
         SwouGHq5Ym4i9/2O0zDcQpq/bR5GrWghp/es4enWAe8Quj6XtEUah889VLl7GJ7TjIMg
         d4SZbm0PK6cRsdRlR38QXJLdvgFJ+TMIloQ0+QYICRDoVGjn5DDHSOovoSZ27sXe3tYa
         EhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958817; x=1714563617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWMfbfXnYK3fqv0yrgeedC9giNqOZfecY/EM1i6Y9pw=;
        b=e9qhxsIc+DQtUm+/687Y5ZM/uZKjLhnx038uBMZ5JPHNchKm6b9aC7fJoH31Uo1bQi
         EG096U7VRmrl9WEGcDCIpN5lNK7Nl2jbqTWz1v2llL4jJRHNZ1VmeI947wQ7IHDU6Xa8
         htS9jTXCny3fkTYmRltUw4CHOc+01DSSYauVVtOg6ShIg9xsAtRN9YsfuZAjh7LJ5Gcg
         k9d0+Mkzp/BbUUmrXHbKLhTa+yEexXY5397h124B6970PkhOyu+5G+WXFqovz3d7OAeY
         D8SLCSeeqtZjzdnzWUoDFcJCbu1SfYUGCmmmV2bRpzb4lN8CccBSx//cmWWFnZJLIHpp
         OC+g==
X-Forwarded-Encrypted: i=1; AJvYcCVz29m2Rq3NSZPf0Hp+H9r3CFsSy+GSHyVX7+dPe2J7msCUV4R1bHY918PIQrOIVCu5eebdvBrTkfJFsxoocWcZdDbZ+X/ppe9A7OkHn9nD
X-Gm-Message-State: AOJu0YwBZyC64UtWiEfaO3OvwluUJMZscYPJJyrfT2sD9fKU1eXT9tin
	DggV2uHkwM84fIuh1Gcnvz0gcR7jp2O2OUZ0HvE26WPXO63eJOtx0l3uet7GjYM=
X-Google-Smtp-Source: AGHT+IEWJT/8VK6y4z/3yPVqZFVfOmJf5zYfnoJ8CK24bfiYAkNVefNagGs454ZH+JH0euJmK90N9w==
X-Received: by 2002:a5d:568d:0:b0:34a:9b75:cb95 with SMTP id f13-20020a5d568d000000b0034a9b75cb95mr1449964wrv.37.1713958816645;
        Wed, 24 Apr 2024 04:40:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm15306805wrj.100.2024.04.24.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:40:16 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: sun50i: fix error returns in dt_has_supported_hw()
Message-ID: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dt_has_supported_hw() function returns type bool.  That means these
negative error codes are cast to true but the function should return
false instead.

Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index cd50cea16a87..0b882765cd66 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -136,11 +136,11 @@ static bool dt_has_supported_hw(void)
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
-		return -ENODEV;
+		return false;
 
 	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
 	if (!np)
-		return -ENOENT;
+		return false;
 
 	for_each_child_of_node(np, opp) {
 		if (of_find_property(opp, "opp-supported-hw", NULL)) {
-- 
2.43.0

