Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309533BBA2
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Mar 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788035; cv=none; b=oH32WoNc4W8jdq332vmtwAa05WIKk8juKXLcIvJuXr/n0VAXloSiaGKNHusMRJZ9bYJnnxWTJJaONjXIBbkq6Q6+6jmaOZqH/pdgpreOR0kH8bJAo/90n/1jeuOja33mH397fLf/NfeonP3a4V6EkWbXImmQzLHn/r3LcuaJSrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788035; c=relaxed/simple;
	bh=fmpuIUrjXVvpSnWsUCR4SK8dYfNMcvPYl9aPlUXcjko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=be1iWPMFyIShErFaI58Rd/1ZKDlne87tVNHqkl7Ew2OyTy11eSMqCjvX1nVFQRtTCx2QLIYGiz/n9RH2BCv5+QOZ/kwHajRmD0CwZzy/X79xtHzWlzznt3yLVoZGr+QztkTlI4fC8CfQCX/YOYmMmBnYnqTgzglf7ZQJY3Tp7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRW28Q8b; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRW28Q8b"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8297c035d28so884057b3a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Mar 2026 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772788030; x=1773392830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/XkAPBi7k7ykpD0UT2uW0E/tNzSIZSxb+xSJZFxgiA=;
        b=eRW28Q8b8+QLiZXkM3PiX+EjJM4BhtHblqUajEJQAGu7nzbb/N9pmtssQjq2dzC8yp
         vdh7xultLyYq+NiPjd4GUpihOpo/w53r8RodSVUq1D5ki7ogPwXM5QxKLEzA3XncHHIy
         alWIz7Xa5NHdIP8JuAj5zwu+vuhuPkLXEVB78R5iJPFj9d5AJPPopmMfpp6ljphyM86d
         +LhWQJN2ssqUuGvjxHTA3795HYKKQ8qocANBOx2nGxrCOQlghze9h4G6r0mph/LxRB9K
         KLTHg0HfgRoubLBHWbL5zVx+JucDL3DStADLDywGba+yUl29PGRtHGWvZIvyEdd7CB5X
         1AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788030; x=1773392830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/XkAPBi7k7ykpD0UT2uW0E/tNzSIZSxb+xSJZFxgiA=;
        b=ePEsipaNKR4JU6Et7t0YdobyH5xad1alJKRdH4GtfqscT1bl3bqwE1uu6m537IkFwA
         tWgbTQatWobvGBNhtpXPOTr1K88jAOq7hzzmWOBM80oumRAUHmINu1TiRnoPrEfd5T5e
         bC3aUz11agNCtTtsdaLGutYRlDsj7t13B8YU7fNBU6I9Uu93IWxR7HfYDTjM6SUrSaIU
         SK+wo3141hIVUHGmjXX0cmIX9aQwVMBtp5v+uVRvjvZOrJjqqC+pyx5sfamZeUxYsl3C
         88KaRLzE4UaVrGrZBjEh8GQlzSstvcMcz/5Npn5jQpEqNVmdyG2pFqvFZtLpq0nIG5Tq
         mQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUscQTWKN67bCK4wRwJh6GUzf94+ZrWztVzE7mtkRIPU6PjzfWLWXRihwKFxkxCU4J+nRj20u3h6cMfVtpsSZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrh9gZUJiUt8LYVLAzKT7UVlW2r4z1KPGJbdLeLD7NPKvx4E9m
	enkk1jHlRqevqgj8eIUqnWBU6qIPhJffpjcW4UJO79qEuJtSb8hDVMQz
X-Gm-Gg: ATEYQzz/Qf+Xqpe1QM+JgzSWGAZCfMX6n/SRGDFEe41NAWbzn/OYEaM3T2FUMK3hAvP
	AIKV6HSzfeH3oFSZT4ekWrzF3ZjICb4HpEkMeevOQ1zhETNcACfJZeagyANKSUTc7BSPA8QSenw
	+zzP9W2KgNuvufZGoB7icTf7PATawisq7LcYAS/WfOM+SmDlxasVij73luGzCtm0w17nPWDMw93
	uNkjNfdjHRnRCkm7V+TL0pHIHftYsPH36FfpiGVev1M2xINMZIo5SboMp1j8TVQHaqp9QGQ4wba
	rOV4B9VUFLimsK6fHUcAJq4heldxlDRRsrvcyP5ANeut8UhIyffp6qNk/snVGtpUGZKIhZcg0yc
	oVhk/FIR1rQcQkSmz4LCXszg9wHbMn070Z4va7QoSbTDv9xLh2ggnETzO68knmhi3b/LMY7rkDU
	w9C2JhQJDWGfjwBIsF7SxyffCNcKueRwpvR7gI8xVZ0rB/c1HXPvTMxPrC5UhckybeVSM/
X-Received: by 2002:a05:6a00:1943:b0:829:91f6:e533 with SMTP id d2e1a72fcca58-829a30d8953mr1341268b3a.63.1772788030538;
        Fri, 06 Mar 2026 01:07:10 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4867e54sm1166142b3a.35.2026.03.06.01.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:07:09 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	smatch@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: gadget: use explicit 0 for success in __dwc3_gadget_kick_transfer()
Date: Fri,  6 Mar 2026 14:06:43 +0500
Message-ID: <20260306090643.47383-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warns that __dwc3_gadget_kick_transfer() might be missing an
error code when returning 'ret' at line 1691.

While 'ret' is guaranteed to be 0 at this point, returning an explicit 0
improves readability by removing a level of indirection and clarifies
the intent that this is a successful "no-op" path. This change also
silences the Smatch warning.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
Link: https://lore.kernel.org/linux-usb/CAPBWGpEi77+sksNLazw=dtyA3d6fBn-r10917k1rEzwzT3M=gA@mail.gmail.com/T/#t

 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0a688904ce8c..3d4ca68e584c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1688,7 +1688,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	 * transfer, there's no need to update the transfer.
 	 */
 	if (!ret && !starting)
-		return ret;
+		return 0;
 
 	req = next_request(&dep->started_list);
 	if (!req) {
-- 
2.43.0

