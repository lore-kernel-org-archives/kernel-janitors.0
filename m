Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38243EB64D7
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Jun 2023 07:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjFUHVl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Jun 2023 03:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjFUHVj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jun 2023 03:21:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6432E183
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:21:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31109cd8d8cso5468032f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jun 2023 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332097; x=1689924097;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=gwX3I3y3JXGrO1fvvhPpZ2E3xlM4/joWTGZoQufhuS1+pPp2RUQ/kSFoMiwJJnceDX
         uiwyIYTj/8dw1EADck2P0Wv78wiXl2JCfd8UaAb3Sb6Bw5KnCIAJmGkEoTuzRe4itxbn
         ZuzrG3JukXgGl5rjPqtosS/XigPt+G+VA4r5yAygLs78F+y2V5a5d6B/P+HmFO+IBO6O
         nHjNb24iEOUUTwZffHQtqmecPCypsQesaFCIXjn96Hdu39OgqWvhWSK/GcLTVAsbCUAY
         i7bYMSjrKg7UwaxtwcCas54se3kJaakK4Qt6xEDoEiZ1i4Ljit5uxdEfnjeHlFH0qyHG
         dB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332097; x=1689924097;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=JfFVv9x3lsUytCBdQsCGFuTzwwIvxFuN6Z0jHafDH6Lj21xNrgykbNBQHA4ipWfoEG
         1bJfWCJz2z2q04UBWeJNLE/MybPZ/5TE5ebpGoPLEE+mnqtNYPkIeiBp+Sf9JjOz3Smw
         FsMVFVSu3m6xLJgHVl1OuGiiodKiZz43Ve5gb9JL3dU6/OkDFUSD9Y/hEW33uBetmbr1
         uZLL0tWU8J184UMYEKto6Y6bOszLfg/48hm6b0CQ9bmY32gMoaKC7BU7gm9EFJsts3qg
         sh3DuSO90CCj0TtUEBgwt/maAz61mAEI/PqiKlmuO3CpntEHLRf64nF6uRVIUV+jrr/6
         VC9w==
X-Gm-Message-State: AC+VfDxDFTketdorAnWkp4M2Be2eQhSJgPFEMDXNsAuh8o4IrTahpTJu
        KLnj/MJ1ceykdTCmKR4sSbBgog==
X-Google-Smtp-Source: ACHHUZ60HKjNzSz8LdbwOSE2Cw7gl9ezizd0yDDWDAe3HI8NT9eurE9ffYF6AYJtLl+48w22r4UjUw==
X-Received: by 2002:a5d:63c5:0:b0:30f:cf93:4bb8 with SMTP id c5-20020a5d63c5000000b0030fcf934bb8mr10906719wrw.57.1687332096781;
        Wed, 21 Jun 2023 00:21:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b00309382eb047sm3626326wrd.112.2023.06.21.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:21:35 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:21:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/5] accel/qaic: tighten bounds checking in encode_message()
Message-ID: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are several issues in this code.  The check at the start of the
loop:

	if (user_len >= user_msg->len) {

This check does not ensure that we have enough space for the trans_hdr
(8 bytes).  Instead the check needs to be:

	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {

That subtraction is done as an unsigned long we want to avoid
negatives.  Add a lower bound to the start of the function.

	if (user_msg->len < sizeof(*trans_hdr))

There is a second integer underflow which can happen if
trans_hdr->len is zero inside the encode_passthrough() function.

	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));

Instead of adding a check to encode_passthrough() it's better to check
in this central place.  Add that check:

	if (trans_hdr->len < sizeof(trans_hdr)

The final concern is that the "user_len + trans_hdr->len" might have an
integer overflow bug.  Use size_add() to prevent that.

-	if (user_len + trans_hdr->len > user_msg->len) {
+	if (size_add(user_len, trans_hdr->len) > user_msg->len) {

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on code review and not tested.

 drivers/accel/qaic/qaic_control.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 5c57f7b4494e..a51b1594dcfa 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (!user_msg->count) {
+	if (!user_msg->count ||
+	    user_msg->len < sizeof(*trans_hdr)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	}
 
 	for (i = 0; i < user_msg->count; ++i) {
-		if (user_len >= user_msg->len) {
+		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
 			ret = -EINVAL;
 			break;
 		}
 		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
-		if (user_len + trans_hdr->len > user_msg->len) {
+		if (trans_hdr->len < sizeof(trans_hdr) ||
+		    size_add(user_len, trans_hdr->len) > user_msg->len) {
 			ret = -EINVAL;
 			break;
 		}
-- 
2.39.2

