Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F61A0BE0
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409104; cv=none; b=aGR6NgbaBCyKgSeaMtUjSadsvl54nAc2wOdGO6jMHD5HEzLOwJfELI1jtdiBSQoqNHxxpMCcVLQBS4L/i6t2hrXtpRhIPGh3/lpG4TQU0/2w+SvaNaLl18kmO9PV4LHdVHCh8djGRvh545YIzMO3jOLi8VVFeWhcLPLdU6I+uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409104; c=relaxed/simple;
	bh=Y38NyVKnZ82iZGpTSGed9LlVmfbMXnVz10ETj3CqMPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPSEN8gZFx7MRBEq8gK9P4EsmfcQB3n9Fn/rCbrWfLYEcPy6ezCLUflXiL6tx3iBVsSD7uOhjcmC7bD2SoivEzlLh+DcGNiG/e+C0nAqIf9E82MlwFlsEZGY0veRuBW5Zn8moO8itOIr//uhKyZb52/y3l6AkV/OSBabOiEBDVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kj1y5Plc; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj1y5Plc"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso2801663fac.2
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751409102; x=1752013902; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+APmr3mcxG70O2Gf3NLRFLfhkFazHT+YEHSsydc6Nw=;
        b=kj1y5PlcxzfBzqjp9yr8loT+juWB7r8INMsofwd8QC6Y7b98u33Q3AxfAF4d2g6CSA
         /CVBEU3/xeliL93K2KQyOQjVRay3xmTVRtFBA9mepks6vm5Wx+alMulLlwFd0XFhI003
         Rz1zvGQaLX8x+EYp5B5F11brux4O3QSykY+I0TmKfP+2tdvr/VkFAS0BdsXQCObiXI/Y
         irqr79atlNC6apnQiyLcmifgcAEVrUk1G6envMDiGPbUWn8SnYhwii6H/u1Hhf125ioP
         HNVs0KIpTTOywVXXD6837FwBo8I/LTBSvIc707sUi2y0PzUsR5urXcV31YUMB3GBuNNo
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409102; x=1752013902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+APmr3mcxG70O2Gf3NLRFLfhkFazHT+YEHSsydc6Nw=;
        b=Y6Phko8qsT41a1eSQqbbU2GYfRGTMW4AsGhw8xlfmpn9xEcEk7ME+ETp6H3gCM7s3V
         dGhh4Fkaff+ZA/xHwceaG8hF/C5KUQXfHLJyDv/iiqGGtAv/seKtCof7sFtx0TKaPxno
         u+i7MvD8jXevDgdd1VqiulX3cKIWjhkSRJ4Anr6Pox9/nU32irYTYWjcGGVPE400d82q
         5Ked0EJMGjc1Fq1Mm9OTH8fQuDrea6wc8netf2tJhagx8ghM3qhcxEqE/MQXeEWsmFHX
         Wd5iq3cXJYDEExmTzKhRwBmWO428Q4Zm9RrUcr5DdIno1r5MImLNSqXfpALVjRQme6IH
         qrig==
X-Forwarded-Encrypted: i=1; AJvYcCVlkQ7QXLoi5gS6+U3SxfE1NdMEhdT9JG3goMv2FzWp/d4C2+a8vLcXxvrJvPA5ixz1B4i69gF5RJLX94dkvGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xvkIjMQm6Rts/CHiVyJ6w//A6uWtpZ0EVP0p0v/bJmvXDTE9
	UIy3fSfL/c1wz3qDl35W0FtbzwTbey560sEM5oY32rB4q7Pr1MAJnFMid5FoCPVv4Os=
