Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F576770FE
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764340745; cv=none; b=Ar3aR3jqvGcbBq7Kc3oCmciDUsP+ttHyD53+pOOtdrJdfgwUgeIG9H+wvTR8iOv1dRQkL9vRg2PGc4KSMxVkk6TuWFxbjYTUbHQcnHsRUQVNyoR/dn56ZRTqtH3pJnsSqDvRgcT/+s1+7ulfa9K+OBY0zdB6VohBacDADlIE8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764340745; c=relaxed/simple;
	bh=QtT5bnHhk9hjsb9Lk9iWVEUv+03o2wUKwskiuKS1tcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEvMcUsLpyX3HizWPk2x9pLiPBBzXtXO2yiwgsfp77NxgOZUjcRZE17FSvoUlKLNkcsE6BOKP8waFBu6ntUbArcEM1IYF1fvizxZrA3lBetoHLuiajb9Acwey/soOQdJ10/W6mwHkkDO7abfPc9I2cv5ga88L3QcSCPUdSzztAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TXgVJlwj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TXgVJlwj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so3139009a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764340741; x=1764945541; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QtT5bnHhk9hjsb9Lk9iWVEUv+03o2wUKwskiuKS1tcA=;
        b=TXgVJlwjupIrFymye1lU50CfsuLQuVrmb9F9SXmDlmYRMJO4+Xw7nSpalLqNc5apue
         fcsIObNasKgzGIvMFOfeSzcLpdVegQKyEnsTytDWbRCVNwV64npSstRqJe8RPpAON6qi
         xjjci+kvhUgpXn9UIB8WeJRIGbBrmCMtwW17zGnUFDgzbB5yHdFKGASP7WYZQ/Boca/j
         bMXaXbJHp2FWzVhB79ZovkgK5UfMsTwlTAw/JFPnPOMKeqtV6D4sR68Rr8lM9Cie0G9B
         j1i8j+oqUE0g6DVf/V7cng2OYoXhuj69eKEEwhQuEFQf0p4UDbhVv2SK5ky3Il0tpg6L
         iXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764340741; x=1764945541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtT5bnHhk9hjsb9Lk9iWVEUv+03o2wUKwskiuKS1tcA=;
        b=O6DFj3Nmx4nh6iFlMBJiC9rYAiy3GFPCkXWH7M85TF4+Ac7IBkKxe1joKOXCYTrqIc
         XBj9QdBssy9RsmoH7hPf3zfQe8aPQ1uyM5hMKSfGPuN4q1WxeJPDZOLEvh5soXmNuDFw
         MsQ96TULR7UJeei0EBx+uTRswoCgAbKsfDxyd/tBzufifDrHn2g5oLQcVmB0spFVmSDj
         Ydw0xzYzxf0zziUAFtcPdA3O2gMtaWJK1NBlx6Ehn1OJ0mVVmIj+BmVEANXSwMEB+2tK
         VcoesuZxM2sDq1fWSbiK+mkZK4OmOoOi0mE6Q+ZjJ7Nk+IhRS3ahku3t82GzkKShFRxP
         JRxg==
X-Forwarded-Encrypted: i=1; AJvYcCXDfPrqXwW3FOI6JiyfoQ/J/pF4egDu6mtHyX/lITOgsdGfbmIEGPOveUxsNrvvHwkmvELe4uWL6ElTKWr2LkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8JsH1IIAF45jNzm5Yl7QpSBff9jO7zGkb6UaZGsOiJdqiAZf2
	spmde+nV+0gTfIs2UAA12uuDDHSNXQUR/BiQaqpehNPNCtCAr6Hi1binFnWQQadvC27gy0dGWu6
	sT5ajm7HxMxv8CkaVhs4aaG7jIVVr7lf3j5bVxJWmBQ==
X-Gm-Gg: ASbGnct68MHkii/wlQbc4jwYPNn9JxdLW/sqDLwA4VSPHrZM788Do8/EAiKjUjBecj8
	vTj+R89WvxBEORykcR5+aRnDgYXSYUWPZDUBzDlcYoSPPVHOg60ah8Q4LQK/p7hYqFnaHPmvXO6
	NRv/XNaQ1JBdvJTuyxtK0MABPsuVwlKDrYFfoHfNEvihDawHE+21ohLLudY7XA4qwEpAS5temYh
	Vz2b9syVPFZvN7JELPROst74D0VUSmvaxl5KcKI8DPWUBpCknWpu/w047XfVJQWgvPW
X-Google-Smtp-Source: AGHT+IFtR/oqE4H85EXdAWXH8FB69qtcHwY9JPcV5frtgDjbPxHt21wsid7qP6GjHSBd0RGAlIYLzm1l/aemuRuNb0Y=
X-Received: by 2002:a17:907:c0d:b0:b73:54d8:7bc8 with SMTP id
 a640c23a62f3a-b76c5595ab6mr1804354466b.59.1764340741025; Fri, 28 Nov 2025
 06:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSlMc4SS09Re4_xn@stanley.mountain>
In-Reply-To: <aSlMc4SS09Re4_xn@stanley.mountain>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 28 Nov 2025 09:38:23 -0500
X-Gm-Features: AWmQ_blhJsyIdLKF-dr7tNos9TGuD6f9djwLZeQyTXXFkXNuuAZtgh6pB2bpzAs
Message-ID: <CA+CK2bCtFFcRGrtJ2PAkaCiBge6HjXRX9F5oiyBtCjEOOiQ56Q@mail.gmail.com>
Subject: Re: [PATCH next] liveupdate: luo_file: don't use invalid list iterator
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Fixes: 3ee1d673194e ("liveupdate: luo_file: implement file systems callbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202511280420.y9O4fyhX-lkp@intel.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you,
Pasha
