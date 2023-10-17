Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A94CDB474
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Oct 2023 14:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343869AbjJQOEs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Oct 2023 10:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343675AbjJQOEs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Oct 2023 10:04:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5A792
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Oct 2023 07:04:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40684f53d11so63634935e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Oct 2023 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697551485; x=1698156285; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouydOp9DCQDO9RKyjjgbFfmh727nP3T250yuxX8/3Do=;
        b=of6uTkZQE6Dwl26wJIWPVxFCBjvsbx7mj61SATc1kwz91dw49h7aM3C6poTraxETeZ
         zqd1rrolQ0UFmOLsEpgPLcUtIRHoJyMMlhjBA1nOuwilbAIeGlegYh3Nx+UWZ2dmkQ1c
         8Y9wR3oNKJjQo/wb55/eJSPdG+EwCsKZPYsqWE5s9inRs8WLdCS6mQ0nbVBtX3Amjzl8
         0G7xuxtmqiuen+ddf5mlcco+VXNzqLLf4ueTd5DKYclY9HZFp3qQYQGCsWJWo1C6VOjS
         aJM/vHogM7NiazeDq2N7QoZvPuVPvBDCj4yFL6z62PEZUZk0Du6D956Qcxksb7w2gbjS
         ot1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551485; x=1698156285;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouydOp9DCQDO9RKyjjgbFfmh727nP3T250yuxX8/3Do=;
        b=I4+xGCA7widrpHOfPokPMO7qgdg+BWJm+RkNUZmyPIlxJ3dv06onsf0ew47T8JkGfH
         LjQineHuczdZpUBT9IJepUK7oRUJlhKNDYN4stdG4UZhtKkm05EN5wNHAODf0DqpncAR
         KM5Fz6SiSKJ7gglFOUYV4yt0XeiG86oK9TtOSFZBczBKsoiqngqmEHO996Gw2eYsD03x
         67tMw61McL6sYj7w3UM/qtwT/cM0artwDFfVkB4V2M++C8GmU8cmMqj4dw8YnOGHoeyI
         Diyclfir3n4FSSuWZW2y/q/zCxza4b2/e1GtAlFN3joPGiFvqxD/fWdvEdDsbJgHKs5K
         qBCg==
X-Gm-Message-State: AOJu0YzqkLFBcTvPFEcAuS4965ZYFGq8nW3U3dqlNX5CKpVmuJkXSrYD
        fqsNgqMAOSwINsut62PWeyjoP49fJsJvAa+Xpic=
X-Google-Smtp-Source: AGHT+IG+7ZMm33Rpww/J0URdy4cjxktBY6DGdh6pUvEnJTHaaeZewjB7KcCSa1ayxVlxIeHyAxsIqQ==
X-Received: by 2002:a5d:4b50:0:b0:32d:9fc9:d14c with SMTP id w16-20020a5d4b50000000b0032d9fc9d14cmr2220441wrs.47.1697551484896;
        Tue, 17 Oct 2023 07:04:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d58d2000000b0031c6581d55esm1752895wrf.91.2023.10.17.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:04:44 -0700 (PDT)
Date:   Tue, 17 Oct 2023 17:04:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix an NULL dereference bug
Message-ID: <4dea69da-738b-41b2-b48c-22dfee5f4fc8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The issue here is when this is called from ntfs_load_attr_list().  The
"size" comes from le32_to_cpu(attr->res.data_size) so it can't overflow
on a 64bit systems but on 32bit systems the "+ 1023" can overflow and
the result is zero.  This means that the kmalloc will succeed by
returning the ZERO_SIZE_PTR and then the memcpy() will crash with an
Oops on the next line.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f6706143d14b..a46d30b84bf3 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -473,7 +473,7 @@ bool al_delete_le(struct ntfs_inode *ni, enum ATTR_TYPE type, CLST vcn,
 int al_update(struct ntfs_inode *ni, int sync);
 static inline size_t al_aligned(size_t size)
 {
-	return (size + 1023) & ~(size_t)1023;
+	return size_add(size, 1023) & ~(size_t)1023;
 }
 
 /* Globals from bitfunc.c */
-- 
2.39.2

