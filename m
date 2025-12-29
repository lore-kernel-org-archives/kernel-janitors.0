Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1330F554
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Dec 2025 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767021588; cv=none; b=YGw1C7eeEmSgo2H8k/vnPsZYHd8MIFo6ZPui8Area8Yd0n/Qf1laUOhzDEwH7orPLagyfm5XftBN5PUpesjyzf1ANrR1310uGSZqwBFBIAd2V2PwRtjzQ3q9IKDHOVRpyiXcTQCP+XEWJjn1MUgj5jTzo8jYVudXuhm/Hllp/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767021588; c=relaxed/simple;
	bh=9hKz0YlE5sEF/vCIrriEA8uj+7j8dfzU6rsLnooTvL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pWn7Yg2AKK/EYDy+ESdKNgxgGIf07FPQIzulrBnUZm8pKuL4oynlUkg6333XEd3B+VTiT4/PdMKMFkAfYmFz2xjp2ejXslTmbksWWBd+5E2GjSGcKI2dR6WEGTrGXTUlcZfTZS9LEfnLjcUAQvLCCHoK8+Yhf3X/OKc5yKl0s9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=b2hXL2Wf; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="b2hXL2Wf"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7cdf7529bb2so1026302a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Dec 2025 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767021586; x=1767626386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irnSD6CgsSgf53U6Y+/egPe34yR4vf5V/wX/ig9SSuI=;
        b=b2hXL2Wf9mePRnynlM9IySm9STQYEzpopwQ2zpbEhVZycUKxmHr5Khr0L3LUWn/JYx
         4Lozz4s80sLOtCqDLkcdbAtmVdc7oybbtPihAAoIkG+Ne2txq8GjbiLmyiL2ZjluExWf
         ffAODkAVxmBonGpzFLbs3Y2bw3DxAY4Gh6wkIfBwAEP0uam/3W6cYCH7PylKtkVu0Vmd
         tRqM0bbptdUCwtbEWP+znRKiz9251fTTWZijiphjiCNbQkUy9RAkqRSIUFG/FYB8Q8bU
         wVSZFm4Ruj03xLGIVKmGG4oFbwid8/hLEbnP6tKZC8AkOsrXHKrsel06xYxIe5MsL7u0
         MgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767021586; x=1767626386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irnSD6CgsSgf53U6Y+/egPe34yR4vf5V/wX/ig9SSuI=;
        b=jk+C64jA1ZcqVIk+po6mdCkVdLaZo9C5URMF4YlBhvRGCjigc6jm8c9NLm719uMBVq
         pqrPXVqJXjp2/ZEGVh8QjS+rkULZ9O84Rr9iA478aiBFfi5887U6h/m2L5Vg2nwdYcaG
         b/P/bMimlaeH18LMo9N/w5t0+M475AC45FdDu5vNVvgQwsoYEAv1iSRsW3Dw8w9u0I9o
         K3KiWzLZv5mdsMrvpHWmeudQzx9vLC9JaZzrdHKbISTAo8uAKmWoxc275Zv7C0xsPZ0m
         sjBALoHns8qGduNlNEOndYaHxtSvP7gWaKubIgO9YtGdVzdYpDIc9x2nuO7C9EVzhFYn
         +AMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeVJwnO7y9FdOF0gO/u9y/AXmRL0TWkPA+u95hPuwF8qKUwHmitIAwnjaOFYu5TXS17Uuk3SuYjxmb0io7xuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85tEbQGo6v6pG7DAwJVZc5IDjSTyoIbOMI6oLTXpfTR0Y51Kb
	VI8+2k9wIE9R3kzWU+EAtO36nWI+4geGraRKuk6iUS3hEHE4xqkKESP/AVyfzbXHwDY=
X-Gm-Gg: AY/fxX4CfH2J4Ih/vyu+T3gsBIlHy7Hhp+mL28NLAl5bjIyz6XK5Lzx4Il2E8r+DxZQ
	R6kYOoUAwbF3bHlHKJW/YPzuwr2myqkugkjYg4ykGdR/sQXYU6KZkrTsB15hXtCSzdAh8e0I4sW
	ndek00gEcwSjwVrjvXe+OedvMkHzUxN1mSHKSOFSR2QbU7h3qd6Hp7LxU43kPrCyzzrveDHApPM
	+/WyfwHQylBFaMXGmc5COdhetvljiXrr8wGMTOuGz6qDCkaA3ya9fB43XrC0Sy46TNndOLs9Vu9
	yR3DsCuNKOJU1oyV6rzAn3N3XixkGe+kTBqGFKrYq8EDl15YBktMvoNBGodLK4iI/dbS5J4N2fA
	IxF/G/XdfspA77r+ujoARSShkTgWcROfXI6Se8zER281OdZeEIjJWxeAjCB+KXMvOrINVppX7oE
	NHreY=
X-Google-Smtp-Source: AGHT+IH+3Cmic9K1ebyokljCYZKom3K2Sa8cUeN5BlUVC+hmDmyCYtsXap82Mh8gP3OFPeOK4v9kZQ==
X-Received: by 2002:a05:6830:264a:b0:7c7:60aa:6496 with SMTP id 46e09a7af769-7cc66a0bb00mr16932231a34.4.1767021585790;
        Mon, 29 Dec 2025 07:19:45 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673c32esm20939101a34.9.2025.12.29.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:19:45 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-block@vger.kernel.org
In-Reply-To: <71cd74099b2b8ab7b153b2ea15b53944189d014b.1767003948.git.christophe.jaillet@wanadoo.fr>
References: <71cd74099b2b8ab7b153b2ea15b53944189d014b.1767003948.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] null_blk: Constify struct configfs_item_operations and
 configfs_group_operations
Message-Id: <176702158486.237054.163427666901563233.b4-ty@kernel.dk>
Date: Mon, 29 Dec 2025 08:19:44 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 29 Dec 2025 11:26:07 +0100, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> [...]

Applied, thanks!

[1/1] null_blk: Constify struct configfs_item_operations and configfs_group_operations
      commit: 9e371032cbf0c8fdc757df5510b55e824668b938

Best regards,
-- 
Jens Axboe



