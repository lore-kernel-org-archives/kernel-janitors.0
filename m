Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC755423160;
	Mon, 29 Jun 2026 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744254; cv=none; b=aAFd+XAdLnIgBYKCLRvNDc0doRqkAVZXWuK8b8aTm/V/sA8RpXApiyGfWYQBS88XHuCcSm/jXgCqhagFji4X1ALsOiRzv2mwLfXMN7yycKYuTun2FIY4pKB1HsnvPaYooZ6iBCRSb9uMPkunQ0Yr88oh3zXN6EYMCrakm3HBu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744254; c=relaxed/simple;
	bh=INoTd1GK10Ddonk85hbc3M9YfmOTBtw83hFS4HM1Qkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V9sLXEki44X89RTO36HcEDNZ7gH6v/sFlBI4DZcO7d6dJ4G351TOLOvxZGDw3EcKg9nsytMpjQEh8AAhSlC+sgpCO17dAqC5CuGxZI5oRe50Vl0ULA0IWTIgGIIicxr27OyckhmmJX7qispSnor2TSzX+oggBn17xlQAIU9hM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wrl7bogC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wrl7bogC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 296D4C6B3B6;
	Mon, 29 Jun 2026 14:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0705FF96;
	Mon, 29 Jun 2026 14:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786F1106F17BD;
	Mon, 29 Jun 2026 16:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9xEdcc/LdUJN7jh7ua9bgISAowV++o8aw3xEPs/KTI=;
	b=Wrl7bogCLMRPcAij8ab1sSn3PfLpgoTfC8u0uq6QFdZ3hG/o/xyzS7bD8UUSkftmu3xTGM
	ARfZdyr3P6BQXLAzKuJs9dc/AvOTneHGr8oa4aSw8tp+ViyS7Ml4Zoj9IpihXCBLS1DvM6
	MNdDRKaPvJIiDq2D0h6rs2PM8/jbGdLuUGv5igsYGn2jwbhpOymYmwnjCvSEBUXMDTrDZh
	VEBrv2r3o5lwxl1JzU6lDdn391dP3kztVmjtm5PbSE5le5SRA3bdNO7at+rVvYV8pVDVnq
	8XBaHgh0f6fxzLrNeUqq1DKk5KOSgPHFRFXKCDPegbwIuFJWUVXALfFpU7os1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
References: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy()
Message-Id: <178274424738.260178.14667978462837066418.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:07 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 16 Jun 2026 03:14:39 -0700, Harshit Mogalapalli wrote:
> mtd_concat_destroy() frees item->concat so calling
> mtd_virt_concat_put_mtd_devices(item->concat) after that leads to a
> use-after-free.
> 
> Fix it by moving mtd_virt_concat_put_mtd_devices() before
> mtd_concat_destroy().
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: virt_concat: fix use-after-free in mtd_virt_concat_destroy()
      commit: 4b45d7836b9526b8776af5f29219615be9417230

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

