Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF0BC61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Feb 2023 12:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjBBMu0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 2 Feb 2023 07:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjBBMuZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Feb 2023 07:50:25 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8BCA7;
        Thu,  2 Feb 2023 04:50:21 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bk16so1581721wrb.11;
        Thu, 02 Feb 2023 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5NS+1c8Tu2PGFvK4AFEdfQ0iYep75esswQI1225dSM=;
        b=S7yIohgxwKAADl61gLn3ethmknWpCDOxD611Nhp4wn7OpDjidJ+3j0AyxWK+QLhJb0
         A7x2wzR8uKW8dVcVhy6KMC+9JBXqQYXP3cCLe9bdFzgMyociIRYLMdf7sOKQAOERQkVZ
         TGHtUzYkbV3daP3VDzoLDiApjv6uDFHiUcdnZ58612cUZteYbEUBa+xkaIlMyYWLO/Gq
         4x+QzKCbNdCNCVE2n4yEUAhbQGocwljziYZ20LaA1ibkMv0diz8W28XmCHtJB+KCru8w
         86teva9QCv/IGpnfPvD0VeiR0dMWyPCc6RFJWeTygEACQ3211VfsZPHHOksyfSIrI1HC
         ANpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5NS+1c8Tu2PGFvK4AFEdfQ0iYep75esswQI1225dSM=;
        b=jSAywSIPUIrBtiU9jtWlDBxJXqUmbJL6hgq2kPF+VulnDqhzkdq4rxBgUBJEE8Uj6p
         hoCNkXLyb6d7OdVBLZEt3wwAKdhQFiWb9tasjE+vdufpuXyrjCMLkf1DMhs3lTds502O
         cMnGxRpxZaCH+Eg4HlvgHhuv4JWeU4KBGK8rHD/KNFi7yWvASvSQPgFCBAWicZum3EaC
         D6M24W2skJjaTAxYAPcLPoiog8FGRGhvwuxfztOxVQ56f4ZdzxTloqVUXR0CMUy9Wvfl
         4RAkYAZZtW+omOy1RpG9g1nb5PV0mmbm6ikt1PmxKkmEa5WYcHfakuRNmVwdrGkpUyiC
         rXvQ==
X-Gm-Message-State: AO0yUKVxtpGYJYwhRP+dzWNij3qyHWS0McyhPu6dmBvtYrSBqgdUNNOI
        PkW0Zi+retILCC6C+ACpo0w=
X-Google-Smtp-Source: AK7set9GirxZBqSwgFAsMboxKE8Izp95X1pyquunjVvuEGOfw96gDntzRpcsoOrreA5T5hjVvI/7Pw==
X-Received: by 2002:a05:6000:1285:b0:2bf:ee0f:9f04 with SMTP id f5-20020a056000128500b002bfee0f9f04mr6115932wrx.45.1675342219853;
        Thu, 02 Feb 2023 04:50:19 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d7-20020a056000114700b00241fab5a296sm19667773wrx.40.2023.02.02.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:50:19 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] i915/gvt: Fix spelling mistake "vender" -> "vendor"
Date:   Thu,  2 Feb 2023 12:50:18 +0000
Message-Id: <20230202125018.285523-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gvt/firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index dce93738e98a..4dd52ac2043e 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -171,7 +171,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 	mem = (fw->data + h->cfg_space_offset);
 
 	id = *(u16 *)(mem + PCI_VENDOR_ID);
-	VERIFY("vender id", id, pdev->vendor);
+	VERIFY("vendor id", id, pdev->vendor);
 
 	id = *(u16 *)(mem + PCI_DEVICE_ID);
 	VERIFY("device id", id, pdev->device);
-- 
2.30.2

