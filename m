Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96A5B682
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713177301; cv=none; b=VDGqFs3O8shM9HqNeiDxQsrECZCG3m+clip73AryPRICH0laMnRBBF0ES5myNFbxp4D6vKmFR+33yz1RAzZyDDiZ6IzStRXhFohw2+JiziEjX2sLwj1oYZmBk6mDHo0ka4m37Ykbc94ZAUZSeD8cmomxtPaOeTRg+me5jW8DU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713177301; c=relaxed/simple;
	bh=EFqueGpy71r8mk7yd/Fy+o3d7bUXemDhP6mho+kFJvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hB3JCOAcDGIJItbbdjV+w+bP4HUY/2FCXAXpIy6QgI+saPkj/GBJzc76mH+m9wsU9BT0Uvdklqoy64SmB4f1kKBhg9GPYg2Jh30fNNdVzliNtradVTOZoA07S+y6RsliRXu0FmUzaDkjaNq4MPiVZDMRU6NC+UNbi0aTtHBBlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dv1Gkktj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dv1Gkktj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51a1c8d931so387591266b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713177298; x=1713782098; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knIjWuJEH+J0HrZVWnDTxaPyryx3WGEM+wJiEZytvQk=;
        b=Dv1GkktjpzGn4iElquo3Dr2zxTu5TkT7XdQVuDmCnGASJRmYkscOM1gRXVFLoaq+Y0
         P23z99qe2HgH1I9knpDS9fyP41NvdErKdj9CTo63pdvvLVuSBPDQaRiGB/Yz5rdHsark
         7YT0I8WXsInWIInVkTnzpED4Itu+mlbMQpHZkfnNlWkR3EalVDGtFPDc9AVe7YZEogll
         3aEYiZgsHIO2AMBrY0RNMPzrBw8qiUefW3ZHyA+1jdpmOfNUQj36EZeNRfTQ/dE3NIaP
         +5RshVaLF0HwppuX1OYpNpgQuQ++Z7QyRegHuy3xs9ne6WKXiBXQ5dwBFW0QcKQbJhCV
         0a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713177298; x=1713782098;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knIjWuJEH+J0HrZVWnDTxaPyryx3WGEM+wJiEZytvQk=;
        b=mkAu5L4/v12lOI0YJzx+MMoSM2UtjxzmgkjuunWvqhq+NHIDNl1dTwSTCX3K/CGoHZ
         HlD0eu24/+taAUew+G9NgypCk90Q6c7zFMe89WyPOEe5bVkKvGOo+dXfxBYSkAsQrI6l
         8SQp9QvGgC3H8TIJ58YuG+yb/GvXTHnfhh4UiisXvdxS5NRkljnfGg+adXf+veD8xIcf
         BC6NmBB1VoJiTKtfWX3atN2gW4V4gVea4DQVZjrIH55Zdb2CnN0UKG18nAWvBFyotQtk
         SFZcKILGPxpR91AnuyudMzE+V1wFpYDAeXaNwzFS4NXVEAorBQeiKb2qQ5VzWClHa3tg
         3Jvg==
X-Forwarded-Encrypted: i=1; AJvYcCXH+i5oPlVoZaXlifnvuUNr5fWdC9QUEyxsvvnDterasaSlpM3YivCk1PqaHeS85XY5LTyHyS1q9D1DQjSZEI+/99YVqfPVW3kbOAgbAaAb
X-Gm-Message-State: AOJu0YyCjvbFKPP0RPo0prlttv3rGyOzNx3ChPFStmCawckkwyGQfgvc
	iEuOkmqHxiAqFOxPnJdJ41nf/HNwfPw6sSVaAVzqZwlFVkElLy/ol0/cJzjVfUQ=
X-Google-Smtp-Source: AGHT+IEM9DjvbLEs/iTz61CYmfTK7igocYO0I2yXTdxW1t/sbMQroUqeZbwz45KUR27jtpRh0M1RpA==
X-Received: by 2002:a17:906:168a:b0:a52:6435:ef09 with SMTP id s10-20020a170906168a00b00a526435ef09mr2028980ejd.76.1713177297932;
        Mon, 15 Apr 2024 03:34:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id xi3-20020a170906dac300b00a52228ce058sm5142470ejb.46.2024.04.15.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:34:57 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:34:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regmap: kunit: Fix an NULL vs IS_ERR() check
Message-ID: <b32e80cf-b385-40cd-b8ec-77ec73e07530@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kunit_device_register() function returns error pointers, not NULL.
Passing an error pointer to get_device() will lead to an Oops.  Also
get_device() returns the same device you passed to it.  Fix it!  ;)

Fixes: 7b7982f14315 ("regmap: kunit: Create a struct device for the regmap")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/regmap/regmap-kunit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index 44265dc2313d..9c5314785fc2 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -1925,10 +1925,10 @@ static int regmap_test_init(struct kunit *test)
 	test->priv = priv;
 
 	dev = kunit_device_register(test, "regmap_test");
-	priv->dev = get_device(dev);
-	if (!priv->dev)
-		return -ENODEV;
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
 
+	priv->dev = get_device(dev);
 	dev_set_drvdata(dev, test);
 
 	return 0;
-- 
2.43.0

