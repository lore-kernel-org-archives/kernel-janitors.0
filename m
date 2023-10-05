Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C4E92718
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 15:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbjJEP6G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjJEP4t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 11:56:49 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614101347E
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 06:57:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3248ac76acbso924343f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514245; x=1697119045; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AooGTYUy452CMDPClrlTisOX8k1qSdGixxMstg0I9q0=;
        b=RXHKOdEK900FcuhVBywDk8NW2QQyrPnVZzSGHaCppaXF0yqIKMULLollDslbMvc0W2
         FcMBed8lKnDktsfnD+TmkWNtV0Aqs3C6gDFTvaaj4HWE/OxmUB60K/wMv05dmX9jcBC+
         a2qTcHku8g5tAt40GYteCXkgQZpauuTQmPCU7bYYprUZpxtH4t1VMoxWl4Hnp4TnkNVl
         nQ1ky6ZjrZGCNKP5N3V6Dixagr5IDmdZ9FMy/k2vEYKTgy3C5xfS5/S7XG5JFyKrCtN3
         71syKa/+TeN/zF1lD7/x7OsBB6tcO905CWXQtRFxGY1g8WHTChIJqjnxxu0dshJvllM8
         jvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514245; x=1697119045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AooGTYUy452CMDPClrlTisOX8k1qSdGixxMstg0I9q0=;
        b=RFwo2jDRVXGYEnr5NgovovAUs/EIEuIDDxJtNA3pvmTH7o/IiD/VzFXCJjVQ4wUCOb
         hP+0NUYOAdufFW91/YZbbmjkHJ2Zrw1Q0kfkPdfOGXJgawYzCO81W/6xICjbzj12/QlJ
         RwafiEW1R1SJSZfyLdSXllEHxBbLkjCvCVVinqr9GW0RRE4IMdJWJOcmfZ3JHOb+NvLA
         3XS+l+8A6Wph/7K9pzEh8+zSWquLmPTyloWCGcveKj8ynpijoveoyDR3y5SwwTmXQv5N
         PDLN0G03AsJ7rb6a5FeYm8yTCwWZdizLUIQI7ac2w+P6s4/AkO2jDSNbs/x7QCWPcZwo
         ANRA==
X-Gm-Message-State: AOJu0YxkqBXvKcZhIRFZe43O1C7RbLBYkPqDE7MQb2ATYJCLUg3jAw90
        iQFvq3m331deNrAle79g9g+DCxyazCwdHAiE9yY=
X-Google-Smtp-Source: AGHT+IGEGxGJ8wEps7sHxei6GOKIWpDvnRrTfQ/aBGCmZAYI2aBq2ytwW6bqUoWdRMnKb5xGjvnu4Q==
X-Received: by 2002:a5d:45c8:0:b0:317:dd94:ed38 with SMTP id b8-20020a5d45c8000000b00317dd94ed38mr4875974wrs.42.1696514244730;
        Thu, 05 Oct 2023 06:57:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q13-20020adff78d000000b0032415213a6fsm1861805wrp.87.2023.10.05.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:57:24 -0700 (PDT)
Date:   Thu, 5 Oct 2023 16:57:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Simon Horman <horms@kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next 1/2] igb: Fix an end of loop test
Message-ID: <4d61f086-c7b4-4762-b025-0ba5df08968b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When we exit a list_for_each_entry() without hitting a break statement,
the list iterator isn't NULL, it just point to an offset off the
list_head.  In that situation, it wouldn't be too surprising for
entry->free to be true and we end up corrupting memory.

The way to test for these is to just set a flag.

Fixes: c1fec890458a ("ethernet/intel: Use list_for_each_entry() helper")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/igb/igb_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index 2ac9dffd0bf8..c45b1e7cde58 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -7857,7 +7857,8 @@ static int igb_set_vf_mac_filter(struct igb_adapter *adapter, const int vf,
 {
 	struct pci_dev *pdev = adapter->pdev;
 	struct vf_data_storage *vf_data = &adapter->vf_data[vf];
-	struct vf_mac_filter *entry = NULL;
+	struct vf_mac_filter *entry;
+	bool found = false;
 	int ret = 0;
 
 	if ((vf_data->flags & IGB_VF_FLAG_PF_SET_MAC) &&
@@ -7888,11 +7889,13 @@ static int igb_set_vf_mac_filter(struct igb_adapter *adapter, const int vf,
 	case E1000_VF_MAC_FILTER_ADD:
 		/* try to find empty slot in the list */
 		list_for_each_entry(entry, &adapter->vf_macs.l, l) {
-			if (entry->free)
+			if (entry->free) {
+				found = true;
 				break;
+			}
 		}
 
-		if (entry && entry->free) {
+		if (found) {
 			entry->free = false;
 			entry->vf = vf;
 			ether_addr_copy(entry->vf_mac, addr);
-- 
2.39.2

