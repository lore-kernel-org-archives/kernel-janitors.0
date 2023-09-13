Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C8ACA5504
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 08:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjIMISd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 04:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjIMISc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 04:18:32 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CB31996
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 01:18:28 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-403004a96a4so45045455e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593107; x=1695197907; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL0QYm+4DpNU20BBRJmcQSCbvNXdp8splkqH77lfanI=;
        b=i2JkCVM075NkwYKDIN0J+QMEQo/TjgniNmFEh8rQOxB0DaNenBDWUHjLNI2MWhrhWz
         PhIVY3pDjGtApGLPkoKZEQg4YzRIGeYyKqwZf8/GBDsQThRasIwEuH69WPUhh9OatYJP
         UUIVGXAaqNGJC1KkJohuBjvVzrTr8r49OMuA2flA34HGqXpAaFkH7d9YYxKcfpeFGpxT
         MtpoxLn7RFBHlXB2aXNuHfsItXuXi6qiPz1Z6av1xjc+/g+iiSVhRoKmfvEIaKSSvgPT
         L/G3T+IJnZhP2EyStwuWZKGmBQpxI9JDmHRPqpFhXv1hxvZfOCV9DYwLHvIUo8w4c0T5
         m/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593107; x=1695197907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL0QYm+4DpNU20BBRJmcQSCbvNXdp8splkqH77lfanI=;
        b=MS8TiFOu/FPStzeIJ6F8WocYo1h1WjUNRgUch/mg6RUIZDaMkBixvIg9Ugp2y462tt
         hyVROUHbUh6fTDD9kvIW9Vg6vmyaLO3i/ELLfwqYEgDvHtxrjqNr8uYWxVEhiCLFBuQo
         nuNsljyj4zXAXVOW5dbcHwpOAl30yyUGxALf69fiiNTYNuN97di1Nq8cPB73v0dWgAyl
         fzeJWiz8qEb6m7EtOUKn9bR8AMdVDVRe081zEJeZs52d5hMf8hY3YIxAefH0dzKr1lxk
         6e767Y2PujR3Rx2jiQ9zNqSCvuJMhx0mlKkcPKvMSgZ1vYdFH75yRnsbxnGhQBgfjlxi
         8YKw==
X-Gm-Message-State: AOJu0YyGYVxET/wuH8EXU+XeKL050pF8cxI58JkClU+yhUd2aCv3K/Na
        wgjrutWf4rBD9yH22D7rcOfBKA==
X-Google-Smtp-Source: AGHT+IGFO0CwSx+Hl2v9TdNBISeq9HBmh94Hh3tAzgvAXxD6wKVhKIFaJvI+u/oy1HGcv/6YLqtxUg==
X-Received: by 2002:a05:600c:108b:b0:3fe:207c:1aea with SMTP id e11-20020a05600c108b00b003fe207c1aeamr1314950wmd.23.1694593106762;
        Wed, 13 Sep 2023 01:18:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bcd12000000b00402f7e473b7sm1285889wmj.15.2023.09.13.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:18:26 -0700 (PDT)
Date:   Wed, 13 Sep 2023 11:18:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Weidong Wang <wangweidong.a@awinic.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Nick Li <liweilei@awinic.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Ben Yi <yijiangtao@awinic.com>, Tom Rix <trix@redhat.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88395: Fix some error codes
Message-ID: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These error paths should return -EINVAL instead of success.

Fixes: 7f4ec77802aa ("ASoC: codecs: Add code for bin parsing compatible with aw88261")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 8ee1baa03269..87dd0ccade4c 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -452,11 +452,13 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 	if ((aw_bin->all_bin_parse_num != 1) ||
 		(aw_bin->header_info[0].bin_data_type != DATA_TYPE_REGISTER)) {
 		dev_err(aw_dev->dev, "bin num or type error");
+		ret = -EINVAL;
 		goto parse_bin_failed;
 	}
 
 	if (aw_bin->header_info[0].valid_data_len % 4) {
 		dev_err(aw_dev->dev, "bin data len get error!");
+		ret = -EINVAL;
 		goto parse_bin_failed;
 	}
 
-- 
2.39.2

