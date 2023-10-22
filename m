Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968A6C00A8F
	for <kernel-janitors@archiver.kernel.org>; Sun, 22 Oct 2023 21:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbjJVVAd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 Oct 2023 17:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbjJVVAa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Oct 2023 17:00:30 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70E1124
        for <kernel-janitors@vger.kernel.org>; Sun, 22 Oct 2023 14:00:28 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ufYFqwcwpG6boufYhqoCDQ; Sun, 22 Oct 2023 23:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1698008427;
        bh=5hCOY5dOqdwNpSOWKR6WdA1L7vg708cH5c+HUNqRzWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FiMJ67ybukLxN+2kR7KwWOqtEO6OdNB043ggY48x5x1mdydJdVBNqlQUaVo2DDFhV
         LBKJNenKjyJlYWt/1Dyu1PZHMGaM3WUH/IIDcDucMwijLro+Xf/LfrOiKbOW89zdTh
         P7rYnqlmK7eXETkuNCnVq1uhzyfXR/eifYd9dHpc7Hp33Ush5Hp5XJRme2DbuYBlqd
         JOQwQN57XdOLc1GxYKZPHCenj2dJ93sPppTgSp+ypJcyHE5paASoMoJrGi9GWMTDgH
         reJX18UNv7l6CYwmH7jVdiLyblpXaCW3kr4hW+0B3SA6gRXukmbzFOSt2yKCI7h3E0
         0LXbvv1FOlMXg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Oct 2023 23:00:27 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, veerasenareddy.burru@cavium.com
Cc:     felix.manlunas@cavium.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH net 2/2] liquidio: Simplify octeon_download_firmware()
Date:   Sun, 22 Oct 2023 22:59:47 +0200
Message-Id: <0278c7dfbc23f78a2d85060369132782f8466090.1698007858.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698007858.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698007858.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In order to remove the usage of strncat(), write directly at the rigth
place in the 'h->bootcmd' array and check if the output is truncated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The goal is to potentially remove the strncat() function from the kernel.
Their are only few users and most of them use it wrongly.

This patch is compile tested only.
---
 .../net/ethernet/cavium/liquidio/octeon_console.c   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_console.c b/drivers/net/ethernet/cavium/liquidio/octeon_console.c
index bd6baf2872a5..f1f0d7a0309a 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_console.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_console.c
@@ -802,19 +802,17 @@ static int octeon_console_read(struct octeon_device *oct, u32 console_num,
 }
 
 #define FBUF_SIZE	(4 * 1024 * 1024)
-#define MAX_BOOTTIME_SIZE    80
 
 int octeon_download_firmware(struct octeon_device *oct, const u8 *data,
 			     size_t size)
 {
 	struct octeon_firmware_file_header *h;
-	char boottime[MAX_BOOTTIME_SIZE];
 	struct timespec64 ts;
 	u32 crc32_result;
+	u32 i, rem, used;
 	u64 load_addr;
 	u32 image_len;
 	int ret = 0;
-	u32 i, rem;
 
 	if (size < sizeof(struct octeon_firmware_file_header)) {
 		dev_err(&oct->pci_dev->dev, "Firmware file too small (%d < %d).\n",
@@ -896,16 +894,15 @@ int octeon_download_firmware(struct octeon_device *oct, const u8 *data,
 	 * Octeon always uses UTC time. so timezone information is not sent.
 	 */
 	ktime_get_real_ts64(&ts);
-	ret = snprintf(boottime, MAX_BOOTTIME_SIZE,
+
+	used = strnlen(h->bootcmd, sizeof(h->bootcmd));
+	ret = snprintf(h->bootcmd + used, sizeof(h->bootcmd) - used,
 		       " time_sec=%lld time_nsec=%ld",
 		       (s64)ts.tv_sec, ts.tv_nsec);
-	if ((sizeof(h->bootcmd) - strnlen(h->bootcmd, sizeof(h->bootcmd))) <=
-		ret) {
+	if (ret >= sizeof(h->bootcmd) - used) {
 		dev_err(&oct->pci_dev->dev, "Boot command buffer too small\n");
 		return -EINVAL;
 	}
-	strncat(h->bootcmd, boottime,
-		sizeof(h->bootcmd) - strnlen(h->bootcmd, sizeof(h->bootcmd)) - 1);
 
 	dev_info(&oct->pci_dev->dev, "Writing boot command: %s\n",
 		 h->bootcmd);
-- 
2.34.1

