Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF747C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 15:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE8556115A
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 15:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhJEPSE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Oct 2021 11:18:04 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60900
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235709AbhJEPSD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Oct 2021 11:18:03 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9C8753FFEA;
        Tue,  5 Oct 2021 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633446971;
        bh=QvIq1h9e/NhyWPRySEGTralffxgGmERWgEP2mQB01KM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=WQCsf16xlonqTKrvB6VvrnLWy3lGEt1zYlmSjqrfimyiIJ602hd1J4b0ZKRgS6qDQ
         jkFEVgJNKJ4osEMI71osYYHSRCbXMHe4ZyVj9NLD4BElT5na+cUXSgjYoWO9PvkUMV
         k6BOgCCDtFFVAST9Ej25fe+EWj/enZOzM2h7SUFfSUHXQhcRFQATnl1O4WlIodQ2BO
         fG+J0BzxztbALuShndTtaY57SntV5nwZfEtgEJ3xV8XA6AbRSyfrQnHtMVwwl1/AAB
         APV2XlXHgWLMGSadJ9irMSldQbuGISY8qE5mLJHUT1tUBFU4tVdolduxurZi1sMkxs
         oKZKXcYg/6mgg==
From:   Colin King <colin.king@canonical.com>
To:     Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ipmi: ipmb: Fix off-by-one size check on rcvlen
Date:   Tue,  5 Oct 2021 16:16:11 +0100
Message-Id: <20211005151611.305383-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an off-by-one bounds check on the rcvlen causing a potential
out of bounds write on iidev->rcvmsg. Fix this by using the >= operator
on the bounds check rather than the > operator.

Addresses-Coverity: ("Out-of-bounds write")
Fixes: 0ba0c3c5d1c1 ("ipmi:ipmb: Add initial support for IPMI over IPMB")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_ipmb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
index b10a1fd9c563..77ebec4ed28e 100644
--- a/drivers/char/ipmi/ipmi_ipmb.c
+++ b/drivers/char/ipmi/ipmi_ipmb.c
@@ -192,7 +192,7 @@ static int ipmi_ipmb_slave_cb(struct i2c_client *client,
 		break;
 
 	case I2C_SLAVE_WRITE_RECEIVED:
-		if (iidev->rcvlen > sizeof(iidev->rcvmsg))
+		if (iidev->rcvlen >= sizeof(iidev->rcvmsg))
 			iidev->overrun = true;
 		else
 			iidev->rcvmsg[iidev->rcvlen++] = *val;
-- 
2.32.0

