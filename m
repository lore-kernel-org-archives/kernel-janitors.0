Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B8274B56
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762022142; cv=none; b=qt3KJEVVBsXouBUHzl0pfN57fB1C7V1i8BFLkAA5uDyBQ5E6dndD7sANf9j3PPp+TDZ2/UrPB3bb6oQuFqyOTI2x7E2HXiHfjLwC8Zs++LQNfIDeufwiSSyXUjBSEROIL1WcskGJwiCu3FfTlLDiVp0wMqRM8v5XcCNM9h4LIgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762022142; c=relaxed/simple;
	bh=4sUqxa80eDuptdCLV+9yUlpRXQVSwLs4Gf5XQWScT+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S+mxWBqQuSMjgJFjKmKEZcUFZvc9jHuOd2KJBsNzlkrsBjZ7joeDA1imlLwnLVx3hyIYWibQafFM+qp6qsorvbsPpe0B/RzdksaY06zrdZ2eHZa8l+SvJ7BptxYYuchnZadfFrQ4VdD0Ct5BY1a9WPk5vgX0Iu9lWZKXWPkuADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCW4y7dR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCW4y7dR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47114a40161so37014585e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762022139; x=1762626939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFcBnQWmGxUHkWuOHMhhl9sQofbkx4ng+ZfaT543MNM=;
        b=WCW4y7dRv2fMFk5KQolOvjP45emeJn8LXvKQUkBbPyl2W882te1oSPRPpLnxC3qXqX
         waU7vZ2g1Nx98CMpO72FHFDoVeY2GYOr47wUSXzSAr3ouhY1smGZhx2SJl47oWtKxFXD
         /wCPLw5Lha9Ucs4OKFHJ44RJewakowUuVt/W+pkyObPjyd3XQquuPlzB3KmLu6fG0pqt
         /eUfwrLtguJKDARBbewCVujxAnOBfAZEEZjqhEpRRtp2mkdlfqtuaheCYqm4UFtl8Mef
         Sv6PollxLXtLTtITTl6cAqe9PyX/cOq69j47v9s6rCwWeaRfDbRj28Uv99uljRTkvLOC
         QcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762022139; x=1762626939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFcBnQWmGxUHkWuOHMhhl9sQofbkx4ng+ZfaT543MNM=;
        b=XRp/RKWrt8auSsAKv9ZPdVH2o+A9sHEtMYnriI5Xvr4YpEDfbTqolzXCqQdzvTfHIg
         ne1WJgl5NsODFKne+sgBai9I+zLw8l5alWGwXFnOR/stSl4b41xXtIxxh+6jCPNsOYVC
         5tw5JpKKksJ3q1PVggGnG30VMHrgaFS12HcERYx9Q0L8yZlnRqE6gvGlZHfxBA3PaWGr
         SLLcR9jExHfquBwmEjbEVB8E3cEp6zAY9PCpyB+GzzQEwNKjIhtcdsj9T3T7Z9AKG+Ha
         Tt57NrxWRpPSUtuAlqZSXZ0BujO+dAA8IYPS433+tiC0YAU4Deo47kQEcyoaOYS/I9cp
         DBOw==
X-Gm-Message-State: AOJu0Yy47knQjkoOBYG9bH8tElnXUCZJkmdGWiHelHmvohOaxv920EuL
	h7kvZhIy2Oltod3p8bLvXepyjbZIrfaLibCdu50EKwSvaeY/5tBVHfyg
X-Gm-Gg: ASbGncunt0pU0YiSTBKZgv6WCj+fSvdJ8X1ekfRMxHL4toft/u4OSFD2LgepOvHYuuX
	6LR41O9GWJqe/rQ2TiTP9usRSfFef82dn/OjMLnokCxx7Lrah0rYOWbSG16H8mjdT/3nvtEO6+y
	sk00EkaghlaJesqvA8sJJApipr2M5KoEqJ/lWPiG4MYai+IHrDoYnrRD4Snk/WjNI6bwhxK2Tco
	J6QV6gp4GgAtYDCMnLlK57+fHJOU166642xUtVSVSMujO2VHBrSkVPSkV9xleZiq/ANlPVxnGDT
	R05izwA3zTZH68ZJrjwYw3+WVW498xn7HABuUs/jg9Tg2Z5bVF0r43OSdYP/9GGkUCaQbiNLWMN
	9/Ud/MyZ5dNBv2s7ervACDlpsSPQTWfWs2Vkb7PSRRLWU+kxcxZ7iInZVhEd/d4Ras/2D/M6vey
	9XAP27SNnOSQ==
X-Google-Smtp-Source: AGHT+IEv2HySmX9ZH4mesehdWb7wgnujM5Ajti5lbRw0Mrtv6PqNuhJysmW3Q3uyqD2pSUVf7SrbXA==
X-Received: by 2002:a05:600c:45d3:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-47730813642mr73186695e9.17.1762022138469;
        Sat, 01 Nov 2025 11:35:38 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c4a812csm68881265e9.6.2025.11.01.11.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 11:35:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: yt921x: Fix spelling mistake "stucked" -> "stuck"
Date: Sat,  1 Nov 2025 18:34:46 +0000
Message-ID: <20251101183446.32134-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/dsa/yt921x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/yt921x.c
index ab762ffc4661..944988e29127 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/yt921x.c
@@ -1131,7 +1131,7 @@ static int yt921x_fdb_wait(struct yt921x_priv *priv, u32 *valp)
 	res = yt921x_reg_wait(priv, YT921X_FDB_RESULT, YT921X_FDB_RESULT_DONE,
 			      &val);
 	if (res) {
-		dev_err(dev, "FDB probably stucked\n");
+		dev_err(dev, "FDB probably stuck\n");
 		return res;
 	}
 
-- 
2.51.0

