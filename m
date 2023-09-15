Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDDCEE6440
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 08:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjIOIOV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 04:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbjIOIOQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 04:14:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346A63AAC
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 01:12:53 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-404732a0700so15695255e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694765571; x=1695370371; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nBcz24d1Uv1RZNghnP2ocTy4sdHcik9t3HUcbQZ4tg=;
        b=Di/kf2Wdm93Lrx3jrBGTAi3i660kqLizdAqSa4izaHnwA7rmtYQcMjV3aGa9LIXsG+
         yi2cGbOQ7LgCfh9yCKtJOXkQn5PV9/4OWxWwIQTQZbHdwilewhuoxOVGZk69fBjWV7mL
         +Y2jMRwVhktlE9sxu9ZIL3pIReZR5SxPChBtA2esuEgVPF4fum4AfUaw8x1p2Dqi22O4
         +6C+eDD5IxpsvT77vEsUSMbFwOLBOfmp+l4VJAQQB/ulyauerAg0Is5dNVkEogQjGsGD
         6irSMtLxPzIEvHowKC4QeeyYsenrivlYzpDlGNNG0rmG9TgbHRKDL8v9VrVkDVpxgnvB
         IqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694765571; x=1695370371;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nBcz24d1Uv1RZNghnP2ocTy4sdHcik9t3HUcbQZ4tg=;
        b=Gk3HLksOIYea3Pq8FVZtOndXTx1YP64/qi1gsWEvY+p3Q+bj1L0mM4160xnK8aH71+
         vae0fJ9TvvsSq4G3Ljnj0wwW44SDo/qr8MAXUycE16FGQrfYujoktUcjSsBDMAi+7oA3
         qeGrYABdUH/7eZHFr0XTBpf2zjHaAccs3xw+qevzvRqOc8G9dD60n7pqnqZbUMnsi3pt
         H4MDx48IjCzOmx2vCcX+ZyZGo8RbeARuDPDaujhbvmcNvH35njUOf/ABPH6kp/6zPVGz
         3qf9FviinWr3Bq237afTC1s0uvxO6+l1amXZZfUHoA/MGT0up4IiMs/9CK4jcvRwOYXE
         U9ow==
X-Gm-Message-State: AOJu0YzrL0ktgi+jd63BhnO2PjSydigEw9Zg7kTT+X/9MfyaN0kw4Ndj
        fQV0M69Epj6lLxQvkeFDIrzChI8O10TuAs6lE0I=
X-Google-Smtp-Source: AGHT+IHhjx+C2tXd6/fYAfk1dEjJySXvLSfq3+0Ehw02LkHJthywaVX6DUtWsNVb0JiNu+Y55DacTg==
X-Received: by 2002:a7b:c4cb:0:b0:401:6800:703c with SMTP id g11-20020a7bc4cb000000b004016800703cmr1007479wmk.21.1694765571493;
        Fri, 15 Sep 2023 01:12:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c014b00b00400268671c6sm3971315wmm.13.2023.09.15.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:12:51 -0700 (PDT)
Date:   Fri, 15 Sep 2023 11:12:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     jiri@resnulli.us
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] devlink: implement shared buffer occupancy monitoring
 interface
Message-ID: <e483bcad-10c6-43fb-9c49-57062728885b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jiri Pirko,

The patch df38dafd2559: "devlink: implement shared buffer occupancy
monitoring interface" from Apr 14, 2016 (linux-next), leads to the
following Smatch static checker warning:

	net/devlink/sb.c:699 devlink_nl_sb_tc_pool_bind_fill()
	warn: missing unwind goto?

net/devlink/sb.c
    651 static int
    652 devlink_nl_sb_tc_pool_bind_fill(struct sk_buff *msg, struct devlink *devlink,
    653                                 struct devlink_port *devlink_port,
    654                                 struct devlink_sb *devlink_sb, u16 tc_index,
    655                                 enum devlink_sb_pool_type pool_type,
    656                                 enum devlink_command cmd,
    657                                 u32 portid, u32 seq, int flags)
    658 {
    659         const struct devlink_ops *ops = devlink->ops;
    660         u16 pool_index;
    661         u32 threshold;
    662         void *hdr;
    663         int err;
    664 
    665         err = ops->sb_tc_pool_bind_get(devlink_port, devlink_sb->index,
    666                                        tc_index, pool_type,
    667                                        &pool_index, &threshold);
    668         if (err)
    669                 return err;
    670 
    671         hdr = genlmsg_put(msg, portid, seq, &devlink_nl_family, flags, cmd);
    672         if (!hdr)
    673                 return -EMSGSIZE;
    674 
    675         if (devlink_nl_put_handle(msg, devlink))
    676                 goto nla_put_failure;
    677         if (nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX, devlink_port->index))
    678                 goto nla_put_failure;
    679         if (nla_put_u32(msg, DEVLINK_ATTR_SB_INDEX, devlink_sb->index))
    680                 goto nla_put_failure;
    681         if (nla_put_u16(msg, DEVLINK_ATTR_SB_TC_INDEX, tc_index))
    682                 goto nla_put_failure;
    683         if (nla_put_u8(msg, DEVLINK_ATTR_SB_POOL_TYPE, pool_type))
    684                 goto nla_put_failure;
    685         if (nla_put_u16(msg, DEVLINK_ATTR_SB_POOL_INDEX, pool_index))
    686                 goto nla_put_failure;
    687         if (nla_put_u32(msg, DEVLINK_ATTR_SB_THRESHOLD, threshold))
    688                 goto nla_put_failure;
    689 
    690         if (ops->sb_occ_tc_port_bind_get) {
    691                 u32 cur;
    692                 u32 max;
    693 
    694                 err = ops->sb_occ_tc_port_bind_get(devlink_port,
    695                                                    devlink_sb->index,
    696                                                    tc_index, pool_type,
    697                                                    &cur, &max);
    698                 if (err && err != -EOPNOTSUPP)
--> 699                         return err;

Moving code around means re-visiting all the static checker warnings.
:)  Should this return genlmsg_cancel(msg, hdr) before returning?

    700                 if (!err) {
    701                         if (nla_put_u32(msg, DEVLINK_ATTR_SB_OCC_CUR, cur))
    702                                 goto nla_put_failure;
    703                         if (nla_put_u32(msg, DEVLINK_ATTR_SB_OCC_MAX, max))
    704                                 goto nla_put_failure;
    705                 }
    706         }
    707 
    708         genlmsg_end(msg, hdr);
    709         return 0;
    710 
    711 nla_put_failure:
    712         genlmsg_cancel(msg, hdr);
    713         return -EMSGSIZE;
    714 }

regards,
dan carpenter
