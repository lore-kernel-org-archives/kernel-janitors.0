Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783CFC00A5A
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Jan 2023 14:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjASO7I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Jan 2023 09:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjASO7C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Jan 2023 09:59:02 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3984D7D662
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Jan 2023 06:59:00 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r2so2128606wrv.7
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Jan 2023 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeSo479aaLA6kL8tn8UanXNmZTCXn/cBCHHp7Ac4Plk=;
        b=E4CL3cMJbTQn/4jCGD2NErULuFbcMqGoU8lOD63wkMHbFNR6PJHfCg5BRodSR/HqAO
         pNwPdMjVqLz6Iq6gwz+jxUqHC2hYmkqkpigWOlkdo2EDFbVM77iDV8VUhByACPKd51yC
         8WHmaSdijIPtA6ScYtqbUCDzglt29f6/D7rai/yXCxqImbymVWnWVaMUcY0veLRXBKEi
         ZARnXKhL/r+zvPasKLYsV9ciywDimmObL45SI7RMFZ26jW1FlP5Id35Qe07LzZ25VM8f
         WGwAhzfRWCCd1o4aS74WTxP+grnzvOb+TElrPqH8nwT5jPdOJeKiVZFGK1YVfmNhWSdy
         GWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeSo479aaLA6kL8tn8UanXNmZTCXn/cBCHHp7Ac4Plk=;
        b=DBOoLxZL+NWSX6xlLKA3D4gU0IvXTE5rQ/SCwbdLHqaCG05Gxbsnbbr38Z4RosyaE8
         1T971dPYRUx7FXC2r3zUmIJIcR/aQrevx3bQhjolw5KZnAc9htjzRQeL8GYhWMJvNANd
         e4ndguaES+5AnIk2BH70RwBpw61PEtCoc91N3RZjPD6h3CfM6X/2HAK6QH/EdvIPO0l/
         WfuJxSVAhPMHLwwjnoZ1Ju0SAQsxWbp7g97qf3jfD0Eik9d+cUV7p4jLf56k4yLJtAxm
         7vyUkWnIucbRIHI6x4HNxykj3sQSI8U233i9/8gAn219VsE/T9SepSils5RLOUU/2U1p
         7keQ==
X-Gm-Message-State: AFqh2kp4M/hrUG48Lq2YSEUVBExHKP0prdymTtwz1N1ZWt/PSpHWTQx5
        PDwJydF+XDBSi/hE3XDwLDU=
X-Google-Smtp-Source: AMrXdXtwuzhrzGcAP0ov6XDynEGu+oSos0PCiHvnjev/qU6pqPnvDrhGA79w15wZzDKDu2lNMJNG1g==
X-Received: by 2002:a5d:4e0d:0:b0:2bd:e03b:1203 with SMTP id p13-20020a5d4e0d000000b002bde03b1203mr18890930wrt.57.1674140338771;
        Thu, 19 Jan 2023 06:58:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b00272c0767b4asm34444067wrv.109.2023.01.19.06.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:58:58 -0800 (PST)
Date:   Thu, 19 Jan 2023 17:58:54 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rander Wang <rander.wang@intel.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org,
        cip-dev <cip-dev@lists.cip-project.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Message-ID: <Y8laruWOEwOC/dx9@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "id" comes from the user.  Change the type to unsigned to prevent
an array underflow.

Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/sof/ipc4-mtrace.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 70dea8ae706e..0ec6ef681012 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -344,9 +344,10 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
 						size_t count, loff_t *ppos)
 {
 	struct sof_mtrace_priv *priv = file->private_data;
-	int id, ret;
+	unsigned int id;
 	char *buf;
 	u32 mask;
+	int ret;
 
 	/*
 	 * To update Nth mask entry, write:
@@ -357,9 +358,9 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ret = sscanf(buf, "%d,0x%x", &id, &mask);
+	ret = sscanf(buf, "%u,0x%x", &id, &mask);
 	if (ret != 2) {
-		ret = sscanf(buf, "%d,%x", &id, &mask);
+		ret = sscanf(buf, "%u,%x", &id, &mask);
 		if (ret != 2) {
 			ret = -EINVAL;
 			goto out;
-- 
2.35.1

