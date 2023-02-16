Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF32DC636CC
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Feb 2023 12:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjBPMPC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 07:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjBPMPA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 07:15:00 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8082956483
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 04:14:56 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id my5so4646045ejc.7
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 04:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05dZJbEkLcyvJKficN7EL+9lgf/S5/q0x+ZILsExxD4=;
        b=JJF565ms5kq1yZuDtRpYMMc/afWOEuKSQVDoG87jJ8N/Qu9ae7BxFv4xutakF/O5z/
         561BCniSWL5xXcPYJvXqzF050iJMwwgYrz8XPxOpFd6iTMftL3C47qnwAVg0L90UIPVr
         RBGjk/BYPV/JMS5XzyhK5Gj57hG+tWdXqVu7CZTjQSvOBXzWhnjwb7UQ52YgXv+FClJR
         pxz+LyRKwIjwpQiv3KlwVFV04Cs3v7FzEdRpnCQJoRNEWGbomIp2DEMV08t16VEPWZtZ
         /EvYbrPz7Er5TGlrOJB/8c74Le9Ma8d9fFp1uoliOkuvO4k4e1hfOojlBN71zaYIVSdr
         Rlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05dZJbEkLcyvJKficN7EL+9lgf/S5/q0x+ZILsExxD4=;
        b=8AZtJwhuyXvaCc2zFYEBwktscPECmtxNltPpBPD08MAnsWAnm4YYn8RLOPwMMKPDxm
         UKeYwlaCe+XPLRfxgsrTPnymuoFWeEpJlkEn2rEkQDLR7CKYENezKLKGxjulNwPagUqJ
         +9gWb4XTihaKlA3p/KJIdtcP0jlmfw7a90CXAmTomIvv9Nn5UE3AIgPs0AANwtYqrcSe
         0ltxWKWyl1Iat+PGc2JnyHTTCsYl+tXZdWqIjlNG34ctRvoYOTdmOLH+9YkfibtmFxeh
         oDsXkDY5jO7AiC1wi100BFwfXTgJh2xxMqliEH/39my65NiaarGikxZ/IdsWjt0h42pb
         grIg==
X-Gm-Message-State: AO0yUKXb7aJqQztiaa9u2nQf7EY06Nx7BYHpGpg5q1A7Tko9Dde4b/zu
        +Pd/adajHjZXAO9J+i7ogjU=
X-Google-Smtp-Source: AK7set8xpL1VXfk2h8B2idIYRFOEdWU8TszgUtK+kw/hBd7jDkyrQo5qecX4Ogy9hpumJq239adt4A==
X-Received: by 2002:a17:906:4e4d:b0:87e:a34b:9e2b with SMTP id g13-20020a1709064e4d00b0087ea34b9e2bmr6152186ejw.28.1676549695041;
        Thu, 16 Feb 2023 04:14:55 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id jr14-20020a170906a98e00b008af574fbfc2sm746839ejb.33.2023.02.16.04.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:14:54 -0800 (PST)
Date:   Thu, 16 Feb 2023 15:14:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Hannes Reinecke <hare@suse.de>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme-auth: fix an error code in
 nvme_auth_process_dhchap_challenge()
Message-ID: <Y+4eOa57zTdCZ56P@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function was transitioned from returning NVMe status codes to
returning traditional kernel error codes.  However, this particular
return now accidentally returns positive error codes like ENOMEM instead
of negative -ENOMEM.

Fixes: b0ef1b11d390 ("nvme-auth: don't use NVMe status codes")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/nvme/host/auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
index 901c59145811..ea16a0aba679 100644
--- a/drivers/nvme/host/auth.c
+++ b/drivers/nvme/host/auth.c
@@ -256,7 +256,7 @@ static int nvme_auth_process_dhchap_challenge(struct nvme_ctrl *ctrl,
 				 chap->qid, ret, gid_name);
 			chap->status = NVME_AUTH_DHCHAP_FAILURE_DHGROUP_UNUSABLE;
 			chap->dh_tfm = NULL;
-			return -ret;
+			return ret;
 		}
 		dev_dbg(ctrl->device, "qid %d: selected DH group %s\n",
 			chap->qid, gid_name);
-- 
2.39.1

