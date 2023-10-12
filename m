Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBC8CDB46E
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 09:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbjJLJnE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbjJLJnD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 05:43:03 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50BC9D
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:43:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40537481094so8328095e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103779; x=1697708579; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHzUG3KG/eLX+tQ6CVjg3fSs3TGh4qhPLNWOVCZfljQ=;
        b=RufdTUbWBmdcKlPoMEnJScb391/ZXiCKalYPbljVJU3tYmjuG5iqfVDxRRjYcglCJ1
         ZoCuatx5xuAcZfVTQ74W8abFF3MDxMPeLM0WdEyLHRC9Nc5UvfY5FfFpxs1LwqzCqcZr
         a32TcsC9z7fjQLKsUNtHgq5tMCs4YefWVl2fHVcA5yV21vUtJJ0cHKz+BmywltTuGahe
         MF/sVdIQ8sYoXCogiKI+YQj+3qbPou7GnPZg+MbniG332ANYIlPuBMx6xOqi0HQaIIRH
         v+qLgDZEy6U+AqW/45GWgu2QSeuAUAn45pPxNkPj1/41SeAPgGrQCbB5glK2Ynd5D1rX
         iE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103779; x=1697708579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHzUG3KG/eLX+tQ6CVjg3fSs3TGh4qhPLNWOVCZfljQ=;
        b=e5wAUg9Pco4jf8TnASescMaPXRw5es3vL6bsGKEkHbEQYksogjbueBaBL+KaGLza+s
         /Y7jHzwGWFlrn3LZhf6yOqpyHdFBbU3RFgq6I/I60UJ0+QrqEJa4NarkkKWbGJ+rEvuJ
         ZbrsPUUQd9cSWzbKtvLdEFbdcTJGFvwNpfDv9eThU1PRDsPq+sWefh1Uw04wca37GKUJ
         Hy9ZSXiU2SeIOpzxJ0GtRGRo6aTxd2uxlefnwg/ZQ8wtm7pQt5V307ay+zg3kspTUKK+
         xqqt9K/dBdnVMwRANb59XqM21o3+7JZERg8TAsyqdECDDs21hDlJ/pmyXkg37VvzQEKu
         ScIQ==
X-Gm-Message-State: AOJu0YxfBKflUKjnCLY5r0pL67D1iNRCZt5NeBZ+OAvTbu28zcplzoLk
        qvlx4gDiCH36ZNEPqTln0N1/bVPxQD8WKReGAPw=
X-Google-Smtp-Source: AGHT+IGk0wIPTIZeyYH2T4fl1g6pwNLVcvlBW+S1aM+ZDTz5C7asBiHdruKBDKex0lJyzF2ybiKYjA==
X-Received: by 2002:a7b:cd0a:0:b0:405:3dbc:8821 with SMTP id f10-20020a7bcd0a000000b004053dbc8821mr19997461wmj.22.1697103779372;
        Thu, 12 Oct 2023 02:42:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c020900b003feea62440bsm19005198wmi.43.2023.10.12.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:42:59 -0700 (PDT)
Date:   Thu, 12 Oct 2023 12:42:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Chris Mason <clm@fb.com>
Cc:     Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] btrfs: clean up an error code in btrfs_insert_raid_extent()
Message-ID: <ce098f42-f12c-4bc2-b37f-2f35c572eecf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

It's more obvious to return a literal zero instead of "return ret;".
Plus Smatch complains that ret could be uninitialized if the
ordered_extent->bioc_list list is empty and this silences that
warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/btrfs/raid-stripe-tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/raid-stripe-tree.c b/fs/btrfs/raid-stripe-tree.c
index 944e8f1862aa..9589362acfbf 100644
--- a/fs/btrfs/raid-stripe-tree.c
+++ b/fs/btrfs/raid-stripe-tree.c
@@ -145,7 +145,7 @@ int btrfs_insert_raid_extent(struct btrfs_trans_handle *trans,
 		btrfs_put_bioc(bioc);
 	}
 
-	return ret;
+	return 0;
 }
 
 int btrfs_get_raid_extent_offset(struct btrfs_fs_info *fs_info,
-- 
2.39.2

