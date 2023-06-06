Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB8BC7EE2A
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236758AbjFFIeb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjFFIe3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:34:29 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1BB10EC
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:34:13 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so2912405f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040451; x=1688632451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2izjzTKrsvyjgmHREHIuV3DhydL97IdDiRxRMnOeXt8=;
        b=OErqnzweEJnhsaaPFaP7VZfLkSbPfX5qAZa28ojnzyelYj5YhqnntN6oV1OS9dkSaN
         G0ei+K2YXyGAGBrgE9XvDk+RPWt/BgtmQtOyyswysU7r/Q9EEFswS5CrABv/6nobBw9g
         yDqfNxCkaNFY/LaJp9W00iklyVLBn2l3MZyJLQCKONlBxICL8oqJ6P6cevqL0n564ZJj
         Tqi0d/FVYsPMXgJs+84uh4raeWnTP251t5LRhfviIOKkZna8VpZK7QqCdIwV97v9qXsJ
         2Po1FKgZaF0rKNixgfymwyvLILi/1/VepJMHiV7kBAFe1oqwLyTyrJClXOoRcZiqDz1u
         kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040451; x=1688632451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2izjzTKrsvyjgmHREHIuV3DhydL97IdDiRxRMnOeXt8=;
        b=XDp0knBfn5AUzGLOUn+jarh+ruVxD6/P9xLpHMWrzzLo2hbhQSA8/QpRBDxhFCzYF8
         V8bKWBmEulTiJymv8F1lEY0gk1zTX8LqVOi6hIMZiEwAP3O8iU6WgfreWYOFH5Zzb9zr
         GzRHxhvFHcbhDZi0Gmc0K+U0xnxNBuOd/Z//j6WYDZjqtSZHSlsT4Q9TO/oIX4Q/O9jX
         2EVs+zcGv7QrBKjrxQT9SR3i8mFAlke56aMxZTfUg/IeQft7XH4wExXgDXuufPTzKkRs
         fYUZO/W//gQMJBbeiooPUyrC5Gw1Wn0vbc3Gxsu+CHTgTYWfQ7lhJthsdOJCa10JzN8h
         iYwQ==
X-Gm-Message-State: AC+VfDzeYAV0wfX1wjaSbYcluORGEqyZprm0xCImOw4IVyLW0icnUy39
        3ih8LLfWZ0LKp9mvgqdw0Vkvlw==
X-Google-Smtp-Source: ACHHUZ6SaR69anAz6NDuX/nLXmGxPow6vG6jR9hOpA0mGvflQ36v0mirre/H1zIBhvPfirSph2+hMA==
X-Received: by 2002:adf:df91:0:b0:309:51ec:b6e2 with SMTP id z17-20020adfdf91000000b0030951ecb6e2mr1281097wrl.21.1686040450791;
        Tue, 06 Jun 2023 01:34:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0030ab5ebefa8sm11910258wrt.46.2023.06.06.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:34:09 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:34:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jonathan Kim <jonathan.kim@amd.com>
Cc:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: potential error pointer dereference in ioctl
Message-ID: <ZH7vfZnpMMsGKEOq@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "target" either comes from kfd_create_process() which returns error
pointers on error or kfd_lookup_process_by_pid() which returns NULL on
error.  So we need to check for both types of errors.

Fixes: a42e42c4e3b1 ("drm/amdkfd: prepare per-process debug enable and disable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I'm not sure how to compile this code or why I'm seeing this warning
again after two years...  Very strange.

 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index fc385000c007..6a27b000a246 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2920,9 +2920,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		target = kfd_lookup_process_by_pid(pid);
 	}
 
-	if (!target) {
+	if (IS_ERR_OR_NULL(target)) {
 		pr_debug("Cannot find process PID %i to debug\n", args->pid);
-		r = -ESRCH;
+		r = target ? PTR_ERR(target) : -ESRCH;
 		goto out;
 	}
 
-- 
2.39.2

