Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51D171647
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355819; cv=none; b=gVwhfMAnS1PPnSwKeFeZyhtTlBDqjOOQCHDLyiKCawkCd0OARv07o4bgqKQydFmueHaJbFmezU4C774apIKPnHP/6YGVXs2cT22aQjT/Gtu/ecIL6dDiAbcFcw8cvgfN2MCEJI/yBZzsuWlh6K/fnatyP1tlrEOCsg3wUgj3BCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355819; c=relaxed/simple;
	bh=G+xH4AF7qc1ighXdU78nJKRNV28XMKcLeMrlk66frcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYfE/X74yFYQAQ1YYiaIKOyDDnPgem+SDjVwi/iWg7R7aciUpa3G95TmCPSyaUhgXwNEBViRd5hzejTrTpplwxmPRoOFwYMZu+2ZF1NV778QF6SeC1KndjiWZw8ps2HzKSgGtYEJIoYTo+VawdNGBCYXCnNuU9UVyx4ytJTh6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJAnfTAW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJAnfTAW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59a352bbd9so371687766b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715355815; x=1715960615; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8I2JjkdieyXRbDrING1zf6naqG91T7vTKCJRxlvQiF8=;
        b=lJAnfTAWr0eB1d6zLYyals0T0hmKJdgXD2083m4Qck2tgYJuM+9RWaWPHbXmTB2Jyd
         PpoSuQvD6rZJ1+mnscgQe92EaZNrN3xdlZJ3TtZSaOgrBVW+g0xQgJdAhenaHS/0RuzD
         ZuTgBt+1ah6VdyCIttyrupILsEd5Wopg85SthMfUgFwXGLAZeirgWMeRXq7RVcQnh+vF
         21mHwxTvPxsfo5/wXTAxlnhoXw17yKD9PE+IqOC+DVy0P/dWrp1AahAWCkb1z4LeD3ml
         Sp7f70efSwRX42iKufIKrjsmEa7JWu0O0mehT5BuM5Qu3i51aV8b/AEM9jWPlsQXqpVC
         yOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715355815; x=1715960615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8I2JjkdieyXRbDrING1zf6naqG91T7vTKCJRxlvQiF8=;
        b=WMWwouNnDeGWoqbjjIZhzkQJ0Mi93gKjmCLgVh3+/2ObD542555QEErcVyZ/y8Pd0G
         sM14nbrlg6UjuvoLErYB2XGJ1etBssFME1GTrpLwMWHvi+PnylmEH9htGXaIytGv1vqL
         GQJxpOoqz6t3hiXPDVUDUe2+eI7OkvXmi1GROnsFvYuWFG1z5tToIwSf9f9QPV3gbkDY
         cIPcluVbBrCIyOiiObNg+MYrMwReJRgos9A8m+LGTstWKFsydGiT0LZgVpIFgmGe2oqH
         YQGX4YT3JZSQstyIw2Wyj4uyO7JFAZBj4i204i/mM2+bZornLWanFtHCWxKFbi5RhB7+
         +TSA==
X-Forwarded-Encrypted: i=1; AJvYcCW2cJoTpLrUk+ADCM+COcT45CrxcItU2Fm/YSLmb6znWnwCiuulWuNTjGWzfeGSx7xOhTKvytxNtD+VoFwj+1YfkQbnPU9DX+CxKJjH/PVb
X-Gm-Message-State: AOJu0Yx7qJ7EwjgUYgrP3Zgahl7nHvxJnfhusqkOGuzintAi5u/dJDCM
	rEy51v1z3azyLLV1k94U42G1VhxUFD83VZi6YRNjU+vwEeAK+AJQuzT+u8i+Jo4=
X-Google-Smtp-Source: AGHT+IE3xlquVur7sdhTe5QiuL1P4R6FQeWnDOJzPQFLVv0j3JLJeMKX/K7tBPcM2yD5KDE1rCRCRQ==
X-Received: by 2002:a17:906:b7c4:b0:a59:bb24:a61 with SMTP id a640c23a62f3a-a5a2d292a23mr261622066b.30.1715355815485;
        Fri, 10 May 2024 08:43:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d27bsm194279066b.21.2024.05.10.08.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:43:35 -0700 (PDT)
Date: Fri, 10 May 2024 18:43:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

Fixes: 881ca25978c6 ("media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style change

 drivers/media/pci/intel/ipu-bridge.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 61750cc98d70..44a9d9c15b05 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -839,9 +839,14 @@ int ipu_bridge_init(struct device *dev,
 		bridge->data_lanes[i] = i + 1;
 
 	ret = ipu_bridge_connect_sensors(bridge);
-	if (ret || bridge->n_sensors == 0)
+	if (ret)
 		goto err_unregister_ipu;
 
+	if (bridge->n_sensors == 0) {
+		ret = -EINVAL;
+		goto err_unregister_ipu;
+	}
+
 	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
 
 	fwnode = software_node_fwnode(&bridge->ipu_hid_node);
-- 
2.43.0

