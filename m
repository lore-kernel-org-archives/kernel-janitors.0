Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF18EB64DD
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jul 2023 06:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjG0GdU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jul 2023 02:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjG0GdR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jul 2023 02:33:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A55F1FFA
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 23:33:11 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fd0f000f1cso3234055e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 23:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690439590; x=1691044390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr9rJ8k4HdXxHK6MWWzJchB/1BvDzSrFqDGod486aAs=;
        b=rl/LDZhEEYPIz5gW4DiwpTZHn8QMdN7t95X8dE1a0Tlnaz/MPBB6QP74M8SYIC8zOr
         0jUbcZ//jHzTCN0k7/UKTn5f0oDr4HfoaSqQfRzBQobmGTp8K3XbQIbRh3DqKRF40jWR
         Z8A00Y6y91OnDrqj5QIEm9sfhcfqGo73rKkN+pfN8jWfX2MR7I6+ZjwnlIV1na23P7nn
         xcgdxC+ygVL5n8UyHiiZONCsUDqvoNdnW+VPsd/02sdKfZziw1w8iFP80JkcYy9FYOgb
         YnQXeA1W/N3f/W5Y4mkgwaAYOBQ/DMK6PWT5NhSpuotcE0jLrHZyOzyxXY6e7VMPy9pm
         fveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690439590; x=1691044390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mr9rJ8k4HdXxHK6MWWzJchB/1BvDzSrFqDGod486aAs=;
        b=grWOn9PqaRgcdkVCtFhTyVjleqCb1Lp6TxUDKdGmriHtrMP5nlFU2Cm3mmKhCN7k4X
         skiNVJGL5GDiRohXbGDMJu76Ln8bQ+2ST4KFwMcNN3Z+f2t9I0YQN2seDx4ld86sNsWQ
         efnMQjCmUGD8z4kJ+qYktiC3+65G2U25Jturd9MSQRmUInskJVMeoZX3mPMnYSqlTJ7V
         mtzLNOLyo1KA3pLIcGsy5pBYsWKPsF8sYHxG5GQWFtxzUuyuF6shIyyn+DpKnzHE1Pt1
         xbxRpcFMDYOs+G/my/wiHolaMbi/mAsOl0z08ykFhVXH5r3ZsXSOPRcYeHSdWTpyrk6D
         Qvog==
X-Gm-Message-State: ABy/qLZ2dyOEAO4ZWPFM3/51H7tBQl0VoCrubNMnkxOEMxD9Z9iG/xuy
        eTuOIaz995g7OPESc4mDG1x7s8ClbSefeCLNoPM=
X-Google-Smtp-Source: APBJJlHjGEJ7P8IwGZgfX9ndKzMNGH0AhWAXzqmnAZgqAzHWkMbjkiyNx+u7k1MvAiwnmIlHIFQf3g==
X-Received: by 2002:a1c:7c03:0:b0:3fb:4064:7e22 with SMTP id x3-20020a1c7c03000000b003fb40647e22mr835841wmc.19.1690439589765;
        Wed, 26 Jul 2023 23:33:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm3808267wmc.0.2023.07.26.23.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 23:33:09 -0700 (PDT)
Date:   Thu, 27 Jul 2023 09:33:06 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     sumang@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Install TC filter rules in hardware based
 on priority
Message-ID: <e5ac49d5-2f37-48a5-805f-1444bcfdab48@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Suman Ghosh,

The patch ec87f05402f5: "octeontx2-af: Install TC filter rules in
hardware based on priority" from Jul 21, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:860 otx2_tc_update_mcam_table_del_req()
	error: uninitialized symbol 'cntr_val'.

drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
    837 static int otx2_tc_update_mcam_table_del_req(struct otx2_nic *nic,
    838                                              struct otx2_flow_config *flow_cfg,
    839                                              struct otx2_tc_flow *node)
    840 {
    841         struct list_head *pos, *n;
    842         struct otx2_tc_flow *tmp;
    843         int i = 0, index = 0;
    844         u16 cntr_val;
    845 
    846         /* Find and delete the entry from the list and re-install
    847          * all the entries from beginning to the index of the
    848          * deleted entry to higher mcam indexes.
    849          */
    850         list_for_each_safe(pos, n, &flow_cfg->flow_list_tc) {
    851                 tmp = list_entry(pos, struct otx2_tc_flow, list);
    852                 if (node == tmp) {
    853                         list_del(&tmp->list);
    854                         break;
    855                 }
    856 
    857                 otx2_del_mcam_flow_entry(nic, tmp->entry, &cntr_val);

otx2_del_mcam_flow_entry() looks like it can fail.

    858                 tmp->entry++;
    859                 tmp->req.entry = tmp->entry;
--> 860                 tmp->req.cntr_val = cntr_val;
    861                 index++;
    862         }
    863 
    864         list_for_each_safe(pos, n, &flow_cfg->flow_list_tc) {
    865                 if (i == index)
    866                         break;
    867 
    868                 tmp = list_entry(pos, struct otx2_tc_flow, list);
    869                 otx2_add_mcam_flow_entry(nic, &tmp->req);
    870                 i++;
    871         }
    872 
    873         return 0;
    874 }

regards,
dan carpenter
