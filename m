Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC422FC881
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815496; cv=none; b=afhMhl6NreXpP4Gjn9sehJhBEgfA/cRG3fbn7TFIe8mmoyzEA9He2JaCIFlpK1UZDhn1VqMuZBwUobqBSLpYpF5udCYhSy37lQxT7V91txHco9kCi/6n65NjVvE7sSo1UvWKTG2ghhhnozte3BhlhCjHaUTIxGxldJSHTApw3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815496; c=relaxed/simple;
	bh=iV9OOBcP8NNsmpN1fZ74F397+PanErPMHV3l66Lj7mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGaabRbUu52FKcy5Vem+Y8E7CKrxh2gjf8STnB1IepxE+SdlmVlOQ1bevzYSmnRq1ruYaAg1eF4XZ7VJpDtb80nhWIjiFz3NIPR9d64FnK7kaxzuKXYpu2HXZ/nm9amLPd+2dc/vQJ3lB18Z2jm5wralWoxOC/VsXebBJRiA6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WeojKAVH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WeojKAVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756815493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
	b=WeojKAVHIdm8NqwQKLrqs3jIsskkZkMiH/S67moFesmIN7aqU8m9ZyXcxbuI1KW67IJe4U
	L+yfR4NDKammGhgrUaYZTmqFi8BmQU6/7WiexzfOK/AoDzu/dcArr5XhZJXEX42EH8XGd5
	951sX5hpowPr9M1KJ4Cjw7qWU5fkljs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459--KtynqIZMP-iKSiHGZ3vIw-1; Tue, 02 Sep 2025 08:18:09 -0400
X-MC-Unique: -KtynqIZMP-iKSiHGZ3vIw-1
X-Mimecast-MFC-AGG-ID: -KtynqIZMP-iKSiHGZ3vIw_1756815489
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b9912a07dso3794885e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815489; x=1757420289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
        b=cAmUvqwQ0jW/XeI3hRIEzkfn1jxcyVuH0hlZ8ZEK7pr8LKoVhs/O3jjUw3px4c2iS/
         cke5pxnY73sFVyV+dRbldCAmeXK8NTqxy64kthMxPznM62KEtBMUR7J2h9ZHQJIdKgkd
         FoJcX+HE3xpnOhjrCVz+bTeOQHfmgWwjESIrkGvpQiWDGGSf95k2BPUMdekEpKl5n9tr
         KTTcK+SW7Gj14A1YCPefLKpLrFyFSUVNneBzwROzlnWZV5+W6LLzmT1nKlzwzW7bIGSN
         Mt8DDlN5aXlhHS+Di2FejNqUP9cuUMf8xuiig301tydRXwqUKfAgpEYupOtojJq0/bkn
         Cd6w==
X-Gm-Message-State: AOJu0YxiO5pF1L635EgoANTzNUZP5Mq8vOuDY9latmHn/YQLZRQ2wa1d
	JMKzq6Cz3QwfOrtH+ZpPCtddBB8umjnb23nr4zCv3mspGlHJt5ifL9dz9AX4VNl1RfBnxCroqoQ
	zW5k6ypVomt+aJMGmwohR5e86aDZ2AZ0mHKcGjEg+YpOOB72I5zkahyueyUiV5ICSYytxng==
X-Gm-Gg: ASbGncs23KJiXQcq++JHEoEb5gSTdL6D0dPmCJ5tPFOm6tHwrzhMJw53+7M+g9AieaX
	okwGcy8nyoZDv2lEMkwKVmG5d5EC9UT+knmb3gv1m+zgTxpDGVG+0wHDiF92bFiy/GMDnn8K9XE
	TEl3VrLThNYFOyibWkLLBhRlU0lh+BydntTMi8ReHpHLACSVPx/KXEq4dhJ3/vBLrKzUGhTepiw
	pYI2GLp6Y1h5YOL9sH22Hf+f0Ezb2EEf7ZwYrDpcsKWoOwO9NX+mWkAUp558PAyEKasapGfJ9yK
	By4EcC+Xm/Pmr824DkoPSTUZ+Uyq8qxOZ5hDK3RufG9a6YIdKm77Jrp/oYqpP0Xt4q6e7Q7CVdh
	s+2+SCjHoVms4
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31212075e9.23.1756815488665;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjWniM8t87MstmOKseixN3K4oxvQKmIMmSp/10Fw9hcxqnkqnioeD1dS7AiZVevFngzZ7ccg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31211795e9.23.1756815488249;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7fec07sm191441215e9.10.2025.09.02.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:18:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Date: Tue,  2 Sep 2025 14:17:54 +0200
Message-ID: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
controller driver") adds the config QCS_DISPCC_615, which selects the
non-existing config QCM_GCC_615. Probably, this is just a three-letter
abbreviation mix-up here, though. There is a config named QCS_GCC_615,
and the related config QCS_CAMCC_615 selects that config.

Fix the typo and use the intended config name in the select command.

Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c90..823125f48346 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -504,7 +504,7 @@ config QCM_DISPCC_2290
 
 config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
-	select QCM_GCC_615
+	select QCS_GCC_615
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
-- 
2.51.0

