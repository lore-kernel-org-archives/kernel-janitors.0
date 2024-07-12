Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF116C69E
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793067; cv=none; b=OkzHTW14e4utr2KO2IKbjeN+kXcYF+S1I5imHea59ImxyjCDx6SJqaSTR2R8gHbtiR+uQkPKVSsrHQM98H00c1KqlVN0/urk7R7+WKPrlbYaOlzXni8IcDOi9nxbj4qBmuuEtqnikOvF3FIBD7wVtIJY9GkvL/OLQkytafvqvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793067; c=relaxed/simple;
	bh=f4nPJBWcL+FWBNNP7qtZLWX3gQIx7r3DtuJMpTD5/Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2zhTVZDdVGkDZ8LTWMGMG/GC86/dlgaiNpHHW8y2u0R3UmuDXdvsZMCN6Zxd5JmSCC2awd8d6Zg4dp7oiyYaZQ2rILdJvB27TVKXzaYRHwO2UDs+SDAmsv9OUWlg1cK8YnjXy0zsOnZ2LjGfno8zjF2/lAkc7OViZCIkTUFmvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0b7joZp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0b7joZp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d9e13ef8edso1199061b6e.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793065; x=1721397865; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0tPaSbJr1gyBPbW9jKrvoYL58n/60/CIcsiIcRMhY0=;
        b=f0b7joZpWTP8fSOeBxnqbFRMdosp5K1RcfFP+hC/sDV+1OzFwX6ZtGwHoQ48Nl3+IN
         H/Fc6XjWHrJ1AK1n3YgzeQ5OmzsslrMG40EQ4o3rWmUy/SeMet1dLj67WZYLKHYcD2Pe
         VIGj76q4f31QYBGqp8I04aLK6BhV9qla1ZG90IDkWK4kwKkjQNacLHuaW/4DxEwNzSuB
         GCuuLEO1WP9NAuvgokD+eD4GWm4XdRoLjbu8U2UeqfVSvMfLR1bhUH2Ev6UxJAO9nUyp
         PBayEX2WCg4WZAU58S83wGYpxTR1CX91oKcLaMpQAkVL+FflvowXAmEEn4pEekyHJCLA
         G++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793065; x=1721397865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0tPaSbJr1gyBPbW9jKrvoYL58n/60/CIcsiIcRMhY0=;
        b=QfuveEKGg5leEOuHOMeNZ+2wipUz7SV1O0qzj1Ca5Q+uc05BmHFfNMTnfnbvf3nYLU
         zVK+8qMvBRDd3y2sJOgd5EY7KvyrydIi2VLpTh43LWvwIm18gMqam02IqAb6Z+1OLz2U
         Zxw/aJwVwQDinjjT+G+iMKEBAxsNemu6eRiYWlWiMVCpRTcTKDxzWT2JQ5fOVQ+G4vNh
         6qB6u1LId7XqOnZYqZXXu+jOCUNUMepdzS8jIj3IpeBvQbTH6AaGl7J8amdR2Q+uhh0N
         MYJo7Viz4LKKFAppFW5v40mb+xg+af9O0sIyixagIgMkyAyaAO2UMKtvgsOdAzhdYc8h
         BZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTG8Jmeh47u2y2ziMWV72sNoP4XoYid88l8HUAt0w59GuwhdbUWBfqgSzjl4hzp6v60cDOqORW9J/nL8fQAIj9fuKVxQk72g8qyKizqVml
X-Gm-Message-State: AOJu0YxPRsMARHHEPweX+Ti3MVmoHZvlyaE6SdzRFSshVsL8WbCG4hnf
	UA41s80tpAplRihl9IKi2ppdNyH7KWdtYNGYcG0a0NvMZ4DVEB2JfKRzWcrVwOE=
X-Google-Smtp-Source: AGHT+IHvKRXgbYK/Cei1uAHdNU9V5NaySuUO0ey6pJOZHrm9szgI1TMI8MwHwey/7TIGHSFFHYqcjw==
X-Received: by 2002:a05:6870:ac26:b0:25d:7cc4:caa8 with SMTP id 586e51a60fabf-25eae74ac40mr9611788fac.10.1720793064654;
        Fri, 12 Jul 2024 07:04:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9feb5a5sm2154367fac.19.2024.07.12.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:04:24 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:04:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] eeprom: ee1004: Unlock on error path in probe()
Message-ID: <b5c51026-a2de-434b-8f45-44a641ab1c82@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call mutex_unlock() before returning an error in ee1004_probe()

Fixes: 55d57ef6fa97 ("eeprom: ee1004: Use devres for bus data cleanup")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/eeprom/ee1004.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index d4aeeb2b2169..adba67cef1e7 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -272,8 +272,10 @@ static int ee1004_probe(struct i2c_client *client)
 	}
 
 	err = devm_add_action_or_reset(&client->dev, ee1004_cleanup_bus_data, bd);
-	if (err < 0)
+	if (err < 0) {
+		mutex_unlock(&ee1004_bus_lock);
 		return err;
+	}
 
 	i2c_set_clientdata(client, bd);
 
-- 
2.43.0

