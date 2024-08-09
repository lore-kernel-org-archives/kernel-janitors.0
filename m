Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB14F18E02F
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206519; cv=none; b=YWWMBSVjhWiq4WOd9buHe/Y0anLQ66YTN96TXJi9Xa2PF/oDiftZBmsHOw0X+S5oCzyY7wMeHYKV+LuB9X3g6ZtADQvJECOlE7U1Hq+oVepewZP4EHc44mXTJUTPNs22oTYiw3DvIcjyLlRMQH3qcHlgxOPFv+4X+201uBWAiTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206519; c=relaxed/simple;
	bh=WTJchTACFfF0mgG9BvMoLf345L2toTwrGpG2d6j2sKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOeVG3z9GAjMuy8bIjYFe4r9ltpkNy3VpZOcvgRpM7WZH6TYKN926MbPpcwenLetOoG2U0bkO+9w0SSm4kz7O0yrI+H7gj/JzKoo7Xb+pynaoVBe7GnlbkghHA1h1+nttNNftr6Q2U0n/ehzFZE62rdcZPVr+FwSqyrZuSul4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXQbh/R8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXQbh/R8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62575eso636323a12.3
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723206515; x=1723811315; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPNE3LYTzfOr9xnzL4XgQhlciyEiRjVlcUsL9IXDC2A=;
        b=TXQbh/R8CbvT9B5bv1NNHtKw/El4iAcoWDQOCflpUn3svM4JxfOhNb7i6S0wV3BZMv
         IDbjG7POB15FtkDbFJWLJ+9ODaidBWSbKJBnRhKLvYByQT1Mv2Wp3Bk1+O1mIVCzQywY
         mhkzaxKsYMMbbu7ZiDtaVUDDbKmYvT80Acugt3fgg9pP5rSbMn1ix9rg5Odfw5RqZoVs
         ypTD5KPvyWOzXqVQAi66FjUBVXQFastKF7E1a2ac1qP55UkVXarb13lT3Zmd+qGKkUUP
         Bz8u0IBPb/rsuSBvm2B7Cx8O4MIotKH/6aUW4mLV7pVpUUwwcyqRUvCyI1mAsfGEpA53
         LXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206515; x=1723811315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPNE3LYTzfOr9xnzL4XgQhlciyEiRjVlcUsL9IXDC2A=;
        b=Sp6zxLrxuuWxS/QVb7+5PX15ayPl3BXK+2d20JmqQ670EyS/Szv1UcepVG5UQAJ302
         YJQuBHyo5lnH8GjRWGaw6l9KpYJx7gJdVsqQ5fX461gV9NtUuHgvDvtCFoiSHC4sT1Ve
         WlQzCV4WG3LeDvKxdPBU/cZfGQpKZG6R+GeoYtgvZywYZAfhnPOpTQtzmPAifBqTzX7t
         DNLunqwcAQaLSDWuLSQfJau1vsLBUUQLdee+jUoC3oqTbGeGae3jIjKbLz0zOizTdiuY
         eVvfr83apQwjgK260blCGfPsL0TKZRMRMzb5ZuyxQ4HDlF3nHj4T4VwvmPLxMfR1eo8s
         Vzog==
X-Forwarded-Encrypted: i=1; AJvYcCUAI/H3SElBpR/0t3zBQcMVZLf1yYA+G7aHNb5BAnTtoe7VHPg4K6YHrp0KXX+C75RKVKNr8tDOK+d51fsewOSUmxyTy+NxeGHyO7oN+RqS
X-Gm-Message-State: AOJu0YzLblHB4MNy4+cr97/ItB2YNEdnrldIJrlYVv4reijYetGa6Bm4
	T1i358u+0E8648W4xYemva3JifetcNv/yswwlWOFukvegf72DXx65+L63DXoQNI=
X-Google-Smtp-Source: AGHT+IHA3gHe6QowP5BFUwIqbqka7d7Ush/Dv+zY+06NT7lYfHcBRJrUte01orPcNeHqhOadMXetwA==
X-Received: by 2002:a05:6402:4345:b0:5a2:8f7d:aff4 with SMTP id 4fb4d7f45d1cf-5bd0a56cd2amr1153405a12.20.1723206515029;
        Fri, 09 Aug 2024 05:28:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf8e52sm1476324a12.4.2024.08.09.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:28:34 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:28:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nuno Sa <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: dac: ltc2664: Fix off by one in ltc2664_channel_config()
Message-ID: <5727ab54-6280-466e-b107-1b6006e5ab29@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This comparison should be >= ARRAY_SIZE() instead of >.  The "mspan"
variable is later used as an array index into ltc2664_mspan_lut[] so
this is an off by one bug.

Fixes: 4cc2fc445d2e ("iio: dac: ltc2664: Add driver for LTC2664 and LTC2672")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/dac/ltc2664.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ltc2664.c b/drivers/iio/dac/ltc2664.c
index 666ecdeb5f96..5be5345ac5c8 100644
--- a/drivers/iio/dac/ltc2664.c
+++ b/drivers/iio/dac/ltc2664.c
@@ -526,7 +526,7 @@ static int ltc2664_channel_config(struct ltc2664_state *st)
 			return dev_err_probe(dev, -EINVAL,
 			       "adi,manual-span-operation-config not supported\n");
 
-		if (mspan > ARRAY_SIZE(ltc2664_mspan_lut))
+		if (mspan >= ARRAY_SIZE(ltc2664_mspan_lut))
 			return dev_err_probe(dev, -EINVAL,
 			       "adi,manual-span-operation-config not in range\n");
 	}
-- 
2.43.0

