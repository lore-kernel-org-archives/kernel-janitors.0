Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46119E7EC
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718386306; cv=none; b=Yz8GBNyrZI8XJLgMGLReUcuMC5NJ3/EfFQXJig/hUhHd08pEA8VOyShv2hTmvV59yCtSmY91YdQq9JuwkK7FtompEzzL4rgYtgJrovcDNw2WpjtowK+vTt3vE74nXHc6rj2HfEaa9DiF4CPhXLaCvWCGDjJcQUDCgkJLG/rFws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718386306; c=relaxed/simple;
	bh=BSipHlIgDvAU9jtI+0UzoGnMftxvZb9NU2THa75rZr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KBXAfUv0KELhcAGMbEFOkLsbq8UzZNkjyC43rx31L6kSrm59vs8nu/yx97JSUdKJ3Hxd2wTw2byqJF06FZRtFLRDD1f4FHKOO2pAZYwYsf5Z/oEc0Z1iNKW4Cf8C8s4gWmoNxZYPAcDVRnOo5szGNttX0j5SO1PWHbL1sFLxAG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JMtBnXml; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMtBnXml"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3608545debbso527669f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386303; x=1718991103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9aAn+dyPFDj13W9kA9p8UoX5UEoPcAwL160WAxAoG68=;
        b=JMtBnXmlPkwAZGeP120iN5JmDE7dBxPvv/O/r4PZ2EtSpsOvoafQjb4HqXugYmIohg
         7+oTb+Ca7kqtML11aUm0WEpcHAaLSjAOMqb4prFAJIkZhACXOM+53Ddd3Ts4TyaXaTkC
         J6482p/iPzmWQNq2Kg92AT7omsUN7jj9CMnZ/Fw5XTOk6lNh9cfXhmBgg1VmFRgv6a/I
         pldcPbi/usSIM5+5oWduSQ4SvKD3kS1/MVzno12JCJs/jYFedMRZPoigT8V9cIRA9OVv
         lZpezaREi8rlC4/sSo4dox5JVNE0/9KIz1YXUSoR3uVTeK5Di8xLHbFXUSPtcrzIAc/P
         x4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386303; x=1718991103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aAn+dyPFDj13W9kA9p8UoX5UEoPcAwL160WAxAoG68=;
        b=kfMPVs4pKEYBwH0g0dT1unOJFwRrmg5iqte5KV0vL9qVElp5hcXkEGgTOcyT+aJ1Ek
         EjksU6tt9VwILh6ZY68dIwLORc6O3xADpsrg4P0HHaXnuuYZO99Xx0Nr2yEAUGxTkcgp
         908/RiqV4DD8LM7DtCvPwU/EFtBbZZN2hAcFgNmhkrUSUtGUckJytL8ab9FF8zIdmoeQ
         nLDikG4tdb56DZQC54n1n48uc2ygs3eM6yuJI/HoXWrHERwpkd+MrTpXCmJ2DK9+bPNK
         vZiK1wOREQxxl26JlcFvxohOYfQCKnANGC/ceAwmts9IN8Y3RddaLSdfr6hfeBmx1khg
         hmiA==
X-Forwarded-Encrypted: i=1; AJvYcCUzc+SgnyziYvQR70RfapcpBUUrxrRwTvhy/SXx2j30Yfg8wWIsYSZY5X1eXKKGu9Enl7NwNu1/1dD22/CJAfAOphiNaX6HCtro7A+6wP4w
X-Gm-Message-State: AOJu0YyfoYhXXMdnJl9d3SqAvP8qbvEz9UI7RamG977NZ8IwxWnsGoOY
	LMrlYZuMeslbq93m1NatV+FlIe+vXmdoDm0AydKfrvb4tc0U8xdu+qvbLpJbMQI=
X-Google-Smtp-Source: AGHT+IHG7stbgSaExY65n+9KApXBI+yAhKzMZixuvshFIifsWmYEYNx+9bdoDb5iW6MQiJc8Gmrfkg==
X-Received: by 2002:a05:6000:4014:b0:360:7558:49dd with SMTP id ffacd0b85a97d-3607a75c379mr3218191f8f.36.1718386302611;
        Fri, 14 Jun 2024 10:31:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad082sm4909069f8f.59.2024.06.14.10.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:31:42 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] ptp: fix integer overflow in max_vclocks_store
Message-ID: <d094ecbe-8b14-45cc-8cd8-f70fdeca55d8@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems, the "4 * max" multiply can overflow.  Use size_mul()
to fix this.

Fixes: 44c494c8e30e ("ptp: track available ptp vclocks information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ptp/ptp_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index a15460aaa03b..bc1562fcd6c9 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -296,7 +296,7 @@ static ssize_t max_vclocks_store(struct device *dev,
 	if (max < ptp->n_vclocks)
 		goto out;
 
-	size = sizeof(int) * max;
+	size = size_mul(sizeof(int), max);
 	vclock_index = kzalloc(size, GFP_KERNEL);
 	if (!vclock_index) {
 		err = -ENOMEM;
-- 
2.43.0

