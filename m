Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2CCE95A80
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Oct 2023 06:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344456AbjJHGjw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 Oct 2023 02:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344423AbjJHGjv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Oct 2023 02:39:51 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3C5C19D;
        Sat,  7 Oct 2023 23:39:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 84AED604B3FCA;
        Sun,  8 Oct 2023 14:39:39 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     jaegeuk@kernel.org, chao@kernel.org
Cc:     Su Hui <suhui@nfschina.com>,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] f2fs: avoid format-overflow warning
Date:   Sun,  8 Oct 2023 14:39:30 +0800
Message-Id: <20231008063929.538425-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

With gcc and W=1 option, there's a warning like this:

fs/f2fs/compress.c: In function ‘f2fs_init_page_array_cache’:
fs/f2fs/compress.c:1984:47: error: ‘%u’ directive writing between
1 and 7 bytes into a region of size between 5 and 8
[-Werror=format-overflow=]
 1984 |  sprintf(slab_name, "f2fs_page_array_entry-%u:%u", MAJOR(dev),
		MINOR(dev));
      |                                               ^~

String "f2fs_page_array_entry-%u:%u" can up to 35. The first "%u" can up
to 4 and the second "%u" can up to 7, so total size is "24 + 4 + 7 = 35".
slab_name's size should be 35 rather than 32.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d820801f473e..7514661bbfbb 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1976,7 +1976,7 @@ void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)
 int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
-	char slab_name[32];
+	char slab_name[35];
 
 	if (!f2fs_sb_has_compression(sbi))
 		return 0;
-- 
2.30.2

