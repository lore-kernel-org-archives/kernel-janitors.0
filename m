Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD73093B2
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Feb 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109270; cv=none; b=GFpVLucOHpqeKPPGyXuXTywZZb0dUpIa+0jBKfBnLa/qX8lIhMWMxbGs08Z01uslpibAio52CNdTq9NrI45mHDCRX34dOYT+4VaXoN88FOXhhUAmqN4dL6hye0ZzXCItQYfDZOqUoA3wdDVFV2xpSYbsgO28jhxF+R3dPUtZon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109270; c=relaxed/simple;
	bh=HQZAdepWAAG05MGOKGf2DOLqH7+vCZeV4b/mfyGkkQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RygRojnXAnCMn7KKdVONDeVAJ1Qwnwc8jJwGptWJ6xy/1CQVjDi7QAcY8JrVCPBm+ueDUi3mDizBmp1x3MKTXj/7BFPTjRQgyjJP8xr7PfFNG8kPmJEQx50F1qou4TgFcJcu1TYvcS4najUzmziX/LQL9nHoM6ZcvYRXDDIMklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyMhnG5k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVgsiqeQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyMhnG5k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVgsiqeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770109268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
	b=iyMhnG5kDl9170z8UoNGClRZ4uajri1iHS05W2P05U+XdE3JdiuacmM4nB099kRK/MDKVZ
	s2kDBOqMbDjLAqnC44C8TRRORoA/TcT3hogwA5YOPp15YVjn0TWKut3Kn33VVvpfYl3LcV
	qFc7yWn4SD4TVbjFNQOJCNGsElk30kk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-XLahWdLpPsOvmpgQdAF6qQ-1; Tue, 03 Feb 2026 04:01:06 -0500
X-MC-Unique: XLahWdLpPsOvmpgQdAF6qQ-1
X-Mimecast-MFC-AGG-ID: XLahWdLpPsOvmpgQdAF6qQ_1770109266
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4359e322f30so3904006f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Feb 2026 01:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770109265; x=1770714065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=UVgsiqeQLXUtbq/xlyg6Jkhi8eBsrMPB52HRom8wnDd9f+i83JNctmOu+YuwEL3W4N
         nVl/USyprhlDE9LUkgztcF7RhSpNyPF3UVrje7hulFceW0OsJl4idJmBQjeVDVJ3rI9J
         ONkoqmbAHCOkvQWWu/ZNSsnqnHTibkpar3LfbV66Yi/yU0iZVePqWgMSGwRSBLs9bew2
         HdpaWQ0jGulQN/GcXnExxcTxQIYjSfbghb/sv4W3+uO4Uyxg+ZnyjZ7ttAhLG8iMsge5
         SRwJVgq/8/lbyDl1xP8GHSyIE9KQc75BJYrIwYMet5tmp9J1XPqJVW4/3U7i3DSbYExy
         5eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109265; x=1770714065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=eJ4vd6TaNflw0ZcbjRmGDgeA/UXIqSH/+Y1GwP3IdYtWfkmOq6mfcUYGpBKrcYJsAU
         nB6K5vNnm5J2AhteF8AvpZMzMLU1HLQP/M6xbnYQceosmWcq+EdrAus9Ko6easlG4+Uw
         wavXPR9S8rMxS1+56FounNIOQwrrolWCRFzUKTu8y6bAXWR7pwGKUbk4Wco2ckA2mFDz
         nwyK/sky+BNfFbJbe11381sLcsEjTxKfVbKHmJHkhakJnhrYUyooNMojT70m0y3xU1wR
         scRkTV5GAC8O0jVb9Ixmr/kpZo6YrVT0FrcKId/DAGHVUS2J820lGqSK3nk78KdYbXwP
         GwTg==
X-Forwarded-Encrypted: i=1; AJvYcCWq5O9O9ajf601gkJeA3GEvi1aATq/mt19x1bLFtUHQUkn8v3YGF5iPqrNkGBUD+bTc531xngv4Ft7R+kRTD3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKm31rikLJhSBSxWeRwbqVB2Z2BdBsgte4qFt/jdN3rmBi+pz
	dddTWtwgg1rUA2ySm74elNFMv8QsUcPPARZi7eHYbZ/f/IUTjOfbXRUh+l1xO1XXxU/kRgLf7HX
	DmMpO7VwVsQHpjE8LYlS1GDSCfPhrScnE/WkKOrFaI37vzaE9hp75MFTJ5mzpmZXS1lhmRA==
X-Gm-Gg: AZuq6aJKmZq5sgqyd7Brxt490r7KVZpRaGa182PIbUj71J1+nWIcnvxyES1yV+3miaI
	7FNwMuC1PghGe/bcdcOB/l/W/zmOaiarjsH3N242ZPGE6RESPbW9ArWWzHYUj2Z2TbCFNKC4Tdu
	+w8bDWrTu3/D0iAAIXJ6uxPAjtICgfOTKXtsTOSxIVfDlKtD3SV9H1z9SxCvA2tOmt2owgrLO82
	Bb71QJJAt5QrioFZov31AJEJDssbYpJJ/cKOm38K9mAWYDOD2MwOxTtsrW/QXQKOO38L9f2W5fi
	W9DTJFYGzKWaGwjmAYw7B3f7SlegM6dIa6NlqdRxmssd/A8o0x+MECBVqG9fhk+QcghfEiXPgmA
	e6RenQ44RmgzDvsURJ8qGczXX/ntZd8T6IkUXEw1or3BUjWp4g0I/hfFnQJc=
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202564105e9.17.1770109264455;
        Tue, 03 Feb 2026 01:01:04 -0800 (PST)
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202563795e9.17.1770109263990;
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132368csm46856093f8f.31.2026.02.03.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Brian Masney <bmasney@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: microchip: fix typo in reference to a config option
Date: Tue,  3 Feb 2026 10:01:01 +0100
Message-ID: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
with COMPILE_TEST") introduces a typo when referring to a config option in
an ifdef directive.

Fix this typo.

Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 509cdc060c34..b764ca059e68 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -74,7 +74,7 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
-#ifdef CONFIG_MATCH_PIC32
+#ifdef CONFIG_MACH_PIC32
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
-- 
2.52.0

