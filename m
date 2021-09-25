Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C25C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Sep 2021 06:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E229D61260
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Sep 2021 06:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344294AbhIYGrf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Sep 2021 02:47:35 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:41994 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344431AbhIYGrb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Sep 2021 02:47:31 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d51 with ME
        id y6lt2500M4m3Hzu036luKY; Sat, 25 Sep 2021 08:45:55 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Sep 2021 08:45:55 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com,
        suganath-prabu.subramani@broadcom.com
Cc:     MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/1] scsi: mptctl: Remove usage of the deprecated "pci-dma-compat.h" API
Date:   Sat, 25 Sep 2021 08:45:51 +0200
Message-Id: <cover.1632551759.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This cover letter is only there to draw attention on the fact that I'm a bit
unsure about the use of GFP_KERNEL in 'kbuf_alloc_2_sgl()'.

In all conversion that I've done, GFP_USER was never used. I don't fully
understand the difference between GFP_USER and GFP_KERNEL.

So please review with care.


For the 3 other functions, I'm much more confident. I've put the explanation
of why I think that GFP_KERNEL is safe in patch 1/1.
Basically, these functions already call some functions that can sleep.


Christophe JAILLET (1):
  scsi: mptctl: switch from 'pci_' to 'dma_' API

 drivers/message/fusion/mptctl.c | 82 ++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 33 deletions(-)

-- 
2.30.2

