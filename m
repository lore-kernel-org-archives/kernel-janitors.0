Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A71CFA4
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evIsb3SO"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B703879;
	Sat, 11 Nov 2023 12:02:24 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-408425c7c10so24711875e9.0;
        Sat, 11 Nov 2023 12:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699732943; x=1700337743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux3JnOkDtQtFFiSSmtfisW2bjV3FX8kEYn9loFMjrbU=;
        b=evIsb3SOPNNfm2CY3xoie9ZNujeWxvMtmbs/bYK6xAwFvd2naAKCv6w8f3p423iJcE
         eeFcfZ4Lacvc+oEyCTFHxDczoqMSa6Zk4ikykuOg6XsDQyjIlpRZGVPvweR/Lvy8bykL
         UTLGIQLmrdgSS28HRZGby4pq2hhhYdfHwuz9iBP/BV6kFIlGULlUctvrMywvXAuxL1jq
         LBL8TkVzqHz+73TS3JYkvjCcybLN+ynRI/UeXAQTx+riE6rLwOqEK0CKwuwpOoj0VDE0
         oDa+4SKEnKUT9lnQa1LHgnPzOT6kZRKPKqUHe4rK+7oTMTqh111oVxwIYOaYkikNBpYg
         MqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699732943; x=1700337743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux3JnOkDtQtFFiSSmtfisW2bjV3FX8kEYn9loFMjrbU=;
        b=q4wr59PZ1ZkWBnfhFI0l9uOZ3n6E6y2ZmuPax1OAAvhz/xv7bsnSmBfCUQmAroCEZD
         BrE4qg/9BD3QLxClHm8fHb0TpoFf0lMIjxyhjv3PX7db7B8wR3ENmioIEUc2VMJN1fB8
         oiwW4zrM7ebrjwAjUYFxqJDYWROwT80uZaAwtonTqwaopzGtKRrQ2CB4DUevt3aIP1wm
         srLhCp0Rfdy9TfWy0ZE7WksohGHz3S53NhuG43eMvBN3kjGl7V+eom0zYl5Oyse0uErb
         2Md6UxMCSNvPn6O2J8Nn6hJgjpJw8M69ON5t467QonfrEw5TuV2r9WiKJkxwzL2GVkOm
         jJEQ==
X-Gm-Message-State: AOJu0YwL9qGnGxz29dn4Qfg/KGL7cDQOLSaX5T25AeD5If43PtH05shI
	thWCwP/xfyWlBaoMrJqxGs8gmR2yihw=
X-Google-Smtp-Source: AGHT+IGtegBIMkINKygpu/FywbEpt/rU4mDYId2ckUhjyq7MIoNRe3aAfbMCExoD7jPrCWGbz7pEqA==
X-Received: by 2002:a05:600c:3543:b0:401:b204:3b97 with SMTP id i3-20020a05600c354300b00401b2043b97mr2234114wmq.4.1699732943216;
        Sat, 11 Nov 2023 12:02:23 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b00407b93d8085sm8652755wmp.27.2023.11.11.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:02:22 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: fsl: dpio: remove redundant assignment to pointer p
Date: Sat, 11 Nov 2023 20:02:21 +0000
Message-Id: <20231111200221.338612-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer p is being assigned a value that is never read, the assignment
is redundant and can be removed. Cleans up clang scan build warning:

drivers/soc/fsl/dpio/qbman-portal.c:662:3: warning: Value stored to 'p'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 0a3fb6c115f4..c2fa5c981edc 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -659,7 +659,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 
 	if (!s->eqcr.available) {
 		eqcr_ci = s->eqcr.ci;
-		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
 		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
 		s->eqcr.ci &= full_mask;
 
-- 
2.39.2

