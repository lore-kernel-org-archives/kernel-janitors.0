Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8334AAF9
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Mar 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635167; cv=pass; b=fwPj0dUo0LRtDguqgPUI6idGhAF9Iw3g6Ifs4ejle5M/OU6kUCyHMot+5jfp74+3tOc9AeLGjzhSR07S3gp3q2/5du4GfatANKsiwVHFa1XvDp+2DRQf0JE7P7QPKy2Yc+riBBQlNKA36Vr5Sfptp5gfchscmZZ9saQZZ311+kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635167; c=relaxed/simple;
	bh=xrJ4AxKLWU1gZ3JRL+IRDBgbgEhT9cgiP347gXioWmc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U5UbbagNFi/v9fOdy1G8QFXnAnR7wO7cktyX8S19caJIcrZzeMxznAQZUIzhg2CJZOPm4sCP/esVQgcioGsILjv4cVKbD1ti0cvi5rsCf8B8b6DOzGnEL7ca3FTiie3lAEgFlSzsw1aQDnSmGqstoGvNKGD5tvMuJQyU/oQQ/rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TatUknIr; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TatUknIr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66b678e75fdso309911a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Mar 2026 11:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774635163; cv=none;
        d=google.com; s=arc-20240605;
        b=OK6MLZEA/vijrTVin/yP+GxTenV+LnhfJd/F6o6NsCu6yvfztbbd3RiLxogOLPpDKQ
         MYFOzEzsOr+clG5SQ1Tkc5b3aJNFW9brLCzkOaX/hr/MgYtZj3tGbP1OxghQu3dINTcp
         cX1DRJqMBGBEb3Y8ImZISc/aqbc50p1X9bZYrUE2pj6w/dIkzXVlas3NzE0quTz+b8p5
         IigDgTvw0R35KhSxUz5K2sc57I9YUwyLqzmpmlHocGpWU28JQute0p80MHbkUcGol2Xr
         z62TYH4IqOGaoUWn6u3am/XLhUyhUnuIfZISykr92XQ4ct7E+IuMTO+OAeBIippN/d4F
         9QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XmfxdbNGoSAaJu1qdryT8tBwPuy4J86sd8B4C6YgkoU=;
        fh=Q6l3+RubHshejQRxLPX8TiOvrqlfI9pfnoNMiaQUZeE=;
        b=ZYfY54hObkBqFdZYKS/6W1/EZuJLcD2a/YLPxMlVTDt7e5hDGc0k11CwLYQdRbZwID
         OFevT863oF7e6Lqxpxm3o5zPYy6RdCJ7j7NI2SyRx/dFa1GB7Wm3ZM99zMpwSAnaTQVx
         aMYPcljwOkDR03l+2UrTQMwsg0jp0QMGNAYKy9djgeLLeTJ4KwwZHeywcza07IXmroGl
         QaIcGruIzJ/+Z1zvzt/u0sdXV38MaOKyIGp+euDcqYIElAsLQzhBIBag7S7AbjhOl4Jo
         bHXbTYflOeMtK3KioLUr8syzEsxU3Ww2BMJ4KOz8ZRWgYHiq7mETN+x57qhwEetl600V
         CN4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774635163; x=1775239963; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmfxdbNGoSAaJu1qdryT8tBwPuy4J86sd8B4C6YgkoU=;
        b=TatUknIrMsXFUXo1YhG4U9zRz6ahwdKhTS/gXkGRsD+cz4newH8AOXhE9jcMRYIyG/
         bkWKx3c6qgV/nxnKpKtEaTi0IM9A7t8tdezzImzuK9ZOvbq4fZvvVSst2TBfujXtCIDn
         fycjh1bhw8hYwC+FBz9w+GlhcUYOXajzYk56ret3++42umP4OQXMs9mSshOscOlI/5pJ
         9OWvrOGtyZQ1kdXTOUruJW4TKLrshbrfLO2DIgCF4y3VR1A4CK3JcO2bnNxgum2Snoy8
         Q1cMALU6JClcE8knSge2Al3U6fSrauatxiHZuMAAVcbCyF5HBU/H1kdByas8cxDjTk7E
         i3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635163; x=1775239963;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmfxdbNGoSAaJu1qdryT8tBwPuy4J86sd8B4C6YgkoU=;
        b=O114cGvCYdzcnLMA92VyfhWZITTmAGRSnvN/4SIf5OHBnQ98jQJJNdZV0M5xwQEuGc
         /gjOC5S9DP6b2RTLr4tifV4KXeYRaU53i3XkMQ5bsarSXCvw/Skb42mxJEiSVVTKVOtb
         8MCkRd+qTsKNM1sJbgqjq9w8/g8ZK67La15DCQ4zwOrHuFpn0mgvrmOmxO9tNlcZ+f26
         Bb1aOgoyA8YAG9PPDp5Fm5zxIAc2P+o+XNzivL/qEgWxf214cL3J6jvAlYeAEE5yIAje
         P9ubi+U3u2+HqEVxZb5dSr9ROgTWHMHJPOTHGnM+EbZqVosK9XgrPht142AXP+OtkQCf
         5beg==
X-Gm-Message-State: AOJu0YzBMdhH7/ZM064AnBycwgwqgvmgTn/xG+x0LsuXeCOluTjB3Psi
	uhy9e2jATxp7WJ2Hzs2OCW8AlYaO++kju4m1ggkxItbAScnnaqGMqbP9M4NU5b/qZ4bj9G3Kcja
	gOVXoWKIEItNPmVbiSXU1VqBmPjv8JN5EdTmdEvk=
X-Gm-Gg: ATEYQzznjZkvhKGVWvdWisrsKuEqK/z7+rYnkHqaMaHqZRTlKLQ6IVFaDkWZv+2Ca7i
	f1hvutKaXZM2tUOQbl07RvxqipVQRgKuPlFmEQdw6gpBWrTFJvymINyo53ma2vfmik1pDCb5jnG
	+3pE5e2iV2XEr4A1bQPvzEEQ5JiP12TU0ZX8STAMVUhBRKzhffNQePs5DJA56LbPKizl9Ze+nNb
	Xhv4AaiXZItRaeZRyfdHvXuBtqG2lZHYiKgF1wFOIJW2T22gtZMnrL/4o2pBs9iepHGF/0EFaSF
	p/5Pvi/x05Kq59CVO+rJFD5p7aEXG2mCXz8bNfxLITVWLL2T65sLsVmTGBhbaGvDdWkEEN2zmDL
	6JueIuLi7+0iiP8qvSir7/Q==
X-Received: by 2002:a05:6402:35c7:b0:663:71dc:1278 with SMTP id
 4fb4d7f45d1cf-66b2836b448mr2582342a12.1.1774635162905; Fri, 27 Mar 2026
 11:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Fri, 27 Mar 2026 18:12:30 +0000
X-Gm-Features: AQROBzDrmZNCxmJ4n9XW10OXKUurYKfEebfgtVCBp5vNI4e2RcsFCAlbW_L39aI
Message-ID: <CACwZE5SJiHmoufCMAP5pJtRn=LRN9Jp3=zSh2j0UoUikwVKr-g@mail.gmail.com>
Subject: [PATCH] Ensure Dreamcast VMU code keeps building
To: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make necessary include explicit

Signed-off-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
---
drivers/mtd/maos/vmu-flash.c | 1+
1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..7c18658a5e7d 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -6,6 +6,7 @@
  * Copyright (c) Paul Mundt 2001
  */
 #include <linux/init.h>
+#include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
--
