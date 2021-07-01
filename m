Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA5AC11F64
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 05:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2A066144F
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 05:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhGAGBA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jul 2021 02:01:00 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:17958 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhGAGBA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jul 2021 02:01:00 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d58 with ME
        id PhyS2500S21Fzsu03hyTkK; Thu, 01 Jul 2021 07:58:28 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Jul 2021 07:58:28 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     csully@google.com, sagis@google.com, jonolson@google.com,
        davem@davemloft.net, kuba@kernel.org, awogbemila@google.com,
        willemb@google.com, yangchun@google.com, bcf@google.com,
        kuozhao@google.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] gve: Fixes and clean-up
Date:   Thu,  1 Jul 2021 07:58:25 +0200
Message-Id: <cover.1625118581.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This serie is part of the effort to axe the wrappers in
include/linux/pci-dma-compat.h

While looking at it, I spotted:
  - a resource leak in an error handling path (patch 1)
  - an error code that could be propagated. (patch 2)
    This patch could be ignored. It's only goal is to be more consistent
    with other drivers.

These 2 paches are not related to the 'pci-dma-compat.h' stuff, which can
be found in patch 3.

Christophe JAILLET (3):
  gve: Fix an error handling path in 'gve_probe()'
  gve: Propagate error codes to caller
  gve: Simplify code and axe the use of a deprecated API

 drivers/net/ethernet/google/gve/gve_main.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.30.2

