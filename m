Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347617;
	b=BgLVQ2mMF7PfgjmfTZhcXTD1lk/JdWbjjmoKFbNKJp0psYDK4XigdNgPRtwWbJ8ISw10
	 djrmxIO6ZsaB4+9eDMQMQ/JQTvAIOpJ8PhscA+mypNPObcyVgJ7oqoZt7vvTyQsdMPlal
	 BQD3V1LoyoH95HIoaEZBpk6ceq65ZNtg72a+YWOW/vo5MhKnZLACDTtR+Xs2tmRGo4wVJ
	 QpPmk1arYU5VD6MFD4J9QgUDIpUkRbFtitSR1efbJxmrOkh8FtP789hI9pS+Eiw17G4Qw
	 hO+bRVZZJ76T4u8MRYkpvBw1bSkarBgzh6oORncOs0lofAzo2PNDKeFTAXrpdeYtyBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
	b=tf95dBhzuqIqEcyFRtN2DCS2/hjBWNFo/QPfy+JOVwzn7lGz0/BvZJypYFI63gqai9Z5
	 1slamX0skBNNr7dcBztXNZ4/LQX08WhfkLakcPuZS2Swez7uII6Nv0pALSqYLKeAbQKiC
	 0xWhiRzRioXkv/U78rdx+tFjyoZo4YJlOo4FbsoBPyg0N1nRiqgzpofI8LZ11eETPDZIE
	 I/krJT4nFHdMuos0VW2fh8GXwxnRqlLTWa0OMfw1MJQ4cdwJYfJbaWbMBVxFAH9DHNPA3
	 jR0tuIZgp8jkR+cVmmUwYc0AsAQn3r4mgKs4P7eTAhWqXvsHQQNOdT5MUKRA/JJj6Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXPodMFS;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51949606A31C
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 21:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51949606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXPodMFS
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1505000f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347616; x=1794952416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
        b=TXPodMFS1i3D2h31qhMaL3XEYHgEBuGxyPiKfk17tn17nlGx8ewWK4778G8yj9Sb77
         eKJR8g8lGRr5MQAmsTiLybJ6cAwbEbo+VoKneZkM3AtdHKRSximP55BgjCgD2eg93ANi
         dteUo79xHb6YxA5GX7bH91vhxkwsAcd/CGmUHgCnE2sjM0GjQ07nhxhDv2Mmd+eBj7NA
         JAiPFtEDGMZKyEU3Rtle6APQ5C0P58Pw2oiCdVVpmU6Wlxrvekv0d1zPGkuUa4ykZ4Kl
         h5qPuR9zxREIZwltK2Vdpy6t6tk5WkEczxfST3/1w4+NgD1Z8kfvckEsAQyT2gVHo6xf
         gMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347616; x=1794952416;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqrPq6DInPU+YVwPB2qO7zdIo9ZkitMttG/r01QX26E=;
        b=ZPo10REKiriWSAloT7v92wzvQEUtzZY5msO0UNQotf+y/8hfM1XKzOu/3SPRWh/by7
         mD9ZPMztcGTiR7shQ90IpacPPslHRiuzrO//ZRLs82CFpH1cJHP/OWUD+jtFtnoR9200
         /pUHHKpCJ1f7iovasvRt//BazFnRJhmCkc6gHy5i8W4WNlc92mq1OgNUi5iVaRtLiK5r
         Us9cepP9HkXHrn/YJ9jh+dgVJOyScAT14D0GkqhaFkuDKMm7tOnAgHo9tSM/fN5Vpkls
         W/TeZQ8DA80xhYkVTRnramLiy2jjvajyfocd7NDdIuyWAK5dwY5F7ItcwY/pFO2oAtaN
         yjCw==
X-Gm-Message-State: APuU4Z+O/pswvnFCcngX+KKjQMeR5UWpwvpt5eMyYD1N/+McGyRWPeT6
	NdjfEY6YniqcLPgT5pf0AdQBMkYbOKGU5XMWo2oeAFfCOb7Z65Rh9ZdY
X-Gm-Gg: AYBFou3qc1RaPhGFIZA27oro3LUn1BHgnY4uuHbDks4k8lSASEv9xBf/fYvFi/nN4PT
	leZ8xhZtEX7ZWMONwi/wBnFdmeoFXieCeDKjho4p/GShRvfrHPD1FFhvWmbtYRq1O1dmvGV3kr1
	m6R+ewMdg9lbnjvXwdNq7uwKXDPEQE8t1MpTGjUg3d5yhDTX6Lv8MCtAhJKTXf/jRbMC0JHyUaD
	dsfU424OtmJOuFUjX4aU8joii6cgxtfXmtq99vkgMAX516djn+pASj1fNGK3w0AonpD2G+Bd6Ci
	2LjfTp4LSL+3qzmwCKUOWr6ZcpPs1XmIsG4JAEVPxGUZeN3iGrMzQnGwh6UWugpsFNjHZnHqxdt
	OCEFFX0JbNu7BGiB24lPrBLme6H0+79pil2SRF3jr1v4sgSGK2EIR2oTXfGsWVQG+5VKK1k1b/U
	zH4Zr5O8qNOt0zpApkhlrOfm1ZJQhJiUs+G8OWpx48WoIevJYrMoqT/s0lbWxNtfakcDA9DSo1Y
	VBUN3w9qdFv0WXslBM3DWSl5kmZGb5MZOkV0C20Uieu8HaIJYQetR1ZcbDiVmpwkSQmuW/J0xEG
	bGDPsVscJANGu0XsRQ6ILERgKog=
X-Received: by 2002:a05:6000:2411:b0:48e:3647:c35d with SMTP id ffacd0b85a97d-499c7a24acfmr395628f8f.21.1794347615587;
        Tue, 10 Nov 2026 13:53:35 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4984e26f8e3sm6377221f8f.1.2026.11.10.13.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:53:35 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dillon Varone <Dillon.Varone@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove extra trailing semicolon from a couple of statements
Date: Tue, 10 Nov 2026 21:53:34 +0000
Message-ID: <20261110215334.947250-1-colin.i.king@gmail.com>
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

There are a couple of statements that are terminated with ;; - fix this
by removing the extra redundant semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
index 71d14fb8c830..5dd22003f165 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
@@ -328,7 +328,7 @@ void dcn6_ms_calculate_writeback_bandwidth(
 		}
 	}
 
-	DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cfg->num_planes, DML2_MAX_WRITEBACK);;
+	DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cfg->num_planes, DML2_MAX_WRITEBACK);
 	DML_LOG_FUNC_EXIT();
 }
 
@@ -4255,7 +4255,7 @@ enum dml2_status dml2_core_dcn6_funcs_validate_solution(struct dml2_core_instanc
 	enum dml2_status status = DML2_STATUS_OK;
 	struct dml2_core_calculate_ms_context *calc_ms_ctx = &core->scratch.mode_support_locals.calc_ms_ctx;
 	struct dml2_calculate_mcache_allocation_in_out *calc_mcache_allocation_params =
-			&core->scratch.mode_support_locals.calc_mcache_allocation_params;;
+			&core->scratch.mode_support_locals.calc_mcache_allocation_params;
 	struct dml2_core_internal_display_mode_lib *mode_lib = &core->clean_me_up.mode_lib;
 	unsigned int i;
 
-- 
2.55.0

