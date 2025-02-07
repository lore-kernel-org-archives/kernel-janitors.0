Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E7235BFC
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Feb 2025 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911575; cv=none; b=HePCDoazjtsb23ZPAR1PT9jV+tkv2YDvG4NOdpaIR/LAry+aqdJanR9EqW4tlSqVLx0oyP/fjfY07T9GabKUvlvj3D5HhRPyCzz3Fl+1NkrT+Lqv6n6gk2o8D2Kql69i2hjXnHr8fNOSNmv/oSHkpAIpR4mAvRVOInK1nvonXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911575; c=relaxed/simple;
	bh=6kaouR7oZgNLN17kEeH+Pxk7KmscGY+LGC8DZcas6YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=F+0VEEnjKoOyzgApgvdTu9Lfzp98rsDgUfVu1vqwrKlZ5hJM+VlBgwJnf/RI0hJqqMfPVuH8uWfBi6mP0WcpPneKkNKKfkF4n+93cFhttXcsqtFonode0DSpP85itcYRv5hoZCtSiC1HZ/6H2jFPxgKBUw1h5jiBcMnHl6IH544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQMvUHgv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQMvUHgv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f3c119fe6so33412175ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Feb 2025 22:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738911572; x=1739516372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W679lNgXvpPBehgEqKaCNaQXg+NBsATD/PMGTi0DCZQ=;
        b=jQMvUHgvhqshc1UDYlbmrn7hqzKAA/xWfHWqExxrt5kGXZIwAatmqk4K8bxLgf09CD
         BI1of/w7CPPv2OC/bV20MX0bbYP+miLMF3LFD74xrAmheqJaBM+1O3bnkpDcaMXq/Y8+
         iiF8IdWi1XlT05eFIt9/p5K04KuodMeWbf7F0zQ8v704jds+1JU32OG8lZJDvppe8o7B
         4gWcuNNImslOa7CMbEVomrRbcDzfnw55BaxYVl8LmyqUMrJdp1yveAOUsXQzTbKhXHaK
         6Yd1HaGVyZ+vwCtKTJvElFGUS46Lc5MkB9/8dWHmgnIMTqhax5/0790QcNk9n34GHefV
         YN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738911572; x=1739516372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W679lNgXvpPBehgEqKaCNaQXg+NBsATD/PMGTi0DCZQ=;
        b=V4SW2QTRMTiWp7G6UVYGfUwXiuPRpVZNR3hnNwqPGf50UcOji56y6Qr4W9B2WHS71m
         hlQHx9u2v1wvge9q6WuoiAqf86d92GbVmQlv8fQOntm0AEFKyhVMt8CYFAD2tufjbhUA
         zoHf7/di+ylLEW2SrqB65RW9ePyC6AazFcT63NSQqbTiaYiy/Z667z8xkTbuzn36NXIH
         7/qH4PrCsi4/Z3X3F3CMBFnHntYpdmQ8uePvzRQXQnrdDtXG5M/AZZ7yjzKzpuZqv7kg
         q2rXrhPtZS1SJYsNWJ0SCoWf4uTCQL4kIgAuJrTHMX1II6YmUpIRN7x+7z+9DWYK3Zh5
         eDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDXdyh7X/DBYFckXhz4dRm13L++ITshHFV8heJwC4uwrRoeYjfcqtVmMBFkvVQTkAZMG4CYj9+eboq1qINcU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNUOFZUSg+miviAIsb2H6nOrB+a/ZbVYlprdZha0yL0bKZnuK
	YM/5TqPet2Ey0cq8UOqPGHJ0CjoWszIOIGUvNg0PN8uSJ4aZaBShydSq5fPHRg==
X-Gm-Gg: ASbGnctLy4MEB2mkjm2a5UBCjNWmLfiJbet/UqDQDKhnyTduFLcfQBNa4lwWLi2ds2C
	ed+eAQy4Vh7vuXZDINnNDulK89X0y3UzhahF4Ozyqvu3ECTHBimOArYm5PuWSL9VDTKtjcGuT5o
	zFcPso/jWr5NRxn5a79cIKI4lQZoHq2qwCXzfnOsyP5cOaPkiAVEtXlNbiGCGtVpBdPdOOG26TB
	yvcd8DXnrQoVT167PPWp8p8BRjSy9TQYyHgXFxGsg0XnmM3FfV0/05XTvDKVBO9OLYgDiPlUig3
	raS3vLerOCX5nTRLAyUFjBqNhQ==
X-Google-Smtp-Source: AGHT+IF2LpdEJOzHM/r4B4JdjSv0QcjVX0ilM/S1u0uF9+87CF7k8lNOP5/Clx4J5u89poWFyLFT4w==
X-Received: by 2002:a05:6a20:43ab:b0:1ed:a4e2:8631 with SMTP id adf61e73a8af0-1ee03c00212mr4065052637.38.1738911572638;
        Thu, 06 Feb 2025 22:59:32 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51ea79a47sm2226085a12.76.2025.02.06.22.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:59:32 -0800 (PST)
Date: Fri, 7 Feb 2025 12:29:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v8 3/3] PCI: amd-mdb: Add AMD MDB Root Port driver
Message-ID: <20250207065925.6u7bemyn2aireiii@thinkpad>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60c5504d-341f-4ce5-b337-1eca92a9506f@web.de>

On Fri, Feb 07, 2025 at 07:39:03AM +0100, Markus Elfring wrote:
> > I don't *really* like guard() anyway because it's kind of magic in
> > that the unlock doesn't actually appear in the code, and it's kind of
> > hard to unravel what guard() is and how it works.  But I guess that's
> > mostly because it's just a new idiom that takes time to internalize.
> How will the circumstances evolve further for growing applications of
> scope-based resource management?
> 

Please ignore the comments from Markus.

Reference: https://lkml.org/lkml/2024/5/20/724

- Mani

-- 
மணிவண்ணன் சதாசிவம்
