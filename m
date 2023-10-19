Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF1BCDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 08:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjJSIkw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjJSIkv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 04:40:51 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B69CCAB;
        Thu, 19 Oct 2023 01:40:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 805C5608BCF73;
        Thu, 19 Oct 2023 16:40:33 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
        trix@redhat.com
Cc:     Su Hui <suhui@nfschina.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] net: lan78xx: add an error code check in lan78xx_write_raw_eeprom
Date:   Thu, 19 Oct 2023 16:40:23 +0800
Message-Id: <20231019084022.1528885-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

check the value of 'ret' after call 'lan78xx_read_reg'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---

Clang complains that value stored to 'ret' is never read.
Maybe this place miss an error code check, I'm not sure 
about this.

 drivers/net/usb/lan78xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 59cde06aa7f6..347788336b11 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -977,6 +977,10 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
 	 * disable & restore LED function to access EEPROM.
 	 */
 	ret = lan78xx_read_reg(dev, HW_CFG, &val);
+	if (ret < 0) {
+		retval = -EIO;
+		goto exit;
+	}
 	saved = val;
 	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
 		val &= ~(HW_CFG_LED1_EN_ | HW_CFG_LED0_EN_);
-- 
2.30.2

