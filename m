Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DF1DCB2D
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574819; cv=none; b=eOe4DnoZRZ01Gm3ckap2d/KGs8gsokggFe5OWH0c4Z/vKbdh0YfbX6JC/QggfrvkodiyE8fiJVS2hcjZp+/frIWi49gNpeVOiceMGwcC5BPGzRUWV5LIb/I4/lOUW9MRAEEAuWHZBZgFKvBHIQi9g9g9VWmTE4OGgGlXSjpgnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574819; c=relaxed/simple;
	bh=swRcq/Roh9GeiOpwIsEok82/Gqfb1Afxwr3Jhujn/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrSmNCFZJyFrdBD/rg22qiTtnnubrRfNwWEswVs1xy8ScnkWs5A/1HJcvU6+V2YHrSTCMYEOUZ+eGp9FO7PGHbx0UvrSwyjHJMZfak54begha2rbu839a8Cls0Fwhcb7237tCqVGvDxtv7TpzUrLiyRUBVIntI0OTIuFf2dsb9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLmEILEo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLmEILEo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ceb75f9631so479233a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574816; x=1732179616; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUuh5zltxKYzzRCuxc7b4hEMDJgmD0NkHW3duX4gjt0=;
        b=jLmEILEo8HaSEUaWPanTzQAMedoxiFrgiHgn8QTuixQdmbknOj+ZNBnySV0JZW1XMF
         Hy2vwQolAep9K2IO2GVnfMuw9ZeIz97bwVl2zddyg4j9Bvk/0IBlFWDGl5NNfHNXRQiN
         dyzeJOyqTpCyVUSNdtogd0PHgSohRNFFCBtZcBcF/DvJeIYnQ0rM3F7HdLW0mPdggGf9
         E+AF7SRRn1OE4qo2GIKBT8pOf2RFwZbJ0k3bC8BEEdNfw5sqdOM20G+X2oZqTVBvFv2x
         FQBPufjhTNjmqmSHnUzLg6giqIGPnE+iYv0YZGJSEBLiXm1KJUAfQIBsNTzoky6jy873
         INKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574816; x=1732179616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUuh5zltxKYzzRCuxc7b4hEMDJgmD0NkHW3duX4gjt0=;
        b=EYdZA6Ssh5q9iI6m/9MFARBgwW/nYY9JhWMHp4K56ElMPgo4/XRCFnoRVIncZBSusR
         8AfxJNRelw+fp2N5jyHzlE18r68ECVpN/ddKTrvDmHwKqBhqSuCxBfe00ClIyqGijwr3
         z5+raZcYwGSo3+Ua9pE5s5dHsmFpS6RMAd1nnerPSQbN9Gt7tQWs7DJYIWofkSygV5+9
         BQH7ay0l7UF/2DwPmZ0wUf73QW+4BHmIn+7SHg/zsi7aRbYe7QtYgVcqjTDuz8G5rAX2
         7yilRBTiLue5EnL1Aq7oo3c/3vL1c/iNpYAtEY4d+nE18l/iNCEQUBvby+Yh0wHJF7En
         dcug==
X-Forwarded-Encrypted: i=1; AJvYcCWdttDrNb43rkIU1K2xXf+PEmiAOfD5sK+nqajY0fpZcUXxPhdsAf1/wgjxkctsK39PvmYFRsU1U6tYetWhigw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0kU03NVD9x2XAVOAf//R/78rRiZdTyosHbnJ/0DR/vF2s2cW
	Pa4NETx5WSqGO2hRvxcw9o19f8/MgOcCmwUSUYC4e05F+66JRlrS3ShTA+v+Mw0=
X-Google-Smtp-Source: AGHT+IG+X7ovgKI22xZbmdO14U6d1DrAnfqcaY8poLnL8MfOyjsxpg0k9//QEFZXnanxkS4IaXNZgw==
X-Received: by 2002:a05:6402:35c9:b0:5cf:7b7d:a9a4 with SMTP id 4fb4d7f45d1cf-5cf7b7dab4emr314037a12.31.1731574816326;
        Thu, 14 Nov 2024 01:00:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79b9fcadsm349415a12.27.2024.11.14.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 01:00:15 -0800 (PST)
Date: Thu, 14 Nov 2024 12:00:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: arm_mhuv2: clean up loop in get_irq_chan_comb()
Message-ID: <40fd7f80-26d6-4cfc-8bc5-f8572eae94d4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Both the inner and outer loops in this code use the "i" iterator.
The inner loop should really use a different iterator.

It doesn't affect things in practice because the data comes from the
device tree.  The "protocol" and "windows" variables are going to be
zero.  That means we're always going to hit the "return &chans[channel];"
statement and we're not going to want to iterate through the outer
loop again.

Still it's worth fixing this for future use cases.

Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/arm_mhuv2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
index 0ec21dcdbde7..cff7c343ee08 100644
--- a/drivers/mailbox/arm_mhuv2.c
+++ b/drivers/mailbox/arm_mhuv2.c
@@ -500,7 +500,7 @@ static const struct mhuv2_protocol_ops mhuv2_data_transfer_ops = {
 static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iomem *reg)
 {
 	struct mbox_chan *chans = mhu->mbox.chans;
-	int channel = 0, i, offset = 0, windows, protocol, ch_wn;
+	int channel = 0, i, j, offset = 0, windows, protocol, ch_wn;
 	u32 stat;
 
 	for (i = 0; i < MHUV2_CMB_INT_ST_REG_CNT; i++) {
@@ -510,9 +510,9 @@ static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iomem *reg)
 
 		ch_wn = i * MHUV2_STAT_BITS + __builtin_ctz(stat);
 
-		for (i = 0; i < mhu->length; i += 2) {
-			protocol = mhu->protocols[i];
-			windows = mhu->protocols[i + 1];
+		for (j = 0; j < mhu->length; j += 2) {
+			protocol = mhu->protocols[j];
+			windows = mhu->protocols[j + 1];
 
 			if (ch_wn >= offset + windows) {
 				if (protocol == DOORBELL)
-- 
2.45.2

