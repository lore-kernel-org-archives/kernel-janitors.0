Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E71C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 07:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FAC661458
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 07:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhEHHYR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 03:24:17 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:40916 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhEHHYQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 03:24:16 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d37 with ME
        id 27PA2500P21Fzsu037PBZZ; Sat, 08 May 2021 09:23:13 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 May 2021 09:23:13 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     rjw@rjwysocki.net, lenb@kernel.org,
        andriy.shevchenko@linux.intel.com
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ACPI: scan: Fix a memory leak in an error handling path
Date:   Sat,  8 May 2021 09:23:09 +0200
Message-Id: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'acpi_device_set_name()' fails, we must free
'acpi_device_bus_id->bus_id' or there is a (potential) memory leak.

Fixes: eb50aaf960e3 ("ACPI: scan: Use unique number for instance_no")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index a22778e880c2..651a431e2bbf 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -700,6 +700,7 @@ int acpi_device_add(struct acpi_device *device,
 
 		result = acpi_device_set_name(device, acpi_device_bus_id);
 		if (result) {
+			kfree_const(acpi_device_bus_id->bus_id);
 			kfree(acpi_device_bus_id);
 			goto err_unlock;
 		}
-- 
2.30.2

