Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4C0EB64D7
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 10:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjFZK6V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 06:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjFZK6S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 06:58:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAA610EA
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 03:58:11 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313e34ab99fso2318593f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687777090; x=1690369090;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wTFFYlEacnCLuLIvI9hxugao/WlAGmt8S0+ic9iMMM=;
        b=HgHm+mJEpvZ08t2fUwrsbQn7G1TAQPnOtjTod7u2J6zZWokbC1xHXBHQfgb/K3Ngio
         J30pnq4MAgl9hB/gMbnkwGGiIXRDEmR8PMUjeeU5wVSiAJ3akho8u62RrEIYPuxWTLkD
         HYouB/n1GN55i/CdVd/gTK0FK+i7nFT409vJdlt3/qf33AbNHwup4+3jbF+zmCK+6Nwn
         OdGEtJahMRpM/9VRFomCUmJ+3KRu9GrC9WTbWqr+moE+yxyz91YZXKt6UKsNKMvQWlki
         JA7z80ciYtgH2KvY67MQNgUKxlwPlnydgCtrctLNtMXf2qJQyn78djfym5/3othlRqzm
         ExJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687777090; x=1690369090;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wTFFYlEacnCLuLIvI9hxugao/WlAGmt8S0+ic9iMMM=;
        b=ljbNQfWTHWytjBaipF2yPwY/LZ3p7Nt6vtikzAaF9A5tQA9P52Hxq//wsxlXAh3hnJ
         Zy/6rXHOFVjj9W/BkaSdxbmYV2p8z3Y6ncvq3sIBfxYttPMCxUlffdQLDOIHpivyHcox
         j6C17SkxNZD0Q+6Fco174f0MpYgAIJPHOvck/aPl7G8YjB51OnAk06Xe21HU/1tAAzdS
         bRa6l7uIk3Zdhz4ZD3PIsrD+WmqnXuXrJ4UJM2l9CqBsFnqPh6FNTUl6qC6CBenQk2mS
         EwnqoQZsFhj6Vza4U/RtisOBJUFdhcEBVBcDdJIwECwgUuXMLoe0YvRXUd4B9iD+yc34
         zo+A==
X-Gm-Message-State: AC+VfDzI5ikb2mnqJ1OSICbYhKD/N2U2QsnZuvlvRumLIq2gSc45Vzb7
        m38jXOQmE0adETCRmFS6LjyD2mKzclJLUEAJc1Y=
X-Google-Smtp-Source: ACHHUZ6+fJxWIb0t51vTNh6sIbcojiplFlynzACmCi59wKuqFvI+vy7PihZPoYSE4aMX2eFgChCdnw==
X-Received: by 2002:adf:dd88:0:b0:30a:dd15:bb69 with SMTP id x8-20020adfdd88000000b0030add15bb69mr20166780wrl.18.1687777089934;
        Mon, 26 Jun 2023 03:58:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a0560001b0400b00307a86a4bcesm7057546wrz.35.2023.06.26.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 03:58:08 -0700 (PDT)
Date:   Mon, 26 Jun 2023 13:58:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Nilesh Javali <njavali@marvell.com>
Cc:     GR-QLogic-Storage-Upstream@marvell.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-scsi@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] scsi: qla2xxx: silence a static checker warning
Message-ID: <4aa0485e-766f-4b02-8d5d-c6781ea8f511@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch and Clang both complain that LOGIN_TEMPLATE_SIZE is more than
sizeof(ha->plogi_els_payld.fl_csp).

Smatch warning:
    drivers/scsi/qla2xxx/qla_iocb.c:3075 qla24xx_els_dcmd2_iocb()
    warn: '&ha->plogi_els_payld.fl_csp' sometimes too small '16' size = 112

Clang warning:
    include/linux/fortify-string.h:592:4: error: call to
    '__read_overflow2_field' declared with 'warning' attribute: detected
    read beyond size of field (2nd parameter); maybe use struct_group()?
    [-Werror,-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

When I was reading this code I assumed the "- 4" meant that we were
skipping the last 4 bytes but actually it turned out that we are
skipping the first four bytes.

I have re-written it remove the magic numbers, be more clear and
silence the static checker warnings.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/qla2xxx/qla_def.h  | 1 -
 drivers/scsi/qla2xxx/qla_iocb.c | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_def.h b/drivers/scsi/qla2xxx/qla_def.h
index d44c4d37b50b..4ae38305c15a 100644
--- a/drivers/scsi/qla2xxx/qla_def.h
+++ b/drivers/scsi/qla2xxx/qla_def.h
@@ -4462,7 +4462,6 @@ struct qla_hw_data {
 
 	/* n2n */
 	struct fc_els_flogi plogi_els_payld;
-#define LOGIN_TEMPLATE_SIZE (sizeof(struct fc_els_flogi) - 4)
 
 	void            *swl;
 
diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index a1675f056a5c..9c70c4e973ee 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -3073,7 +3073,8 @@ qla24xx_els_dcmd2_iocb(scsi_qla_host_t *vha, int els_opcode,
 	memset(ptr, 0, sizeof(struct els_plogi_payload));
 	memset(resp_ptr, 0, sizeof(struct els_plogi_payload));
 	memcpy(elsio->u.els_plogi.els_plogi_pyld->data,
-	    &ha->plogi_els_payld.fl_csp, LOGIN_TEMPLATE_SIZE);
+	       (void *)&ha->plogi_els_payld + offsetof(struct fc_els_flogi, fl_csp),
+	       sizeof(ha->plogi_els_payld) - offsetof(struct fc_els_flogi, fl_csp));
 
 	elsio->u.els_plogi.els_cmd = els_opcode;
 	elsio->u.els_plogi.els_plogi_pyld->opcode = els_opcode;
-- 
2.39.2

