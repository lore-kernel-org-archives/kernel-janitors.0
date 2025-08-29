Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191F317715
	for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756472261; cv=none; b=EpeK1lUJGFHS7btI+SjMBhcjVMBfE12y0PzJdXb4jVWShVL947lx4i9dp8jirN62AIO8ihT43/mvW7NfKqm26QrtOdPxm8cMw7J9qZF/1hcNUHHoMqrJae7leJOEouVIsXpY4PuzCI7FqU6QOhbvD6W7OzGqyM70jUCYg0ySwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756472261; c=relaxed/simple;
	bh=4DJ5TD3LPs+dlaSYUK9sPSDfziv2OnIO0PiD9AsLDxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQVVyxGQgCbArsTE34IO1Nj6yB6jsx/JtZKc9J3wKryw8kT8hK6NCvaa9nBe2xsJCV/CSUgza37Wk292S4F8aXlsKSXqCXyZZKUkqT3TFyRxgwHprbYTNV3hv+jhyJI6srsTxhqPXXZMJQI6hKYtRaLQJDU9Vwg1BJx+95Tupio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jxge4PQR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jxge4PQR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso13238915e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756472258; x=1757077058; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpA/ewX5yJEUV+0C4r0oVn+iS4syCSTzFuXWGmDLoYo=;
        b=Jxge4PQRM6ldn+kEndjUQsHwSfNENkYWtpTB761xF6t6jQWewME19cNo2vIXp4tom9
         1yw0gaiyfsW7s9LFCKMXrmFZnZ8l3Av1yqv+m7C6xCD5zSUwxLYDTyhBpJ/nPRTHR+zy
         cqsEewq9GnG6y12gQj1xYdR90v3+ZgYsWnsnAYO8a3Bc/fBbdZpORZBKjr5WfuuJ5swB
         jUGGpnrclPmvYOmgwFmku0IGFzs57LY0klRS/GCsYa5EDSFZtH2VLDGrTj54MuCl+rZp
         MBzQqycPPwm2Q4Q4guhZ1vP/uOtqUaInzCOx7Y7q/9GDvR+IBG2KTO3xVFVLTNc0hCNg
         Vizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472258; x=1757077058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpA/ewX5yJEUV+0C4r0oVn+iS4syCSTzFuXWGmDLoYo=;
        b=FViQ7aNJG8pp1rin2aOPx2ziFHDxZD0Wj9Lxr0sO9NILJlMa4fQ1mn78rGinNqUJiA
         2wKaxFyetWpRsfDJ9UdQ/MTnD9GtAg8ptsq0vENs431jxq2lAvNxDgccpkWkNgA/u+0b
         zUXNU31PdsV4oVhPhUvieuxfc4TLoB4e0ky/IXMXjF65aWvwOyYHG/4Nt5bj4UOc9766
         BX3VKY2BNbmwSjD+ehhdhZZSIDD7/zxFzcvNfFFGOsSIK03OWBQoJGYyeJhFtBs4G2f7
         4jlzq2qnPs/5sPK7V6b+beIT2wQmKdr6NxfSnDC3689iou5094DXejIuWHXdLS7oQ41C
         BxAg==
X-Forwarded-Encrypted: i=1; AJvYcCUF9hpIMUffdZjHlBEj9obpYZf/821SSb1QNP5zOSV9wsoOk98fQhY7fOJxdp9e8lcpwD3DAhBNsMwsuHteNKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXGSy6EVnIUZDCslJvMC1d3KiGbogELJ8gzbIsELqNT5kE3aU
	g6MhVrpl7MgmU09k4/7YwHQuDq0eIhxwLfb+e4JiO8SUQTekUs+s3HxBS9rUomi7U8c=
X-Gm-Gg: ASbGnctJxfh+V+kPcJG+kDLkVOoFRE+dKu6Qqyw57uquURPt9PKB2SifEgpkVbF3o3C
	5tz5PAbnmZn8kzwCbeFmdcIJNTeW6GD+cjmWdpt87hJLxxPMbJAbNysTpS0ylEZsNslwJHO8uGF
	g+62mJMUsr33392fkqn0Aw5rfaJw5rCfEdlRi/nDHZ540dxxQ1jE63kUPFU5voGejoZl8YId6ho
	FkHrsItGVe36W6Pz4u/xbnBNY6u0TZ8qUZxWSz3hSKZT2Rdh83gtC8H8KTpXXOgWIXkMK5I/K3H
	kF3x/Rq8WjZNeY/q36jAKKkBBDi0/Rpq/BLGSZ11Cc4enHrY8phKgANJFbU673rsqU27ydi1dGI
	TYWueXPNJ5bjr+BqM1SiyNnqgWp7BhvhnhtjJcU8enTfbr5L+
X-Google-Smtp-Source: AGHT+IEk3X0SmDDJCM0kDCrUQkEzXw5unbHaqvpYBH8N1Kie2B/+aRAtHjZ8wJqalzmQyaEOC0bTTg==
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id 5b1f17b1804b1-45b517cca56mr247842695e9.25.1756472258171;
        Fri, 29 Aug 2025 05:57:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e8ab832sm37195035e9.23.2025.08.29.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:57:37 -0700 (PDT)
Date: Fri, 29 Aug 2025 15:57:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codec: sma1307: Fix memory corruption in
 sma1307_setting_loaded()
Message-ID: <aLGjvjpueVstekXP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sma1307->set.header_size is how many integers are in the header
(there are 8 of them) but instead of allocating space of 8 integers
we allocate 8 bytes.  This leads to memory corruption when we copy data
it on the next line:

        memcpy(sma1307->set.header, data,
               sma1307->set.header_size * sizeof(int));

Also since we're immediately copying over the memory in ->set.header,
there is no need to zero it in the allocator.  Use devm_kmalloc_array()
to allocate the memory instead.

Fixes: 576c57e6b4c1 ("ASoC: sma1307: Add driver for Iron Device SMA1307")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/sma1307.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 6a601e7134ea..b683e676640d 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1737,9 +1737,10 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 	sma1307->set.checksum = data[sma1307->set.header_size - 2];
 	sma1307->set.num_mode = data[sma1307->set.header_size - 1];
 	num_mode = sma1307->set.num_mode;
-	sma1307->set.header = devm_kzalloc(sma1307->dev,
-					   sma1307->set.header_size,
-					   GFP_KERNEL);
+	sma1307->set.header = devm_kmalloc_array(sma1307->dev,
+						 sma1307->set.header_size,
+						 sizeof(int),
+						 GFP_KERNEL);
 	if (!sma1307->set.header) {
 		sma1307->set.status = false;
 		return;
-- 
2.47.2

