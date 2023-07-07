Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFEDEB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Jul 2023 11:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjGGL0F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Jul 2023 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbjGGLZp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jul 2023 07:25:45 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3361FF9
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jul 2023 04:25:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-314172bb818so1798558f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jul 2023 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688729129; x=1691321129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQkPGD5/eqRL1CiGFWeiMUPmKQY/9u9/vWvSh1GggDE=;
        b=lMYjUh1DQgels50J8Ik5tIQ4VpRzz/pi0P351yaNC0VUTyA2Dxp/1+AGTn/7gg5f71
         S8CF1PnoxlbezYZ4muWjc+Joq/RvpyviY+5XIrW8j/z84la7VdqhOCzrnrhrbssxODCV
         G7wMfWQw4db3IYhw/uayB/H0GfAdOrcRdCTQhPTqK76MdxPwO5ykob5DMg7CwHs6Y16/
         4xBHMPjZW3bMFcaLAbG+bW8YpFzqYqvL46sGrsERtSphekqokTVZoOxDT/ONxh6f5sL6
         uof2biixlSQqHMNoYrLfrtEQnCtJCPboxOwUPgInaVP0sdYQogpZsTwJNidEVfYWz6U9
         qLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688729129; x=1691321129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQkPGD5/eqRL1CiGFWeiMUPmKQY/9u9/vWvSh1GggDE=;
        b=kDS1icx966BrTbD+HLfgTdQwNaZz+xbqYQQlynfUT0OxMMPojnTbp4QOSl75snL1u2
         AUAqO/AigrS44YsP0tUHtdJaFMyWWKWeK7cY4jNiZZQLJwdLWSYy62ohWgmLl+jfzL3O
         FMu2kRKkAPeOAqV2aWc9axO2sDbqcv+ZofzPfj2Tj3y1RLvUy8lJb7Tx1NneqTiCAPSX
         YlGy6M/4TGwXb4QsJzCxyp86WjIARmxHRjnA3WlZ4dt0XDc1wzkoqXe5TDIvW26EaSoH
         iFCIo1lZLks7MxSW/XBYAa8PAIz1A20v9RWi7NaGS/7MMavInHd16/Lc5yQcDj7Dg0oA
         COoA==
X-Gm-Message-State: ABy/qLZlysiYIpHDkWscVc/ILDxJ/hmi3jWtBfZmHwgK6hRA92nYqw08
        rpBAR0ftwB1ofrePTsUCpNQjWg==
X-Google-Smtp-Source: APBJJlGvlB38IdvqZ4ywf8WZL30A5qwSdsoLNrkiHml15YN1JK3u6HivCYr4mfjrzUKgYMK0dBIN1A==
X-Received: by 2002:a5d:6590:0:b0:314:db7:d132 with SMTP id q16-20020a5d6590000000b003140db7d132mr3918714wru.61.1688729129143;
        Fri, 07 Jul 2023 04:25:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y5-20020a5d6205000000b003145521f4e5sm3080546wru.116.2023.07.07.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 04:25:27 -0700 (PDT)
Date:   Fri, 7 Jul 2023 14:25:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: ipc3-dtrace: uninitialized data in
 dfsentry_trace_filter_write()
Message-ID: <74148292-ce4d-4e01-a1a7-921e6767da14@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This doesn't check how many bytes the simple_write_to_buffer() writes to
the buffer.  The only thing that we know is that the first byte is
initialized and the last byte of the buffer is set to NUL.  However
the middle bytes could be uninitialized.

There is no need to use simple_write_to_buffer().  This code does not
support partial writes but instead passes "pos = 0" as the starting
offset regardless of what the user passed as "*ppos".  Just use the
copy_from_user() function and initialize the whole buffer.

Fixes: 671e0b90051e ("ASoC: SOF: Clone the trace code to ipc3-dtrace as fw_tracing implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The nicer thing to do would have been to use strndup_user() but that
comes with a small risk of breaking user space and I can't test this
so I didn't do that.

 sound/soc/sof/ipc3-dtrace.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 1d3bca2d28dd..35da85a45a9a 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -186,7 +186,6 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 	struct snd_sof_dfsentry *dfse = file->private_data;
 	struct sof_ipc_trace_filter_elem *elems = NULL;
 	struct snd_sof_dev *sdev = dfse->sdev;
-	loff_t pos = 0;
 	int num_elems;
 	char *string;
 	int ret;
@@ -201,11 +200,11 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 	if (!string)
 		return -ENOMEM;
 
-	/* assert null termination */
-	string[count] = 0;
-	ret = simple_write_to_buffer(string, count, &pos, from, count);
-	if (ret < 0)
+	if (copy_from_user(string, from, count)) {
+		ret = -EFAULT;
 		goto error;
+	}
+	string[count] = '\0';
 
 	ret = trace_filter_parse(sdev, string, &num_elems, &elems);
 	if (ret < 0)
-- 
2.39.2

