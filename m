Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AC5C61DA4
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Feb 2023 03:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjBFD2a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 5 Feb 2023 22:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjBFD2a (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 5 Feb 2023 22:28:30 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D55EE076;
        Sun,  5 Feb 2023 19:28:29 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id E95B91A00A5E;
        Mon,  6 Feb 2023 11:28:57 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yQRbuDbOX5Gf; Mon,  6 Feb 2023 11:28:57 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id A41601A00A58;
        Mon,  6 Feb 2023 11:28:56 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     agk@redhat.com, snitzer@kernel.org
Cc:     dm-devel@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] dm raid: fix some spelling mistakes in comment
Date:   Mon,  6 Feb 2023 11:27:39 +0800
Message-Id: <20230206032739.19567-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix typos in comment.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/md/dm-raid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 54263679a7b1..8c66a986d647 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -1988,7 +1988,7 @@ struct dm_raid_superblock {
 	__le64 sectors; /* Used device size in sectors */
 
 	/*
-	 * Additonal Bit field of devices indicating failures to support
+	 * Additional Bit field of devices indicating failures to support
 	 * up to 256 devices with the 1.9.0 on-disk metadata format
 	 */
 	__le64 extended_failed_devices[DISKS_ARRAY_ELEMS - 1];
@@ -2855,7 +2855,7 @@ static int rs_setup_reshape(struct raid_set *rs)
 	 *
 	 * - in case of adding disk(s), array size has
 	 *   to grow after the disk adding reshape,
-	 *   which'll hapen in the event handler;
+	 *   which'll happen in the event handler;
 	 *   reshape will happen forward, so space has to
 	 *   be available at the beginning of each disk
 	 *
@@ -3148,7 +3148,7 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		 * If a takeover is needed, userspace sets any additional
 		 * devices to rebuild and we can check for a valid request here.
 		 *
-		 * If acceptible, set the level to the new requested
+		 * If acceptable, set the level to the new requested
 		 * one, prohibit requesting recovery, allow the raid
 		 * set to run and store superblocks during resume.
 		 */
-- 
2.11.0

