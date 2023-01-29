Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DE0C61D97
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Jan 2023 18:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbjA2SX2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Jan 2023 13:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjA2SX1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Jan 2023 13:23:27 -0500
Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2149E1BAF4
        for <kernel-janitors@vger.kernel.org>; Sun, 29 Jan 2023 10:23:27 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id MCKlpGwDQMaRbMCKmpnji1; Sun, 29 Jan 2023 19:23:25 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Jan 2023 19:23:25 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org, peterz@infradead.org, pmladek@suse.com,
        john.ogness@linutronix.de, baolu.lu@linux.intel.com,
        tglx@linutronix.de, mingo@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] usb: early: xhci-dbc: Fix a potential out-of-bound memory access
Date:   Sun, 29 Jan 2023 19:23:08 +0100
Message-Id: <d6a7562c5e839a195cee85db6dc81817f9372cb1.1675016180.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675016180.git.christophe.jaillet@wanadoo.fr>
References: <cover.1675016180.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If xdbc_bulk_write() fails, the values in 'buf' can be anything. So the
string is not guaranteed to be NULL terminated when xdbc_trace() is called.

Reserve an extra byte, which will be zeroed automatically because 'buf' is
a static variable, in order to avoid troubles, should it happen.

Fixes: aeb9dd1de98c ("usb/early: Add driver for xhci debug capability")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/early/xhci-dbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 797047154820..f3e23be227d4 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -874,7 +874,8 @@ static int xdbc_bulk_write(const char *bytes, int size)
 
 static void early_xdbc_write(struct console *con, const char *str, u32 n)
 {
-	static char buf[XDBC_MAX_PACKET];
+	/* static variables are zeroed, so buf is always NULL terminated */
+	static char buf[XDBC_MAX_PACKET + 1];
 	int chunk, ret;
 	int use_cr = 0;
 
-- 
2.34.1

