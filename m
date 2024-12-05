Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B317E019
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Dec 2024 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440023; cv=none; b=EIYl+it0xkcJsdIHL1dwP3MPoE8MkbGWNolR/hAi8D7LJLG9iNs3teqnmjwSzHzPy/Cc/tV2WvhSVHPBEhyhcgPS1iDanB3wttnEZnUfdAyfpd0JpR07pqzsK63+6f9pk5TG/wpGEt8+8op9jBiDiKv2G4x+N22suhee7omdyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440023; c=relaxed/simple;
	bh=UciXj6R8kmj7F1nkPNLftcUuWn2zjjonY7XeTsiisyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dWb/GGrKA/PQVZUza8GTyczMyv3HDInCS+/s+wWKUoDBjfydUoVIFDxt42qlfMP/iZnjd5MqrfF8uhPsQaATLaW7N2A1MdAjvdP2Tcd3SZTmV/y+y0ImnRd8eQ+gnO5kvC6V2E7YnaTbiqkYYd6xsw+bvBAHdDNZY4vIqsT4dDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cVPp2XKe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cVPp2XKe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee6abf124aso1251161a91.3
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Dec 2024 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440021; x=1734044821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=cVPp2XKesf4ltGnkcHkA+JjCxU88rJTYqOXLX/RrkGqP1gISqUyPdwdPvIihg026XK
         u5LOC8eRJ0fGtGxo8/Ij6UHDnrS4svhMGZmVAxezXsQ5ISYn5XePWtOMeU04EGpvh8r1
         dUs9XTsD/zkWGXqDnNzPTU1gqvG2wiwCgavoYlFG8U/myvrZjdFmpr0KZAISfHeuKD7S
         dstr4mHMITuc/45nnoFkiz01SFVLkq8wesE1K6HIzRoxDb6aE5tmlSen2qRtwjWlRT/u
         64wNQTTm8kjMXtGIlbhxRubAFd4DC/HMM3A1Av4kj8QJON2PjA2A1OzSZkhvd9/sP9tr
         mbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440021; x=1734044821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=d9HoSqlQY7cAEB7msS6GMOU7OgRyyJrtaVDSWKwgAl6xAT5KLirzSL07/cahJogVLq
         AijsDeXwHMGXqc3b/RyT1FVTO8X93jguRW8iJLi6PNykR+4BoLBmIhiDyuKIvApEQnHD
         itBWtO/It0TT9T6NTAkpZXwsCepSG32dB5AZ6bLnVLq5Mg+IDKLnO78M+Kk2qvibhkZi
         BwGj2771qQJT3Z4ps2DlsPvwz/b3ynPLlO4lZIABK+3mgvTDKTfkKNeV8ibteZy64Wmo
         KJDZYZWSDGZGeR6pjsyXIam258dHvKDkQFdtKtHh7p4zyVy5VW+FfGontdzL5uef8IFI
         prQA==
X-Forwarded-Encrypted: i=1; AJvYcCUoH634YhlWd5J7KgDZu0Z4fi7SHCHoRsZDsymbO3/EQ2qs7vk3HEdPDG7V5Eif6Y95JAlDpXazQIuXMaPLejw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNViBkH2f58PVVu2Q3H5NwWkfMfI75DA9dTeIv4n0+KN+CbPDW
	H/mOtz+xROwv5xkjywzkiJttVZbWcbqdMDDQoaB0lfqAJioowRt53k2AIb+BEf8=
X-Gm-Gg: ASbGnctp9pRRZl+v7A58fISUaZVJN0SDTbmG5XKKqKxHKd2sOiR1WoRUqoPSccAOEZN
	D8/COdkyVQLHOFybWMCifksqgTd8MxjTH3djDNfdeHFhbOkS0FSbnWXNRDhjDCcX07Fn2VfwTts
	YCKJBapnRCOL0sdAtjiSV+hi5Lv/CeXvNCepr/i1OhOODcYtFEmRxXGUJeY1EB43s0a9242ZsFW
	nTn99NWVpWM7AyuA5hBJh21iVTVxHXS6OVTA8uhdgrLHVgl
X-Google-Smtp-Source: AGHT+IF0lJnHZZwx5qW89pY3JM7PmU56DWfppWtG1IiiileeHZLO1SZtL+I4lEvD0dwQNQWcZ0pTbg==
X-Received: by 2002:a17:90b:520e:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2ef6a6c112cmr1324606a91.20.1733440021483;
        Thu, 05 Dec 2024 15:07:01 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f7d804sm1938792a91.1.2024.12.05.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
In-Reply-To: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
References: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ARM: OMAP2+: Fix a typo
Message-Id: <173344002056.407600.10771943462992727832.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:00 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Sat, 02 Nov 2024 10:27:51 +0100, Christophe JAILLET wrote:
> A 'a' is missing in "powerdomin".
> Add it.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Fix a typo
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