X-Gm-Gg: ASbGncuhlaB4QlQalsCbCHl2IhidS8GyiKngWsCZpYVeB9jYkMho+EKjtrp3EeZFrl0
	lGDanFVmjmBRHFD3BCfITNHu0wtWRlaMcJLXUAMyAEWkyLkDSQ+wJbq9Dv46QVuy/2QL6ZKUAF8
	slUFS6gQ3YOP66h54+u/nvAHMwcfrzhh8pE7VzUfYsszT6f6riVuKR2NhF28SFWi82KSYyyXuAs
	WcUkVGAmjWHpHomceAQCMVLw5U23a7B+LJbmeIUXWw/ycZGj8IPjjPncxkt6QCml/WLqirwSY8t
	BgCk2Ms2xAHm3KZOQ9y1o3i8tpzdROh1CtqhLq3cEC1hVSqhlBMfqqSLdM92TqvuUv2nWg==
X-Google-Smtp-Source: AGHT+IEsUQPOhLWTesKKtP8Y6vrAjQiXU7OxciWMUsj0112kKHLpaSXzrVlr3Y2T3n6p/TQSmzEMbg==
X-Received: by 2002:a05:687c:820:b0:2bc:716c:4622 with SMTP id 586e51a60fabf-2f5c7de279fmr396814fac.38.1751409101828;
        Tue, 01 Jul 2025 15:31:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73afb10088esm2275056a34.50.2025.07.01.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:31:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:31:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: nbpfaxi: Fix memory corruption in probe()
Message-ID: <b13c5225-7eff-448c-badc-a2c98e9bcaca@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nbpf->chan[] array is allocated earlier in the nbpf_probe() function
and it has "num_channels" elements.  These three loops iterate one
element farther than they should and corrupt memory.

The changes to the second loop are more involved.  In this case, we're
copying data from the irqbuf[] array into the nbpf->chan[] array.  If
the data in irqbuf[i] is the error IRQ then we skip it, so the iterators
are not in sync.  I added a check to ensure that we don't go beyond the
end of the irqbuf[] array.  I'm pretty sure this can't happen, but it
seemed harmless to add a check.

On the other hand, after the loop has ended there is a check to ensure
that the "chan" iterator is where we expect it to be.  In the original
code we went one element beyond the end of the array so the iterator
wasn't in the correct place and it would always return -EINVAL.  However,
now it will always be in the correct place.  I deleted the check since
we know the result.

Cc: stable@vger.kernel.org
Fixes: b45b262cefd5 ("dmaengine: add a driver for AMBA AXI NBPF DMAC IP cores")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/dma/nbpfaxi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 0d6324c4e2be..7a2488a0d6a3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1351,7 +1351,7 @@ static int nbpf_probe(struct platform_device *pdev)
 	if (irqs == 1) {
 		eirq = irqbuf[0];
 
-		for (i = 0; i <= num_channels; i++)
+		for (i = 0; i < num_channels; i++)
 			nbpf->chan[i].irq = irqbuf[0];
 	} else {
 		eirq = platform_get_irq_byname(pdev, "error");
@@ -1361,16 +1361,15 @@ static int nbpf_probe(struct platform_device *pdev)
 		if (irqs == num_channels + 1) {
 			struct nbpf_channel *chan;
 
-			for (i = 0, chan = nbpf->chan; i <= num_channels;
+			for (i = 0, chan = nbpf->chan; i < num_channels;
 			     i++, chan++) {
 				/* Skip the error IRQ */
 				if (irqbuf[i] == eirq)
 					i++;
+				if (i >= ARRAY_SIZE(irqbuf))
+					return -EINVAL;
 				chan->irq = irqbuf[i];
 			}
-
-			if (chan != nbpf->chan + num_channels)
-				return -EINVAL;
 		} else {
 			/* 2 IRQs and more than one channel */
 			if (irqbuf[0] == eirq)
@@ -1378,7 +1377,7 @@ static int nbpf_probe(struct platform_device *pdev)
 			else
 				irq = irqbuf[0];
 
-			for (i = 0; i <= num_channels; i++)
+			for (i = 0; i < num_channels; i++)
 				nbpf->chan[i].irq = irq;
 		}
 	}
-- 
2.47.2

