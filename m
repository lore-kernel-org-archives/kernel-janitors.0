Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AE330D38
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918385; cv=none; b=Y1CSBBTLKu3C2QIcqZeUL09g+R3zcW7TRl8w+fQJEWG2CBetcXYIgXxn4GpVgPWbUK5Mkto7MHszYZJgSj8CRqhQwkzWggg5584DETWldv4r1V0dLK7h1o44jYJlC7EpYgooVg3wDneKIkxIgH19u5M2LCynCRWr5Az7vmDr388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918385; c=relaxed/simple;
	bh=dGJkN6SnVshmKW6KFF4UVx9o8lSkn1Lt8gx8YuivxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmRygiYXMDihIOiQx5C4HF9lxQ/b7Z3CyEalc96fQB/hP5fBFBw9XmvWRc/abLCAiG1l4Sha6d5Y5DqgETdwizl1KpFODn94TKi4CYMFtNmZriZ/3omvLpJPV1acAf1eMIlSqNKwlcTjuYc0ApTHayFAho4X0iJ7WCn0DDezgn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpCXJcaA; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpCXJcaA"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8230c2d3128so2177924b3a.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Feb 2026 23:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771918383; x=1772523183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=IpCXJcaAK7k0hT6f4MwikAdkW+l7zxShjxPvEpC2htMGtQOgaqMZnr9giLDTsH//fh
         ytpldfUj2cs1t5mPEL0aAFrtfK2epgtX/P/grDXIPEeMyvrwB92m0cTdjlyVJp8OuTsH
         e9wSN8MrRR33M4Q8JbNG1visBoAv2rXgIeoMHemWBZgPTMpf2lVWk1NSt3Wp5jnQ8Vrk
         Aqu+I6jWvxqkepKcXWCCUuOf53K5gMIwOCKs8G3XDXvM1n9n1C7ka4tDqAi7plMfey6J
         71uWVrmzb3LG6eVaOJsBu9jC3wbL9KmXrq2tpqBxk7OatCdP0btoxj/5zwOBNttxfFuw
         Ay2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918383; x=1772523183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=m/6/71qssqwg1xhv1ChPoFcec6XshU/wsms9cvioAaOJcsRgKOfIk/4FiAsjIt1EUS
         fzEmQGBnbICgMbpPCVGTaKd5qDAqb8Ys/D3J/SMlvR1fUc2Ee3sAlOUgUMJh1bcelVqC
         Hhp4R3TGNgyreOgYRkj/oOu/Xpf/REalWShOxA19pH9cWTSZFuTPfIin2AGoHJKwDer6
         lpAk2lEK0+vFQYy2c2k1XcJXW9dEPaWHNfyX1CB1XevvS7PaAYhNQB0J45YtEnIyhB1Y
         UmtAx4bz11Zk1Av1ou0m1CTCKRRSh0HpUkUA+aTjKEhxwr+eoQOudimjDvqMc2OFht02
         gsuw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBlgREBUIC1VOWnYicg8cf9F//OK4K5wB3RNn6CPQB/Rk/lcqMVx5XWRFUmfatlFT3+I/BNDKR6mpu5AcJ7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBgwb7Fsf9srDpUZg3RJdTluiy1/1xgzW6EDN4DPY5Q1jG3Dr
	/9+l2M6fNUlm7j7gD0Ht9W4/X01jME1IxCb7DgaEShdLEvOcDB3w77gC
X-Gm-Gg: ATEYQzxTLb+MuZVtKU0s17R8Ba5fFZPGo/qqVj2wMR5cNS3H2oHVnAjpl3j+78DjhAg
	VrTEpaUmTWDjEUfMS7a3WuCjkP14ibP3Y5bxMhhFCHMstnRJqeX0/lj8BAqB9Md4SBQT3YJZJ/E
	e3hVaclYIxyJOWyPnD9l8Il6m2UUY5h/X06w8rUcnuekfkByaZ3v46Gow+c8r3YdtlCXPHanhg9
	mqxuoqGq6KtgGjLbcIW755yMBdR/gxDg2ejTZYkVGGeetjqTRJHoBQ5hr1vZFeof3e+2iTjl5Zp
	kHq5evSAzX8PUBikIUa3kvWS5B23k80vVapNP4XZM4GiY19bNSluOaCTfJAtBIejVAJ56/QG1PG
	dTKfRJc6RoOFeuYqDDVimrPBMRHawriRaMciLhCfgtT0Qk88vq/+Gf1yAPQVp0ImsdtgqJQrXvz
	DUbZnu1hr4MkQKatz1Lhdf/hkeN7yncOewtv7CIY5GtuZdcdzJHJbzOb1BCrl/Sj24zeC2
X-Received: by 2002:a05:6a00:2886:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-826da8f1ab5mr11354487b3a.20.1771918383031;
        Mon, 23 Feb 2026 23:33:03 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8cbb02sm9994587b3a.57.2026.02.23.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:33:02 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Tue, 24 Feb 2026 12:32:43 +0500
Message-ID: <20260224073243.9053-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_get_irq_byname_optional() function returns a non-zero
IRQ number on success and a negative error code on failure. It
never returns zero.

The current implementation in the modern dwc3-qcom driver checks for
a return value less than or equal to zero. Since zero is not a
valid return value, simplify the check to only look for negative
error codes. This aligns the logic with the standard return contract
of the platform IRQ APIs.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..f43f73ac36ff 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -526,14 +526,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	int irq;
 
 	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
-	if (irq <= 0)
+	if (irq < 0)
 		return 1;
 
 	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
 		sprintf(irq_name, "dp_hs_phy_%d", port_num);
 
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq <= 0)
+		if (irq < 0)
 			return port_num - 1;
 	}
 
-- 
2.43.0

