Received: from relay2-k.mailbaby.net (relay2-k.mailbaby.net [68.168.211.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C543DA7C2
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.168.211.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638382; cv=none; b=GQrVTgt2U30+tqm/OS/yrkfYoA4qj2uE2jLP7eFcZaG33hOJXnnXi/vzSeoMZTlEI640l7LY2Wj+Ztjs8EvqKte7oVsy4oBaaDgKSjqBln46MUSLBSMiY9L0yBPpCjy/7XGVjkObuCXgp95xRyQIt6vUSjWOD9xP5ieVkA/Vo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638382; c=relaxed/simple;
	bh=sYLuPHPtQTz6PD4zCIbAuGnTLgYrbOGpdh++OcZk92A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsU5Z5q4vdpCsg9yFGz6Ox1Pc5KmimTOesRbG/5o95iWyyaJMPmV6NF+dri/Kj+xJgHng8Z8JujivQAmK/8/FNjyHIP/DCSK2csqlmXvs3fr0FiFIvj8XkYMxe3NQSTmCFcdOYXZcDdFcZBmPwYYm/NTlqcf3JXwSOm9iFHYFg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev; spf=pass smtp.mailfrom=agatha.dev; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=JCf5+T7t; dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b=KIwz+ZLM; arc=none smtp.client-ip=68.168.211.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agatha.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="JCf5+T7t";
	dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b="KIwz+ZLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=EL/cN5AYCRWf80hf75Tw/uuD1MsVrpiSabcvjE9L9Hw=;
 h=from:subject:date:message-id:to:mime-version:content-type:feedback-id;
 b=JCf5+T7tT7imj/whyg2UkhxyHmOWLynFe1wX/pxUcbP4ReneJ5yLOP9wddkS/l2feckc1wIuf
 fVmMxAagB9VGWJvG2b2BrSh9OARzy/uf492WQb1cfZoQaV2sb0+pHCkR4cot3aLWOrSjO21M1JW
 um7BMoK0SB20hXn0rXDUSV8=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb6724)
 by relay2-k.mailbaby.net (MailBabyMTA) with ESMTPSA id 19ed1e75c140004889.001
 for <kernel-janitors@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Jun 2026 19:27:41 +0000
X-Zone-Loop: 2368b6905e3f4ce6ff383c75887aeedbd553adc597dc
X-MB-ID: mb6724|me@agatha.dev
X-SPF: pass
Feedback-ID: mb6724:19ed1e:507c5a5c5e5d585f7d5a5951:mbaby
X-MAILBABY-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EL/cN5AYCRWf80hf75Tw/uuD1MsVrpiSabcvjE9L9Hw=; b=KIwz+ZLMe72n1v2D1Id43CuNin
	HoKMHQ3SpWIzX6TxMcIlGxKlv5fOEOmoxD3rWqbpAkg8WSx0rKSiRubTYRain1g7+YS//0UlQp8av
	co31AwsGRDiMKjTtUJu3FPJFqnEQ5wJ64lyEa06gjY34ViGCIOSvrLSf+zdUgtTxuO3su2C4gncnA
	bsM46HeVfohKry1esvSKtLrKZg7M1GvurGYZhVUaA/BrPTPjC4MfmfxcLFKjmugrfyIc6QYt6rZKM
	uGpXzCNjIT6xZv4YL/LacPGGZc0BjAI4bYJ6fT631/VkpVsAa0yJv2VW8Xn/A538k6NYQwF1N/mab
	SFOP0FSA==;
Received: from [170.254.153.168] (port=37457 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wZZRl-00000009EoP-36MQ
	for kernel-janitors@vger.kernel.org;
	Tue, 16 Jun 2026 15:27:40 -0400
Date: Tue, 16 Jun 2026 16:27:28 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: Repost: Stack Sizes
Message-ID: <guidaicaWc.490766.2026916ajGffm3ujI3YzudF_19650_LINUXKERNEL_AGATHA_@asdfsad.agatha.dev>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-AuthUser: me@agatha.dev

Hello,

A couple of days ago I posted on the kernelnewbies list:
> Hi,
> 
> The kernel documentation says that any function that uses more than 512
> bytes on the stack is a candidate for change.
> 
> However, it doesn't say under what conditions (what config options).
> 
> I found 193 functions matching, some with stacks quite larger than that.
> I suspect this could be the result of some config options, maybe.
> 
> What would you recommend me checking?


Anuz suggested me to check with the kernel-janitors community:
> This question might be worth asking in kernel Janitor mailing list. They
> also use a few tools for static code checking.

What do you suggest me on that regard? Also back to my original question
do you have anything to add?

From what I checked nothing of my original config screams "huge stack
sizes", no tracing or anything like that, just regular optimization
(`-O2`), probably a lot of inlining, but that's just what a regular
kernel would have. But if anyone could point me out a specific list of
widely known options to check I would appreciate.

Sincerely,

-- 
Agatha Isabelle Moreira
Systems Engineer | C
