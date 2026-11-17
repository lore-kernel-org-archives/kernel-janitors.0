Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892464;
	b=ZWayieTwl4jXYata5lDWkpsA0VdY+3GGrJtodPJ5tZuUHbGkCDI2DZxOSBP5NjuOUXcH
	 OO321NLTX98G/bUq88SYYyd3rzkZne6A7iFnwTXHqxHIhTkvKuKJ/VyMCrvh+Ck5p2hc+
	 YoVBcCM6IVi6jyFTBtGuOpfoKxZQ22zsKk+DcmuaYQJzl8mqHC8ypOnFAubx2Ed30U4R0
	 K47OzJaU2nID+l4DKGZx3MvuHVUPWdtrLIOmfkltJhOdyFCaMVvDFARs+1DamC8rFyaBD
	 9jc44heMbZpGxQcLMGuZUFt/OL5uKrOjvq8I6A3zu3/acJRaDaVUpNYPizVlIdcl6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
	b=3wTH3uH9TTjT09DeDhBAItzfxIa8UrqbNfKJdYvrp8HnFTyBlF8kMlaBy1uiGFsPKBFz
	 KTOr6SpSvTor7jom4GVA+VbpkofSlVoJbCHnIfX6lwtqQCOFw1t6jmjjSm/F28UeOPH5A
	 pxYuqTAW2ld7WdehdUPClvuq4r4T0qHb4F9u8eADmRymf4QAhuHO3vhmDhQ+JcovhmQ5b
	 9HLgAs8dNKN2o+lMPCHh9GVIYfadxGMZUMk5s8pDjfRBri361q1c4eYq4Ah3RBR76JTxC
	 xVy4URMKJn5jZAYgIDl0KRDXFFDlas0WTR135AzYJWwJhDCnwaBtleuM/fhr3Cizv0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QRtwsQ0P;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F4606A323
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Nov 2026 05:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QRtwsQ0P
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so477071a91.0
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Nov 2026 21:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892464; x=1795497264;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=wcmfhBiTEczG61UpKcap5pwZXVdb0onb47TC5pzP8QcODOmw5sowPckSVxXt3hh+96
         9vNvMz4FVGk3ZsaOfEUrkN6Lthi90YVwXDW79/e+eEWVpQOk0Lc5IEruLKKfwa5oG5bF
         ZiX1aYgXdLCl0myuBo+cJcLndYglVftPJZ9rWzmutS2122i/qeWC65a497c0jtJQlV2p
         EG7sbXnpRzESJpRQWs2IQLc88HTfNkK9nA7aSNLcBPrhrOs9KH5jguJpxjai+RaCtfSz
         RsSfe2AIrJy1pLrmdm04vOWhkf+D5o2YhEYhvm5w+FeY6keMw1acDFaJZQkfcDKOAi2H
         H+dg==
X-Forwarded-Encrypted: i=1; AL+hErFP/Z4QysnOqOM02zfx+2LlhyE4v7SyHzSNhnkyFE6nQQAWBxOj+UcJF22bv6HVIyciI5m5LTCcLwodOWFti3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LU2UedYzX95P+wXZN15Sk2SOkQHsdBmxgHroYpiv5bJ99i5VH
	xnlqcb5X1up2449a1zBXKkwUhkSquP74Fto60rS8TDHQieJtt8B1NsTz5MMUIB4FSCIYjyrG3Rl
	OEbegKrGP2IqH4Uty8DkO+lUTKKp107yPR49kcuy0VW4rZdc8v2uuXRxag2JWlr3QYDtVKVAfIy
	dcvnSV0l7SvvvEaAI9t4xQqIO7/YFAduIYiT7K12BH7BwLyNDJUr1gxls36wsHV0N0CczgwtWHT
	e/c43wXhntTACGvZczo
X-Gm-Gg: AZFdTZfw4gBj+o0R5rT1hhMx89vbnyLzokguJIvZnAMWdOOAgV/2jzWwYaw7nM3oddE
	pGZp+ObX64MmM5B/XhfZVXIlCgV08Ti6mqPXoVXzpoiAw9aMP7161Thg5yEmSlNClapyjdPBtQq
	UdcgZGyb6YqkGdrB0ERPnXeI3gxlQFJx+e6Nep8FNCeLlQVJRaMLI65bQHioPWiB9X/P6T4e/j2
	o6M7n3a6f26VSiHbJUksAV6sD3hq8oO83Wk6P7IOwbDf4gRwPoMGYS2nuTkxkQb8o3QvI+CSSSF
	8Ug/rZckQH63u+eF/Y04m7odJrN9m9u7GVcbNekwVU86Ait0NScfIRtXMIeFlKITr7eRjbrk4y5
	q9UIvaQnSffxMLANnOnlMDyQ0qrPcKiW3kPk9XFaOu88elwbtysizPetZScvLyjlhVE/2BIMPWA
	dr7xUHzqcJpEp7C4EHR7R3m0VknkQXpcel
X-Received: by 2002:a17:90a:e7c9:b0:3b0:ce1d:3398 with SMTP id 98e67ed59e1d1-3b1b09f3b5bmr13537811a91.18.1794892463574;
        Mon, 16 Nov 2026 21:14:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25d9ba7sm4178968a91.1.2026.11.16.21.14.22
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:14:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2859568a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Nov 2026 21:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794892461; x=1795497261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=QRtwsQ0PNhn6ZQMGqA7GKqCG7kLtVXrZkQTiLFXykfug891axJZYWxFAN7bP88R13J
         wcdL0wDBq3X924XD9DkIfomoRLF6tlUWfS1OiFNY8raFSsgmu0Q6AUTqsnWv8v0hS1ow
         DiXTbHPIx2/VJJNYcCOdmdq2kpRzamnO517E8=
X-Forwarded-Encrypted: i=1; AL+hErFzSt5ARtJrKpF8wENotHeAAfegDkgUfCuUt9gUOVpLnQp5QjvR4pOirWxvEAOHKQyNEilF8GK8tk41XGPgpT4=@vger.kernel.org
X-Received: by 2002:a17:90b:3d87:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b1b0a3a056mr11554923a91.42.1794892461620;
        Mon, 16 Nov 2026 21:14:21 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b1b0a3a056mr11554911a91.42.1794892461137;
        Mon, 16 Nov 2026 21:14:21 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586d0sm7827675ad.47.2026.11.16.21.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Martin Krastev <martin.krastev@broadcom.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/vmwgfx: Fix NULL vs error pointer bug in vmw_prime_import_sg_table()
Date: Tue, 17 Nov 2026 00:14:16 -0500
Message-ID: <179487959553.2515856.10912427542043749089@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akPFZ-e9usvsYgf_@stanley.mountain>
References: <akPFZ-e9usvsYgf_@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thank you. Applied to drm-misc-fixes.

z
