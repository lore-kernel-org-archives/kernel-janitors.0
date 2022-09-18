Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA314C6FA86
	for <kernel-janitors@archiver.kernel.org>; Sun, 18 Sep 2022 06:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIRG1V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 18 Sep 2022 02:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIRG1U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Sep 2022 02:27:20 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BA025C47
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Sep 2022 23:27:18 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id ZnlsomI4hr5PdZnlsoraTc; Sun, 18 Sep 2022 08:27:17 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 18 Sep 2022 08:27:17 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] misc: microchip: pci1xxxx: Fix the error handling path of gp_aux_bus_probe()
Date:   Sun, 18 Sep 2022 08:27:15 +0200
Message-Id: <cover.1663482259.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 3 patches are all related to error handling in the gp_aux_bus_probe() probe.
They have been splitted to ease review.

Christophe JAILLET (3):
  misc: microchip: pci1xxxx: Do not disable the pci device twice in
    gp_aux_bus_remove()
  misc: microchip: pci1xxxx: Fix a memory leak in the error handling of
    gp_aux_bus_probe()
  misc: microchip: pci1xxxx: Fix the error handling paths of
    gp_aux_bus_probe()

 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 78 ++++++++++---------
 1 file changed, 40 insertions(+), 38 deletions(-)

-- 
2.34.1

