Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AD022F837
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924004; cv=none; b=rjl//Xk2DTRQjmPaGRjXdnJpgxhUybzkBql+nXa8xOVp/KadjFT6i15kAHW3MbIbLmdo8QhIRk5F+fc38nmxECe6e2HoQGXTY8exeD0TwmOFej/L2tGu33oYcVRLR3yGE3Wzz971JYYgqgATnUEGFj/HgD8ZFNxEONB5JzUsbqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924004; c=relaxed/simple;
	bh=lZtdYvwm0/D+wrEsjVubJTTYAK+wxUZeR9nJ3jVsGl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvNtqAXRYaTd68E2VnpTjNDonDb2XW/9UM2u47LVh3g4ws76D3lI3qS7eGJP/GPK+QXS8FH71Rld0sM66qywUmiW1OyQLPUwGc9dd2/ED6V6Gl7Er9Yo2ODQGPeoxmR+/5djtTz92qPvLjWtmiVTWz7dIrdnG8LrR2RC5KXs0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLOf31fG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLOf31fG"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so10743377a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 22:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924000; x=1737528800; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jHKviSWbOJnThNL+BRNc29xaYnK5sB8qfkKjQ020pY=;
        b=XLOf31fGgX/FS5ncmoLi84Csb4BAl3+99Eu2RWNBz/HZZKXx7tFbk4vkvP6gQ+a6uU
         HGBEdEVqUzh1dIFzfAD6rppY6Ot2wIM/jZM55GbVqVJWPwu08/qXZhxgF5eLnzCZfVpN
         6VLp9XayHP5ZTaqV+04cguwo8YbI7qYbWkJU6J0hO5AguzDoIe4mDg4IXVdTnuB7Zuhp
         AyaX7oky33O/E1S2RyPEQCdVUlm7tvLSnNRioamXBUJ/QaIY5o3x5QQZTzI9ofNMBAde
         C9pGUyv3vePMsQDXb1cEBSzke43LeUpAOldPAURV1DDe2hi0JAPWgxKMhy+5cGgdC7Ot
         uAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924000; x=1737528800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jHKviSWbOJnThNL+BRNc29xaYnK5sB8qfkKjQ020pY=;
        b=OGrILZIfYjGbX03RgGYGpq4hd6trst8NjyPgloTwnuohlaZni/Wn+2BETTzaWkB34y
         fGdvgKbbP9/7D1M+vmhNPAVfUTzbGyR5RgY5Q8sV56/MBY6VO8qychtIUxQf3ajbiXNf
         gRcS2F1E3lmT5eV3eCKa2pjhFTk0oZEXwcIqseLbtGMu7OlIHw5iBjZFwv3l9G0BiLlR
         9xBDKUsII7YEDI7J0Ughg3sU2LqqsWZ+mU57uXJa5GrqPBLMJdqHzzArJURdP+n9EsL0
         pAJBm5djvwbHcqT8ieUnmK721TenMmMaQ78ZsAxJqUaZ7cBud+d7WPc77f0GKSA5kN6q
         r+yA==
X-Forwarded-Encrypted: i=1; AJvYcCXH678fTsYE4jxZeMkRkPhHGCwAsRwZodZ8pwhx5KDpn1vwm+StO4fowD50Ufz6v+qGKylOfzxXIfqTo1OQTKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+qwnGeRDh4tfDcvHOpciSAGH4IGnxwaj/wpm3zgI1fYuuOyp
	BftzSeInij4fXA6eS/X6bGpjhufKQSjLRbVo+1C4vKShHYym6mDUg2aA4PfiSNDlcdY0H9yJ6nl
	v
X-Gm-Gg: ASbGncvOxUvq+YqSR7V3yy1jtcXxC5HxCczTadDw2UVZebCkmrFRx2UXcleEVfIqdLD
	pi1/FIij29+ts3eLTeL0MCyPZQDmbtn43IuQiEeJ8UBZGRBZH08g22aCkonYsBuRfkT0B/nmPfK
	zDMtWGOoTs8Hdy8nbe/pT3rU+Bc5ev7sAjVy7tWCx5Wyemakv1ooutWp9KMNEqawRYY+2Z/yf5c
	EtUetQyQ+5dAK4pLXrSh/Kxn1EXBR8bU41mI5hV2s8S6D0Qo7R9pHq+XLzi1Q==
X-Google-Smtp-Source: AGHT+IE9P5PDtBvyWPxhRNEsLiyx/nfhdVfXbwMkWhpN/F7zwvZlvMv1+220NOQBetuNrhffj43vww==
X-Received: by 2002:a05:6402:518b:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5d972e06740mr26199332a12.9.1736924000495;
        Tue, 14 Jan 2025 22:53:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c371sm7145838a12.11.2025.01.14.22.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:53:20 -0800 (PST)
Date: Wed, 15 Jan 2025 09:53:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: rockchip: Clean up on error in
 rockchip_pcie_init_port()
Message-ID: <7da6ac56-af55-4436-9597-6af24df8122c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call phy_exit() before returning on this error path.

Fixes: 853c711e2caf ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pcie-rockchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index fea867c24f75..35bfdf3e17a3 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -132,8 +132,10 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 
 	err = reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS,
 					rockchip->core_rsts);
-	if (err)
-		return dev_err_probe(dev, err, "Couldn't assert Core resets\n");
+	if (err) {
+		dev_err_probe(dev, err, "Couldn't assert Core resets\n");
+		goto err_exit_phy;
+	}
 
 	udelay(10);
 
-- 
2.45.2

