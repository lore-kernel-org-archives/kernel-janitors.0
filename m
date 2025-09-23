Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331C30F545
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625988; cv=none; b=evN2v8mUkaU1DwucRt8mKxwpvVaB2o/oO3efwoV9FqyvTozXe4eZGOZHALONM/DE0bzOtTlZ7CCT2NnKDQJ3SnPzCyqbEdobd/0ErDWbplOnZLSBau0Jz7lzXULjz2Qw248YJUf/P289DIbDtVn9iTe9/j2PyMIejCAfirrvbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625988; c=relaxed/simple;
	bh=Xu3aFhrso3x/XEZB/pUFkQq50ed8XXakXxPeuUqgUyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iB5DJ8ey0CQZUlcdmjxENlWt9PhcKPvfC9Fp+QHn8G8eaEuHytiJXC4obxrqrih9nViZAuP1gwmUbR6fLUN4LqFPgc8J22y+OB3zuEPpRRrS6ZBEMtVTRbmeVnjSGE9vYN2U5rn+v2KnAl7/ZfHnWPTO+vNgNebbe5bmgRF841E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wssa56PB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wssa56PB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46dfd711172so15440975e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758625985; x=1759230785; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPfB6vZFAN1UWmkMopxYEPmOWLUUuC+tX7ts8FDpK5M=;
        b=wssa56PB25qRd4yA0y3AsSRitOAHTtIyTAqQoQ8NdRHDjov5CO9rTtzl5gAUKP/J+Y
         90IrEzZTGDXrVfM3ABzhnBt5Uj0rbAP8OKLlMjo7PAErA46zUblb0dK4jaBpzZhRM4Oc
         mV1mFiwyPL0Y+zSXRrPSkY9leP7nQivXgAEJJNYR7F8qjwAdfdMVuGEt3sI7Ahzotjn7
         fB4NSJX7NobcMe6cUs4kwrXTBV1PH2Y9UNu9zT+6NxkjYMD6XFqzLt414bZ3EG9GkPeW
         IIVhCkT1XdctQGnPBLBTghoACjRP4bISDUyJLLddwPbaBdczlpqeDMA8xSLIruGZJmzK
         RJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625985; x=1759230785;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPfB6vZFAN1UWmkMopxYEPmOWLUUuC+tX7ts8FDpK5M=;
        b=HUUnsZlEokYBDMFJMi7VKvgGX4ZixsqWS3oSxk0+sLkYt35SDvOsg/4MTYt0Z83zQe
         7RpwlcyTgdLrF0n4WA7zukQT/O+p3Oo40hoW3EkMiTQY2Mj4g2ZbKaAWnGQTpLEQFqoD
         3ZM0mozmVIwbXw+q58Igw9J43J7tV3E/HCuEOhIh5aamGUS4IzgtCyVcNEN8UhoZKKj1
         UzMzRpebqVRdiL1ysjpWJmmEIjuTXBPhXSfvm0PHA3yAvxWm7HXLntG1I1J/UVS6d+rG
         CzXqGbgiUh2yn0qIGyBedHCIflEPUwLmwID/9Gn2caqYXwM34sY3uzcxBDTFP3qvTrr1
         dqtA==
X-Forwarded-Encrypted: i=1; AJvYcCVTMXy9deXZfC0AX1PfwWCkdm2dncWru43cfk0GtfWXN18ioLvTN+NL4WypDk5z28/9zpL7sH7yQxcnxlCcVxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXayBPZZglovshOi+qhlPjzP98czo6SychxpNvpwa9CtIFw3z+
	64LC8XD3WnMauPmCL/BPWYROH/70fe6B3eRE+RW1nqTn5TGbY6fWUYRsNGaK8CwQxpM=
X-Gm-Gg: ASbGnctuUxZkNPyFz7wEC84xwDdlJ1m3nMOAvbEq26uJF21hgN4KrPniXsT+dNI6eix
	P7noQpjvKKtbQb5WfcAwzIaElr+vne16pfJJfvAk3/XfOoEtXrUpqTetj+e62Sje6CVv433n2vv
	S0SfGX6brfpI4RiFOb6l14N35eenVoIvb9CYRindt7e8mMbTPSz8MopnXTSMZOoAPaLva+Kk0JL
	ulz2501cRuFzxucCEO1/LSY2zWPHjsERgHXzDA8xksJFNahIEFDANJq2CW9KBA9qiPIOatB7BlC
	aM7/uyewzg2QtAAbDrjm4LRG3OpQ4HeZcSLj8QdZbDF/KE2gMi9gxD3ASGJjEkAeeEchPTk+v0h
	6COR4uyZSSDhPPU9c6dNSkdNJvZ/0cJIoZKhr+3U=
X-Google-Smtp-Source: AGHT+IGkTADoNqcmQjP+QOFZr6eMBbrG7pkg/2yNv5pLWE/18q+4r2nqJqLF9iBKY05vapp9F1P7rw==
X-Received: by 2002:a05:600c:3103:b0:45d:d68c:2a36 with SMTP id 5b1f17b1804b1-46e1dac2d45mr21237175e9.27.1758625985079;
        Tue, 23 Sep 2025 04:13:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e1daa4a4fsm14991665e9.1.2025.09.23.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:13:04 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:13:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] dpll: zl3073x: Fix double free in
 zl3073x_devlink_flash_update()
Message-ID: <aNKAvXzRqk_27k7E@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The zl3073x_devlink_flash_prepare() function calls zl3073x_fw_free()
and the caller also calls zl3073x_devlink_flash_update() so it leads
to a double free.  Delete the extra free.

Fixes: a1e891fe4ae8 ("dpll: zl3073x: Implement devlink flash callback")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dpll/zl3073x/devlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dpll/zl3073x/devlink.c b/drivers/dpll/zl3073x/devlink.c
index f55d5309d4f9..ccc22332b346 100644
--- a/drivers/dpll/zl3073x/devlink.c
+++ b/drivers/dpll/zl3073x/devlink.c
@@ -167,7 +167,6 @@ zl3073x_devlink_flash_prepare(struct zl3073x_dev *zldev,
 		zl3073x_devlink_flash_notify(zldev,
 					     "Utility is missing in firmware",
 					     NULL, 0, 0);
-		zl3073x_fw_free(zlfw);
 		return -ENOEXEC;
 	}
 
-- 
2.51.0

