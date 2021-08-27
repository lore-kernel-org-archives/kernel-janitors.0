Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A44C432BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A8A360F6C
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbhH0RST (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 13:18:19 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:31728 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231325AbhH0RST (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 13:18:19 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d74 with ME
        id mhHU250043riaq203hHUYF; Fri, 27 Aug 2021 19:17:29 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Aug 2021 19:17:29 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     eli.billauer@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 0/4] char: xillybus: Remove usage of the deprecated 'pci-dma-compat.h' API
Date:   Fri, 27 Aug 2021 19:17:27 +0200
Message-Id: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

However, updating 'drivers/char/xillybus' is a bit tricky because of its use of
'struct xilly_mapping' and 'struct xilly_endpoint'.

The first patch is just the easy part of the pci_  --> dma_ conversion. This is
mostly done with a coccinelle script.

The second updates 'struct xilly_mapping' (and code using it) to explicitly use
the dma_ API.

The third takes care of 'struct xilly_endpoint' (and code using it).

Finally, the 4th patch is a clean-up to remove a now useless parameter from
'xillybus_init_endpoint()'


These changes also offert the opportunity to merge some code from
'xillybus_pcie.c' and 'xillybus_of.c' into 'xillybus_core.c'.
See 'xilly_dma_sync_single_for_cpu_of()' and
'xilly_dma_sync_single_for_cpu_pci()' for example.

This goes beyond the scope of removing the usage of the deprecated
'pci-dma-compat.h' API. The need of 'xilly_pci_direction()' should then be
discussed.
It could be included afterwards it required.


All these patches have been compile tested only.


[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Christophe JAILLET (4):
  char: xillybus: Remove usage of the deprecated 'pci-dma-compat.h' API
  char: xillybus: Remove usage of 'pci_unmap_single()'
  char: xillybus: Remove usage of remaining deprecated pci_ API
  char: xillybus: Simplify 'xillybus_init_endpoint()'

 drivers/char/xillybus/xillybus.h      | 10 ++------
 drivers/char/xillybus/xillybus_core.c |  4 +---
 drivers/char/xillybus/xillybus_of.c   |  2 +-
 drivers/char/xillybus/xillybus_pcie.c | 33 ++++++++++++---------------
 4 files changed, 18 insertions(+), 31 deletions(-)

-- 
2.30.2

