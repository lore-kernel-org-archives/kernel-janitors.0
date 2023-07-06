Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B27EB64D9
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jul 2023 05:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbjGFFwt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jul 2023 01:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjGFFwr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jul 2023 01:52:47 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01E01722
        for <kernel-janitors@vger.kernel.org>; Wed,  5 Jul 2023 22:52:45 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3142a9ffa89so250953f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Jul 2023 22:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688622764; x=1691214764;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmghjAxIZETM80Y4eowuI0+E6FG3YgixB48nOwNbm9o=;
        b=fijStf/B9+AaMmivN5Y7sR0r3hGVdHsGhuNl+G+aRAtLdP3jH3ZPz7/vkKqUWhe6Bk
         BP9VQUm/JxQBF2bob8wpUcm7qduGQNN/nKCXdc8azilpt5LbSK/PthyyqM6bGmUS1VQu
         x4nM4WX0jK3YD6uvsxZLAbAmTP0fBmfSTzYSqwcVkXBfJd5710+M3qUgX28cY4gtxKdH
         qGe5JAl1KOfNr5J2j7DrpN0RfoDG2gyihrYgIWTgLU5O7axu0UW3e8/tfUhwq+IcQz5n
         p1x956FfC5vuAWCcQrNq3/DEThZQWG9sU2z3dyS+MZJicozt8Amk+wpDUQozbnX/u+fc
         YAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688622764; x=1691214764;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmghjAxIZETM80Y4eowuI0+E6FG3YgixB48nOwNbm9o=;
        b=RG/m+L+3sB+lU8EMRkmnyChN4T3P8sw6GuPDe+lEoo7PZcJhV0DX8ZIDINL7+sQVf5
         EPnvktz1B91mdOimD1SzVoWpopkn4CNykf/vaxwuBQAuXgcURVZBajOmqYEsDATNsvyT
         k+q8WSuhm1/Uypw6IhRY9pvKp5UMJl7/4koQk5mkxGtbTg8543xmpdHZoWiRSdzGAfkw
         PgVWub8gxcA/STeDSpklCPuLy4PtD9YtBX32ix2tBDlLKcqz8qH6uujSApSQgB6Lsnm5
         jnG7bQJjQ/2yfJBUyD0F2Z0dmKXM/jIQ1YUcKphgRkMuAufolHJVWYYz+p8rNUEvbZAQ
         WWpA==
X-Gm-Message-State: ABy/qLYg3CBlveosIoqabJHxNxvJIHh3vqECAq+BobvprMYQ+YAL8sKd
        Ijfik1AKIgp+QCfX8oz2Uk4/Rw==
X-Google-Smtp-Source: APBJJlHnPFczuKzdfSvVB/cmZ/mpGY1gDA4k27AnPCEwZ0jE72NwRJSOh2Sd/E4gFlWZsi51jSA4KA==
X-Received: by 2002:adf:e28a:0:b0:314:521:ce0a with SMTP id v10-20020adfe28a000000b003140521ce0amr636808wri.40.1688622764323;
        Wed, 05 Jul 2023 22:52:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z8-20020adfdf88000000b003143bb5ecd5sm855993wrl.69.2023.07.05.22.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 22:52:43 -0700 (PDT)
Date:   Thu, 6 Jul 2023 08:52:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] smackfs: Prevent underflow in smk_set_cipso()
Message-ID: <5070f3eb-55e2-44db-a97d-41f9b9878c6d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a upper bound to "catlen" but no lower bound to prevent
negatives.  I don't see that this necessarily causes a problem but we
may as well be safe.

Fixes: e114e473771c ("Smack: Simplified Mandatory Access Control Kernel")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 security/smack/smackfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 5590eaad241b..25f67d1b5c73 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -896,7 +896,7 @@ static ssize_t smk_set_cipso(struct file *file, const char __user *buf,
 	}
 
 	ret = sscanf(rule, "%d", &catlen);
-	if (ret != 1 || catlen > SMACK_CIPSO_MAXCATNUM)
+	if (ret != 1 || catlen < 0 || catlen > SMACK_CIPSO_MAXCATNUM)
 		goto out;
 
 	if (format == SMK_FIXED24_FMT &&
-- 
2.39.2

