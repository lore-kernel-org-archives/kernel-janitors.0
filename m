Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdIL75z8"
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D932D131;
	Thu,  7 Dec 2023 02:54:57 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso11317585e9.0;
        Thu, 07 Dec 2023 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701946496; x=1702551296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZPaAye3nkWneLsD62Nfqghe2VakCTzAP/KB7XhFCdQ=;
        b=GdIL75z8cyHNS94vQsPHb9q+os18lbl7ec7mxD5brRfAPlMTOewowrQMzcizyICmex
         hHLYhvQO3DhayACMuGA+AxiLsZhzwo3Hw2NvzFbaw5dYvDr7Gd+o98o3R+QxfFQai2Ey
         +45nmZa7D9fxkEGRCh00Y4pc79ZSjeh3v3E0Tp+Zu54ffEyoTbONGCqgF1rgfPXwPF7Z
         tqD8lVmmR9zdk2+0mYeo03J5W7A7SKH/AQamVCUoPe7S5T5Pflm3F/2r6DGxntQNIOk/
         RPCW+efNVOCrd8wujBEQVn3BxYKpfdWjnZ05S1j09j09412cSQS7zqOMb/L69lrFCQ1F
         Xuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946496; x=1702551296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZPaAye3nkWneLsD62Nfqghe2VakCTzAP/KB7XhFCdQ=;
        b=bbP9yb1mLfwswRTe6u/ViZhlTvxcTqgQf4rVOeCtMlF2oQ/pNf56CVMvyUk0WGUs+Q
         /Ji9gjgos5upSA992G/LkVsAGTavXMSQZeczMphWWyU49WBQSbbhmu41s0GvSEVNyOg0
         mKEkO5BvsUHdB8wDV17c+Q+7Q/6ox7irV8UeT/vwrKllfSPFeIgPp8+0bxGnX/8Mco6c
         ziOTPG4k4f/QPU11yGxLP5go0PnbHBsAcHsg9sjoECTNh+s4c0752KuhUBSyxScXowfy
         8ypF73XrVP7/+e6OzCkedT/mj622RXO6E/ZrUIcR8NgzKbuOkgGCzpu6o9RnzChXusZe
         pEfQ==
X-Gm-Message-State: AOJu0YzfR6WGMvTDF6GT3aja4/GM0feFIFt6g68It1FqBD3cDOAmW6pG
	HU58Lc0zrYZCugzi2WpQ1EM=
X-Google-Smtp-Source: AGHT+IEikmXKg4AE8MRP27nizvNW5SUNa0ZVvzQXagahn5GdC2FJ1hW+EiTdLdRtyapIAcw+LWO1lg==
X-Received: by 2002:a05:600c:54f1:b0:40b:5e59:ccd4 with SMTP id jb17-20020a05600c54f100b0040b5e59ccd4mr1457662wmb.181.1701946496021;
        Thu, 07 Dec 2023 02:54:56 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id e11-20020a05600c4e4b00b0040b48690c49sm1514762wmq.6.2023.12.07.02.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:54:55 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui.Pan@amd.com,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Charlene Liu <charlene.liu@amd.com>,
	Sung Joon Kim <sungkim@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "SMC_MSG_AllowZstatesEntr" -> "SMC_MSG_AllowZstatesEntry"
Date: Thu,  7 Dec 2023 10:54:54 +0000
Message-Id: <20231207105454.3138964-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a smu_print message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
index d6db9d7fced2..6d4a1ffab5ed 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
@@ -361,26 +361,26 @@ void dcn35_smu_set_zstate_support(struct clk_mgr_internal *clk_mgr, enum dcn_zst
 	case DCN_ZSTATE_SUPPORT_ALLOW:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10) | (1 << 9) | (1 << 8);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_DISALLOW:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = 0;
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg_id = DISALLOW, param = %d\n",  __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg_id = DISALLOW, param = %d\n",  __func__, param);
 		break;
 
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW_Z10_ONLY, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW_Z10_ONLY, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_Z10_ONLY:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10) | (1 << 8);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW_Z8_Z10_ONLY, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW_Z8_Z10_ONLY, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_ONLY:
-- 
2.39.2

