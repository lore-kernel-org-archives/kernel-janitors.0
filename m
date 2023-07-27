Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563F1C001E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jul 2023 07:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjG0H2F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbjG0H1d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jul 2023 03:27:33 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FE94C1E
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jul 2023 00:16:38 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-307d58b3efbso626675f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jul 2023 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690442197; x=1691046997;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkADfI1IITAtEX5v+S8j3Mm4PQmUqoleV9IfpFo9m5w=;
        b=vOhAluSiGvZlYqXw23vgq1DpLCehDHSf1+Kos+7coPZq2YLiiaurcBlSc5Qc+vh4yj
         TYnvNcOq4Tzy1eQlXmS63lYMSvTaeuuJeXunzCt6E4GAS0MXpFpMBcRmx7p+NO5irLPN
         Tn1URsTkC4QCjnSmBMHVSjKg4wQx2NRD5FpK2w+BdUkPJzeaQ2eVPPd9d0+sXYffbKhQ
         yLYbBA8PCVNx+45x8aWVRl9mg+srViwkfskslQ25DIQM+Y25BOEg9YP/+56skGWMa8c8
         8GMhtd4ZTyWjkgQdNggXiI+CFdYFYISynoq5P7HixW3M8bZtAlXeWadIvGtxlz1b2HoH
         LloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690442197; x=1691046997;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkADfI1IITAtEX5v+S8j3Mm4PQmUqoleV9IfpFo9m5w=;
        b=AFCSe/YqH2LJrShxPcxpin2sP77n6mk6N9tnusAeH1h3oF2jkWZdF/BDkR3aowvRV5
         a4HND6xbDwNrxg6/fel/5dXgey+iW5bG5+QPDWTF+LUzv4Akt8gF/w0etimbjJEo6o7K
         dsW2NapAt4g7xXNSmUYyHqxgzwxSTdUZZ1vcGxA4H+TDCeqTwqOH8rdIUgh1j/jFP3k3
         EBHA2NPk1CHnuOXgVnJTz0z7Q5zzAv/KTi+KnMtyk5VrWc/5TdlUDMamhkoFxZ+/TPjH
         E1AzYprru7gAvLgrR4cswG/qtFUUo5ccK4crxv2gC4DL1iJFm/0fUBB9WiHwzLkm8as9
         kv6Q==
X-Gm-Message-State: ABy/qLafRR6JrGAGEG4GX6jH8KzraTEhf0f6yCghx01RubY3hrd3OGOH
        lKRybSWHuwsOR7/8IIeX7DRidXvRMoK4/KE+N9w=
X-Google-Smtp-Source: APBJJlGX8E9P4/I5JQDGiC2JpjRcVDZJdtV/ZWZICj5PRQB90Ll5/+I0L2gBa5R0jGBYo/1MSo0sKQ==
X-Received: by 2002:a5d:4942:0:b0:317:6fff:c32b with SMTP id r2-20020a5d4942000000b003176fffc32bmr977308wrs.53.1690442197192;
        Thu, 27 Jul 2023 00:16:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z1-20020adfd0c1000000b0031424f4ef1dsm1165692wrh.19.2023.07.27.00.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:16:36 -0700 (PDT)
Date:   Thu, 27 Jul 2023 10:16:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Simon Trimmer <simont@opensource.cirrus.com>
Cc:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda/cs35l56: Do some clean up on probe error
Message-ID: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that this return should be a goto:

    sound/pci/hda/cs35l56_hda.c:910 cs35l56_hda_common_probe()
    warn: missing unwind goto?

The goto error disables cansleep so that seems reasonable.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/cs35l56_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 71e95e64f8a4..4c3279f61b94 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -907,7 +907,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 
 	ret = cs35l56_set_patch(&cs35l56->base);
 	if (ret)
-		return ret;
+		goto err;
 
 	regcache_mark_dirty(cs35l56->base.regmap);
 	regcache_sync(cs35l56->base.regmap);
-- 
2.39.2

