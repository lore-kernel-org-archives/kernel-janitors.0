Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0321C3F0C
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055272; cv=none; b=bB48ZhRoHyxODW3ZcVDyxgVA1ODdfFGHewd+50ZyoQzWrMzi6x6f1HM9VAVNvsEmdcq+yqjAkyaWtyMN7CXroTkJXFW6spf+diecfaMSRO7yYsvWdRiBo32ZeI8IctP7AiC4WP5m7mIFfgHY7X9xzeR2R5mBiv/rxZo4W3xqiIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055272; c=relaxed/simple;
	bh=kRZxvVYrz7Hra0DaAuY0TwUpnxsMRb0GdYsC6KRGam0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjFspf5OXovUCqBhjawtgNnEIG/sZReeZc1aRX4OxHwmv5A7F8MBX3ykR0XZ1OVMJtd7VxYCJkfvDhwfKrN/081GXcEKLAwi8pBleVnsAoevcrrTMeZCpfbBRo/kuhlFucCprv6r9n3v4GOLwF8I4OHZRt0ZUxZu9UFtpYwNHO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xh3/9Y1B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xh3/9Y1B"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-454f428038eso14885005e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754055269; x=1754660069; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ikwrGSjcBBLrvu9XsOAXM0jftfGyj555P1DWTA9Hp8=;
        b=Xh3/9Y1BcoXy4gVMWOGSUfekHimMfbdwXykQLeZ+425zF/a+oqQlZovU42npsBKYsw
         kiGrNEZ2e6u/AnAH1nrasyhmNUmPqLhz5wTrRlVa7nSgaPh06e/BFNBqBL/+w+isvsC9
         o31tegrNe2+UpGnSogolYx+BkziUVj67GUvBBFz2Ynslmw1JoHajTmOwX7znySU2/1Jb
         UzBRw+i4LFqcW/7Sa63FQ8VfWP9YIHqwhwY/5Qen48KQQk8ZW6KtWoS8HZd7FssXjx8y
         Cv1Nh00gjHEE4D776DFuZKLiiW5c2NuiRIPXydDByWtphjgOjUAnVF7xOAixRGmE8use
         AGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055269; x=1754660069;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ikwrGSjcBBLrvu9XsOAXM0jftfGyj555P1DWTA9Hp8=;
        b=GoUIaKuckOOU8arta4YCMVYXQGniNT86j18Irs6lg6SLMeAM9KgHyfkxantY1BiIjk
         XJVmgWwRP4mKcQRq2+nEZyp7yowmKPhEAvGUXRJpdeqskA+ay9hBGu+udYc9OYHZfEoi
         ty1iFZBxVOIUttBKTGnTV2SgZoZRemjTaZS/UkkG+7d6JeqaiWK/ABofeRhF4UWSNrlG
         luVQbytZi8w9tPPbm93eU9norYLH27tkX+kSvFgtyb5euDwvz21k+ro7V8d2WknWFozI
         QqMcjToPay4061wA1PBbsocr5gdioC2/hSHGKPk4bF6O4LmlAfzoDlVtEhBhuyysNJHS
         v5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVRxdo4rv4IfI3xXZ+qnDFgUm7rhm0sVeLgGg1igXT1mq33NNvThqkOUZEDPZziGXXI+uvHDn6MuCiwJ7kbP+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkjO91APgB16tianrwal+L6ddH923SDNUjiMwPBJ95rnDQ6Lg6
	Gb/3/c1y2gT+J/tNk5ysjhzmIs+KY9Gy51aZsLL/F2DpyxvUnaQnLqEor6SFG3UTI8Q=
X-Gm-Gg: ASbGncs+0eP81ZR1j2yz0yINzGNPF0TkzHaAcleWjlca2D79ogEnWWv4pCXgbt3Z0JL
	l2MTMTxQZiHgCBM9Nm5tUPu33ypst96jS+veghcksRxcCKPC+Zd4b1ucex4zBYezFAdSG75n4yj
	rEErbxawNdI42g/P8Es7GfYurJtX/hUapXZYYDnmqj6MkdL/Uz5HGsCpJGQIiq0un8PeoNQ0OBR
	kW3HuS1/9nUuQGF8+wJIWo7uRDhxzl55ZI66hNeXJtd0VzogSNjEXPF5b2G5RhaBL/WmNCrUiPK
	niT+IN9iUHW+MGJdwIlXV/nR/LqC/5jVv8Lnjg0f43jFOidXAVB6PymLhzwcXYxYVlrM4+BLiIc
	q5Crfdl716hZ16wLc9vojIwaLmWjThJozI3EfzjgrJmI=
X-Google-Smtp-Source: AGHT+IF+SIPd3jy2PLV5NH/C2c9z1GDxjjS04pa20jYwnWKoaqf9mFZGTto/hJb9geJcaBIO6yUqfg==
X-Received: by 2002:a05:600c:3b01:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-458aa325e47mr28237545e9.13.1754055268940;
        Fri, 01 Aug 2025 06:34:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edf56e0sm66135635e9.1.2025.08.01.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:34:28 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:34:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] misc: pci_endpoint_test: Fix array underflow in
 pci_endpoint_test_ioctl()
Message-ID: <aIzCYdH9dOMDag5i@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added NO_BAR (-1) to the pci_barno enum which, in practical
terms, changes the enum from an unsigned int to a signed int.  If the
user passes a negative number in pci_endpoint_test_ioctl() then it
results in an array underflow in pci_endpoint_test_bar().

Fixes: eefb83790a0d ("misc: pci_endpoint_test: Add doorbell test case")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/pci_endpoint_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 1c156a3f845e..f935175d8bf5 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -937,7 +937,7 @@ static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
 	switch (cmd) {
 	case PCITEST_BAR:
 		bar = arg;
-		if (bar > BAR_5)
+		if (bar <= NO_BAR || bar > BAR_5)
 			goto ret;
 		if (is_am654_pci_dev(pdev) && bar == BAR_0)
 			goto ret;
-- 
2.47.2

