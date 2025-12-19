Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063CA4C92
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180077; cv=none; b=eSbAhljsNVYeLwi04IfYKPJZgAwpnvBy3o4bkezxwANDloFSIVxgQJrHywRDS+2DBdc4pmlfUxrfUJxVbEa/l1rmiTMDVIQi6i8CHcYlzTYIpayOsJ3vwuPir8MrV3dBrpHDOyKLfRnmmbvgmkNc9kWcSVW0tDiIc5uBoTYy8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180077; c=relaxed/simple;
	bh=8FbHIXHWfLuxgf3xtxTNzDgOnCSoEu0+aZpZJeQ9mWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I7nqT0P8jrwV1tOJN56PY4PBsvN3sihLKfMl+5QIUqmfD0UVzNzy1Ck1eh/ZbL789EQLK6u7E0rYOuwys25kJj0gIa7yndLopjY6RwR4Ri4eIR1cBemkx35hNyNN2PY6ugAcn6cunif9qRFNWX8HXOah6YjLGvbFmSIr1swjWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exx4xAj+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exx4xAj+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47774d3536dso18499845e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180074; x=1766784874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZLj05sYwE0LA7Tdl5LEJ2p4mWbQLxeYVPVLaNXSCeg=;
        b=exx4xAj+4LABQ8uJfDlhJh9oZ43aFxdbM44Hs3pVLoSNwCsmujKj3ZasvHcBodTyYY
         cay0HcxOc338owC1xZCzztDg7g57toE4JnbPbSyx9GPoVvIZ3pLAe3B/nNzDUTquzYOt
         JdPZaFFYjCnuPUxAm4sGAGrbxkSMGy+4McTajS51T3qHK1Y0gnocvn8Ky156Ib23lzWw
         IEsPc57Owt/w0yQWKv2bA812F3A0PdLiWs+JeWB/7sSa5hejKONwQWqJpv9aBNSbNc8i
         PTwE1q7ZTvQZNRtk3O+3Wcpyh8wt4VLkdj76mUS6xloC6SQomwCXyXdPbIWIZKv8ROHW
         3Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180074; x=1766784874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZLj05sYwE0LA7Tdl5LEJ2p4mWbQLxeYVPVLaNXSCeg=;
        b=BEQgUUyBucCN9kaXiaI5Y6ML7wb+EkHS2Aqf5pfauf0UyYmHoZKKlJjwH7jU6GU9+p
         77n8LXw7SFgYE3f1KKysM7ZjCAVG05A/JKzStuiTdxoslNiuuWHVl6anWk+rvvbkkTEd
         D8XEayO5phk7gO3vE6iEHALVmG+h4ZMf6uzHLMAPPv8GVM7cfguWEedbqDt03UgA86mK
         oTq2f4gtj6W3RBUZfrLvhyC2Ro/HHw++IjPCOvf14XAql+Qm8U69RdY4QEywLWNHdmYH
         1s1lj/67k521eV/pgWyTnuCwUBj5K8XtAvSUSBho8RcS2VxAyx8KY+dYyyxQdUAiPjyo
         zwMg==
X-Gm-Message-State: AOJu0YydDYUGBMHGGb+fRdVOwgeG9mM4fZeT3ajp894So50EKXAzEE6h
	+T0Rje0w2AaDMqM1WveCYE1SAImQGFwqhm5ll2Vr16DAAcRNko6XosMs
X-Gm-Gg: AY/fxX5KMxSnUu6fvZ9vRBoDzW+AwFO94N0K7P6vt8CR4us+EGOUjyXqUKKa6w0tUh2
	fDJ4/o0M8MwwK22ESRi4UXaLT3PosG0z0fNHrQrP2H0OtPw5ejbGSgMxbWRjBPTBEE98j8hXNdV
	nlQOUq8GRMq8BqsW7+MBHhnaYHK10RqbNAZoRk8StnZvFBKMKiG3rYbRHWSuUzNjmbp6Mq3Zkt3
	3HtZFlMz9qpFvGREJFTYpqouWAgih6BQ2kiO9iBGy40SyvtnwmWTX+cL4iw7vlwBYAiAndxHo9l
	aj+VdpBPTi/FA5fASspPvRjY3shLc2vyNNt8jkrA6cVAOsxOQG/rDfuFvXQrjco2hwp7T1FHEo2
	WS5gvDQEAvaLpb1LlHGYUPz58+UNV0rYsuAZO2W1bQbXPCCD/2YDS9eFk+9cIITxMzeqtpMiLSB
	78TthU7nniWgO01Hqgcesv
X-Google-Smtp-Source: AGHT+IFMgP/enUl1la1BBSXs4ST33XxJjubSW4ZkC2dvmsZAfgmmEbWX+svxAlb0q4PiUvjqAs9RIw==
X-Received: by 2002:a05:600c:1c85:b0:479:255f:8805 with SMTP id 5b1f17b1804b1-47d18b8307amr51508005e9.4.1766180074216;
        Fri, 19 Dec 2025 13:34:34 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723b2bsm112596665e9.3.2025.12.19.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:34:33 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: microchip: make read-only array ts_reg static const
Date: Fri, 19 Dec 2025 21:33:34 +0000
Message-ID: <20251219213334.492228-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array ts_reg on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/dsa/microchip/ksz_ptp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
index 997e4a76d0a6..839b0202076d 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -1088,8 +1088,11 @@ static void ksz_ptp_msg_irq_free(struct ksz_port *port, u8 n)
 
 static int ksz_ptp_msg_irq_setup(struct ksz_port *port, u8 n)
 {
-	u16 ts_reg[] = {REG_PTP_PORT_PDRESP_TS, REG_PTP_PORT_XDELAY_TS,
-			REG_PTP_PORT_SYNC_TS};
+	static const u16 ts_reg[] = {
+		REG_PTP_PORT_PDRESP_TS,
+		REG_PTP_PORT_XDELAY_TS,
+		REG_PTP_PORT_SYNC_TS
+	};
 	static const char * const name[] = {"pdresp-msg", "xdreq-msg",
 					    "sync-msg"};
 	const struct ksz_dev_ops *ops = port->ksz_dev->dev_ops;
-- 
2.51.0

