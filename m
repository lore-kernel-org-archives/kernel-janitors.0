Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBA25C82D
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507857; cv=none; b=KNeo/rlUKj6pFEKGu8EMD59NMwOfNB1rVuxl2lhDV0WN84WfgM3GoalW4UvhzfEd5yD2YOcFfvzr7TD5QvDE9LYleMI2mJZd7QPs6o/qqmcXI0r9jmH0diqF8SR52NPEJP4SBRC2KGT+2zYuBYdGLHom3pcGlMHfAVryMLXU32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507857; c=relaxed/simple;
	bh=5CM+wL1BMdouWGV9UuILR2UOBgnMEPXEp9/eRNE6KiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6Lh0UdQw/UeZVzBL+paasrl4ScvDmrosBS6qt24GP4AT83LnRC8gM4saBfjT8yw+nQgCFOUhrw7sRYOmGRcaa/he6vYAFQwhKo2aZyvv/lWnqGoGyQ6l0mtBkdE9XUnAVr+7lf9OWA7zL7N3Moril69GMr9fVynyoXepiNsHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydj9b30m; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydj9b30m"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74b54cead6cso3040324b3a.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507855; x=1753112655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CM+wL1BMdouWGV9UuILR2UOBgnMEPXEp9/eRNE6KiE=;
        b=Ydj9b30mLrQtYvP1iWPIles3a1XDW8ZiWsCG43/fMeM+cl85bNT1oOiItbhG0sk63P
         4/y4oSrDXOb6YePOomawtSjHxV9q0veJKTO8kZcCCHFTT+A9OWAr//w+XXGu1UqzgUdd
         YIeDeS3Vx+IJZWa+kHvKM7M1XR3HwrVouPLs7mhdGT48ORglzWgM7NlbqCjmzv/cDnl9
         t07JCE2U+4UjN+RCf2t40f5/BCeD2xyv2+A3vY8AWVDKcA890tmFtQNqMnhUcn+8x6Dv
         y/mk6hKwYGsE9aoA0epjOjV59uOyr+KpEjFBaSmgBSib6ZLYJXZSfAkqNmcArLvetxh8
         4LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507855; x=1753112655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CM+wL1BMdouWGV9UuILR2UOBgnMEPXEp9/eRNE6KiE=;
        b=H1zpGPR5n/eck867i39xa4tKif0NZuztqNpYKjAvKsKo9i0uIXv+uZJlv7H/vZVOsm
         RZKb1ZRALKZKyYzCvSw2Bx/8+szR/ru83dvLQwsyuTeS56uX/npIizvExjg2sY8mPssL
         EdBiO2X/w22dzkfy71gHyNj0WjF09e/6Y/TMakA33lo1d1kjAqx4rd9wqLZDFd+Hykbs
         fOglexA9Z28dkWcVukjmny6XBnpSh2A+z1NwBkNjRMMXK2nw02omGcezAm2Dxhn4BRgT
         Kfa9g8jgPBRoVjxkxdcQLZwu8laGpzPRygX9zjmJD8fdcsmQPgtQ6aU+hTtSoK+75pTK
         8Wfg==
X-Gm-Message-State: AOJu0Yw2CBfK63Zd52elwQQCcYG4RX9B79/P87IdWd3F5Vh7oUCdtUkM
	PGx/WA6UwmF1We2lvsfPzEyVLPyot6IOoJWhgpeDF4JUvVQQG60LD032
X-Gm-Gg: ASbGnculSlZP282YCBkuQ42+Y7JxYZZFaKFl3An5+tfjyI3i6v7en27YMJRkyaOHHfd
	I7ZQZcewq7HBSpVPDS3RBHw4b0okV9BWHPh/eYRhFDof3IfEA6HeMCBk0wmkoANU6wGYO255j2z
	HOApZVSPxEmA+ycdjX/GFPqMDdHWZOrXh5SfSVBtLZPww84IphOpq3fT/7wC5Db0fg+uM4sPPDY
	Y4Hby2slpX+WIJ91eEIxjoqUtpKhpnAL8TDP1JCghXVbO2MrrqywyrGYMPdWo8M/39f602e0H4o
	eFNEUWXlCNPqild51Ooyb/eYmVg72ng7hqbr1zzkO9eLpL4hUjqZkIJiGyhQfXWRRcEiWXx4UpL
	lMQLpmjpAapep7nkjIIkWnbQTjGmpf1jDMqXVRECB+gIPDA==
X-Google-Smtp-Source: AGHT+IHDeFmyvLcTBg6a3QHsQsNLZ6JSyH8ZP/IyVmqCJIfB1UtN1CQErS8ft2cHOf7aTU0Bz4Nweg==
X-Received: by 2002:a05:6a21:f119:b0:232:ac34:70f1 with SMTP id adf61e73a8af0-232ac3472a1mr13548196637.30.1752507854936;
        Mon, 14 Jul 2025 08:44:14 -0700 (PDT)
Received: from localhost.localdomain ([223.185.134.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8c2sm10386258a12.39.2025.07.14.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:44:14 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: dan.carpenter@linaro.org
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: Fix grammatical errors in i2c_msg documentation
Date: Mon, 14 Jul 2025 21:12:16 +0530
Message-ID: <20250714154339.4740-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5034bf7a-e415-478d-912f-5442bdb28143@stanley.mountain>
References: <5034bf7a-e415-478d-912f-5442bdb28143@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies for reviving this but could you please validate the patch as part of this mailing list. I need a public acknowlegdment for https://lore.kernel.org/linux-i2c/aHSvixooGK9rFT8g@shikoro/

