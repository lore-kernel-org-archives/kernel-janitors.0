Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF823ED5B
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965784; cv=none; b=cQ+enOi8hPzZ4A8lLa7zihy3LMcZ4e0zfjTbeHJyZk3ahUCIoj0Ba9M7E0XdTg3/pZik2GMj3ZxZyzwXHpENnm3/e+Yx0IqbtASQvFQVww/dJdAk5T3xlY5OWvng6Qxb7dvYaV/wfU9OssphUzgalwoxaYkrQmb2gcKgkfPvKQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965784; c=relaxed/simple;
	bh=P5TTthgk+Rg78pTtJpD/DUUy985t633wbAtev7NEJS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyKiBnbjU+16gP0XcNyoSDPSJQp2CXCTFz6iKhjm+5ulsMbcTNmv6ID9mls9xGcxors9gSfK3HB69C6PqezUjL8zk1Hv6wwciICSQ0gwPCHuY/XbOkmc84k+aAGYlqWAolUyhrroXUJGboociAvaOpNtA0wqufAPLmd1CxeG4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwRb9heE; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwRb9heE"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2952727a91.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 04:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786965782; x=1787570582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5TTthgk+Rg78pTtJpD/DUUy985t633wbAtev7NEJS0=;
        b=HwRb9heE8oBF/e4N8qPwhNqv3e+A1hJ70dgHVrp74rjUC7JQwF7AsEt2EmvxKecggA
         d/VAyqGmsVZOnKqdDHAQxaehV5fJC1VSoS+1XMsW1rs2XezFgIx7uE+Z6uKofZsldk7C
         UWauaDrsruu3+8HT6v8UNhWzSiDJ7iPn/DOaDQvLJME0GuJydwm2Yv9Dj5xpk+Nn++xZ
         qUuU58ee3uY4tlV0gMk0TlGM5zib2H+8T7VQifRhuoCjGQqeIGwxl4XhQCJhukR8EcsF
         it4WSN9wWEHPuTgioMW4jMCqgrsCHTbNzZCZwCxFMm3E9ysMihO8/ZXjT4rSCv32xK80
         qsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965782; x=1787570582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5TTthgk+Rg78pTtJpD/DUUy985t633wbAtev7NEJS0=;
        b=OseyEy244+/xR4g5oTh0uyOsmtcrTdHKQXxk8USyYWHeB0uOI8581wFw1+zLbCN6ae
         0WLPtg6+WNk60wMKU4kU97EKmXYhBjv0SXvZhuHJta9BUJBg/r6XaAdkPBEqWaFjJUl0
         wr34jr2nCxS/AP+HeMLNJ0QM/jToY1BBDUdQDvnBlEuVogM87Y2jHykbrDDvW3cfg80a
         evZpTS+fqDMGkL2NVVMNZtI5MiXqCDbLKt/TuXlj3G3Yudm8wP0CZlDLZaLeKpSQVBMN
         0Z+o+1vLMYKfGohLhQUFvKbMGDkl9eUOgO2cDjnFi6rFiqMVGLC8HUF9vaI5ALhuVeEx
         QqxA==
X-Forwarded-Encrypted: i=1; AHgh+RrteY58gqguTXo+V//wLV+B7/xELV/9CxRG+IVtwYRAU3CJSrNYq7l2hivEPPXtzndGq/L+ZlbVi46Qnj3DJTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPPUwmZQ+VRz0tGDovMDvUPkWKBJMQ/102VEoZ9D0XxNwwqDe
	h6xJYSMXVl06XpVYlb9wrCyuDSkzaQIuUJsFdjkctmzwd/jm8g4xNivSThHvDtatzdcu
X-Gm-Gg: AR+sD13tl9o6uywd5NOuV8YnfYSU5ULdEjg8D6h56ytswc5FI2ELeH+CMmtY0xN9px5
	BCUhdY3GlindeLlXetHo0TcQO6Z11neDWgIbJsvhpyg5MYi8fvslpZKHj+Z/J2VFvgV5DtHSwQB
	PGAUwFyNA99LRjP1dLWLQphSr+5SPB34B/AhYpsQQ2MBxq9TbWj6XOBD2F83rY5/FK9IZ1L5bJr
	F0RBzm4zjxIzXMnuWrFKA2vWJ4uBhxC4bEOhOB5III737sOLeb7YEWSXp/WbH5zbXqL9/3hkZxe
	b7nreqiPx956B4iTfF9fBoxs26Bx7+bUliBHLq1dYVcXDUDjbo8wQ1nrGTtKYmhlPUr8S6UJURT
	nb81l+QFMXum14jCKdrnBBZLg5/IAXIoHfSTVpVOkeGKp4ANT/o9fsv8n1aFv/4igAaAQ/5sqHg
	VOnMF8QsCzoqDnF6Lw9r2CBhj/72ggaJ5OR2wUs87Xk4mmct004RB6//9XT/KR/wF+QO+pdJi1g
	sS4+JIcHB3ldBBE5A8YasXWv80krD/FZarwiFfmmNHsI+Cym0qnj+X1G0WvPqYZ
X-Received: by 2002:a17:90b:5291:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3933bd18849mr25980349a91.2.1786965782511;
        Mon, 17 Aug 2026 04:23:02 -0700 (PDT)
Received: from codespaces-a1fa80.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2e64dbsm1953571a91.8.2026.08.17.04.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:23:02 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Markus.Elfring@web.de
Cc: dri-devel@lists.freedesktop.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	royalnet026@gmail.com
Subject: [PATCH v3] drm/rocket: Check allocations before use
Date: Mon, 17 Aug 2026 11:22:53 +0000
Message-ID: <20260817112253.26086-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <eb5a74fd-8db4-4ea6-8fb0-96ade2f3566d@web.de>
References: <eb5a74fd-8db4-4ea6-8fb0-96ade2f3566d@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Markus,

Thanks for the review. I'll update the patch accordingly in the next version.

Regards,
Triet
