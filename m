Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663F18C3D
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714821953; cv=none; b=ub7BhGwMMk51O77eiqiHwPpDH9+j8haGw1jxCHHfd7fRhjAiEsnYCCXjOjyz4Lt3WXTqYtvfaw/LU2eCKG2/m7ayEeKqTm4Fm3ZvObIckFsX++aZdkuCFH2+fzJVVh8Yps4Jzcelv4/m98UFOeqpYS5kDztZ82KHMaCWKRGeDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714821953; c=relaxed/simple;
	bh=4R6lWWk4F+MSTfFJIUE3nMNDvuJ039zVA/52AkBhpQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbEJDLX3uokfr8MxSdSn71v6lk/JlpICsPmG67/5KIlBuY/Mpq8beEYqEe5D42JDde6dzCtwXpuU/2cKhFS8CHWRNEYQ9P94txKeLTCZjAcyKNDJxX9cyLoJnOiIXyVSQk8/NmeIwoMclNFT3lJdnrdDc3nlRRUpMKUFTZfpGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nt7oHHwm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nt7oHHwm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b5e74fa2fso4514695e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714821950; x=1715426750; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzT/pgsXlCPnmBQoa3l3jmnuAByrCDFjM0ki/8uzIUY=;
        b=Nt7oHHwml419tXSbhTICgpcX6SusKMcAuWDs65Ww2Mz5+EW2/SvnktPeoc2iq3uYfv
         4ZHwfGRCD+2gFqCUXpmUcgDaAxdT1+dBgUArwO4IvWQwZph5Z7ZRPs0p0xmpO/zYZDbM
         zXNC8flE5j3FOvFapuXIcW4E3s+1m6f1pnZ0yqQW1gKVlCz0TvYG2zauFM334MOMlQNp
         lMjAcL+apJJ/plTiEvC/Otm0pkU8Q6d1D1MpoOOp/rfUAloQ25Wrey0qoV1QSycqccZL
         XOqY/ss0+bCoLm4Oet4ea2kMnwij4Q27RHjPlXq9SHKMh5whVHKIr9nLdyoyKoQicHGF
         mYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714821950; x=1715426750;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzT/pgsXlCPnmBQoa3l3jmnuAByrCDFjM0ki/8uzIUY=;
        b=Edbf62vL0DdT9ufSnN+P5xH2hEGrL+TVFKUTLs9p30NWoMhH5KPYz8H/BMvEFaTilV
         SWxHVy2s0n9ll2JRjAK7jwVze6DcwKeC92osYMllngh5BSrPfdePR9QpSTi6nIRwRf+H
         l1o8elY16KarRzDj9JS+gAk6PnT76YCXhW8WLfr/Xljyy94SYF1lfqL2rqDo7ZbJ0WUm
         41BP0jdLUq37n1o3V0pgtLFDIPf1zf1d7uOkipGLUnVUf0OBdP1gDeJJlZgx4/HeSDYY
         w5N8/BYB0ldFeS+gVPQMP/c03mFZuCs7CsJQeAJUpVkNZAu3ySIzR7+hx8xarbLRZF88
         eGkA==
X-Forwarded-Encrypted: i=1; AJvYcCXE0McAi6sOZSxd2PPZ+OqJsHy1sTJKKP72MixjSbjdXFwyFz4hl5dk3DVeUAxFE6pg8J3JppeboMasjJi5Y/jk4BN+k4wK9bGRYxzyhhNO
X-Gm-Message-State: AOJu0YwXlWgOgEO9vA0JLdxBTDCYt0+LWp/UoZ+QsHqbkC4NaU80WxWx
	1efjRRzms5lozN6ewM4uIVIausiob44cUiWBJCPas90L4vM1r/Noxb6QuKN0T8E=
X-Google-Smtp-Source: AGHT+IH0dtuQdk52wloIJDcyOMVhqG0Joify2yarrnZ1m/g3/dA4l8Gi9fUnltSy9j/eM5iNR6TRuA==
X-Received: by 2002:a05:600c:5013:b0:41e:1f78:314d with SMTP id n19-20020a05600c501300b0041e1f78314dmr3578278wmr.24.1714821949781;
        Sat, 04 May 2024 04:25:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b0041bf7da4200sm8982436wmq.33.2024.05.04.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:25:49 -0700 (PDT)
Date: Sat, 4 May 2024 14:25:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Bluetooth: qca: Fix error code in qca_read_fw_build_info()
Message-ID: <515be96c-4c44-44d5-891f-fe57275e9f47@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM on allocation failure.  Don't return success.

Fixes: cfc2a7747108 ("Bluetooth: qca: fix info leak when fetching fw build id")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bluetooth/btqca.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index cc61014ffbc9..3b018ee33725 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -136,8 +136,10 @@ static int qca_read_fw_build_info(struct hci_dev *hdev)
 	}
 
 	build_label = kstrndup(&edl->data[1], build_lbl_len, GFP_KERNEL);
-	if (!build_label)
+	if (!build_label) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	hci_set_fw_info(hdev, "%s", build_label);
 
-- 
2.43.0

