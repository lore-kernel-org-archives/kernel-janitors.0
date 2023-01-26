Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90D1C54E94
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 09:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbjAZJaS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbjAZJaJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 04:30:09 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C1011653
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:30:07 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id fl24so711866wmb.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53zqjk/QjV8XLHukhAeoEZ0VLwkWFteYs5gPHt0hVVw=;
        b=oH4g29yGQ+U/JBwaDC+0dNSxWoVo3WG20yxUOq7FOuEjlLXrWCiKgwFO83wI2hqFyr
         pjoN2q1GM+s0e9w98q3974f8amUfIOAYWiWd2EqdlgiSdbbsaDjr7MiZgW588iuqLSnz
         K9deXfDNJiSFfzsKu8X3hrQFSA+Jkf4viA01kK4Rn73z0OUOZU3XlEH9t4gpUBPUVnyw
         sA0b6ZkFzFnHN5opQEx12nQ+O/Om13YXz/GnuHLC1kYZ6QVougXw4vE2gt8ZMmL1j0kN
         tt5IjAMbxsS1DD+o38dizcg4qXIthhw1yhBtKfT+c3RNBedQFmMZ5DhrYCfdzjj7OapM
         1Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53zqjk/QjV8XLHukhAeoEZ0VLwkWFteYs5gPHt0hVVw=;
        b=gFVi0I/dRVSXXUVinWv5fEzS1ru5LUu4t+m8LbiyaVfAABPCYJyttglJUMFxU4W78J
         9QbCuTYu/M9lCo6Gilh4nsLs6bvsU38NSsbmOMaxGBZddTSlMXZrsQMjFfwKxAjg3sUh
         0GVZjnziRL9JCW1VibcrL60QFDHt1Vs85dai8OPJtW/Gzb1Q3xZgwfx8ahRa/y2R3wS5
         XHEkPs1/zww6hTES0bLoO5bkQGI9xdj9i3nua91NNwoNRLWiSD5TrwztkdmbbXUi8aXl
         t9SWM0hYfs1YiLbd2sWiA6n+sC6ysiJNrYMFXjqLxTFmkWM6VIyZbV1gjVVxlpTohOhB
         fcNQ==
X-Gm-Message-State: AFqh2kqzC3cj6UybmrbMmv/SlyILzbGxfIUuE23HiqTO9emppIcrwzdK
        Vw3MkSaW0tQwAX+6j/tjcS0WMD5GdoyGdg==
X-Google-Smtp-Source: AMrXdXveP98wGLr+SaP1jr7q/JDiHAEPg0nzZ12jzVvn+eqhQXA/cBk5+1w7fnP/sZf93ONs0DOFNw==
X-Received: by 2002:a05:600c:35d0:b0:3db:c4c:9224 with SMTP id r16-20020a05600c35d000b003db0c4c9224mr33355186wmq.3.1674725406458;
        Thu, 26 Jan 2023 01:30:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i21-20020a1c5415000000b003dc23574bf4sm957077wmb.7.2023.01.26.01.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:30:06 -0800 (PST)
Date:   Thu, 26 Jan 2023 12:30:02 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Jaroslav Kysela <perex@perex.cz>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: pci: lx6464es: fix a debug loop
Message-ID: <Y9JIGt0HT8mLkUXF@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop accidentally reuses the "i" iterator for both the inside and
the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
4 or more then it will loop exactly one time, but if it's less then it
is a forever loop.

Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/pci/lx6464es/lx_core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index d3f58a3d17fb..7c1b380a54c0 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -493,13 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
 		dev_dbg(chip->card->dev,
 			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
 			    *r_needed, *r_freed);
-		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
-			for (i = 0; i != chip->rmh.stat_len; ++i)
-				dev_dbg(chip->card->dev,
-					"  stat[%d]: %x, %x\n", i,
-					    chip->rmh.stat[i],
-					    chip->rmh.stat[i] & MASK_DATA_SIZE);
-		}
+		for (i = 0; i < chip->rmh.stat_len; ++i)
+			dev_dbg(chip->card->dev,
+				"  stat[%d]: %x, %x\n", i,
+				chip->rmh.stat[i],
+				chip->rmh.stat[i] & MASK_DATA_SIZE);
 	}
 
 	mutex_unlock(&chip->msg_lock);
-- 
2.35.1

