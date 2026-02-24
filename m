Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBD3033FC
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915479; cv=none; b=Lbz/1BJN/+l6KA2PPysuKtg5ZpSaNxtXp+utdRldx8V9/xPZDtC7jeVSc8PGps22n7Ib0TIYdr2xzGUnAOp7wDwKU+zw1ZwizumixSlBz2+qrUEDc6KAmTdMRiE63Go8jI70u/55A8soroooA3mEui3X4rmWWclCBbUHcDpuufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915479; c=relaxed/simple;
	bh=/+UE2MdC/Z98Gw4ktgFVgpkHLwDCLqq9BwXUszP2DsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsU8qGQu2EkwlsXnrdQvdgJPH4nv7xtrtVIUi4BNawmGBSK3RrUO9vmlFimrzWWCJwx/LyM7v8/lLWhY5dI1I7mHYZaTJd1pMxFaR+NtGBpMrl+ZIJlyY879DH+aJOaypDZpSwylwLPJORjVXoCIsGoU4L4jyVeQhZF6p9OyN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqPvVpfY; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqPvVpfY"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a9296b3926so35899295ad.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Feb 2026 22:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771915477; x=1772520277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AYD+S/OiWSSC/r1ggCFAOv+uWX9aAv5ZZhpGGUpWFM=;
        b=nqPvVpfYRReSwKXp41H9JiMM90wrHCUDRjp6fXkU7NQ+xZTc6xNwU+B1G2+jRCZRha
         4xMl1V2uFABkvMaldreY5CkwmFFrsSmvaLw5wWJ88PLIMEPI28EPUQiUZedyCY70SM4j
         hw1flZSYRgntbFQnS+v6xYbKkzJe527YzHhC13DeS385Sw66ULCLMZOzwYa0/oQN6qHV
         0MILk38UtC0yYKg4tlAV4nVayZHvZvMVtgrisdxAmlBlihV6KLWL3LFA3x2XtY0v7MoY
         qQiRVQEOUzHyI8JYqzNvvDi9PX9uI+Rr0tOdSChJuXJfAE4ujl2Ih2vFhCJUcWJcVHpv
         yAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915477; x=1772520277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+AYD+S/OiWSSC/r1ggCFAOv+uWX9aAv5ZZhpGGUpWFM=;
        b=T11s/FC3DkLlcpv//3U2Vz4+R0kSGsrJcvc48xd/KbKYSpTxBSSBWihNe+GTwT/isC
         bCQysbcYRa6uby6tOT9SFs9P4mlvN7C0FOlkHJQ2GSHdeFSvWnF3YaqRrx7v4pntV4DU
         YK3+F5JO2LwAGxi82DcI+9dN5zDHUQpLlqZGfnHTl9jTbNnWRRJTUymv5XQNwQZn3kpM
         nXs0LpMRYHqChv9Mz5dh8Qcr8EqvyiArNeKTSZhO9RnhxgVSphGb5Xb2OGzMO17TIQUk
         2yEPmqwVDPF6k1INRXLI3U0bKSyPlS0+B1WHBv7z0/b17f+Uc/j96KZqejtCfkPecfze
         zwCA==
X-Forwarded-Encrypted: i=1; AJvYcCXg+QS8jhXFkboD70LsVVYGOgWjRD5q6jJSmUgW6LHg+32ANhp/y7Hf7mGJxzHZYovKdqsTjhYeIw8yqhn3zfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcmEcnjDWWua0o+RBDPeYEIO3RzcTpJ94e9NvWO22UbCO0y8ge
	VyNaQjLBwXxdSd+zeOkDDrXV6PEcpOmdjDawliDX6UNOu/NFHFZsQ39E
X-Gm-Gg: ATEYQzzOdB9SseGde629Bv63FvE5dcpc75QwHpv4lzonmjOY+m7Kyf5P6lt9/Y4G/44
	uEMDGdZzEAFghhy5u9ErIhoZsxQiplxVb58w7W5Heqz8nxvroHZlalMIEeaKszF1tBPkqvB3HSo
	HsCEoRw/Xd/EHQBLX96OlR7DRhzbJ1rBHpE9JkDK0Pb7Ibp9xwXZfBTT4ZdZnW8Co3ly/UKTIqn
	aCRd86haMboDoAhdRa2q1cKrEyEnlpUFSHFgtsnqYZ4aD+V75gxVEyIaR2AfZRR+v3ldtUQPEBz
	VUxhI/I8XFUQ/dejPaPbZvfSvcdlv8P5slu1xYYjp3epe1WDLAwea6PPgAn/Dkrj8pOH+eyify/
	rMeqQ9yZ1VuANMxty9hmO/qQpAtUyWjoyzvVU4nYpextuOTYOWg40kZGIXTT3Yao+TMykJwm15P
	TwdktMc6gisBW3TPW35LuXEQk70FgmEtomrYCwaxLd/jsUHaLYbCaohIpIATjYGHiisI56
X-Received: by 2002:a17:902:f652:b0:2a9:5f11:3a34 with SMTP id d9443c01a7336-2ad7441c3c4mr82580705ad.13.1771915477360;
        Mon, 23 Feb 2026 22:44:37 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3edcsm12402391a91.13.2026.02.23.22.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:44:36 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Tue, 24 Feb 2026 11:44:09 +0500
Message-ID: <20260224064409.3888-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
References: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thinh,

Thank you for the suggestion. I have audited the modern 
drivers/usb/dwc3/dwc3-qcom.c driver on the latest usb-next branch 
and confirmed that it contains the same redundant IRQ error checks.

I will drop the previous patch for the legacy driver and submit a 
new patch targeting the main dwc3-qcom driver shortly.

Regards,
Zeeshan
