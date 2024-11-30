Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D4715573D
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961305; cv=none; b=B55XM23fbvkHpqC5eYXeK5srZq66kQW/gP++x14XLfaD/lKWG/i1WXUKFVqwCFbPs/EXI/Nh6m44dZt9i5AZiRxyMBVdU72csbPhGyu4RbeEJlUapivEEkEHMwlwypprCkKUfKHL8XjE7+jDOzSb0QfvOsjdi6/PFOoWj+rTr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961305; c=relaxed/simple;
	bh=yGN0skpZCH/XVXgf1QIShlnVw3a2xJjULCwKrnqKSg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxcYc2JSjpFwawBdWSXULAz/xBEaluBN1uDtW76YoGRu9D0etIrPh/pH/DeVRfMfGEoeArb1bBLjlptYdxMYRoZN+YQt1OtXSOpJLodC3bYNLE7KIVu9An3jt1wbQObOH7LMOrT37S605tg+JkEtsfav+Y+3NLuA+TyFbUWRs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZTWUD4X; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZTWUD4X"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so6417150a12.1
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961302; x=1733566102; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Foltdq1wnJptf4CLVy8W4RVoCPqvSVXILCEAnOfXokg=;
        b=MZTWUD4XrpdcLOOg/ncjq550IxAEH9fos0PkNXiSDMfZIBB7EouCckfaKvw+SQvniv
         6BIYMzLjh7/OzNTCbdcXSd00o2z0JkDLP0ENn0KKWU/iXu98W+4j853c5Y1495fUPVly
         tCid7j6+99WpmrAbECIy5MUwKD0buQgnG6CvK6fEv7CwtdE5HSSL2E+kV8tjx1mdBmEF
         mbAQepSnwTujAaZX2EY9WIlXaXk9LRqudY/Wc3nRTQUGq7Wvw+TikBaeRZ+XAeVh79PX
         Qd60dv/o5jdJBs1vttP2+jjy5DiYRboAjOAGn04LfrO9VjIfcaadXLVgbTSGcvYy6M34
         mXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961302; x=1733566102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Foltdq1wnJptf4CLVy8W4RVoCPqvSVXILCEAnOfXokg=;
        b=MMhZrwa7K1koUOAPDOanQxtaeWIqr83FaD4i82RoT0mM2woxwUweD9LP3510OTWJv1
         triQHrylnAmJpskfVw/u90Cod717MbxbZpaWd8DEvnsU5FQbwhCpl+/zympVYr1OMNq9
         kIZQBz9i/lU+TqEgPuS2IylDuq5oBRluDRlv5a8z7OIJM3sfm2DEVIds7U8omXX77weK
         m0OVceEEHu2sDUXOzDRi41bH/hBxP2yGBBgHLINJcjaVAhXc5yUjvZC5LyWO812WX3gj
         gO9me0exy9fGplYcyG1m7Kvg9H7tWXO1lTIvqlzsPugZRU28klcNx/99rRk2mDrQivwt
         vV1A==
X-Forwarded-Encrypted: i=1; AJvYcCUP6eCv0knFcpk/TB8S6vMn8DYhZN7xM4oz1898qrLTrJQY0xdQrmSt48uIZ6d72nPKJ4nYacKW3zG5r0/sjik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdt8znSq4YOyOuRrx/JOrM1WTRtr4p5IgeNudPbs1sE+0xQwj
	yNQ5dW7Z/TV83XSUopK7W7Wz2O1DlMrZxTwGqZW0/IrI39dDrWkUhymDCZSw7B8=
X-Gm-Gg: ASbGnctyiVoCp7WYIkCizkXyhgLMxUcE1NdVacOF/VVn4/f8Xsi4sqlA2NLpHFQ1Kkf
	v5HBX0WEAWyEYHg+G7EJh/0MoVEkM9AFf8kRPYiMH4o3whGR1NJAe2YtavGZGdCuv1+dYlGLuJr
	0Gl3V+S/+3CA60qvw7lBbhmo8SZRAintrJIU4aZnxpNUIyfG/CPgODEhywmKTPAvr+OW6ITkiot
	HH9TpYvRiuHMC1TISCYwrKscwthu1Dfq0lX52gpWTnVmxOJLDQJpyBb3dxTI0GGG1Ms91/W
X-Google-Smtp-Source: AGHT+IEpsOjTRBw3ZIvPknkFFjSqYnH4ouKRAqfBsVsF+pma6HwTEfCu8fT9yrQ73+MialO52y3mFg==
X-Received: by 2002:a17:907:7615:b0:aa5:358c:73af with SMTP id a640c23a62f3a-aa5945075fdmr1341277966b.6.1732961302097;
        Sat, 30 Nov 2024 02:08:22 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a79bsm264809266b.151.2024.11.30.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:08:21 -0800 (PST)
Date: Sat, 30 Nov 2024 13:08:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ALSA: hda/tas2781: Fix error code tas2781_read_acpi()
Message-ID: <ef773f8a-a61d-478b-9e81-41a38a75c77b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return an error code if acpi_get_subsystem_id() fails.  Don't return
success.

Fixes: 4e7035a75da9 ("ALSA: hda/tas2781: Add speaker id check for ASUS projects")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/tas2781_hda_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 45cfb5a6f309..8ec03bda85f3 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -143,6 +143,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
 		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
+		ret = PTR_ERR(sub);
 		goto err;
 	}
 	/* Speaker id was needed for ASUS projects. */
-- 
2.45.2

