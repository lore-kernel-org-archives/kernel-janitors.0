Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66618C7EE24
	for <kernel-janitors@archiver.kernel.org>; Sat, 13 May 2023 07:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjEMHZn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 13 May 2023 03:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjEMHZl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 13 May 2023 03:25:41 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54BC55AB
        for <kernel-janitors@vger.kernel.org>; Sat, 13 May 2023 00:25:39 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id xjdGpI56xdpXhxjdGp2faT; Sat, 13 May 2023 09:25:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1683962736;
        bh=dm1js3DpRsFKlJofm66SHdhk3V8VdMOV8treZOSyphE=;
        h=From:To:Cc:Subject:Date;
        b=L4AVwkN3WRFE2VGWXmE8i6eudxgexNn3dRrKFYAJWJRrKj+48u86O3eRTa5ol/AZb
         Ki9sLnHYWUQZp+MCLK3ibmjUQGyAcnJAF8EBGQXsVZlDWXT3VsjwnTkecnfn4yqLaM
         fOOrZ/SHL5u/GE/OF3m9V/jcaPeYnLVfspvIuswkcrWwNd3Xxb+u3VOzyhsSbwGWEV
         zJ/lbxD9f2VmW0batGkWiNNU8T6LuGri1miPsYPEyrVDjyilBt6oNJtV+0loIZT4eD
         VnahBKr19kFjfXZWiHjajVozLbRfVcUA8yYiKfuQaThBgDVBYCHk1Ypw6dVIJZe6wb
         aZdeC5A4S2CrA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 13 May 2023 09:25:36 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Pravin B Shelar <pshelar@ovn.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org, dev@openvswitch.org
Subject: [RESEND PATCH net-next] net: openvswitch: Use struct_size()
Date:   Sat, 13 May 2023 09:25:31 +0200
Message-ID: <e7746fbbd62371d286081d5266e88bbe8d3fe9f0.1683388991.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20230513072531.Neci5xKNvH33PRjFXggiJJxkBsoMYdbCdolpaN3mIDA@z>

Use struct_size() instead of hand writing it.
This is less verbose and more informative.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It will also help scripts when __counted_by macro will be added.
See [1].

[1]: https://lore.kernel.org/all/6453f739.170a0220.62695.7785@mx.google.com/


Resending now that net-next is re-opened.
---
 net/openvswitch/meter.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/openvswitch/meter.c b/net/openvswitch/meter.c
index f2698d2316df..c4ebf810e4b1 100644
--- a/net/openvswitch/meter.c
+++ b/net/openvswitch/meter.c
@@ -69,9 +69,7 @@ static struct dp_meter_instance *dp_meter_instance_alloc(const u32 size)
 {
 	struct dp_meter_instance *ti;
 
-	ti = kvzalloc(sizeof(*ti) +
-		      sizeof(struct dp_meter *) * size,
-		      GFP_KERNEL);
+	ti = kvzalloc(struct_size(ti, dp_meters, size), GFP_KERNEL);
 	if (!ti)
 		return NULL;
 
-- 
2.34.1

