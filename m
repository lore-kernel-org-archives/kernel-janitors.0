Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0B08F66
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067821; cv=none; b=VZ2f3HNsnAanzF0p1tHYcK9qBlsKUIsdzKc19OFDpW17Nuq+yNT6oiw+IOM6KfwMkz9ZCc+FFgO8oX2FCEmVjMOY3MuhdX47rDpuG6f5f0/O7Vr4tIFLFcQHF6Pej3e0/nlifeIUoc7AJkSWbIsEjhGdZSmq6xGehSLXVhORkqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067821; c=relaxed/simple;
	bh=nCQxiJoszU8ksOrhF3/w351OjygrjbbqU1ObSybD2RY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1Kgel2nY9VZ48iXgEmec4788Y8E/M0j+CsSTRqlcSqksPum/K40+XVdsMtVCTJi/DvEzJP2kWTjoaaX8tq1uCsYv+rtfeQMSuMo6qTmUXae1g4atKtuy4IGU7Y1gqgf2/sgnKo2AxZlmQKCxhvlVrHx6Nw48sT/SWkpUOvkg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFBv7MO8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFBv7MO8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4560d176f97so12197795e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754067818; x=1754672618; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8Idzcjcrmg19teuU7qWglO1ohyMC29kZ4c9xikiJd8=;
        b=fFBv7MO8DM8RD48Bddnrzh2oxr+ZmOKyuxIUb+aD+BeljgnBqLLg2UxXuouQB+aZkm
         5ZQmHN1C9HYfIfqjRlAHCyoYhCQrRzRgqnGCafbnnbwqKIEDnFKyNFkirumOU1n/edMy
         i3I7xthmIvCA6eM/s/nqPDe+ixoGoIxOKrIMaoEcK0pdOZtkrBT9rSOe50ssOXPqDigl
         nMBlfk5KQQmgAHVRagxcMQumqd8XEI96/fsVL7a5rq+XWIkNcE37/vyxTWpSOfoU2TbE
         9cs1+vUvFIiI5Vam67kXFxRyQLDDXT9rxFZMBoJbikZ/+++Tsic5jFYOSdw4EhPyjNLq
         H0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754067818; x=1754672618;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8Idzcjcrmg19teuU7qWglO1ohyMC29kZ4c9xikiJd8=;
        b=H8Ir8C3eBvQcGixB3v/KD3Rf939MJB0VhrJHWY9Q5Guqm1VhJcPk7Unx+KkDAHtblG
         CUwd+219udK1/gChFTgK49TcwGBdid1CDjVcWNTMfOEcl/uGgtjzwbztaiNxJq4gdsxM
         Dkz3vQVR5MXqWM4zUgXxfLhcgs6DqIc+I3LOsMIKOa6rVKvhZixfaq1QmJEHYddwARII
         wETmXGsR/gG25nQX1x+FmK1s3IceOpJAdO8yf3siL/Iy2RiUYBxjA5SbtqWJO3bmVQEe
         vlXLwO/qOooD8xLZVFxG9f8s3vccoI0yKU41gywr2QF3ZsBCDIKdciPo9t1yLFdFXg3/
         pGVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzawIJQ2pQZb1VAMDh5B9XWkcmfJdFBvrwSJbs24HLwYOmGnkfDCZolmKctKEV3EPIMJU+LzY1aAJ0OznJzMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEwvux7LqTmkZvzAXevdjoO9g4cLcticl8ebdvVzbG38JGjhp
	ig0z+Dljb7J9J478xNoCQ5EBWRBOO1TEEIgnWGv2I7JR5iJswjyadSnrwf868xUdysk=
X-Gm-Gg: ASbGncsgr3kRpuJ8J7olKXHWHGP8SDg3uizasBYiKvnXxUZAonwdLtNCEA9xAam5/n+
	ZCH624px6y6HRLoKSbYwXUF6fKAndebYCGbzaEEnQPmo+4Yqrj8dHso9vZ+Btdry2PrlG3geaBG
	KBAY820Sv5XqOQGPU8cmua1iGx7/ug5l2iPmlWZoMqz49ryVgKNBxiUuhFPy/STxlyEeKwAe6IX
	WiM1iPO9dicYVoXQ8KTpaGjtO1lFtMSBYqGoxSnyGbXfpAJHM1dTjFQwu2Pi+9J4jPi6sdPhzF0
	/sT2d+fLE4mfJFbRA5g9OnixTD196VDSdiKIi9sRWbluQLfASiHveWL0c5k1Hs05sv2eRq047RI
	P7K9muU0eg+9ynX/stjt2YqYbvcqi7fpkipBR0rA4XbA=
X-Google-Smtp-Source: AGHT+IF4SZA4+gvm+qE0CvIZzsjptGyk828yA5KPOKH5NCsTm42x7LDrAlCkH3FYaw1k6NNDuh4ctA==
X-Received: by 2002:a05:600c:35c1:b0:450:d04e:22d6 with SMTP id 5b1f17b1804b1-458b69ca289mr446125e9.7.1754067818139;
        Fri, 01 Aug 2025 10:03:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf5638sm71554525e9.4.2025.08.01.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:03:37 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:03:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] misc: pci_endpoint_test: Fix array underflow in
 pci_endpoint_test_ioctl()
Message-ID: <aIzzZ4vc6ZrmM9rI@suswa>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit eefb83790a0d ("misc: pci_endpoint_test: Add doorbell test case")
added NO_BAR (-1) to the pci_barno enum which, in practical terms,
changes the enum from an unsigned int to a signed int.  If the user
passes a negative number in pci_endpoint_test_ioctl() then it results in
an array underflow in pci_endpoint_test_bar().

Fixes: eefb83790a0d ("misc: pci_endpoint_test: Add doorbell test case")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Update the commit message to mention the commit which adds the
    NO_BAR.

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

