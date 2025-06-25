Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777AA10942
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864966; cv=none; b=jJRrv81MOgZurDPG3p8ouiZQ0Sd/dSb4stcDVTw9Sw3x8UY6b1YZ76b29DoReKbBun3NLLoBGpYbQUisKkkB/vl6Oyvwg14IjBWoQ2g8KEO9PHVOTHUr4GmzS3VKNSrE+BtywKfAikpKIvdwIzPDCUAW3RknI4oPYAwxoFc2iaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864966; c=relaxed/simple;
	bh=mQ25qvLYMDyvpv7j/NtUZhUMRsahcY03k4TaRiRkM20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUr9ntG89wcWweLU07webdG2hcRWO+PnmgoghdNy80oLQZkdFZXGVBa5u+UWwJHNLbhCOZznDwHmWaZGk2/3QrDQdhf4S7UI8fT6KO0Vw4kFZUk+6Tz1RfGArMmA/Zr0XUfWXSqOjt9Y3hvliN2Th0Bk63yd+yTYJMyHRlsQvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVEeVp8D; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVEeVp8D"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e8f7ca7ca3so20964fac.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864963; x=1751469763; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=FVEeVp8D7I3eWP/zEEURmhwpJmvCTTmC8Pj5y+FDFPIvzj8Rtl+Zz8DJxTW67fY3Pr
         zPu0e7KC+B7RBgGwZ+pLVa7Ia3Qe/wvNoSP6KDiJICpazSCtJPIQpg9kvV5+X9xlsjAc
         3Zk9nocvX12gjIUO3U3j+CF9s3b/rv+VrE6yVxqQt5jDw2Yca0lLVh512fHpUbr0em+n
         /WnQEcteaEZnKtGLlHuYEvEMb+dRr9gJ3DsT+olDUORWCigLtNCoOISSrxP6dY5P8mLL
         oDBI3iSdisUFIFSCHliuuj+o19uNIg7qQePHcsqcmoWTKqi3q9HYB9/oIz/iGj1HZIVm
         XogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864963; x=1751469763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=jJhP79lcqkrSs4UOGE3lSsgGr1kTJNcjPzxWkQ2gT8k/vszpQR7UHogzcN1aNytaj4
         zte1El/e0ULrAQH8ptJp138prX8le0kO99ZZ+b2xh7LCCN9yXOo9IsgepE0hRX9rIAz1
         drj0ojKW0hWw78l8UkSuUKVXCdT4aqzM9wBu8TScDflupG+1/HvgWch4W1DeBzquNfTP
         9LHgZVzHHImFFzyE4D7xLr78yY1tqwjsr8X6YwgBDlIWS5Lh2IvjYZnfAaaVINv5LLLP
         phxRtWnB0omNOX+ljtuARk5SyIhEf0OiR8Qj4YxPA9O2CfQFvKnFx2QzeuGSHUzRbgny
         UA8g==
X-Forwarded-Encrypted: i=1; AJvYcCVkm/cad447wj8A8MQhDNF4VswMg+OIyBoOdbbvgcmiV9qtV5syAgMire7r5xYmIibYVLRLWhy+791iVKikxbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlQ+wOOkCT5JM+7sf4tEg8Ir9H9J/SRZv8wEihD/LwUmlR58S
	Alvwmqmz3woc18rZvzfN9FUBR1XYbAvwKrEInhhrA3MAglZAWNsDLmz48mSOasgxorM=
X-Gm-Gg: ASbGnct5WsTiDE2TNStjV+HAZ/RpdqLWbIkH4rc135k7uujvWWNT8CHobEZX8goeXLZ
	JVXgBbZ1tuwk1nsnV4FlOOh6mtHV0MUzKe4trQfHU38nHxLans8sNQHdD2AO58kgizysQsV78+U
	GbSbhrm8zCksYsTVk3QlzPHvjmCcgfDy2a8U7pDyDwv45EePJVnhoWPy2ZDCAYNzh0kNzEHv9Xf
	fwZzQPUwmSjboj0F7qaWUEt0e6RbKFGVXmJGtJU7vdo1mS9MdCMaO/XKTFi3XaFP2rrbX1P2Ak2
	mEvwr6M20elbWy0TeLWrSbMnvCa2YnfOM1zR6Bdca+V1LVn9Def+98thZAj2Q+GtEMI+ZgXGSS6
	K9sOC
X-Google-Smtp-Source: AGHT+IFd6lJtom/4lncQLlKjav5G6+Wsq1AopBqbxlhEagb6rUzpAIrbOCnTOFGol9ueG4rxfQAm6w==
X-Received: by 2002:a05:6870:af88:b0:2c2:c92a:5789 with SMTP id 586e51a60fabf-2efb21346b8mr2671351fac.5.1750864963645;
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee664ba910sm2562945fac.8.2025.06.25.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
Message-ID: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function is supposed to return true for valid headers and false for
invalid.  In a couple places it returns -EINVAL instead which means the
invalid headers are counted as true.  Change it to return false.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 1b4ebae458f3..0ca268bdf1f8 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -33,14 +33,14 @@ static bool mdt_header_valid(const struct firmware *fw)
 		return false;
 
 	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
-		return -EINVAL;
+		return false;
 
 	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
 	if (phend > fw->size)
 		return false;
 
 	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
-		return -EINVAL;
+		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
 	if (shend > fw->size)
-- 
2.47.2

