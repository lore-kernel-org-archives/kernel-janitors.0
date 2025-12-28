Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68766277CAB
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Dec 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766903691; cv=none; b=Kl4DhH37a/d+qbxRgwL+zTT1X+cDOTNNUM8fc3wnyeKnJlvDSDZu0oDVoMYkeVDGKbOkDz+/QeQAqHaJFRlLHZueJSrDq5yoA1oOcWOqKiCSgGxY04OOmQ8ZY+95g0WrBKe0F4RxdPvWVTjrriHduiua/SK9JhbLw82Ep7G9kvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766903691; c=relaxed/simple;
	bh=+dBgwafK1WHE+TP5vVX3Fb6vaal8og5lmnIAu5wHwks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mU7ig9RWNaXPZsGbcdLVJJs2Jq3H1mBihPf1Hx6Fi4xK9IYyZFeWAP8gUII48yNogUqbD9FZUl3oY3utVCSEbF5IkuL/gLVKOdoS4njzoaJY+o2YgO4q6hktLIIKe57DXBN+QUbmbaWhIB5fm2FU6+fj68XHMV3Fdf818ndoheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2euG1Gr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2euG1Gr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b25acdffbso3649645e87.2
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Dec 2025 22:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766903687; x=1767508487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ze4JDOO+w/8r4IHqJTt1vUQMM6G2qXdySjviR/vKtk=;
        b=K2euG1GrWIb87qXR/NYqDvJvxGFTu3UPgKgF0huDV5PJYXARvAKPkGfBYf6B8WH9oC
         JWk/fDXB7jxr0mPyiuC1mvLWfGhdw6lRYO1FT79BriWg8o4O/Y+kcGkH+uz3tKUV96lW
         TRUSsngWMmn2f6Qf6FN/cbWKTceJREyp3zTFCtGkv6KagUcwyMFLc2fFKQgrikSPJNEd
         1YitzQg1WQgjA3nWMDAZ+aVJ4Ey3/N+9fpQZPH6hr4E2p77CA3Q8PhkjrS7Dy2SFdexF
         482zQgy3EYfJ7Mt13ZM97TP2ZQXwwnnxcTnIaCWTtUEDgCT3Lr6gxcN+n0Tp5Vm+sGEN
         9Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766903687; x=1767508487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ze4JDOO+w/8r4IHqJTt1vUQMM6G2qXdySjviR/vKtk=;
        b=YuaLD16+3ssp1EFjXxM4OPuyUY8D+1eSvZAgRrqKHY/EoQeLS6v2frg2MeXKmYb8Ox
         a2Oc6fimUPWSvkAdJH8RGY1yG90Hy7Wpu8BAN/G7UR2xAm3Osx72ahFGwE+phNg18XWb
         NALZyY3h2VgxCTtButtgRvVnD+xbYUiQi8FgUeeOv3kGvQ60FYFolhkK6iI71RdEB3Xh
         nYPbIeYPFwMqTyLLQ3SaFS4iC8yQLi8oHYPpAL0T37Q4rxA9Bp9Vewt7FrDE0y0tdfZ6
         /wxP7sTtp02pMyyG9wqUAfO39pvSYJS1mYNRus6TEjXknhgbwVkA66XvO0nM8smYPqd3
         O0Ag==
X-Gm-Message-State: AOJu0YwhMXcn82vgj6tA/e/JLORL94yHMWMzWbe8lEOKSlnz0BTDAha1
	C9lu5FFhyeUvlV4ORfZjlDaDmvD6xPhgjgqP5d5tSXR5T5mpHVcTCE/J
X-Gm-Gg: AY/fxX4NpIyX4NVGrahDdIo6L9mlbdGqkVSHyWpuOqtzd+92HSfbWR0Loj+BXVVoQWo
	nvv2vR36MAKDAZhODI0PA8aQ+Yi3alRy3KyDPX+nkz93sUeSqMzHt0KS7s71lxAatWoM30TlqPL
	/gdQ70aBojEFLRPll9GETCYxm2u0pQYxdfa+IS0ZoAxItm0ntPJ8DoVGQZPK8nkcMkoQ08mA0R4
	jykR6yNZGeKUkfmHElPWkCYq1k47E2juKjtS5RVPDnL7xkyBmdkRvDoxA1Yip2m6U+I5vGRXdD0
	q+evqi5vjoF/4zYW6XizfP/UAyd/ggEYabODutUgfRrIPT/xmrtRm6w/rdu9KCT0eusKH3/0HIm
	zk/I+bmoNaGeCDzU4g65dAKkeIpJZmNCrlDQ4yN/8nFvBHEBTmlUQyn7bQTiIeGkakeJUMdS/qa
	oYLGrSRXvv
X-Google-Smtp-Source: AGHT+IEScK39qWney1DbtmJfqqJaGXJZQS1q/KrTQSNAdJiqhkIYncms5uKKRBKKHWTE3Ts9fsYWUQ==
X-Received: by 2002:a05:6512:3f26:b0:599:fe3:785 with SMTP id 2adb3069b0e04-59a17d65082mr9941339e87.52.1766903687301;
        Sat, 27 Dec 2025 22:34:47 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-3812268ec5csm66332301fa.48.2025.12.27.22.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 22:34:46 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 0/1] alpha: trivial: remove ^L chars
Date: Sun, 28 Dec 2025 06:34:39 +0000
Message-ID: <20251228063440.2623595-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
I'm attempting to write my own tool for parsing kernel code.
And these characters complicate this without giving any benefits.

Askar Safin (1):
  alpha: trivial: remove ^L chars

 arch/alpha/kernel/core_cia.c      |  6 ++---
 arch/alpha/kernel/core_irongate.c |  2 +-
 arch/alpha/kernel/core_marvel.c   | 18 +++++++--------
 arch/alpha/kernel/core_mcpcia.c   |  4 ++--
 arch/alpha/kernel/core_polaris.c  |  2 +-
 arch/alpha/kernel/core_t2.c       |  2 +-
 arch/alpha/kernel/core_titan.c    | 10 ++++----
 arch/alpha/kernel/core_tsunami.c  |  4 ++--
 arch/alpha/kernel/err_common.c    |  4 ++--
 arch/alpha/kernel/err_titan.c     |  2 +-
 arch/alpha/kernel/pci_iommu.c     |  4 ++--
 arch/alpha/kernel/smc37c669.c     | 38 +++++++++++++++----------------
 arch/alpha/kernel/sys_marvel.c    |  4 ++--
 arch/alpha/kernel/sys_titan.c     |  8 +++----
 arch/alpha/kernel/time.c          | 10 ++++----
 15 files changed, 59 insertions(+), 59 deletions(-)


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578 (6.19-rc2)
-- 
2.47.3

