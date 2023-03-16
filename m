Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2597C6FD19
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Mar 2023 08:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjCPIk6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Mar 2023 04:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjCPIk4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Mar 2023 04:40:56 -0400
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D18D23877;
        Thu, 16 Mar 2023 01:40:45 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id D56C51A00AAA;
        Thu, 16 Mar 2023 16:40:43 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rtsi9PHcep3B; Thu, 16 Mar 2023 16:40:43 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 6DF971A0079E;
        Thu, 16 Mar 2023 16:40:42 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     jgross@suse.com, sstabellini@kernel.org,
        oleksandr_tyshchenko@epam.com
Cc:     xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] xen: remove unnecessary (void*) conversions
Date:   Thu, 16 Mar 2023 16:39:54 +0800
Message-Id: <20230316083954.4223-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/xen/xenfs/xensyms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xenfs/xensyms.c b/drivers/xen/xenfs/xensyms.c
index c6c73a33c44d..b799bc759c15 100644
--- a/drivers/xen/xenfs/xensyms.c
+++ b/drivers/xen/xenfs/xensyms.c
@@ -64,7 +64,7 @@ static int xensyms_next_sym(struct xensyms *xs)
 
 static void *xensyms_start(struct seq_file *m, loff_t *pos)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	xs->op.u.symdata.symnum = *pos;
 
@@ -76,7 +76,7 @@ static void *xensyms_start(struct seq_file *m, loff_t *pos)
 
 static void *xensyms_next(struct seq_file *m, void *p, loff_t *pos)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	xs->op.u.symdata.symnum = ++(*pos);
 
@@ -88,7 +88,7 @@ static void *xensyms_next(struct seq_file *m, void *p, loff_t *pos)
 
 static int xensyms_show(struct seq_file *m, void *p)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 	struct xenpf_symdata *symdata = &xs->op.u.symdata;
 
 	seq_printf(m, "%016llx %c %s\n", symdata->address,
@@ -120,7 +120,7 @@ static int xensyms_open(struct inode *inode, struct file *file)
 		return ret;
 
 	m = file->private_data;
-	xs = (struct xensyms *)m->private;
+	xs = m->private;
 
 	xs->namelen = XEN_KSYM_NAME_LEN + 1;
 	xs->name = kzalloc(xs->namelen, GFP_KERNEL);
@@ -138,7 +138,7 @@ static int xensyms_open(struct inode *inode, struct file *file)
 static int xensyms_release(struct inode *inode, struct file *file)
 {
 	struct seq_file *m = file->private_data;
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	kfree(xs->name);
 	return seq_release_private(inode, file);
-- 
2.11.0

