Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A207C352A1
	for <kernel-janitors@archiver.kernel.org>; Sat,  3 Dec 2022 16:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiLCQvs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 3 Dec 2022 11:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiLCQvm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 3 Dec 2022 11:51:42 -0500
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBF721270
        for <kernel-janitors@vger.kernel.org>; Sat,  3 Dec 2022 08:51:10 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 1VjGpuTflbw2u1VjGpvypk; Sat, 03 Dec 2022 17:51:08 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 03 Dec 2022 17:51:08 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH] net: xsk: Don't include <linux/rculist.h>
Date:   Sat,  3 Dec 2022 17:51:04 +0100
Message-Id: <88d6a1d88764cca328610854f890a9ca1f4b029e.1670086246.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no need to include <linux/rculist.h> here.

Prefer the less invasive <linux/types.h> which is needed for 'hlist_head'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Let see if build-bots agree with me!

Just declaring 'struct mutex' and 'struct hlist_head' would also be an
option.
It would remove the need of any include, but is more likely to break
something.
---
 include/net/netns/xdp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/netns/xdp.h b/include/net/netns/xdp.h
index e5734261ba0a..21a4f25a187a 100644
--- a/include/net/netns/xdp.h
+++ b/include/net/netns/xdp.h
@@ -2,8 +2,8 @@
 #ifndef __NETNS_XDP_H__
 #define __NETNS_XDP_H__
 
-#include <linux/rculist.h>
 #include <linux/mutex.h>
+#include <linux/types.h>
 
 struct netns_xdp {
 	struct mutex		lock;
-- 
2.34.1

