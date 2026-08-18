Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86969EED8
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Aug 2026 01:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016706; cv=none; b=VLVkIlrwMr4Qa+CSPAj+hAjrsQCLuBzHEBKYFVVjv96BCHYKeip/aDMA6w5msyG7viLa4P01m4Cp+IKEzeV72OjYQa8FDmF6HjsI2mc0gkF5VuDEaxleRXQyZfy52L8GZw9mhoeM1BvfI/VmrhNO/Dn5GLunCzXYOPM7pjq73go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016706; c=relaxed/simple;
	bh=nDwTmt2AUFVhieHUgzWmzMtZYA61Q62iijIjthQqocs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4E2Mvgpq2gp/eYOyJoRwIG4o5tXOKngd4PkCP/kAC9bJZnL3VdHIpPsQsMu8V/cRunXvaRaIHrQXVfuNCHBCD5gg7PSmyuhFdOapUzfNcnp9W92VSVlyWfNq9GDjSWOi1oD+nol3ODyUFf2NuG+MiPrXCF6ulL7OvkGbC527Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk1MrbKt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk1MrbKt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca80d708489so375606a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 18:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787016705; x=1787621505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDwTmt2AUFVhieHUgzWmzMtZYA61Q62iijIjthQqocs=;
        b=Lk1MrbKtL4DPPGktFAkgProzo8EdU7as1zBx8MZG1j+NJAromwIf03xlxNkzb1fNpo
         +qN69f3YBzmn009TxEX2Y0RA/8pfB9UQVRTyxyAQ0yXufX6PEjPRdM07oIJDv7loHOpe
         crQxsNq1McRsPEjOSc+rAKM4pUBgK15gk1QGELig9pgthoK3bkLWfxZPrgek9iOEGUeo
         vseg3JqKLM6QhJbw3FyTM9an7L23B2CFVetagvWr16PyZo9wPEtZ19ccbZrKQr5dtJEY
         /1iLov2ThLTN4bkHYDc39AyapyijheO1LusjUi1jxayqQZfiad0X9GIpRSie6nV9Zi2I
         ceUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787016705; x=1787621505;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDwTmt2AUFVhieHUgzWmzMtZYA61Q62iijIjthQqocs=;
        b=ClEUf3IP5R+g79sNwm9cGPbBB5OxTPayCgp2+4UWp8SE/W3L4gtIBvLjIIaS3nZkV8
         iAFVOavE0yaqad9YEwT2dBWCquiddLv1BoqCDHhviipJVKKAU/yd7jrgeJXyfd16z4ob
         9bNDlemT1TNuSjuPaKRSWJ7Y8hudtIGKLJGzReedyf8M4R9RLX/pDnWuW5V+B9I5HygG
         Y97j6ZW3jb3x2FgfU70wJa63ZMmm6dLaXEzOyr3+NBoIWyUhjdxcVSTVl+9JKaD3Yjf3
         arLU0bu0NDaVlsj6pKiy81pwwqj40j5lCfU7giRRWKqUeTtmwXvLVsQgVpjp2AYjGe5e
         Ir8A==
X-Forwarded-Encrypted: i=1; AHgh+Rroztpa2GbEOGnca9PxpvdW5asgxhj7KknDAdXV1yYNZmCXXZzFpjG7vA6qLE3xHdm9cxNLF9eYO6zb5t0sTcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1T+8z//iR1inl9qaJSgluhkSsaU0tgW+gxwEDxa9vM20N9xZb
	O/eErTCP9VdR9VwW9gW35bMWcruKF3fGw8549+AriDckp7m7OsA2YEQ=
X-Gm-Gg: AR+sD12hJvdUJqKEBFpJy/VyxTJpZyaWHhhvr+nF77wRBb4+SyTo5zKJVfN8PYKshzx
	hnjtT9D8YWp4HQCM2GEUx+IosBZNd7tu3agk6HjUTT1+YCzz1oCyuyVhmyct0GO5ZzbAchx8HJD
	Q4I1cN3BL9c2Z2pHy4lOt5Z3pfXkan+PI+DrD5oc6PDkxols8I7ysO3n+pBiXCivsxbTekYC/9G
	j0qq3IFtu0swTxSWeU1Tl5hQ1nP5XRrY60z8/LjS0e6+FASXT7agcshO4SjJiTlwFum/xzLEfNv
	pF4CeCs4vXPmcYuOvK4Ux+v9FJzkxodfDQqKoeXANvyiJXtBcu2fkSZaMp1KM31u+22fBdWm2gS
	i4iqye+VTj2bhcGrZyBSoZ0pGB4LC3oasknET2oFTVW1C8j8wH2FV3vVq88vb91klJM8EwgTnjw
	sP3nDaA8c28fEZCCMAuI+7hg3WcxhdxpzoFP2IAKS8jEH+PYrEXrQecwAg7AH2
X-Received: by 2002:a17:90b:1dd2:b0:38e:4f42:d0d6 with SMTP id 98e67ed59e1d1-395638e8a5bmr1543834a91.12.1787016704739;
        Mon, 17 Aug 2026 18:31:44 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b85b1sm4179445a91.2.2026.08.17.18.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:31:44 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <triet.hoang@datalogic.com>
To: markus.elfring@web.de
Cc: dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	royalnet026@gmail.com,
	tomeu@tomeuvizoso.net,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH v4 1/2] drm/rocket: Check allocations before use
Date: Tue, 18 Aug 2026 08:31:19 +0700
Message-ID: <20260818013130.1482249-1-triet.hoang@datalogic.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d593bdeb-e6f8-44d2-a444-e9197a8ed1a3@web.de>
References: <d593bdeb-e6f8-44d2-a444-e9197a8ed1a3@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> I see opportunities for corresponding collateral evolution.
> How do you think about to apply the attribute “__free(kvfree)” also in such
> a function implementation by another update step?

I am not sure I understand your idea.
Could you explain more? This attribute is a new thing to media

Regards,
Triet
