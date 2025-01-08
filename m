Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9C14883F
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327760; cv=none; b=oGRYoFZBLP+KcuyZdGviRDD5kxkSwJp9SjZN5ylAd3VnCNhd7/4kX1tw62moM527p85UGSwJMEDBZXK55+P1r0r0CnnNZB+VJA/bAwTz/FbiFejGvP+Tu+uu5vLIdQJqwsl2OD2R8N5l5FYVzUbMSAe3NTonHdm9aI3UV1OMia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327760; c=relaxed/simple;
	bh=BDpuea0x98xGaOH/brrQV7qpk2foL2fZltIoQWXcJDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfWoDO3Ql2mR58zv7z3gIcIH9bwtOXw8WCnZ/FbK5NLfsx2EQHot5Ww87UQqtxEX/nSdxlwKvYaS+5w7aQcH0XvM3IkzoxS5lB22QN2DCkpKZpx7YP3iCVUm9ZZyCMzLesKqdIpdyW3cebpYvI8wUvqQa9x+2DWHS/czmCDAtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFum00QC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFum00QC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso14008896f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736327757; x=1736932557; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNfHlg7+rOJqYIBrKsr5HH/Jvz6rLd05OrWMK+Cy6zQ=;
        b=MFum00QC+j+d2mDTtauIYhucJVzVSaefzQSYr0BELxxO4n8ZMI3/t/xelRNB20uLMV
         19QEeoK0D3SlizjyiBCfEZBovA8kB2ZuiihrzMrLIACtClH3m9Zm9gvSAmg29tcxRiu5
         tR0d24pR4Zz0NQKmBPgA7BQur9idFhEmh1RJydjceV/qU2inuT11wrzhDbQz4js4uyWN
         APDle9opOL1PePRtJ3xiPyOEB+g22/bB3MGP6Mz3wfS5qwDODQJFloFGPgxs9P5iBkhr
         5umBydSjkyRDo3dPQpRY1zdhuie0sACntlxlkHIhb/X+LnyxQuY4Muqs+Bp2uN+UUnx4
         R+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327757; x=1736932557;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNfHlg7+rOJqYIBrKsr5HH/Jvz6rLd05OrWMK+Cy6zQ=;
        b=UsP6EKWelnCYYW1jgiEdMKUnI+GcupS/0Q4DNhWKAJdfrM7LEGgsZXnyeLU+LjY9tD
         LcYM6XaRLfoLlf8uGX38mO9lC7hQDxr488ssX7PHEChFQ5+cBjK7LHpASl3kAxdxXDr4
         vyvbwXb+Jze5iNqE9682QZ5lLc2uXEPhJwmDZK7AjbgVbFwTqZeGW/SD/hZtp1mP0fT8
         w/DqHbRUkzSP83jxtP8zfGuJl8Tg+JdpQgfzx7Qt0pKQYwIw5nhBigjuKzv+OjdlMrMO
         IDghvhCGw+hamboybULb8Kpi33os63TjGooVfwN9QgiXE//iWpPG0PkW+dKXL2EeKq61
         5ubw==
X-Forwarded-Encrypted: i=1; AJvYcCWSWky3u2qiI23AYhAKoltnAA4+05C9yp4Mdw+uHlIuwTWRPsfsDWav7atHVu6y6zmaMdYaCrR1Jp+ANxUg9D0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVSe21bqki3CbSyrKKn3p07m69G1MDAR2XebdrAJl2j3paPsC
	7jRJtT/+9e+6PjrQIzjcTvobO/Wa6X6UPEZPtn2IBENGbJ893HE8VKqTRrN6XYs=
X-Gm-Gg: ASbGncv+fopqSeNWyvkMiiVpFtOS6qjB8BIXEk7tQSNlxw/+DvH6toTKJirofcxdypL
	KP2XBPRCGfgS0aLhJbC/XibbaTvIAabodCZEl01bfZQyv2XJZ/UDGiyRqss+1LWO0Rw5nLKP+ez
	if4yD4R2Qrnx4W2GygyLAJ+uIn9SVf0O9UVIGAdFsIOgstYAi5ma7xp4NwC0nQpIgRtlsry3AHy
	Arqg/3jhgZ7Hev0+z56p1QqG3YKuFZGG6+qcZoxNqmwEXgjD6qsbedQgsdyIg==
X-Google-Smtp-Source: AGHT+IHCY6wO+12ioIIeFx5QBHEz/z5fXqeEkaIQcWC8b/Zkck8otn4DFulJBJDQ/f9lbUQDLV7jiQ==
X-Received: by 2002:a05:6000:4714:b0:386:33e3:853c with SMTP id ffacd0b85a97d-38a872fc034mr1308522f8f.12.1736327757259;
        Wed, 08 Jan 2025 01:15:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e31sm51691430f8f.33.2025.01.08.01.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:15:56 -0800 (PST)
Date: Wed, 8 Jan 2025 12:15:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Justin Lai <justinlai0215@realtek.com>
Cc: Larry Chiu <larry.chiu@realtek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] rtase: Fix a check for error in rtase_alloc_msix()
Message-ID: <f2ecc88d-af13-4651-9820-7cc665230019@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pci_irq_vector() function never returns zero.  It returns negative
error codes or a positive non-zero IRQ number.  Fix the error checking to
test for negatives.

Fixes: a36e9f5cfe9e ("rtase: Add support for a pci table in this module")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
For more information about the history of IRQ returns see my blog:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

 drivers/net/ethernet/realtek/rtase/rtase_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
index 585d0b21c9e0..3bd11cb56294 100644
--- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
+++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
@@ -1828,7 +1828,7 @@ static int rtase_alloc_msix(struct pci_dev *pdev, struct rtase_private *tp)
 
 	for (i = 0; i < tp->int_nums; i++) {
 		irq = pci_irq_vector(pdev, i);
-		if (!irq) {
+		if (irq < 0) {
 			pci_disable_msix(pdev);
 			return irq;
 		}
-- 
2.45.2

