Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580D4E3780
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048368; cv=none; b=EGupvoAMOQ+8eI0WLU0chUNfunOpwhg9Qf4GJ+0UKxPxbBSZZOOb+VqVNxFpXbgOuB1u64aGAxvWf7sB+x+AHFFGNfVjaGDCx22oWOr3P+8GvZkhDTJE65zUSqtG76KmIJodXOh0N9KFPDrsWXCfDO0E07u5FZWNn20/1cqOIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048368; c=relaxed/simple;
	bh=xG9Kwn5y5gCw9fBzRJfdS4XROO2aFj5m8mD+l2ArHdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=huGUB2t+EZVkkQvEzdNsD2MzPwf1LXmExnlm94FFDIZO7gMoL+kj8NjK3NDsTS3Yp6140wte3kM4r07SpPWsH7SYVP/ySm9Z4ezh0u2EOV8Xnkmszu+QKRan7uqOLOGfXo786fqgNyj4iGjkd75pxyCXc14K7/FFLn3Nuhp4WJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwY9Gky1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwY9Gky1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso4325966f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 09:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784048365; x=1784653165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UrX+2PReJBw6XIph6Tw/hL8PSQO9wuRuPP9B9P45GQ=;
        b=KwY9Gky12AVvGx4Q9fve3xARwxMr6oah3KLujBA1u3aia+hvRJ50SVDfpO4xk0ssQr
         LAFriu/R2zGy2qmNwvQlBxYy5+DhNRdwlfj6ODfsdUcFniHod/aCCJYTjUzZQKgdaUO0
         hYD9D8d7+TeeTm+hNJNP6+82+cv6WkZdbMNHONg4s4etPDQUErqgGTYWEvHrDPH3uS4r
         i4S0YHWYiwav0qCP9XochcGNpYgQytmdsOeYQ+GxiRVTJotBnsPOzpjESoH13Uv2ZHEs
         wVMGcAVc4i6uSmulYE1Cg7WanRdgF0nT/WeoLuXQufExSnzJFfQ7ef8LjQLdgF6jwF0H
         q5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048365; x=1784653165;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0UrX+2PReJBw6XIph6Tw/hL8PSQO9wuRuPP9B9P45GQ=;
        b=c7jLhin36/mDL9aZJ6Hd57+vKOnuCsYgsHg088t8RPBNH3hZ1s2XMzmP3hirUZAG/E
         83ziMGsosF8gmiyv4ai9JvlfQI/T271LKJgFkhY+EuEx5ZuHqrFS8ygOUPxWwwQ+e2jE
         frVDqY10VhuxNkzU/dFgo/wSeMEA3asil+HqQ8LNyXXDEIPXasxuYsYFJY6nGi8cqx09
         +o7Y49izC44Sw6UtpdHrcvkJcsMJcIF/N7eMwxH0SiP0Voks/jzA4M7CcinARGg+A1Uy
         A/scd/RMxAdMJG5pjNgdRKkyfcQJdjYY5CCjqGBEMf8PybBZBKgx+4G0vJtVyL649TOr
         STuA==
X-Gm-Message-State: AOJu0YyiRHDz5plq5NzJLMOmHGixYIjOkiueAeFGvcvvo8TKZMtaq8Zu
	dQxIDfc2GZNhXCF8eL13bgWdo7GZ2zfbzZlZfs5sldS+XuG+uzAATh0j
X-Gm-Gg: AfdE7claVWioPeuERMKn6EVP59Y/9b+7vrqNh21hFEaqGPpYpx4JBowAnYLg8AZt2SD
	CY1R3LTx1scnHD5IF+r6sDDeRQViP/X0WTFqrrn/EcCu+ak2lwaIjE5bTG/fI6SL38dTzdMg9I4
	8YFeVsPU4xn/C83ZYpHB148Ziy2zmkn/4qWiUfYrTWl8LesrSGKzoqJK2Ix8TkSsdUb3wxAlEo9
	yB3BDO7kGlqj/a5yD6l/PKO9p/ii7bH1DUvjQ8BtBfuepFD6qQKTNgEZQvnEsePfontMXJPJd10
	H5rnPkiTqNPW7DS0V8jiHDYU0ZYuvAY7lG6qMDnmbunfCWZuvaA7SyvW2UYXZTbFOj2I1VL+huw
	VCNVZchrOJ2Cbs9Z0kvfCc41SUF376JFh40BV2fyAtNLqmpl/+XdSzB03Ch3lN6HO4iem8V5FSU
	d7C2JO9F0uuwEGICGvRUjzKA==
X-Received: by 2002:a05:6000:2481:b0:475:c946:36c5 with SMTP id ffacd0b85a97d-47f2dca7f13mr16783953f8f.9.1784048364994;
        Tue, 14 Jul 2026 09:59:24 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635aa34sm8858744f8f.15.2026.07.14.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:59:24 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] iio: light: vcnl4000: make read-only const array regulator_names static
Date: Tue, 14 Jul 2026 17:57:39 +0100
Message-ID: <20260714165740.186119-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array regulator_names on the stack
at run time, instead make it static const char * const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 128ae3f94074..b8ac156ad5c9 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1922,7 +1922,7 @@ static void vcnl4000_cleanup(void *data)
 
 static int vcnl4000_probe(struct i2c_client *client)
 {
-	const char * const regulator_names[] = { "vdd", "vio", "vled" };
+	static const char * const regulator_names[] = { "vdd", "vio", "vled" };
 	struct device *dev = &client->dev;
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
-- 
2.53.0

