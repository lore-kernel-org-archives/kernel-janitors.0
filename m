Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0195D739
	for <kernel-janitors@vger.kernel.org>; Wed, 31 Jan 2024 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689472; cv=none; b=GJG+HqdoL0TGEp6J6LlY2cbv+Fkux9lJyW7GO8haxciSiYwD/E5r7GAe9N+SDRSdyqDqGClYopYExSrE6Ub0Ny+/2Sh4wfot9KhKb9EuBCEenm1lNGVxXGfYHYuRp/yKa/MCU4BbKe6kW23wH6yO8TUBZJmzNj48hj2SeQOtL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689472; c=relaxed/simple;
	bh=ZnF7iKo/ZFbGkBB2MbsvheyNsQD3je4DZX7Au09k4DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZDg27InLcCf64MipnlRZ2fxfCO5b+vAWqDTxrZNHVMLkJMBsLYHnS1CvqRrgI6INDGbkdo1SfWXbq0Lv0oc1lpAVMSP9Dp0QxUHvtRhmnqaINE1hY0EikjDCXqqjS1r9Og90ooPV7TkvgayNcIcN2MXtnRzLtML8kDRbObRJ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYIjIA42; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYIjIA42"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3392b12dd21so3281674f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Jan 2024 00:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706689469; x=1707294269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlKKphLBogbuT0RBIYdtdc5+J5iprMNNjA2TgZhIPr8=;
        b=LYIjIA424ArZUH+A6k1TiLRxSqxKvN+2UragETnPzGYK0XyY/A2i7KxJtNErzRIR3q
         obmGR+XJOmgITikXmLhtGZUIc143UjrT4xqWmBgj9+dYLCKmCTy2d3sa/lhKCbC9srPm
         ncVoEeAtyexe4Oq12f/ufI3wv5hc5Ofh2Adfgd+KbHgmk9FhZy2bG8fWxNw6UtT8gopP
         iunBbS+p7MHmkh+rerDWPHLWSSjeMvlAtT8z4nsn7qKKfl3puDlR9QQu8FLIV8VWXy5+
         3HE+2HIhaza176QAbvU0pqs5DvRXu5GegkWeolkthvbrNcr9FQqFKOQ4ZEyjNctmYSEY
         ycrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689469; x=1707294269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlKKphLBogbuT0RBIYdtdc5+J5iprMNNjA2TgZhIPr8=;
        b=QwItNRImfdiXpWxeKo0waOd2gUD2Fb0Zt6i4z+Y4YfQsdhbglSrVwBtT0UNog4AaAe
         01xt3TbgAfblm3JFLS9NyqEEdDPIujc/vBWJns2bZNTI6+BVfY5clKoWGjlLjylRUcYw
         f7DmTrjGadfeLFIzqiQIxeCGy6XOjVH8cFnX1MABAyfE6e+gbaU3A+fJnvB9tlaPgexT
         cdARNiLJyTBol6Ore1i2WdUUmirWht79GUTq8G0E9ZuKt1ExJ8JUw46R2fxBdYr5x38M
         RF0b9sVQKYasA5ab3huLxxDADHPLviL8rUxo6w73vu4GhwSrize8evH9BHE7PvumtXnO
         1OmQ==
X-Gm-Message-State: AOJu0YyQYLA/kiriO/eCg19EX3gHzB3Msoj56It9emedTyhA3AomA2Iy
	O3ZKRnvxylxDv2NO/plvzi4ddfbCWDQl0Ag/a7iJlxsNv5wS/uHrcnCXERkAkDA=
X-Google-Smtp-Source: AGHT+IG/KsmeYrAxJSxpF1zN165aGnxdGMtGJFaiuGGf+pE/DxpE2WAhuz1IAOCKENhXBOFFshzNUA==
X-Received: by 2002:a05:6000:25b:b0:33a:e52b:5a36 with SMTP id m27-20020a056000025b00b0033ae52b5a36mr470161wrz.44.1706689469111;
        Wed, 31 Jan 2024 00:24:29 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id bj26-20020a0560001e1a00b0033ae6530969sm10016575wrb.85.2024.01.31.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:24:28 -0800 (PST)
Date: Wed, 31 Jan 2024 11:24:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] RAS/AMD/ATL: Fix array overflow in
 get_logical_coh_st_fabric_id_mi300()
Message-ID: <279c8b5e-6c00-467a-9071-9c67926abea4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check against ARRAY_SIZE() which is the number of elements instead of
sizeof() which is the number of bytes.  Otherwise we potentially read
beyond the end of the phy_to_log_coh_st_map_mi300[] array.

Fixes: 453f0ae79732 ("RAS/AMD/ATL: Add MI300 support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ras/amd/atl/denormalize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/atl/denormalize.c b/drivers/ras/amd/atl/denormalize.c
index d5d0e1fda159..49a900e066f1 100644
--- a/drivers/ras/amd/atl/denormalize.c
+++ b/drivers/ras/amd/atl/denormalize.c
@@ -405,7 +405,7 @@ static const u16 phy_to_log_coh_st_map_mi300[] = {
 
 static u16 get_logical_coh_st_fabric_id_mi300(struct addr_ctx *ctx)
 {
-	if (ctx->inst_id >= sizeof(phy_to_log_coh_st_map_mi300)) {
+	if (ctx->inst_id >= ARRAY_SIZE(phy_to_log_coh_st_map_mi300)) {
 		atl_debug(ctx, "Instance ID out of range");
 		return ~0;
 	}
-- 
2.43.0

