Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD17395AF9
	for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581083; cv=none; b=ZGXSIltNVOd/Z7cbk/12FuXUnepKSYYhvlSYvlfGZnqwztqdFq5qGj5//39NQa4mzNmfJVeHpSk5tJ50uY1+tt6M5UCjS7XZjJBcwxq9MewgwFP2sPxCEgj1Wckujp4sofZgih/bbfLR182KwSPBj7UT9rV9ndttxZclda9NtQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581083; c=relaxed/simple;
	bh=1ihYxeZy0xVM4ZTgNCYSrPgt5wfbDLc6o4wFztW63Us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBkR9+4mV+FCvxnNMKCw7T1sO6zGa+Ce0XxpDnqvpjI1uxwYYYi7bDsZ9zqKM3v95fXu4h/FagMtqHcka9vl/A+LlQwQNR4yCFl5p/E4c1yx/vDWbkvK183h1WVB/+Zo+z5rv1wPndN/ahw0X/Kz+ZPoKvN2d7d+rKxKqB0gfnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esjjwCl0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esjjwCl0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d146705b4so65405245e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581079; x=1779185879; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BPjmQ+e1w3H/ZdOVio7epboMKxq2EH1m6tGkpmimMY=;
        b=esjjwCl0osSmx+RA4ehzn6n7aLqcdNz+6/yp79ri/ENWuUFygsWNf2d125LBUq5FPi
         AkVWWzxFc++jxNtcfQh08ppm3t1w7FsjHyp+2kad9pEg2SJU/vpsy0TE9Hq4B4Fwv4qf
         lmqevuIMgI5JJUllh6MJQvvaltgZn9abPLo0UscAAuefs2EFjq6s++BYgK1Tbl0w7vct
         If/LAJ9oYedE74mTSb1ZK/Xo3MLbACL8MVnL1aVXADt9SOpFPth9RwR4PedmLS28jKcP
         v1SdxFXslI2BfpPo+zqrULfrV5d/zqDk/QVZU+BmCOlW6YKRBeYbVTUHwaAqy7Z7cDSG
         gbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581079; x=1779185879;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BPjmQ+e1w3H/ZdOVio7epboMKxq2EH1m6tGkpmimMY=;
        b=TOceIs8IWYrzPJcZytCU3mcR3Pj7eMrSdldr8KV2AWUa2HTRQUIoEADNCAsrB7BRVf
         FK7dJ5fwWIQCN4/rRTugITDl0sYnetjHD8OsG1qSfxTa0i9b4zg2uf0+evNcCFW7s5Lq
         GgwaUa0/Ot7SBX2kosLICNIwATr1us8FwZIhQ5D/2CLd+spFeWIwVqJXfDmzBLnGJ4Si
         AHbvmmoDq0tXxdsjnZZBhpAGj03Y9dIIwMzIFPrU0KE+2AFMZi+Kb33uHm4znFdMu6Bw
         FtJjl5uH9i7+O23SNei+lCdd3AM3K9wF65cKejYgzJ6nSZVRyd4oqUujerncoia6mrqJ
         lsqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IANVU7aO2N9vjiG9vrNcyWuay5dSI+4eySLftPzak5hS2a8gRwWGSWpArgfNxESvPMVJ77mhmoUkbo+9QChs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbJm2lNhMhfl7Rf4mT2sJVU+A8CN9LXumWDchyBDnIJGjEi+E
	ZIcI6c3tXLUZ0DvXmQsKKHarTMAxMJRum0TDmsCUcdDbm0WJTesLCiWm
X-Gm-Gg: Acq92OGChrqFMVAF/KvmgIuGxheQ3JZTPo2YmRrsB1H92UzZO4bas+lF4HE6UeHT22L
	mpn/bRi3LOlkd/kHuXuOflxCHIjjl7Foy8ywYq7DnSiLrDVN/R2SNpETC7xz6b9/KwA+M37Gek0
	IBeDI1Fd/iYoMG8xYSbM3hms0En/oR6pHw7gW1H6PTU15LbgB+Hsb8o4/UHwbqt58McY9J9IEeY
	tXdSFvnQ3ZyLgM3+4T6rbkozDohvTFz96SYsQwvCtDSBwgE7WjoO6kt1IJeV0xSBUlKzKVuVR4n
	+ED2DoSyXcOeHzQU3xIKcIeSJs1xYES03t/jfe30fGTERZpwVfxkMhvPhcvrG8N88qImmlvn4NA
	9TgAWU7N5z5vUHKyygACqqW5lpCn573wuKY7nP91Hna4IURr9qsYICmr91WJ7uaqQCtxjC3gGAh
	1FISOmUAOtp2Sld6ik2L0=
X-Received: by 2002:a05:600c:474b:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48e8fe5017fmr34845395e9.8.1778581078730;
        Tue, 12 May 2026 03:17:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm24709975e9.1.2026.05.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:17:58 -0700 (PDT)
Date: Tue, 12 May 2026 13:17:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Fan Ni <fan.ni@samsung.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] PCI: dwc: Fix signedness bug in fault injection test code
Message-ID: <agL-Uwfn26SI4Gb0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kstrtou32() function returns negative error code or zero on success.
However, in this case "val" is a u32 and the function returns signed
longs so negative error codes from kstrtou32() are returned as high
positive values.

Store the error code in an int instead.

Fixes: d20ee8e2dbd6 ("PCI: dwc: Add debugfs based Error Injection support for DWC")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/pci/controller/dwc/pcie-designware-debugfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index 945f8f9b6d0e..a6737bdc46ac 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -305,6 +305,7 @@ static ssize_t err_inj_write(struct file *file, const char __user *buf,
 	u32 val, counter, vc_num, err_group, type_mask;
 	int val_diff = 0;
 	char *kern_buf;
+	int ret;
 
 	err_group = err_inj_list[pdata->idx].err_inj_group;
 	type_mask = err_inj_type_mask[err_group];
@@ -326,10 +327,10 @@ static ssize_t err_inj_write(struct file *file, const char __user *buf,
 			return -EINVAL;
 		}
 	} else {
-		val = kstrtou32(kern_buf, 0, &counter);
-		if (val) {
+		ret = kstrtou32(kern_buf, 0, &counter);
+		if (ret) {
 			kfree(kern_buf);
-			return val;
+			return ret;
 		}
 	}
 
-- 
2.53.0

