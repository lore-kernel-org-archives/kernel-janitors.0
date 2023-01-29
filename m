Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEA8C05027
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Jan 2023 18:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbjA2SVu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Jan 2023 13:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjA2SVt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Jan 2023 13:21:49 -0500
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30931ADDD
        for <kernel-janitors@vger.kernel.org>; Sun, 29 Jan 2023 10:21:47 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id MCJCpl46wEUgAMCJCp8QgR; Sun, 29 Jan 2023 19:21:45 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Jan 2023 19:21:45 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org, peterz@infradead.org, pmladek@suse.com,
        john.ogness@linutronix.de, baolu.lu@linux.intel.com,
        tglx@linutronix.de, mingo@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] usb: early: xhci-dbc: Some fixes and speed-up
Date:   Sun, 29 Jan 2023 19:21:36 +0100
Message-Id: <cover.1675016180.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

While looking at places were using memcpy_and_pad() could be useful, I spotted
1 issue (patch 1) and 1 potential optimization (patch 2).
The use of memcpy_and_pad() is in patch 3.

Christophe JAILLET (3):
  usb: early: xhci-dbc: Fix a potential access to
  usb: early: xhci-dbc: Optimize early_xdbc_write()
  usb: early: xhci-dbc: Use memcpy_and_pad()

 drivers/usb/early/xhci-dbc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

