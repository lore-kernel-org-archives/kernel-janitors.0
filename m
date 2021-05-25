Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC23FC2B9F8
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 04:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF026141F
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 04:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhEYEHb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 May 2021 00:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEYEHa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 00:07:30 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8977BC061574;
        Mon, 24 May 2021 21:06:01 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id 105so10055760uak.8;
        Mon, 24 May 2021 21:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZiDan9dXVGzljGcSZKPfVX7WRo0V+2AqnJOcfMOnQww=;
        b=D5n2ETATta69U/pKGykggX+cHanHnfSc4MGuc/zzkdsYy0gS2VnxMtN1jTzfC2Xi9b
         EFP4ml6Jn6LiTajZfcR07sevsMrBTcEdKnczR4wW6T9uNy4GGV+jXmwPjOsUNMsKTl26
         WoHtHm8NzgE2hQSefNie/YnfJV49fsXeFOa/mDJ/rX9CS9jEtGJ/BYfkB09Ae0brt83G
         fRFx+tLyEs/6NwTZoVm0mgEeW9QGfz9gt+qId6FIpNpqho98MZxeXNSWRir3f9qQjhE0
         0KYaqCSpp6uJsAAsFiMBCQdww+sjp+3/mm9suTWZViFs2SaOTZWotbks4mUavRRhimFS
         dMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZiDan9dXVGzljGcSZKPfVX7WRo0V+2AqnJOcfMOnQww=;
        b=YOZsgZFr9x8elghWtJl+wwSDHNs3ACusaCsEs1Ig8eJLdYnxrdww3HB72Jx/q3gH0X
         ZN0Fo/icEQpOLDAyXv+ahccANgByFhXdkz5Jss5tGU99azAfi9OlqrtVa0lu1KxY3tpO
         AezAB9QSJ9tRI1mUE4vAtOdJex35HG2TpJiYM8AMvYKW+GLd7vlGb5bH73i+1sn+6Nwm
         1/imo4rhm8e9PipQRMM3YzyMl23pC/HYMKUd+vh9WlsWwzKxOSEqudLzxv6TAoMHwb/o
         eBghxsq6gooXvFFKybKyOdF6qwqI1eepO/hCuJif+/0xfTWYlNyNGsH6D3iUssvT+J3z
         1VDw==
X-Gm-Message-State: AOAM531ZyqdgHr58LO4Wk9m4YN0gH5bKsrWxdjlUwvUDtA44ukv6hm1z
        oc22w+f9tGF0wKzPSHv9EJhWjbmni5tXpaKQ
X-Google-Smtp-Source: ABdhPJwFqkNf60V+7GW8tjF1W7eozuZ4lQ0psHNdtj6/sAvFyNl0pQUyYOdFzN7XhjNyoab/aIv01w==
X-Received: by 2002:ab0:4385:: with SMTP id l5mr24758938ual.76.1621915560802;
        Mon, 24 May 2021 21:06:00 -0700 (PDT)
Received: from fedora ([187.252.202.191])
        by smtp.gmail.com with ESMTPSA id 34sm1336421vkn.53.2021.05.24.21.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 21:06:00 -0700 (PDT)
Date:   Mon, 24 May 2021 23:05:58 -0500
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Roopa Prabhu <roopa@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     bridge@lists.linux-foundation.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] net: bridge: remove redundant assignment
Message-ID: <YKx3ptXPNbd3Bdiq@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The variable br is assigned a value that is not being read after
exiting case IFLA_STATS_LINK_XSTATS_SLAVE. The assignment is
redundant and can be removed.

Addresses-Coverity ("Unused value")
Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 net/bridge/br_netlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
index e4e6e991313e..8642e56059fb 100644
--- a/net/bridge/br_netlink.c
+++ b/net/bridge/br_netlink.c
@@ -1644,7 +1644,6 @@ static size_t br_get_linkxstats_size(const struct net_device *dev, int attr)
 		p = br_port_get_rtnl(dev);
 		if (!p)
 			return 0;
-		br = p->br;
 		vg = nbp_vlan_group(p);
 		break;
 	default:
-- 
2.31.1

