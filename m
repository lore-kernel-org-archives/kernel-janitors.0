Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BE2345750
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732045; cv=none; b=k3B4q1dui2b3shIffZdK9nBJGOxL+hbGywgq2Wymt/hlQYFi3pdJOCNkFTJNQ6fN1vTXIP+2lYXUuJBO4ZfynrjzVNRipVACLM+9kY6r9NyvpURzYT3uYVlhO8M43wPOBgUsxWiDwicShZ2cs1192W8wDcFNovzeVYo9jdLiaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732045; c=relaxed/simple;
	bh=JMf6sVa3t3YH8xrM6IoLfzeeJttXQP+a6Aj8dqHL+UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prqoJbrFq+G0S2qd1OCA6gJCjyrWmaAjORkrhWaLP7TIy4chdiLGyUewzCkRFZXZUm8EvI4krOX6Q76x61NilVzxVxiiBIfu8QjpsVYx/xWWYkS85crCmGqEVxozcRdmFLHdgkaM349LR0Ujf8XPvKDjJYci6BLmZJI5StXVXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA92UoJx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA92UoJx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so22412365e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732042; x=1764336842; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gd+NXDJH1k/AiseFURMWhfY43fUAfOIrx0pDiZrMqs=;
        b=lA92UoJxh1TB30eYOgFlPCNHe6ELXU3oUn1zq9GJABckAhL5/xdopkAj0qAen0Qn8F
         CmL4Ob91FwH0x55cITKukQSY3jR93agNrDWGGntsLH5FygkCyMv0joZGB1zXLRgNH8+8
         iO40Im71TD3DhGEfkRBFCtslN0B0SULkEogfINV/xvVJ+d04ByVaq9qYrfkn+sEI1TdH
         30gKgMDAxa1hjybH4gL/8TySHATWqPZ6aMQ11NiFATf8jEAYgMz5HQzTAlRd5+8M0/SS
         kqUPGSlkg+TIWkHJ/YKVOQs43Xb7zXA9ppf328kirLhIxfbm9MdYDMDVsi5Y4JPFiiyw
         Z0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732042; x=1764336842;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gd+NXDJH1k/AiseFURMWhfY43fUAfOIrx0pDiZrMqs=;
        b=CE5RFQCB+kxTSD+v/7FXEpFOZP72Uog9kj7yLIh+EMm50VCNbPDh//syhuK2QCr6nE
         VKVa1JwM/qVNLJQSLxkIv0yYkS/sNF+tMAdICF8KsfjqEs+uL2Vbu5gCU/jNqdIwKcei
         NTMDtHHHy5TA2OtPYGyuFzZHHZZbeNyvd2uI3L5U7kZJaoKdvxlKrzJptLNGWt1wgl3z
         5jN5V7vfhPRbd/mkIHvfgO52XO9OZIN5NsUlggM50oNkmW6nsTysj/MtI9SoXCx3MPic
         c7EnWYxfzhmEy1JnrrYjMSpnWwyuucoxmzsjjlNBmrC5FBxh5xxv3ZLPTUkP4PhmUcEq
         xurg==
X-Forwarded-Encrypted: i=1; AJvYcCXp7lBPifD61llSpt24TIbolfSUJX9L76T7orp2c4FbUsxEGGJWo2jwKXmotybpGMALTXL6D64VYoLqzKO5UMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/w1dctIcgOk5vPqhlKWMtm4VUKeX2uFSd0YT5SGZojX530qw
	WdXeS3v74xZLlATZ4ajY0JlMEGSVvdw02OA/a+PO9XmFlkq5/62pOEoIJN1FNClGVnw=
X-Gm-Gg: ASbGncv6kAyNQH4iohz98ekeYTPBVWqAVPmxmwx7sFNq/LL5pZnojdfzplT+j5/HOrn
	FN6fZuZrBhCvnc5cujbgjB6gUUEDB876B1m7nHDmbI7C50gbxWND64Z6vS/RDAYOApwNWVqt1+E
	6NNFsRaO7+jtNaH+ywVCSqwdFPo34KzN1IvOaCz/5nkeF/LZldzHKMwfkDSb6OF/dhynjThJ5y+
	aqZNO0e9hG0yOHCiw2obf2ccAlpsxdubhGreTNK78YRGSw0kQGarKFQ5V+lGXu2euxQyxjUJxUf
	W3qw+LfczknfYf5oYGPFM6aaaVzCZGc9OzcZXlc0Guok7HKSSLXl9Kr0ACH5QYMCTvTPjnX0yl9
	7I6R+rMWjTYnwsGJ+J8I/I1trrtyzFSIWKAT5zBtEBIDuKdwH7ObhtIoNyZEyQ20vuNbrVL9BdM
	a+co0agHTk8+oc84mT
X-Google-Smtp-Source: AGHT+IFz/AtAUGVrEx4UQpBBcJKuyq0FlCCQOjhjBHhOkLK1YZ+ecaVnE56K+BtIy27pAWFHs7Z3oQ==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr22166915e9.14.1763732041527;
        Fri, 21 Nov 2025 05:34:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa3a81sm11420352f8f.26.2025.11.21.05.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:00 -0800 (PST)
Date: Fri, 21 Nov 2025 16:33:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: asus-armoury: Fix error code in
 mini_led_mode_current_value_store()
Message-ID: <aSBqRHs256Tz7EKr@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two return statements in a row here.  The first one is wrong
so delete that one.  This changes the return value to -ENODEV.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to asus-armoury module")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/asus-armoury.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 9f67218ecd14..a2cfaaa71f25 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -463,7 +463,7 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
 	}
 
 	if (mode >= mini_led_mode_map_size) {
-		return pr_warn("mini-LED mode unrecognized device: %u\n", mode);
+		pr_warn("mini-LED mode unrecognized device: %u\n", mode);
 		return -ENODEV;
 	}
 
-- 
2.51.0

