Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580914B97E
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961283; cv=none; b=uHnF0mVWkuc0QMhw4m2/rh2JyH6O7NK6+WUVfsMaPMGCNmFFeM3czJgQWj/Eg+/L0JJH1KFTzOLahGmq68djvXSNDJmjUwjq36HnFf03GI924fQkuPzXbkoR6rYSR3ipcfkAa2nJue/BQ0FijrpZiPj9u+R512a8RSG2HEziIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961283; c=relaxed/simple;
	bh=7zmpFrkNE9b9fiTObZOVjwcI3iZNrUR2CLn6+i8hq2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJwcJCR2Sn+vBoQHRV9E0+9+Fi8pJyuQSvXo4hst/gc3+HSYDsDT4Vc/frNBusfRPC+pr26imwtdwF1CME3r5XITwcUeMNKcZ12zkUwiXAsz8H412fIeOce1IYp7/6xfqAaPmVxuU1KiEqsJEDfTrbVTd2NRNa1a4T/GerDK9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3GBR9rd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3GBR9rd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa52bb7beceso286351466b.3
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961280; x=1733566080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bF1qKdUD6G82UToWOeQ2OIejZEXXxD5wyzBbKqaeajo=;
        b=b3GBR9rd0hyfCgYKbu8TnWR3qKxYGOMQvNRF3pPW54jLcHrFjMguPv5NyYyQOP/YDm
         xS1dSKvt+9R/eR5S8HICejlOgGrg3re5qSYaL0q8UW9qmQNmxllmN1YcAEP3qHENpyQH
         wtFEK6EJmi0nPi4VAVQzhJyVXj6cK9+e4yCfq0eNHGQyBIUWhrTiA4TZx1E50Puvuyqm
         Hc5hO/jiXVBPKMBe5EBA3D5G/sNkyeHn1qALIuKFAW+NtTiZ/13P0b0jKei9fEPxKTSv
         ET4wwN1gmBSt5AT9FUTVpAMrMVG4RqqC1cq3D3k5B5asl4+ABWPuQje1Yh6MyZDfwdJH
         VlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961280; x=1733566080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bF1qKdUD6G82UToWOeQ2OIejZEXXxD5wyzBbKqaeajo=;
        b=LFr0/T+iGMLTzdFGjSOZh4y3aORewGTLbp41Lf54yR6yr1uJLrE0ZaDsYhyzD8lzBV
         WZXPdhf8RDgLmvmhiwAgGUlXzl2dSk/DCn4fnrrPR3HRrpuqiVo9hQUoHd9eq/oOTGZ9
         1KKBNMhNBDtF6HVYMX1ds5A4YDE3sFDGkFT/zYKL6WugIrk0kVzKjUm0biBKPImq2qiD
         P3paWvSH+1vLdb0ZbYOWmLI4jNpo9wozz/rEb+XxgMREOnPyshpeB9hywJq26DZCobLr
         3agU6DkOrF+geitCxsnbN71NNVEupdgoWXIaxqEKJziwPK+D/fVYIz4xOA0s3MhgIR9r
         JWDA==
X-Forwarded-Encrypted: i=1; AJvYcCXlivsXJNmsANs3CJ1aP/YU5iJc2nHmGJ3dfEWpsCBEP20ZQDZ5iHthIpbyqcPRRvzB5ycsPOxvfTT21g8QbHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6s7TZ5Pq/cEAmBKU9kj26rHEYskZtzHmHl3R3W+NtuSZ7qDMR
	KtFWfa+f34DsvSTTprxgLs11FPOEfSRMTXPFJ3DYxxu3hpF8XL3zIwE1PSGGm0I=
X-Gm-Gg: ASbGncvnAtWwcXfODSn6685Rg3mYuMYm+W4sA3nfzHtwjHw5svbK5qs+tyC+lQd9KFY
	QdNe/aPNQ+t/rCVABJbLtUiEaRXRtVh5WLf6GNBYtHHaCk3E1mXG4n3RovRx2nns4JoTWMcVXZv
	P/llzEpZ4t4vO699qJSrbr92s9jPmE9J/5sz5xHSbWr/SwdhJz3QHiI75Ra8AGKMFUs5lQMPloD
	lT3H1QGrChqkrrR+i/YwwGipntgLD//jlbzVT0lreaVUQTvTsyAHvMYTmCcgTI7Y7MyEPKl
X-Google-Smtp-Source: AGHT+IGFFkuSzUzBV6MpzgZNlz2YgAq3cRPDWZKCNGkjjw0xQWjwQCZY0kfL1J0lIP1VbayZcSBWxw==
X-Received: by 2002:a17:907:7819:b0:aa5:b2b:f236 with SMTP id a640c23a62f3a-aa580f353f3mr1240877266b.28.1732961280003;
        Sat, 30 Nov 2024 02:08:00 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996de7e7sm264394866b.71.2024.11.30.02.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:07:59 -0800 (PST)
Date: Sat, 30 Nov 2024 13:07:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] opp: core: Fix off by one in dev_pm_opp_get_bw()
Message-ID: <41ae307c-f6ff-49fb-a962-eb488152de71@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "opp->bandwidth" array has "opp->opp_table->path_count" number of
elements.  It's allocated in _opp_allocate().  So this > needs to be >=
to prevent an out of bounds access.

Fixes: d78653dcd8bf ("opp: core: implement dev_pm_opp_get_bw")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index d4a0030a0228..09a1432561f6 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -121,7 +121,7 @@ unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
 		return 0;
 	}
 
-	if (index > opp->opp_table->path_count)
+	if (index >= opp->opp_table->path_count)
 		return 0;
 
 	if (!opp->bandwidth)
-- 
2.45.2

