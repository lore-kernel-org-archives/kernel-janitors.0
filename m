Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B951E5B9E
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Feb 2026 21:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152934; cv=none; b=n19ogdsBNy2j2V/rII2+KLkBern+oVstaLRVWf0MsyAR/FBBR0O5O22R7tOPOGEJmiSoyU96kxt67AMXbT9lRVEoOrwZdF3fVnuWSj80zEBXJLC4ypiKlXzQt7tq9ppatPpc1n6FZxjd1kbvhmkfELC1gCnXiNyHVBSbbTjagfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152934; c=relaxed/simple;
	bh=VMkQsJuFLLLu7JJilTYZc97YppbBarhFslbcJBqfrQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RHwlJCvjxTmTP2L3h3FUmEW7fU1p9+z0ADL3WC45mFgaE8wy7GgDZj2kesiFPFqpIq7DutIncCT+xUPERaq4ia1Sma2Vy/VbwvGP581lISOADt9l2miTwMHNnQDvGHB6WaNSZrghVvPeBrkq6RWPIdFP9V4+DWsRq+LPNskuyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdFbFWPT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdFbFWPT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so64421575e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Feb 2026 13:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770152931; x=1770757731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOaC7ZgINNg0twPrRky8t1EuRrSsqF9vkFHbkRc80e0=;
        b=mdFbFWPTf7cYuQ5xP5/awZMpPHdqpjYaZJtlIqcxQtghftwvSArCu8g+jaFh6+lGBP
         7bbJ1rmFjNgpqa1hNlj6688RVIafAjBS97p03vgK4gINtv8xv1e1gvvQzUsoZIlL4P/I
         3kusYgWZTVLpYA60KMlNW71+Rdr3pzto7fxHq7hfzhMbBBPi2LnhpZu+Diqy35I4G3hD
         KlEATUCxmRvUaKzXD91NW2/bSslfVPHUw80Wikw7lIFjiEqkodEhD6mE/G1HaAbAGi+K
         i0ZD3Uv1qHlw52lA2mE/5mQlVyPyrDVffCRNgik4mXsxBD3DVoR2vJnyLxbX5a0XOexn
         D0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770152931; x=1770757731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOaC7ZgINNg0twPrRky8t1EuRrSsqF9vkFHbkRc80e0=;
        b=sQovmL8VvEO7Xdx30vo6HA4zGYv8nSZ9mTByYpXmxIeSXuilbZukekQFfIU9ImLvm2
         iaPZgG9dYGpCCpNoyjBoJQ6QWTRt4YlyQIR3iS2K3H3fucPeMQP9xfASmXaSg1JwuQ7d
         LIGbutJjf6TKfSiLhXQecUU6ChJWGsjQhEvunsXYIXksC1GQYXHjpBu+wjoMfq98x5Nc
         LToiGCDNisD3X6w+P4uBM/YTlJps6YEAa9HbOrOFvmdLbCB7iiEzaum+giDOQBy0pLr/
         x8PVUELoevUPagE0vx67Le+B7IPle2WJpd/u3F6vqVISY2PXnPE78x8Ni1zk/IrB85Ty
         rgbA==
X-Gm-Message-State: AOJu0YxSGu4/lyCpai7mcNdTKa/mlpsXs2ijMzQSAAltkheAbRFjC5qf
	Q+kWSiVQhyUVkn+0BxpjLxQm/3mwH/AvvKXal2z1YxtjiRAAzXjVEFT6
X-Gm-Gg: AZuq6aLh8Hp8/Ql/55UeKeRh08aQK2738pxOrQc7p4GdWoh3dEyhcZxl/VzOzSiTw7X
	fRCFx0xF4ScDemHDueH3qO468Rxh/5JH37xGfOKihfCB/CR4AGYOjRuI+lBTf96XuHctOpzqmpu
	lTl3jOn3cWcqX1J9e/Abga0EoOJwSaohxBySuzq+M2fnmpXuGvgu9lj77JoS0nLnEmp7AgLU5ol
	ltr90aZFw4SCSTK/S6ggQEk+9MfFK08JS3PmNah2Z2F0Aw8pGwLpLKi4maOv2/srdl9mFe6cyov
	C7tW8N+DZkOd5FjTOAEYFoRv7CXExoGn7H8XmsUPoHYEjd56mHc0ncHFG+2EeHQ01E+L1kqE8zg
	HZVfqW//rMivmDieYJAZHNQ9w0louxrbgZ1GcUJ/5aTXm718XVdfpunmOfk6U07FgvJD0DdwW9p
	UDIRncT5daww==
X-Received: by 2002:a05:600c:35c8:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-4830e8d1e59mr15873095e9.0.1770152930823;
        Tue, 03 Feb 2026 13:08:50 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051292bcsm125902805e9.5.2026.02.03.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:08:50 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" -> "outside"
Date: Tue,  3 Feb 2026 21:07:35 +0000
Message-ID: <20260203210735.5036-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index e24ce3d9fb62..8c4cf8430871 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
 		event_id_base = info->hwirq;
 
 		if (event_id_base >= its_dev->num_events) {
-			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
+			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
 
 			return -EINVAL;
 		}
-- 
2.51.0

