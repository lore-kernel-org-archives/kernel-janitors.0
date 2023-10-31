Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59758134B3
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6nCG4YF"
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB16111A
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:59:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-509109104e2so3794529e87.3
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698742778; x=1699347578; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNOnxQseUn+sdzcn++tRPmK5DAb/ytwQ21KP2ZD3yF8=;
        b=J6nCG4YFqgEFdX1t0NzbCF48/yxhDKHE3rp2/7yzhr40yH+l7JCa9OQFMwidONwCHc
         apjDRXhPwaB1imBLjzuRvuVZSj3rS0RDE2fNLLOU6NM1zY4M/4/uvtn3ohhJ5AxjxvIa
         FM8yfqNknfNjS0CV0Em5Z4ZwRAnQzu/+qtWY4pxuV0rWWiXD5oLQ1AY86TrSdH4jHIRy
         F0J1z+0nWURU4gcYgRj/XG06iubZOHM6wHAXCIuptqZHJDJXBrGlb6FDvxul7IJRpXDn
         Ph32JhVrXN896YkHGrGPl3ghD/+QCXcdPiep/8kALWMpB3ZmrIct91FaUrlrCli30jgh
         5LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742778; x=1699347578;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNOnxQseUn+sdzcn++tRPmK5DAb/ytwQ21KP2ZD3yF8=;
        b=N/9MCGZNX5IK7W5dEunxb4kQzahhXg+Gs9E5VmCL0d05m6U1BPjzigZTEwi4Ms/lAe
         cw6xMDAGVj3ERrS9Br7UvSMtzlc2xOFpjMuKq+OXp06RPVCef1sdTSVmXP7lN3iNvslp
         nIEssrkCzoN0A91i84T6yA6LqRbraBEqGZ6eBMGyHmIHHkcHTbNDCdvI3Dq6uw87LHtn
         75Qf2a+UHAgqxnAW2fQqq1O//zfS2tfItiTvhAbMoXWMEcdZw0kgk4rmBkozH2wylBnD
         iy3e/Cii1fm8LKYHCrWcHapVNgSeqp2Pu6kUoL1c9DmGbN/QvEAVS3ECGpvNO4zOkrJA
         7ZPg==
X-Gm-Message-State: AOJu0Yym5g1bTSJeg4muhq8CFFD92ddqhEmT60s9ZCGdTyerX2/COcHC
	cOB1pJOX4m4KmiRIyUWlrvypyw==
X-Google-Smtp-Source: AGHT+IEz7RBymWwGaxhsiouoy6qvMnV1G4Gz7ZzpjpSRrBR9AiCIjw9PoA1bkmrCkpDthe9/kykFuw==
X-Received: by 2002:a05:6512:ea8:b0:507:ac56:66a0 with SMTP id bi40-20020a0565120ea800b00507ac5666a0mr8295514lfb.56.1698742778001;
        Tue, 31 Oct 2023 01:59:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d684b000000b0032f9a0fe0absm103388wrw.96.2023.10.31.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:59:37 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:59:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vc04_services: remove unnecessary NULL check
Message-ID: <1dff4d9b-d067-4525-95e0-ffdc1185cccd@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We ensured that "service" as non-NULL in the previous if statement so
there is no need to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 39b857da2d42..a0117efa2991 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2040,8 +2040,7 @@ sync_func(void *v)
 			continue;
 		}
 
-		svc_fourcc = service ? service->base.fourcc
-				     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+		svc_fourcc = service->base.fourcc;
 
 		vchiq_log_trace(state->dev, VCHIQ_SYNC,
 				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
-- 
2.42.0

