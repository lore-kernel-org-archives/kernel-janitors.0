Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2022C54EBE
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Jan 2023 10:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjAPKKv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Jan 2023 05:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjAPKKB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 05:10:01 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F389518B39
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 02:09:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r9so4152023wrw.4
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8pljPTJrgop8W9mMlI23DdeWgAW8xAQlg66FzVGihe8=;
        b=j9Po4uIQ4irwGeF4arlxpAc/BgftMP2D6mdZBFLfitP2rKvipGJmJuqKgortxvJA5V
         6FVhXIsKgr511wneYzE+tdo2rtD7bpxEDYq6kq4EA52slYGOLCYQ1aEaRxIBIvYsvbmP
         w3pRc4aklVJTRIrWoVVdRBSrOxa1aFJ+HemypmMY/2u4LsMWzI2vyuf9JS7ypjVkHHp7
         aotyk6yJCReXu9CD7wfWwD1xCGwF72KsK35xb8BDdlI/ZP8xjFrmX2B39bjk6haqwHz2
         Sr7uvIMg9jpNqKFdBcLu44zafY9Qc+6uy2HXOCbrCKCi6WvDmP8c7X3giRl/2LAtJyzw
         xDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8pljPTJrgop8W9mMlI23DdeWgAW8xAQlg66FzVGihe8=;
        b=1qk0DigZTu4P/5UkwQEHwGhh4tC5lakWiIS/WTnotnAs47igLfAQfOTTUGr1Kk02CL
         RGC9g6geG1ppqulS039mNcAZc+omNpE76NeNmRPp2rPyDTVTa1KiXcyklCEMhsbk5o6C
         bbU284RdF4TVoxirpDGVlpJMusSayT2U1vFCFAiFRnn0rSlwcIb7DlhUpGBeN3FsP/gW
         Koq7C0qPHth6sHRCsrp6hyWhjQqxYi7z5KecIyR8cgD0Xm5+Khh//mLFECoZnG5Ckhjo
         QFx8XB95OUfJtzcSRIUmzfJ62yL4B2G2pkyG5sYdmGs3/UVYW88+lTn3qhdOGHYFdH0b
         z1zw==
X-Gm-Message-State: AFqh2kot9iydj37+k2RBQn6a7jWI1VdykgusRHC7uW1k1gPRxCCQxshn
        XB60qAnggTzqMEClaq9CJ9xdieKxrUo=
X-Google-Smtp-Source: AMrXdXt0fDd4kfBZgKsx0CUlj62EvXY09wlP1DfJbRxRNLzXvkN2dWQbk65ozgM36tU6yZ7x0CFC+w==
X-Received: by 2002:a5d:4904:0:b0:2a6:caa0:f230 with SMTP id x4-20020a5d4904000000b002a6caa0f230mr29290256wrq.66.1673863763381;
        Mon, 16 Jan 2023 02:09:23 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id by12-20020a056000098c00b002bdd8f12effsm10505570wrb.30.2023.01.16.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:09:22 -0800 (PST)
Date:   Mon, 16 Jan 2023 13:09:19 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     piergiorgio.beruto@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] drivers/net/phy: add helpers to get/set PLCA
 configuration
Message-ID: <Y8UiT9AKQIqz1zxr@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Piergiorgio Beruto,

The patch 493323416fed: "drivers/net/phy: add helpers to get/set PLCA
configuration" from Jan 9, 2023, leads to the following Smatch static
checker warning:

	drivers/net/phy/phy-c45.c:1036 genphy_c45_plca_set_cfg()
	error: uninitialized symbol 'val'.

drivers/net/phy/phy-c45.c
   999  int genphy_c45_plca_set_cfg(struct phy_device *phydev,
  1000                              const struct phy_plca_cfg *plca_cfg)
  1001  {
  1002          int ret;
  1003          u16 val;
  1004  
  1005          // PLCA IDVER is read-only
  1006          if (plca_cfg->version >= 0)
  1007                  return -EINVAL;
  1008  
  1009          // first of all, disable PLCA if required
  1010          if (plca_cfg->enabled == 0) {
  1011                  ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
  1012                                           MDIO_OATC14_PLCA_CTRL0,
  1013                                           MDIO_OATC14_PLCA_EN);
  1014  
  1015                  if (ret < 0)
  1016                          return ret;
  1017          }
  1018  
  1019          // check if we need to set the PLCA node count, node ID, or both
  1020          if (plca_cfg->node_cnt >= 0 || plca_cfg->node_id >= 0) {

Let's assume both conditions are true

  1021                  /* if one between node count and node ID is -not- to be
  1022                   * changed, read the register to later perform merge/purge of
  1023                   * the configuration as appropriate
  1024                   */
  1025                  if (plca_cfg->node_cnt < 0 || plca_cfg->node_id < 0) {

Then neither condition is true here

  1026                          ret = phy_read_mmd(phydev, MDIO_MMD_VEND2,
  1027                                             MDIO_OATC14_PLCA_CTRL1);
  1028  
  1029                          if (ret < 0)
  1030                                  return ret;
  1031  
  1032                          val = ret;
  1033                  }
  1034  
  1035                  if (plca_cfg->node_cnt >= 0)
  1036                          val = (val & ~MDIO_OATC14_PLCA_NCNT) |
                                       ^^^
Uninitialized

  1037                                (plca_cfg->node_cnt << 8);
  1038  
  1039                  if (plca_cfg->node_id >= 0)
  1040                          val = (val & ~MDIO_OATC14_PLCA_ID) |
  1041                                (plca_cfg->node_id);


regards,
dan carpenter
