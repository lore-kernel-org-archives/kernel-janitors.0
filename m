Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1B2686A0
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582311; cv=none; b=SF5NbHniycBpRwYhhmCdlSfcbN/cjiTfVNqDDNsYcT013k1YCnNA/Xw4H9Rm+Bx11eMQIOOzrVytpEuCf6RE1eVrj6g+pMW5TDTfi3/4H/IhRDymlo1AUxpJqtUKapPpg4UtrsCZfL13WY9OBFL4YqYG0K123+M1+rSLSRJOS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582311; c=relaxed/simple;
	bh=UebwSTgEBGX45jSwaqppv1MZDgNUsTmKmv0RDSYtYBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oemQTXXwsMic4rXj0Vw2GpT9LJAeXmgcblxfs8Zxb8y8cW+qkJcYtE4sozUCaLI1oVjkRr0Wn0FDJk1JVKfe9zxIm47bxJVtiGuTxf4EhHXlJmKwjhFeFh6zbU9yjWRngQEFtP9Bviz5QOhgkBdNDcPmS/boH//O65RAajgdkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8canp1+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8canp1+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso8867965e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582308; x=1755187108; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=I8canp1+HIYdWbmOTJfwAl3ic72csHSF9VQgrOjEGHQ4l8y4evhhxJ4ABC9uKGqKDK
         d3rGH4+lVZWpqlVguEXobU/mIpenQlinoV0jBumjFPSrcp6Sh2O414XnOrfwwY5pebp/
         Ml3SA/ZrCBYl+E/TcqcDK7nXtxmZO1uPgT+/HESLH1XMkscvtaqOKjNZR4G62c3UXpH6
         VPGlL0gkcaCFW8a2fAeUd/F4U8bhf/JWZoLlCv+A+E8d5UEXbLTGh5GNF0d7/Moi8tFr
         N4e2VQQepTLAOG1WCzXVe7ZPhJc2gVjdKnRdw/FuYdJeas6d4AXmIKYam9mTFqXDbP//
         Lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582308; x=1755187108;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=vH9d9ZXCD2BIfQdF3ABgW0oKBgatxe36puWBoZQLkdBuf01x63dgClJ2pPX4JkAeB0
         aIXTn8DMobMzGuWhEmx4L61NkzbMgxc7De2gyynXRkmpVDeZxxwRxymujw7mzx+Pj+Fj
         w4fh3cgUQWnPbkdWSYA7qZLsE7sOCEC3PgmQwwy/FGTJpU8IOWflUf5mhL4V5z7A/BF9
         Cy3H4xkUSwutBSFqLe9NDXtuKOpbttc++u42SYe3wYy+KcP0moZ/y3LaNpKP/LTHU0PS
         35P3EqvxRi1Walw7PV1XpAQE5sado/7TgZ03clDxhaoLJse8hAANuQ4aoEmpFt2gMpp8
         1ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQjWv4r+MtxUHezezwcjVO46Ko1bbkTLDvMRYy8KWpct/kGab89bUnGQ8pvDc5VHHd9OY3275vIUUbEaTsJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63qIqzgXoQCVoSCDgJN3bfORjFoLqIbdgltkUKVK/oWFRByQZ
	tEn7BV/ryIw6pHgdnAW+kPlg+ha9l5ET70fgBfeOikIiQYs2ab3ffx9H7PiXn4ovff8=
X-Gm-Gg: ASbGnctm70LFe8HPOIW6lHw9AasKllhiVcGGjWGj2t1yMtrAaaocZzVJIMmLywHDl/T
	sfvm3FuEFWyYghdvff6/K6UVoqdAGtBcqr+XG12aN6hWsPvsGQESzQj/7UlV+ztr4Qn7CmE5KDd
	63Y5NPvogMPAdBguOCsOB/tTrJzdKnyK0K7fyQsxcP8DKzzOKhxo4rKDcgXPkHukYdG4AYngBaB
	Xk7fxyt+1JAO1BZdzVjSQq26shszqPeLtl3fXXHdL6r3OPXO/R1xhXtvme9uekYcgCZVVtHPyNJ
	PK0w1Nn8L2E0dTmfz9RJK6ykda0TJtutx3sNamv7bQKdwc+nr5deO5jTKmkQrxEAK3XW8Jfrqnx
	EyMKeJH8D8URXkQXhl3fvWIL6GAQ=
X-Google-Smtp-Source: AGHT+IEQAtbjB5WuaftcfISb7loqx9lFVpOAzAnPzXuHW243UbLgIM9IVwryPWI9EYIwJTEBgNYAhA==
X-Received: by 2002:a05:600c:154e:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-459f431f845mr2720525e9.0.1754582307874;
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e587e154sm108933495e9.27.2025.08.07.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:58:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] PM / devfreq: mtk-cci: Fix potential error pointer
 dereference in probe()
Message-ID: <aJTNHz8kk8s6Q2os@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drv->sram_reg pointer could be set to ERR_PTR(-EPROBE_DEFER) which
would lead to a error pointer dereference.  Use IS_ERR_OR_NULL() to check
that the pointer is valid.

Fixes: e09bd5757b52 ("PM / devfreq: mtk-cci: Handle sram regulator probe deferral")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 22fe9e631f8a..5730076846e1 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -386,7 +386,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 out_free_resources:
 	if (regulator_is_enabled(drv->proc_reg))
 		regulator_disable(drv->proc_reg);
-	if (drv->sram_reg && regulator_is_enabled(drv->sram_reg))
+	if (!IS_ERR_OR_NULL(drv->sram_reg) &&
+	    regulator_is_enabled(drv->sram_reg))
 		regulator_disable(drv->sram_reg);
 
 	return ret;
-- 
2.47.2

