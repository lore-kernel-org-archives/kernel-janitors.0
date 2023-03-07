Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BE0C678D4
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Mar 2023 14:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjCGOzq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Mar 2023 09:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjCGOxn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Mar 2023 09:53:43 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA5A85351;
        Tue,  7 Mar 2023 06:40:05 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id i34so53132333eda.7;
        Tue, 07 Mar 2023 06:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200004;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3RqJ40QuyU6gTdk0TLAOUN9gyan56NZTQb54foCPzs=;
        b=GlR7BJ2BVMasBLyzYPDobcTwCUC6CxlHAnohTNSxZnNUAJ0vAC/NGxQfM6TOgvgtAf
         KJr79LYAejGkTvZxqzmYmbY9Ky1hlULhlGrjurb6UmnkI8k1v/WfI2K0ZDTBWH5d5d4G
         9K0j0pTv5DtW/b9LMrPImDJuq839Ag363ytclj1bRyct349YSCVMiqG25Dn/Of8voZPv
         88+c79xYk0cS/JQOc0KdylylOv+u+KoVUEBoFA2y+M7ZHj+B6+gQ0PNduZCASOLGfShN
         rqboMJJLZkg6g24Hizjeknvg9585OrmcBY9kYpgKBILzzBBkNx1PqtKFhLhdgOtY6JY2
         IVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200004;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3RqJ40QuyU6gTdk0TLAOUN9gyan56NZTQb54foCPzs=;
        b=TylUMMPtOeIJku7cl+0BlMGUug357HKA6lyqn4Hf5xJDqsjxzxAJlVLrPsKr/CBCt+
         07Nh9gJUwBLcZ5Xxgfq4Bwq8KDOmzUt2G9pflFWTA6MKy1wjn9bwfxLjkJGnhFbImrRT
         cY7B8Kn6wqCSdakQgIVMh5TwDJBA94Xwu/WbszHlB9z+ZtMtgeIhcgRUdznTiVB1p0Ay
         Y39Dsq4LbjzuUyLnkFPj39I7qVGpk/YGUP36qxG1nrGG83jLcMWQlurVcCrvE7qkDO0m
         uzONqEbl7VH0s6vszzfR8h77BA8y5GzJS4As+/Dx4ca84HZg12dv97UqJaOpNznyEMDx
         /RTQ==
X-Gm-Message-State: AO0yUKV1wtGJUWIJyoxYziSZSE+yp34YDOLBxrw/9sN80ezWmcjMC9EP
        0kwxYbyARRaX3caKJx4PIDg=
X-Google-Smtp-Source: AK7set9xSqBTU2QYwHlLx1MIR2qXzc9eOL1pGw/9RyCeptxm3dDUQsuDkQHP5X8u+NyFET63Yk7AJw==
X-Received: by 2002:a17:906:1593:b0:885:dd71:89b5 with SMTP id k19-20020a170906159300b00885dd7189b5mr13679935ejd.41.1678200004142;
        Tue, 07 Mar 2023 06:40:04 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:a517:a52e:cdbc:e30d])
        by smtp.gmail.com with ESMTPSA id pv16-20020a170907209000b009079442dd11sm6183861ejb.154.2023.03.07.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 06:40:03 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        device@lanana.org, unicode@lanana.org,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/2] Updating information on lanana.org
Date:   Tue,  7 Mar 2023 15:39:58 +0100
Message-Id: <20230307144000.29539-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear Jon,

please pick these two changes that update information in MAINTAINERS and
the kernel documentation on the actual state of lanana.org.

Thanks,

Lukas


Lukas Bulwahn (2):
  MAINTAINERS: remove historic section DEVICE NUMBER REGISTRY
  docs: admin: unicode: update information on state of lanana.org document

 Documentation/admin-guide/unicode.rst | 9 ++++-----
 MAINTAINERS                           | 5 -----
 2 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.17.1

