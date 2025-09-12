Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD62E62AC
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672535; cv=none; b=LyXQ++jkO1wAaIKMh+PK05VN4J87PA+K8s6RcyZztsa3yp4v0uQyyAt23SKmvi4mm34J40TwvPVX+bKn++Dukbcf7z/AZ5qFVAUgegO/xSr5nSliVTNk8smg7giFY0LMNccjFJA/CdspuMk661DjUw1I8fg3atZyCJccepWVK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672535; c=relaxed/simple;
	bh=L/gp5djrsVKyV+bMWAPmsk2KEc0GK+ORs0rOPU/8QSM=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=Rhz7S1Pm8oAyzAsWH+Zl1Oscu7nY6hEqBd4ep7KMmIOUD3egB05RqDFmMjHoshrvHZZ8/lUdJmFIXaCm9i2MNzNh7nDA7ESfgiPPpoKLM3CAd9WZpp653brVA+6cUbmWMC5dspfkXe0A0DZ9gcpJ3rnR8hG2VaUNInrj4AipLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=GyARpyc+; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="GyARpyc+"
Received: from cmsr8.hinet.net ([10.199.216.87])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58CAM9w3861516
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 18:22:12 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1757672532; bh=hJI3fRRGw8AQWF8YRLHqhbfvEGo=;
	h=From:To:Subject:Date;
	b=GyARpyc+NDRHG+8sEspWXk6U7ACH3sM1Oyo3ktWiNPXFOwe0oGiifbYtGmpTtYjDg
	 MtQJxwoR05FJFGX9DcAhuEk6yn48QSq8HcCVb1vpic7E10rmucNgK/v0oDgAbA7aXR
	 33hOYg7muCG3X1Y3YbAR8w4c+fvXFeTADExW2d9Q=
Received: from [127.0.0.1] (36-236-12-182.dynamic-ip.hinet.net [36.236.12.182])
	by cmsr8.hinet.net (8.15.2/8.15.2) with ESMTPS id 58CAFEo0364147
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 18:15:36 +0800
From: "Info - Albinayah 429" <Kernel-janitors@ms29.hinet.net>
To: kernel-janitors@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMDUzNTMgRnJpZGF5LCBTZXB0ZW1iZXIgMTIsIDIwMjUgYXQgMTI6MTU6MzQgUE0=?=
Message-ID: <d36c645a-aa9a-be64-968a-f790bb136a26@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Sep 2025 10:15:35 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=KelxshYD c=0 sm=1 tr=0 ts=68c3f2c9
	p=OrFXhexWvejrBOeqCD4A:9 a=nESGgMvO2jw7tQhjmqxCuQ==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

Hi Kernel-janitors,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading
