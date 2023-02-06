Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752F7C05027
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Feb 2023 14:00:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjBFOAV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjBFN7Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Feb 2023 08:59:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A3BD525
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Feb 2023 05:58:43 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so10816695wmb.4
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Feb 2023 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9BgtJ4so9KwHhE8rorYQ5JnQdesAnEyOYjdic9MTfc=;
        b=RTout/ggpHfdGBZVfYR89ad+hgiP0Eb6NEBtrAjuAZtS5HlHGYlt6HOQf1A7UqrBue
         qm/ZfeS8bs/s1nRE4MgBhcyVDZq+4NwvPL1zY/CtaNolQkoypGoGzrYohc1woRsIiQYw
         Z1rhjxBtZaEVphFcZshQsVn9D9jUd/po6Gt9fbDlYNM8bCbQKaoySCIYJUCoB2JrWJAG
         7fG0TQ5ldCXIE0zL0bE0MYj1Gs4WQ2RT5d07F5hsbe+nBlPIXqqMAn3hpEnFrAWz7x19
         ixvApe1G/mC87L/adlORLPJGgwjDzVRhyDfWL6dx19TLTq9nMdSie81kj14F2O1Lim4T
         PWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9BgtJ4so9KwHhE8rorYQ5JnQdesAnEyOYjdic9MTfc=;
        b=S2zlbxZ2FaGAOjYxnFwl3KqSmSFtdryMimAzPMulJs0ftfChRGhmyLWx90CyBVPwao
         vsqBN78qo4YK0mdmER0rITS6KjuN5uNRAUpyw47aTNkCBr3ncTt1BAbf+z3uQGpCt60y
         klnIxp5NNckqPqIiGIKMVxY3pcazly6lIte8VtgaEm7mOGvZNf0Wu8l4t0zUhAPSNWkZ
         LwJ68W0c3IG+/glU2i4H510vIMox6XxkTX67iW0abWQP7ZHvVGtbcyItdXzzm4DMq5K9
         bmydcdVvRxcgIF0f2XaBtfmpVE2qIhSCUMJxHxHEpSUtbB+BL6bxXBQwzTgbz+Bmd4Nx
         NXuA==
X-Gm-Message-State: AO0yUKVyBMCy4Q3wYyISidjl8FJRaZ7K7Z0PvoSQEvsxSTmuGh3e+uJ/
        2J08Nsl33CNdLL8iu+bg12w=
X-Google-Smtp-Source: AK7set/lsRA0W5X4iJwzoXeGyM8eEf3KsDdv4IP8UG2N0ozVzaPlKmjU1xAsfIAkmUt8JS6LFE+2Dw==
X-Received: by 2002:a05:600c:1d96:b0:3dd:af7a:53db with SMTP id p22-20020a05600c1d9600b003ddaf7a53dbmr19346118wms.11.1675691921772;
        Mon, 06 Feb 2023 05:58:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm18549148wms.28.2023.02.06.05.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:58:41 -0800 (PST)
Date:   Mon, 6 Feb 2023 16:58:37 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Bruce zhao <zhaolei@awinic.com>, Nick Li <liweilei@awinic.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88395: Uninitialized variable bug in
 aw_dev_parse_dev_type_v1()
Message-ID: <Y+EHjQ0+QCAXxmlh@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "cur_scene_id" variable is never initialized.  It needs to be set
to zero for the code to work.

Fixes: 4345865b003b ("ASoC: codecs: ACF bin parsing and check library file for aw88395")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Presumably this code was tested with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
or whatever to automatically initialize it to zero or it would have died
specatularly.  ;)

 sound/soc/codecs/aw88395/aw88395_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 64dde972f3f0..d7c31a202adc 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -769,7 +769,7 @@ static int aw_dev_parse_dev_type_v1(struct aw_device *aw_dev,
 {
 	struct aw_cfg_dde_v1 *cfg_dde =
 		(struct aw_cfg_dde_v1 *)((char *)prof_hdr + prof_hdr->hdr_offset);
-	int cur_scene_id;
+	int cur_scene_id = 0;
 	unsigned int i;
 	int ret;
 
-- 
2.35.1

