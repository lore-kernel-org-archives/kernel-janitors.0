Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A02BD01A
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864989; cv=none; b=kYWlpSe3j6yMVyxiNsjLnRzU9VhN2g9CmsVRWrfBeikEtHKVZU0JoMDDWV5Ol2I/NTNtHdwOw3eLeQOSZAgF6ad4MqNgP8ACZUbX5RdqlcTKTSBpOphHpyIhc0J6PreJyePgwsbbWuEmx/gdDwgtINV8IG4EUipCAGGgvCNYWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864989; c=relaxed/simple;
	bh=a47eZHNrHhm8bIT1UsXDpMZVMqM2M/J1nRMDkPp4vj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0pkcsItIxMNb0M041MX3bJBqVWqlAauugVy5KYfnxyEm9LpWT8XfYsilSLKJWYeiNisq0TAZxfZDDUbJ29j2DiRQgBz8X+NwYpS8WRXkPThHyZofcUTcOzW9c4rJ+Wnw+mJTppN/bZcvK14v5g1XRX7VCW4BXCIqPKZ4Hs/X+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8QL6c5y; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8QL6c5y"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73a9c5ccfcdso3318897a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864987; x=1751469787; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gzYs3m3F/c7eB4Inj/8U0D6uQl5hfC5e5tB1ISacj4=;
        b=z8QL6c5ymUm2QCKobA5U/ljErhFTSOq2eZzBh7i+MQiI35m4HkFZxK4AWQucZjO9xd
         kR4L+X7pK/99kttJZmvX5z+TMjdrmjgW+N+IpmvCMoB0RwoThpNXlSy3qgZofflkFU5T
         Md7rud0cTXfyuwJ4DHL7mQoja27T2ZiNnwK17MmjWZhUZw7cQIEBOKIqDv2MQsxexsDt
         IsOwNXA2BQps4aJZ59nMUueEieg8aX6vHdlkHTmTt7hWsseze19FEj5IDIfSQ3A85NO7
         klPVKO5+26wo1Tp0WmlUDFtg6kQN8F8icZFn72slk1V0+MsoCj3Ana6IQJwibcNSijVW
         i6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864987; x=1751469787;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gzYs3m3F/c7eB4Inj/8U0D6uQl5hfC5e5tB1ISacj4=;
        b=BA4NM9TncdQCTwri3nLY4yAcnoEQg4DEWLmPxSbl9HDHo9sPNWAFPxWyGkwHNEwHdi
         g9AK17h/XPKtXx0G+Oa6Wr2DGv/NhgT+1BUrf5pZApldfXawnA9F5glExTmmqINIZja/
         fntM6X3y5zuJtMiEQglbaDuAyC2q3XPno2GvtSMx6fjMCKuUs4A8K9PiA2En3MdJRA1M
         Jvjd0C8EN7zqugt6arMREfQwe5ehecBU9RkcPjGgMxyAO4gHS6A0kmiQO7iLPPwK2d2y
         6FEqF8Q7PCXtUXhKdDrUVPTf1sap1K2BEDRMBoVpN2q5Itzm1R23dJirUFFunRD62jiT
         LTIA==
X-Forwarded-Encrypted: i=1; AJvYcCUFrHNXucJ5zA2yQe41T/hRIa7/jLQ+xC8LBMIkGl8QB5Ofaws7p7xWocljmeUw2KW36CC2uOVMZiB3kx8cCCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Eev+FuEI9DPpCCe3V5fQf+AyvZBvL7N98zne1Ez24fPdEZct
	QVuNI5roazUz2Q9Wc8+wsB8XBwX/ovsAKJHfL8lEh+T3659EODSSep6rF9ljHEvqJTk=
X-Gm-Gg: ASbGncvsoHdB6tKmmaXamQWu00Yof4mm8hjc9UZDHRkLsmn31BnUtEZQIURxyayXw2M
	vSMuXJu9BzJ2zM49pmftIvZLn3magGT5MonUI7Twp0nLSWPGRl6tn0f+cJH3Cv6s8mHcIsHPP6A
	K4mHRQ27X2dhnUREnm5/U/eMv04oAtMwx255A6p1f/nYZb9teRzgohrZvmkNB/plN1alao3WX7W
	lA7CHojsReteHYtI4AvHXiOvoOKve3Dxh2XNgVf7cP7HkurECztth4ZwP/FG2abyXRAa9VO93wt
	xww6qsdvJlaB2l8460VdcuoXiQac5pN9PGNJljFPbpQW5hCvRu0KqHZRLFVTan+vC3CxXA==
X-Google-Smtp-Source: AGHT+IEd8+YjM8LYQGmqEAU6rFmznZBC4Qrv0XQ+XpbkPlvJZEhO0r+n9pOweQCLkeKUxTgosdHpgA==
X-Received: by 2002:a05:6830:3e8d:b0:734:faee:58a2 with SMTP id 46e09a7af769-73adc5e9b79mr1827733a34.12.1750864987275;
        Wed, 25 Jun 2025 08:23:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90c92335sm2258295a34.36.2025.06.25.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:06 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sai Krishna <saikrishnag@marvell.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] octeontx2-af: Fix error code in rvu_mbox_init()
Message-ID: <ee7944ae-7d7d-480d-af33-b77f2aa15500@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error code was intended to be -EINVAL here, but it was accidentally
changed to returning success.  Set the error code.

Fixes: e53ee4acb220 ("octeontx2-af: CN20k basic mbox operations and structures")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index 7e538ee8a59f..c6bb3aaa8e0d 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -2458,9 +2458,9 @@ static int rvu_mbox_init(struct rvu *rvu, struct mbox_wq_info *mw,
 			 void (mbox_handler)(struct work_struct *),
 			 void (mbox_up_handler)(struct work_struct *))
 {
-	int err = -EINVAL, i, dir, dir_up;
 	void __iomem **mbox_regions;
 	struct ng_rvu *ng_rvu_mbox;
+	int err, i, dir, dir_up;
 	void __iomem *reg_base;
 	struct rvu_work *mwork;
 	unsigned long *pf_bmap;
@@ -2526,6 +2526,7 @@ static int rvu_mbox_init(struct rvu *rvu, struct mbox_wq_info *mw,
 			goto free_regions;
 		break;
 	default:
+		err = -EINVAL;
 		goto free_regions;
 	}
 
-- 
2.47.2

