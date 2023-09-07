Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60103EC8742
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 17:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbjIGRRZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242885AbjIGRRX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 13:17:23 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D31C171C;
        Thu,  7 Sep 2023 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eOVoT6V7KWNNEIeADoIjwh0zS86Ag75fR3Q12aE6oes=;
  b=YSzuTvQA1jS+b4RjgU0BGQ9rm6YONlbqmUWkHmpA7Ni8z+ubJcrp4Xi4
   QSyaSS4iH3rh7puO2ZE0ujv75PkCRRHmoJqmItOf67TgDYmEH3tZulHik
   5r7mYK/CQtqqOQ9I9Xfv6/q81mevXo6QCyyLqrCEcHf+66hVN9wv/nNOI
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324670"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:31 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] ASoC: rsnd: add missing of_node_put
Date:   Thu,  7 Sep 2023 11:55:20 +0200
Message-Id: <20230907095521.14053-11-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

for_each_child_of_node performs an of_node_get on each
iteration, so a break out of the loop requires an
of_node_put.

This was done using the Coccinelle semantic patch
iterators/for_each_child.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/sh/rcar/core.c |    1 +
 1 file changed, 1 insertion(+)

diff -u -p a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1303,6 +1303,7 @@ audio_graph:
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
 			of_node_put(node);
+			of_node_put(ports);
 			break;
 		}
 	}

