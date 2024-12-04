Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9297620C462
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Dec 2024 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733330424; cv=none; b=PJEtRlSyl4NLNLQuU8CkFwaNr/fzeBGCVFfUnvTXdtA/iAn39bgkgER1AzpKF2/I6g+DJoksoJQEaUvA9n8bm7GTeQX7SyM7NR927OFa1kICI/lDFGH3yCjCyaXrcApUlGt9GhCScZIhVzSrjzhiOEfC4y26BSvnG1jLjXAseAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733330424; c=relaxed/simple;
	bh=/04I5Sh36cVEWH0Dc57OoZdAbdAokopOpW2ylNRnEV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dH5OPH+M7Jssa++CbK7RqJvOIf6xkq3uLzXozzbndEUBUHShGeYpLYNaNvGQSnm+vxrt/4Eopx2AUKtrQLZwwQlA2LccDunj4/pLNzb8uXXzBexxf1koG3YJjQm2nCNrj2xse6YeH8A4ZA6vhgLagto0wdjvuw82rWwepAM56gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=e62okoPB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="e62okoPB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215909152c5so37606725ad.3
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Dec 2024 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1733330422; x=1733935222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea41nc8IA/yWz0s00ynnrLVfux7dYksfDzuAH1K99H4=;
        b=e62okoPBN1EZ1e62EceYghK3vwedofJo6Jdpz1L0w695AosDS8l13OWPT8C4yK8aun
         7VVEzLMs53pysJwQOIM440Jj2vsqGCVku0WzJepWBrm5I+GeMcY80KZM2NL8ipDGLah8
         IwamuyP3RBN7H5aRBURiBrQLCDREimvS1cCgxWyHG7wGv8I+FWhw7Ws0i7Qxy9GnIgMk
         /I4PkPWL7Q7V7iK2PkRHTxyZmMLlgAbal1efn42tR3noFAxEEw+X4dPk0iIcShoCvC/m
         j2xSQrGvBSoe2dzIwb69Fx7kdxZXDaxSZ/FU5qUzU0JLainIuYREQ8kZzx7a+TfPPm1R
         q7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733330422; x=1733935222;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea41nc8IA/yWz0s00ynnrLVfux7dYksfDzuAH1K99H4=;
        b=oP69m2hWvv/n13qtQNAfIYKmw/RE4NYTlhHzE+Psf4JPieQ/vfeb+8RxFnlN+uAeiY
         qGLphTfe9TDieByhJk5Ra+kYMLXzy/pZaLua8TLxx3ITC3G7cOp9e6ImRwRlHtoeY9LI
         sj/CchJIfY/i9dv1LiU8/ND9QJNd/yi6dYjnFxJch2vzbiHt/WZiH3R6kls6KCMb7pc5
         7I+Bzp3K25pdWw7MYlAU9ZVAzayXxN4JM2Gy89qrKqeU36MkFCtr0/pV0VW8Euu4/MD4
         6FYUBmX5wsM6lKJ+LjuBJ98scE2u0H0di4Nj0fFetgOhU8wQj/LlTBZ8/XokQrA2W3Tp
         ILlw==
X-Gm-Message-State: AOJu0YwS0+YmxEVO4vqNKSq6ruLpxLRlgGzUNvPjk0KiMnJUIEq09THw
	IYOcXg/bqxiZFdlK4yUGvZpdwHajoCaPb/ZzPPgJi77EVHUu378agShSK5leIn0=
X-Gm-Gg: ASbGnctPbXHuM41MyBqBa4kHyOPPeEYn2js/xB0NRsTS2r5AckzX4vt9YTsWCaFe1DR
	tQbuYvJ4iw1W5DwiJ0gtytcNHEgo2e5qE4gFmE4v6CxR1ADy1DJYqEeWB6af7v//JwfxlE4WUrF
	xS5NELseXULXfxIpZjhwIbn8d7VSelpasbKBgHFX83D8sqoeijdYrHwkSbcqt+Zh9/sjr45wxE/
	cwp/bR8OXLSeA20atnQ07laK/RBbw==
X-Google-Smtp-Source: AGHT+IHvExbzUsZz3phLvXEVX1hQ65i0mcWOe7p/CmHEt2r2LOx5jc+H2no4a9V5TPiVKl76Q80KNQ==
X-Received: by 2002:a17:903:41c6:b0:215:9642:4d7a with SMTP id d9443c01a7336-215bd0ed2efmr111425035ad.0.1733330421907;
        Wed, 04 Dec 2024 08:40:21 -0800 (PST)
Received: from [127.0.0.1] ([2620:10d:c090:600::1:a7a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154e1c34a4sm88508675ad.260.2024.12.04.08.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:40:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204153923.401674-1-colin.i.king@gmail.com>
References: <20241204153923.401674-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] io_uring/kbuf: fix unintentional sign extension
 on shift of reg.bgid
Message-Id: <173333042069.512655.8947541818653406492.b4-ty@kernel.dk>
Date: Wed, 04 Dec 2024 09:40:20 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-86319


On Wed, 04 Dec 2024 15:39:23 +0000, Colin Ian King wrote:
> Shifting reg.bgid << IORING_OFF_PBUF_SHIFT results in a promotion
> from __u16 to a 32 bit signed integer, this is then sign extended
> to a 64 bit unsigned long on 64 bit architectures. If reg.bgid is
> greater than 0x7fff then this leads to a sign extended result where
> all the upper 32 bits of mmap_offset are set to 1. Fix this by
> casting reg.bgid to the same type as mmap_offset before performing
> the shift.
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: fix unintentional sign extension on shift of reg.bgid
      commit: e54fb80b57e4534ae91e65ea14cc66b9f21b4b7a

Best regards,
-- 
Jens Axboe



