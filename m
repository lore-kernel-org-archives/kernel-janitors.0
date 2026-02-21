Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487743115AE
	for <kernel-janitors@vger.kernel.org>; Sat, 21 Feb 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771670502; cv=none; b=Xnuac9bok3ga8gLN7r5DrNoHGu6jv5fKyGIprCYEO0KFNJzW4XmnwXg9yNF8taMwzft4Rsh27h6RpvlBcdJM/PglHS+h6VrKyZEaSrrvQdUic7vSPAJDW+DXpBp0wTwwAFPCUlwtX/Z4B39wCt8L69Q8DCCm0ugfhVzBO0xtEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771670502; c=relaxed/simple;
	bh=DSF2NhmQGDeFoSnzI+Mg1CGPDPklUr4KfPrHzH1V4WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xrqi4BeqJCk3btXC/bJDF0tGeRxWxqTHRXYMOY+ijyBrESz9Rv4myQ3v62RMDq5YPoySyIf8HUePcTVU8ZvISxegMgKRRtCXJpzrchm0XLbkMfi0fHLdbOsNvI0/1WvrCe8GhiIoD7hvlTdLUCfuHz2f3dWeoaat2csB7it9Q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJeTfUhO; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJeTfUhO"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2aad1bb5058so30634845ad.0
        for <kernel-janitors@vger.kernel.org>; Sat, 21 Feb 2026 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771670501; x=1772275301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX6B3fZCA0dAwqSvjvOB2FTtcU0eRxeM2B9ioo4wtiw=;
        b=jJeTfUhOKQPnqSYz1ku84wG4mJGTQI2IHxzgG0dIb28ZwDHIckqOwZWaeqaozSBZmz
         ix9v/le4af3/d2eR6YFlBF+cXe2ElpcafJ+Zcoxp4DtfnPZt4ozNGSPx3dc+UM+QAc+S
         I/8CC9M7fLJ//IBxcs9ucg2qUq7SltKrREUF7OQuPGRD+P9aHN9KzugLGuX2Erq6Eydy
         7jaWClKKZH0kdZdKmvYf6TECTYhS/lH9VTp/Qi+zHUpgUI1LPFl6mTcvROW/KppxChQX
         +1qTz0bDsy3n6+vzNbv9qKpfq165iPZ1e7eCH3Pr0Pmn53BKHgT45XFFprPSTkliO7wU
         Tzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771670501; x=1772275301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YX6B3fZCA0dAwqSvjvOB2FTtcU0eRxeM2B9ioo4wtiw=;
        b=ZFmWRCc4eQzBkl8MPM0eG8SYxTXHhAdssn/UsbR7J9l2Mh7bWuHaiUrY5ri4HBhG/E
         PkvPb2LHFcq3T4nURiCCf2l6CpwzlWvmAV1jJckXoaqCJQG2E1JUQBb6U2x2NQTEu6a9
         osbB5t6nSgUGWhG5dk6/KOrZz4Huup1nC8Q1MfXIZp942LOS1GwrS95xlF1qQ+TRLj2r
         AurJw0lB0nxk2syfST957PQECp69WeG1R2kRXkFxKrWp5nCVZEca1Wjd+hOLntTBc2uK
         mYVYcRFqXDxaNGm5ho5alMozjtIsZshW/LCNRdoFf6qLZ/9JfbhGfKJiDQCXgTnxwUsk
         oy8w==
X-Forwarded-Encrypted: i=1; AJvYcCWb8BanwRvSQ8Et7KK9lK5fT4YhVwuKLJxIYonPr7Z3EarkSqpa940VCNvt+0pzn+B6HwuBx2c7UZp552UxOvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybzWUdOnBgvs0k0jvh3IV8v2puvXGmgksBCb19Rd94F6LhZUTY
	HTBrOAuALwooCXeueCXrgU+sYOL3nwHvjeniqwWH8HAn6ZK2yevm+5EM
X-Gm-Gg: AZuq6aKMgfXEeHvjnai3zgtsY1gAdCGRoXWyGpkXX8CU7+TCweYzGHVhuxkxqem5COS
	IvVBd2qy8TEZML4ESB6MVsZvIwHcg10eRQWl/np7wv7MEhml4Y5wfpjNlW/MDnTcVgDzoIwPxyg
	2D43dNVmubolU6Dq3By1S8AYNtgOsKHUUO6ypFrjoqhfwH997r07j/7erBBC1qYM+Anb6T58v6u
	yeHtsc4tJdW1TukAXFjRS4E49nU4kDTLGtzTwv7dLjAC0lbPPIp4es0NU5HFVSX2yLoD+Zm4yaJ
	kaQwXCrElHRLkIPdUGcgRnN1GNBM8qImx682MBPWkFd0X95VlfLEh6HiCxusUQikghvf1Tjzu8f
	4B+yhqyb29Jyg3YbU1hUgL9ZEW/Z27qOc8E+EOh0sXbPSZh54Eqhh8lYKeQxSLu9THRrESNkkKo
	d6uEzU9Sq7jDb4PKSyBu6GJc6dr4JNNTblyx4v7NG5WOVIzp/Ej7m4XgldVNaSgxer9XB5
X-Received: by 2002:a17:903:1248:b0:2a9:2a0b:4ef5 with SMTP id d9443c01a7336-2ad743fbbafmr25024305ad.7.1771670500635;
        Sat, 21 Feb 2026 02:41:40 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([103.73.101.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3507csm20656665ad.8.2026.02.21.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:41:40 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Sat, 21 Feb 2026 15:41:15 +0500
Message-ID: <20260221104115.4400-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZgYKin2nP19CZyL@stanley.mountain>
References: <aZgYKin2nP19CZyL@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

You are correct. I ran Smatch on dwc3-qcom-legacy.c and it did not produce 
a warning for these lines. I identified this issue through a manual grep 
search for the pattern 'platform_get_irq.* <= 0' across the drivers 
directory.

It appears there are several dozen instances of this pattern that Smatch 
currently misses because the '<= 0' check includes a valid negative 
error check alongside the redundant zero check.

Thank you for the technical background on why Smatch handles it this way.

Regards,
Zeeshan
