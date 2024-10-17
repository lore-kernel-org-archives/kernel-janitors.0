Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6E22738A
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194019; cv=none; b=sXDZxWknL3fbnT0w8rccMdn251jW8lYiG35sprsfSN1OL2XdtPcLIbMPMwhMiC3qFWLZVawqqYh6Jf6hcfstBv0LvVALPycIgPv/Ac6VRWczE26FJqbHrIDBPWMFwfekHA7F8GIB1Ds0wSP9krz8apXksjFK/Ds1TFVXn/FW+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194019; c=relaxed/simple;
	bh=3cjJavFR6NC/HCRHI9EPOyrqnyNGb2dE/RAZTMIh2Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5dnC4hJdpNO8R+v+bfDapqXHtbufhgHJOHEV48JZFJUJdQE9jUbRA7Q6j8hgSfao/gB6aPheVib8EplzQwolhe2Ggql0QLDdkHQXBsEb/20vSnkuty+dCKPs8COal3L2YI3x68hN1K2chHH7UUopgfZacTOFx1o56TdHZ7qnc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6v4QXbK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6v4QXbK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a156513a1so161819366b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729194011; x=1729798811; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=x6v4QXbKoA5p/Qg+ZWFTjQ2TBO7yBb8zMc3BLC0JA3KlC5i3HzOZhpdJuHJlVHLBBd
         Wtgg+94A+u0Wr88PUAMmjQ/UstZW4GOq+qFqNljO+jXLMt52OC4pAvz7A/9eAnwBeyXF
         QWaf8WGwqH35H5XidZjcPaOOGPC/D90ldKQ0iAuIHBprBcRmilb2Qra3nKT5lltcZnw/
         nHmlNaZwRcv0/fgY93uEK0ovWKA83+qVqy6QKtOPfVBmtvO/xwGRwrDXTZ+uWos5KRab
         vkCQpY47rz4C5lGJ7tTKizwXzQP0SFbcJXKifaLQ6gO8QN3CnGWVP5J2GnnWSwCsJr1U
         /DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729194011; x=1729798811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=OTvA99OedWPtlta4V7XKws1PM5Dl5qMzZ508F7G9D3hoxv9InviZ4AKtJ7Y8MVyvLs
         Gn68HlZk9ia2Z9GY8Rsj9G77b//y+OsJD2puOxl0kc6VoMsM3CP9Ws+yhg0auIvv6ACO
         dYm04td6LevfvkbOe+v//l00bdIo0hFDIar5OiR2+ldNfHa6MNuAEbokYnqrhBLwINLT
         TVfD/KUwFZTfKg2qo71KF1mEiWM0pECOIOVzbScS2W01iWp1DWPdyiMbbkq/dYL6zeYw
         Qttc3+7XVp8k9XB1xAjiXrB2qvU/a0MsY8mo3R4Jk2Zaoc0CapEU7c8fUK+souKJXi2R
         yEWg==
X-Forwarded-Encrypted: i=1; AJvYcCWWXM/epcZP4hYgMOy9GhYkSnaE3+zy9T/LPXwRu/j8BMMSIaJ8ssxKInkWoaR1OwkdohTGRcKg1MoFuP5EUvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwohR/h66iS19YRQOltjJnLQA+zL7vtbSWtiXBp9lgCJD09RYjg
	G8o+pHGEII/SYeqK/iJ4Chziq4ycUZX5+lZuBuLFAVbcSmJ4cehyTlDrYihbBiQ=
X-Google-Smtp-Source: AGHT+IGxstbOFapOUqQjp3ZRs6n1QMqDvHLOM3P/WHoCxTXHHg04lmOTKj0g3pfWvKqi+rO1wTNiWw==
X-Received: by 2002:a17:906:bc23:b0:a99:368d:dad3 with SMTP id a640c23a62f3a-a9a34d078d5mr696337266b.30.1729194011492;
        Thu, 17 Oct 2024 12:40:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf7037sm2959166b.183.2024.10.17.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:40:10 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Qian <ming.qian@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, TaoJiang <tao.jiang_2@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: imx-jpeg: Fix potential error pointer
 dereference in detach_pm()
Message-ID: <ee0eac36-3bb7-4bc9-8062-1305d5679580@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The proble is on the first line:

	if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))

If jpeg->pd_dev[i] is an error pointer, then passing it to
pm_runtime_suspended() will lead to an Oops.  The other conditions
check for both error pointers and NULL, but it would be more clear to
use the IS_ERR_OR_NULL() check for that.

Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended before detach them")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d8e946aebba2..918ab12edc9e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2679,11 +2679,12 @@ static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	int i;
 
 	for (i = 0; i < jpeg->num_domains; i++) {
-		if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]) &&
+		    !pm_runtime_suspended(jpeg->pd_dev[i]))
 			pm_runtime_force_suspend(jpeg->pd_dev[i]);
-		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_link[i]))
 			device_link_del(jpeg->pd_link[i]);
-		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]))
 			dev_pm_domain_detach(jpeg->pd_dev[i], true);
 		jpeg->pd_dev[i] = NULL;
 		jpeg->pd_link[i] = NULL;
-- 
2.45.2

