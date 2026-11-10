Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347790;
	b=gQFFGAQ3UKcQMrew2D1l/fShdfZDhXIY1DEC1+bHiM8nwIjxVbn0Ng8HF04XJ0GXSs+r
	 m14YoZo+hAqCSvurpBYr7yjbEX4Lt5UEnjRq9IKd7ktVHBhQMgX5cSnU5BjOVx5DLnxCQ
	 n55mD1O9VxDEIFC9f7vsE7W1xCZzvKAKHPXLoNPJVpjU2eJ2jT101nclJACyNAqOk2pkh
	 4eA4TV1VMWccGCHR8mZsPo2z5NofiGVmC7dkOHIHc1SEN5R0Ph1Vb4xRd9vJo7RuwDLqP
	 s4vLGSF3FfeLBVsu0cE61+j98S2fCk/Dk2cA71K25iAayiBwJnRq+yh/IagOZnB2jCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
	b=vpH8VaKQcHBUVTfxtvoGTCLyxt6T2SglPHU2HiLvshnsOlfva+I47yubARAuY8IpgDAM
	 ddVcaT3i/N1MC52R+s7izx3mrY3mlmkx5TO1OdkBAq7NPOKG2jMfVd6VmKwNchOAfeewa
	 YQyOof6a26NOW9nGpj1nDXKY3D84pPUPxMecJ/ZMIKmDP0o4FrWaI9CqfHRj7IqsKLoE9
	 a/Wq2d6uRIcWdQljbjLaS+lTRafM7GMd8ulAC4uY5/5Ybpye47SE5SxaHhbHxqrOQeB3R
	 qzLGulx4pxxk0MJNZL7C5T/dK/MxppyBYDjc+f4+2cjbEDgmhlTYiejVQMuB66O4jxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EED606C992
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EED606C992
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1726259f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347788; x=1794952588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=Lo3MmjzD66xIMCjGFcAGJ5+d8S2RjC3BmJp5rNdyYHSxnlCbGgcHfa2ALiNjxfGiei
         oR0U/eXV+jZXK+8lACQiknvMzXQALqXZoO5VITTOZGQ2ZU/7DxgqPwwGRcr4xGv6IwDc
         ah6dloCteuJhuC3cH4aevOtGmenjGl4Q3FGaWpVJ/8WB+iisQ7CS8mS9LBPpyYyyvEd6
         Ohdt7sbBS55p13esU5pAm1KaF57n9PLDMvNc53iKX1c78XslXnLg0c+x+NdtZj8zcv9z
         BlyPRF+CDmhlp5xE/4wuhWCt9F02kasBmhajDC4z7bifupMcWClnRbkUDqNzSEKoWk/D
         gxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347788; x=1794952588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=wPQIow+xHhL8N7wWvkZ9GFaTJYCXASWxnTCWTTi5LFWc+lrVjLnOyy3PpnR4aDo0jY
         7g5XlYJr0il/KqPcT0WrjjSgC2TW25ux17prtrZh355OmMn6tHok4HPXrO1N47H7EX33
         9RqJHxzgni6qaZHDoWeXLmDWPhEjQvoWRcnI/4Cw14YNGNTNW9SYL62G+Pqk2upKyoaj
         CgWv/CjGUntLBEZ2dVQixCaGysM81tFa7zuKKZjclMcLEf8LjjiGzNi+t3fcDi89GRyy
         Z/NjoU8lz+alv2I7tG6xwhJGCmQ+tV7eFG3GASl7aRLwMogt8M4qADEjhN+VvRIEPYAI
         ielA==
X-Gm-Message-State: APuU4Z+/11uMJ7COkjfWuhL+UGJU1pkl1hg0sZVG4tVMQTbHcObAe7OM
	1TobDtGNXzi6FoyQmQBGP5aeEJVBrgX19a+lIla5NQJRYakNPC5sgBLkaw115/bo8zY=
X-Gm-Gg: AYBFou1fSkFYx8OQaCn3lFGf6UQy8ZC1Kn0tx7y4ifbpHlnN+6nwaOjTI1O4qBFVvk8
	40fnBvYcWs+91eVcGhHrZC5+16qTIKWGrd9X3OixZTXW0q+no23Ohu4I0/NMRgro0jUT3TH0J+G
	NaVRQefB+Wn2klVKSBxcJun9k16zgVRkVdIO7kjePs8c6vgL7bxs6NMse3i/vTHPBGntnCZmhAy
	4spS19qGj5vKUySBFlcPe1My0U5tQnRYS8S1udgjZoWlAiU5972v2G36TZpoxLp5AOk5WsiOhZw
	7aHoYaEmg6AZnPhM46Rrd5117pLFGQtZmkx6k/CImusmlFJIdhAFxY6ba9N6z3QwyCehL7a7PIo
	0TfI/SLZy2sA/17POcEF8FetUQLDnxtlpnsjQtzKYWC/UV0Z1Sysi4y0AuEmSqvFf3vQ2MV+oUa
	pHr+JPBBHwLajiEZJW73aTTjhrVocaydp/AjPwvhDoMeusl1JYa/sU8Sgqf8COmAtNDndh1Lm2J
	6fL5ygjFiODHuhFYnWFHc6U6sSPKPwTvO1LuM/BNJSox9yXZAvGvFnZBe6tdKBC3afiU4sg56oP
	YvyR444V9YwXsji3WGItG4B3iwnS/ax3rnCGpZ2AXjrxPfXB
X-Received: by 2002:a5d:584d:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-499c7a25644mr419632f8f.25.1794347788659;
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c4e07sm6762009f8f.49.2026.11.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mac80211_hwsim: remove extra trailing semicolon from a statements
Date: Tue, 10 Nov 2026 21:56:27 +0000
Message-ID: <20261110215627.947448-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a statement that is terminated with ;; - fix this by removing
the extra redundant semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim_nan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
index 6f90856099e8..21330850754d 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
@@ -278,7 +278,7 @@ void mac80211_hwsim_nan_rx(struct ieee80211_hw *hw,
 
 	/* And deal with the lack of mac time stamp */
 	if ((rx_status.flag & RX_FLAG_MACTIME) != RX_FLAG_MACTIME_START) {
-		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);
 
 		/* In that case there should be no timestamp */
 		WARN_ON_ONCE(rx_status.flag & RX_FLAG_MACTIME);
-- 
2.55.0

