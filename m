Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7145EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 06:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjGJGl1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 02:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjGJGlY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 02:41:24 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8E80D1A8;
        Sun,  9 Jul 2023 23:41:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 9FDBE602A8713;
        Mon, 10 Jul 2023 14:41:17 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     steve.glendinning@shawell.net, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, wuych <yunchuan@nfschina.com>
Subject: [PATCH net-next v2 07/10] ethernet: smsc: remove unnecessary (void*) conversions
Date:   Mon, 10 Jul 2023 14:41:15 +0800
Message-Id: <20230710064115.173735-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: wuych <yunchuan@nfschina.com>

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/ethernet/smsc/smsc911x.c | 4 ++--
 drivers/net/ethernet/smsc/smsc9420.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
index 174dc8908b72..c362bff3cb83 100644
--- a/drivers/net/ethernet/smsc/smsc911x.c
+++ b/drivers/net/ethernet/smsc/smsc911x.c
@@ -552,7 +552,7 @@ static void smsc911x_mac_write(struct smsc911x_data *pdata,
 /* Get a phy register */
 static int smsc911x_mii_read(struct mii_bus *bus, int phyaddr, int regidx)
 {
-	struct smsc911x_data *pdata = (struct smsc911x_data *)bus->priv;
+	struct smsc911x_data *pdata = bus->priv;
 	unsigned long flags;
 	unsigned int addr;
 	int i, reg;
@@ -591,7 +591,7 @@ static int smsc911x_mii_read(struct mii_bus *bus, int phyaddr, int regidx)
 static int smsc911x_mii_write(struct mii_bus *bus, int phyaddr, int regidx,
 			   u16 val)
 {
-	struct smsc911x_data *pdata = (struct smsc911x_data *)bus->priv;
+	struct smsc911x_data *pdata = bus->priv;
 	unsigned long flags;
 	unsigned int addr;
 	int i, reg;
diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 71fbb358bb7d..3b26f1d86beb 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -102,7 +102,7 @@ static inline void smsc9420_pci_flush_write(struct smsc9420_pdata *pd)
 
 static int smsc9420_mii_read(struct mii_bus *bus, int phyaddr, int regidx)
 {
-	struct smsc9420_pdata *pd = (struct smsc9420_pdata *)bus->priv;
+	struct smsc9420_pdata *pd = bus->priv;
 	unsigned long flags;
 	u32 addr;
 	int i, reg = -EIO;
@@ -140,7 +140,7 @@ static int smsc9420_mii_read(struct mii_bus *bus, int phyaddr, int regidx)
 static int smsc9420_mii_write(struct mii_bus *bus, int phyaddr, int regidx,
 			   u16 val)
 {
-	struct smsc9420_pdata *pd = (struct smsc9420_pdata *)bus->priv;
+	struct smsc9420_pdata *pd = bus->priv;
 	unsigned long flags;
 	u32 addr;
 	int i, reg = -EIO;
-- 
2.30.2

