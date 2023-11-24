Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3Hb1HfB"
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4605B19B5;
	Fri, 24 Nov 2023 08:39:20 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b2afd049aso14504095e9.0;
        Fri, 24 Nov 2023 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700843959; x=1701448759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHTMENAVi47XR6rxLgnHilsaqtzEhcUlvrvQs0OyJoU=;
        b=N3Hb1HfBON2AGtnyEtP5G7PDn75WxAtzjeaXILVXfqsM6wS1Ul1yiSiulH7qKrKnLq
         IskjTvPYYtjRUIBS3FqDk/KCTvevq/Cz5yFuiAgikRj+f6Aw47mcHWgDqdPEx4vneff8
         rk3U3LfDGBAphr315s2nfg+nV1inLb8tAjGbR/S2aBgnszclj1e6X/vfmsY2dQbN0Pzw
         pTyPv5S1LrmDRmVsxKRwrPjUkZMokWUpipG9kgJg9rw2CHG4mCNWNHTNEKr/xVlf67Aw
         xaG8nTMGpMQH0Bw4uka92DPBfnhooYCaz7WQWGyXkhudmRD4Nmq2kXUcoAVw7eDkuBto
         Fgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700843959; x=1701448759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHTMENAVi47XR6rxLgnHilsaqtzEhcUlvrvQs0OyJoU=;
        b=fFJeBS4H3z6CJbdwoKV4+Y0MMdGEaabZO5NQJk+p6cpsuxoa1mBV2aV5J+isrowzff
         1feABuqoG4PrGbQeQraK4Q6LizLPqxmdjZBQJ8sc+j51Z0hg2q0GKarIyBE12DNqnd5/
         lGBfU0ZfC9ZG6JK2lLdJe3eEg/5sEvH399IhTOKYRKcM76Mnq2ZsfgmH64DVmR/7a7AF
         pBh6UwaOgu5v/ac+8NgeENq5rsW+663yBBXh2I41p+WQTKn0YcTWrwuF89yNFiKThIva
         LEP2vPhM/UDzXojrUuGEKk2X8uDImLrEknfz9vqVfuc1aqkf2jHUR+SquEFOjST4j/40
         5Mng==
X-Gm-Message-State: AOJu0YzDg+kvnQrWvGa/H78h7oL2rp0J6+FOK4AdR66PtDIIUYh1TGG/
	sx0qsCPRf3m8S4O/bR5wJME=
X-Google-Smtp-Source: AGHT+IHgvt3JEGuFmzPkYjDljN5d22OqpBBoT+phXZicmhBss5j/DMGuOvopUBPJTeMCd+p8/KjybQ==
X-Received: by 2002:a5d:5267:0:b0:332:d1cc:6374 with SMTP id l7-20020a5d5267000000b00332d1cc6374mr3108691wrc.47.1700843958487;
        Fri, 24 Nov 2023 08:39:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id s15-20020adf978f000000b00332d41f0798sm4747110wrb.29.2023.11.24.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:39:17 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Frank Binns <frank.binns@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/imagination: Fix a couple of spelling mistakes in literal strings
Date: Fri, 24 Nov 2023 16:39:17 +0000
Message-Id: <20231124163917.300685-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes in literal strings in the
stid_fmts array. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
index 571954182f33..56e11009e123 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
@@ -497,7 +497,7 @@ static const struct rogue_km_stid_fmt stid_fmts[] = {
 	{ ROGUE_FW_LOG_CREATESFID(213, ROGUE_FW_GROUP_MAIN, 1),
 	  "Safety Watchdog threshold period set to 0x%x clock cycles" },
 	{ ROGUE_FW_LOG_CREATESFID(214, ROGUE_FW_GROUP_MAIN, 0),
-	  "MTS Safety Event trigged by the safety watchdog." },
+	  "MTS Safety Event triggered by the safety watchdog." },
 	{ ROGUE_FW_LOG_CREATESFID(215, ROGUE_FW_GROUP_MAIN, 3),
 	  "DM%d USC tasks range limit 0 - %d, stride %d" },
 	{ ROGUE_FW_LOG_CREATESFID(216, ROGUE_FW_GROUP_MAIN, 1),
@@ -1114,7 +1114,7 @@ static const struct rogue_km_stid_fmt stid_fmts[] = {
 	{ ROGUE_FW_LOG_CREATESFID(39, ROGUE_FW_GROUP_SPM, 2),
 	  "3DMemFree matches freelist 0x%08x (FL type = %u)" },
 	{ ROGUE_FW_LOG_CREATESFID(40, ROGUE_FW_GROUP_SPM, 0),
-	  "Raise the 3DMemFreeDedected flag" },
+	  "Raise the 3DMemFreeDetected flag" },
 	{ ROGUE_FW_LOG_CREATESFID(41, ROGUE_FW_GROUP_SPM, 1),
 	  "Wait for pending grow on Freelist 0x%08x" },
 	{ ROGUE_FW_LOG_CREATESFID(42, ROGUE_FW_GROUP_SPM, 1),
-- 
2.39.2

