Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D044EC87FDE
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Jun 2023 11:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbjFILFV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Jun 2023 07:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238845AbjFILEx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Jun 2023 07:04:53 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08022113
        for <kernel-janitors@vger.kernel.org>; Fri,  9 Jun 2023 04:04:50 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30ae141785bso1577267f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Jun 2023 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686308689; x=1688900689;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXj1WwjbvB9/pMgnlgZ+4nn9ohz+hnVKVJRXwh0hBUI=;
        b=RPTqyNKRXVwFr2f498zOolCmS/QaBuMCBH2XsgfgSo9Ec2d51VIgjo3ANXJgxMwpdy
         Tadmr/fFjfY88AUjE5l4BNyB9Xe2TrKJCurkEVvshdhe0p0UsbVjjjVpRc+X9ZnaHyPz
         EUc0uhqzAm3fnLZnt3VyYvQ3vQoBYuTLMaOC+jf5otjZ9a+/eI1ViZBOxwVEFLc1FneB
         /3WHyiqm6hU08L2TNYiX2OwZsKr/PenI5uboqCTjak90Fr7ZR11XkXacbsTgDJ+6c8rl
         5kN+LnvROdePOiYCzH0sqMgEyFP9JIzSnzx0I20oDeO5VZX2n5duKfN5I0cRiM0nfH5L
         NlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686308689; x=1688900689;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXj1WwjbvB9/pMgnlgZ+4nn9ohz+hnVKVJRXwh0hBUI=;
        b=J2U3Iwcn6FcYmVnBlib7gXMpYD72Etcovtp9OVTEJWXyYUsazvnIkecM+Fp9S9339p
         K/k5JZJjqcL6DpSldtxl0/CjtWQjANQof6WbT6/A737/rCy0JmuOqY40aPsN+EhxT+mH
         x+EU3vT2Gd7YFcZvoVbQQjYRKreTFLAou4+Y+gfc1e2wJuid8gq88Q+OM/v6zVI7i7X+
         sbyUkiXKUCg1CJ2W8p2x7PB+xBMHDbFNmBctgOkud0XtQ9xMFPtsCidMd8wI+UqNx6af
         X97Q6LC8HnsaeqIqmqRhEIqTMtWATBzfw52LmCH79yrlS4n9/1dLol6KIKldTeESooR6
         846Q==
X-Gm-Message-State: AC+VfDxqAqcwG0K18flzT71e97wcShKj//Rm7wytqaGbwdPbjtI7Q63c
        LCRneOgZsq9QkXvcwKUSXq1EbA==
X-Google-Smtp-Source: ACHHUZ62BlqjebHJfa/aFzpvqpty56hZMNVb2Jao/A4jGFspbi9nX77fCrW3yRU6jOw7a4mSysm05w==
X-Received: by 2002:a5d:67c9:0:b0:30a:d747:b357 with SMTP id n9-20020a5d67c9000000b0030ad747b357mr720722wrw.56.1686308689368;
        Fri, 09 Jun 2023 04:04:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bl18-20020adfe252000000b0030adc30e9f1sm4147402wrb.68.2023.06.09.04.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 04:04:48 -0700 (PDT)
Date:   Fri, 9 Jun 2023 14:04:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc:     Xin Long <lucien.xin@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-sctp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2 net] sctp: handle invalid error codes without calling
 BUG()
Message-ID: <4629fee1-4c9f-4930-a210-beb7921fa5b3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sctp_sf_eat_auth() function is supposed to return enum sctp_disposition
values but if the call to sctp_ulpevent_make_authkey() fails, it returns
-ENOMEM.

This results in calling BUG() inside the sctp_side_effects() function.
Calling BUG() is an over reaction and not helpful.  Call WARN_ON_ONCE()
instead.

This code predates git.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is just from reviewing the code and not tested.

To be honest, the WARN_ON_ONCE() stack trace is not very helpful either
because it wouldn't include sctp_sf_eat_auth().  It's the best I can
think of though.

 net/sctp/sm_sideeffect.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 7fbeb99d8d32..8c88045f26c6 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -1250,7 +1250,10 @@ static int sctp_side_effects(enum sctp_event_type event_type,
 	default:
 		pr_err("impossible disposition %d in state %d, event_type %d, event_id %d\n",
 		       status, state, event_type, subtype.chunk);
-		BUG();
+		error = status;
+		if (error >= 0)
+			error = -EINVAL;
+		WARN_ON_ONCE(1);
 		break;
 	}
 
-- 
2.39.2

