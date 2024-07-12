Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA141171081
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793177; cv=none; b=eA3QnKTh42eiGwpfy4N1YZMh1IE4OUazLOgJOXp+mr3n04FDvOkQQBIJfmWEhNK7+8FSuUpQ2F5HbLiGoziywATipVWh69QWo4vBC8oipiaSmHLAeCKUmbvxkwQEd7bcja+zxJw5e1xMTKngKLnm8Ngo2qPwuOJIs1W+m4oJIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793177; c=relaxed/simple;
	bh=N06X/eoY1Uebyo+0qwaEwr0aawks/J5+fGM4g2wyaBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUDpBfarOUGKUh49Bmudp/yQzB2Io6255VbGb3eiJq+dytVL7gXowK7W/r2S04/4QJNaSbPoF2TcXZEZy/3J+MAH8hve7+zaiRRBVnszrIa0dN0w/NCo+B9r7g3k43/ITHMVnlbj1O3uRhK+zPmP2HsDVL5nPrw7IeReaOqid9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fX6gkVcy; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fX6gkVcy"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d932f991f6so1175418b6e.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793175; x=1721397975; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvGeMLuAwhrzJn9gtgYIG8cYNqHlo6tU2+mQF6lF0yw=;
        b=fX6gkVcy3weHYb/O12GBCdcCiTIK0PYJtIdJkZhBAYC/R++x0G60O7wOT+y2JuMLki
         yallOF0lLvKmPVJqFKpwEUvj4JDtkJeDxY4JRtwRlzWYS5/rfhI8RBCgUTqFhpy3cDKS
         jcRuxvHqqdJMATer/o4ddoar48dq8PFQNwfMI9i6+GRKT3tXBTCLb44o1JVGtAa8K3fg
         gFnkwoyv93tiUzcFBwXGXMeamr1Gz6c16gVOXQIri/1Bhh2KMZUXPCLkPQDMP6FLpmpY
         JC7qtFh1PJiwsfJPIP3qcVj//G7cwP8xPu/dtMXlQLnS1EPhxb4obxMFSA9WO25CioIS
         RZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793175; x=1721397975;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvGeMLuAwhrzJn9gtgYIG8cYNqHlo6tU2+mQF6lF0yw=;
        b=gcV+D2vOvPsEVQnRfx9w0JOnlH6gmiCFbSQhjY1w+yE/svfDXc2IzFK4u7AYB1dmea
         HgfUTAfja1rWvq7Cq7dWJbbx4v4EFKjs7UCDHaLhT5p7xd1oCwd7ilGltRZgUCvtKZuR
         is0FKgskwWs1FXWMot8LHE6sbAzqKr7tC0pJAmaGAnLs+pwkImCu82tS3hQDrS1iHts3
         aqhb6+LwKkdjBqpIOPgIyCB/vibDipFguIUbWcj0SaBEm9C1urhyGhUCN1s51AYBUioA
         W3z5QtYY0MF4D254gglYX+284hZBNAvJTDAPzl8DhG3u6nYXFwTDpnu6ZTuvcxgEHOXk
         YPaw==
X-Forwarded-Encrypted: i=1; AJvYcCUE0pI87Sy9T3rlkXBcu1qNYNw7PHRxf6wx5d4gD3KW1uC3g0NQ1TQbxAbE+A1iM2TI2CR3LQyDVJrenh2CqueXpe6MKG+Nv2qPo7OCbyNR
X-Gm-Message-State: AOJu0Yy27HfsBd+0YwKEs+/XsymX5cvQIw1RtnYJyxF6x8ROgLYSousP
	axoXwrPkjUSBENmaVqRdtBhIhidm8NWg9t/8+XUrkFaCrkVrEQNF090qvfSE4OQ=
X-Google-Smtp-Source: AGHT+IHtlDnTv4HuxsnriRgYqH4/N/EK8AvwLk/fKhC8ywuVcO8avOC/Y0CnrzNEReTN5UcGHI/41w==
X-Received: by 2002:a05:6870:a353:b0:25e:2923:a373 with SMTP id 586e51a60fabf-25eae7a3377mr9210983fac.15.1720793174935;
        Fri, 12 Jul 2024 07:06:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa5afa68sm2180190fac.28.2024.07.12.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:06:14 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:06:12 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srujana Challa <schalla@marvell.com>
Cc: vattunuru@marvell.com, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vdpa/octeon_ep: Fix error code in octep_process_mbox()
Message-ID: <623e885b-1a05-479e-ab97-01bcf10bf5b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL for invalid signatures.  Don't return success.

Fixes: 8b6c724cdab8 ("virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Nag mode: When we add a new driver, then could we use the patch prefix for the
driver not for the subsystem only.

 BAD: net: add driver for abc123
GOOD: net/abc123: add driver for abc123

 drivers/vdpa/octeon_ep/octep_vdpa_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/octeon_ep/octep_vdpa_hw.c b/drivers/vdpa/octeon_ep/octep_vdpa_hw.c
index 7fa0491bb201..11bd76ae18cf 100644
--- a/drivers/vdpa/octeon_ep/octep_vdpa_hw.c
+++ b/drivers/vdpa/octeon_ep/octep_vdpa_hw.c
@@ -140,7 +140,7 @@ static int octep_process_mbox(struct octep_hw *oct_hw, u16 id, u16 qid, void *bu
 	val = octep_read_sig(mbox);
 	if ((val & 0xFFFF) != MBOX_RSP_SIG) {
 		dev_warn(&pdev->dev, "Invalid Signature from mbox : %d response\n", id);
-		return ret;
+		return -EINVAL;
 	}
 
 	val = octep_read_sts(mbox);
-- 
2.43.0

