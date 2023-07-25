Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC082EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Jul 2023 05:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjGYFZH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Jul 2023 01:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjGYFZD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jul 2023 01:25:03 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57483A6
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 22:25:02 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so41371025e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 22:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690262701; x=1690867501;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H79WJ1tZZDGA2P/ZJGv/toXPeURCI3lAAaWA6i+7WCc=;
        b=haLrXUc4DawVtAshdPyra7G+2ZK9BuBOpIhM1fU8nWBd13IGaY0Qj0WMXKOwB9geo2
         zbZoQIKvVvtXJyofj526s8WWvsGNc59d63mc1+N3NuG8MJC/ykrY19sKBs/6crYXgUs5
         cgUZYCBlzVSz/hPrrsK7G0uAl80BXQiWubw81dR2YKcovNZ78giuuS/i/KIcp/OnbYjJ
         yQJCO5gHjOj6ZKDcAOHbEuCqOH6RBmE4jgfGn5WdPqJunL5IybDnIHq3Q65kKMoh5iBc
         /T9HR2Ejs/C9mnwV8q7o1pSFcfLdtA/K86CfP6V4au+7OuctD26UG3GRwBtnszYPxygn
         I7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690262701; x=1690867501;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H79WJ1tZZDGA2P/ZJGv/toXPeURCI3lAAaWA6i+7WCc=;
        b=iF9b2vTIJMpmd9E4ITLNSJfWCjKML/lKJqlr1s6Ue4we//mf270x0UFkQXTquIIyTT
         lhRRn5PkWRzzOVVIAx7Xpb9AaXnbkRgL+rEAGEzneFl42AUX77wGANLjlnwHH6czciFf
         csFv6z3MJynTIVG73hW4qRgDFKuP+FZV7C1I8zPCraUiFbuz7BHxtbcpAJeQPdMIsN4A
         3idFyHUI5Q0bYHXJ1xzpX2EOMftfIbken7CHpgpi9EEdLjt1u5Q5sbcQuoIwRZV0OBXe
         Aq0AmVD0u5HKgj5U5fiu1Uik7xbqn87fg54xvJZaTDrG1RHwk6x4e6tKsFzfC/IRV6RK
         gq0A==
X-Gm-Message-State: ABy/qLY7v2IJgvQ+03+fta1U2xJDU7oyjjIaTeD7u0LIMyo3bZUOYK/t
        IhDs9ySNKcJ+TU5qTfOC/czL1NLd7CihxgWcXzY=
X-Google-Smtp-Source: APBJJlGlk5/ue4ciZ9K0Lm551GtLicMS+kyem42WYzAa6gMALSP3J6b8ppTyop7YQiL+pWW5wx7Wwg==
X-Received: by 2002:a5d:5956:0:b0:314:5376:f0d6 with SMTP id e22-20020a5d5956000000b003145376f0d6mr8020592wri.52.1690262700825;
        Mon, 24 Jul 2023 22:25:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adff70f000000b003143ba62cf4sm14867520wrp.86.2023.07.24.22.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:25:00 -0700 (PDT)
Date:   Tue, 25 Jul 2023 08:24:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     petrm@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] mlxsw: spectrum_switchdev: Replay switchdev objects on
 port join
Message-ID: <049ee4a7-441c-4e76-8ca1-fb4ac1c3f389@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Petr Machata,

The patch ec4643ca3d98: "mlxsw: spectrum_switchdev: Replay switchdev
objects on port join" from Jul 19, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:2679 mlxsw_sp_bridge_8021d_port_join()
	error: we previously assumed 'mlxsw_sp_port_vlan->fid' could be null (see line 2664)

drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
    2642 static int
    2643 mlxsw_sp_bridge_8021d_port_join(struct mlxsw_sp_bridge_device *bridge_device,
    2644                                 struct mlxsw_sp_bridge_port *bridge_port,
    2645                                 struct mlxsw_sp_port *mlxsw_sp_port,
    2646                                 struct netlink_ext_ack *extack)
    2647 {
    2648         struct mlxsw_sp_port_vlan *mlxsw_sp_port_vlan;
    2649         struct net_device *dev = bridge_port->dev;
    2650         u16 vid;
    2651         int err;
    2652 
    2653         vid = is_vlan_dev(dev) ? vlan_dev_vlan_id(dev) : MLXSW_SP_DEFAULT_VID;
    2654         mlxsw_sp_port_vlan = mlxsw_sp_port_vlan_find_by_vid(mlxsw_sp_port, vid);
    2655         if (WARN_ON(!mlxsw_sp_port_vlan))
    2656                 return -EINVAL;
    2657 
    2658         if (mlxsw_sp_port_is_br_member(mlxsw_sp_port, bridge_device->dev)) {
    2659                 NL_SET_ERR_MSG_MOD(extack, "Can not bridge VLAN uppers of the same port");
    2660                 return -EINVAL;
    2661         }
    2662 
    2663         /* Port is no longer usable as a router interface */
    2664         if (mlxsw_sp_port_vlan->fid)

This has a check for NULL.

    2665                 mlxsw_sp_port_vlan_router_leave(mlxsw_sp_port_vlan);
    2666 
    2667         err = mlxsw_sp_port_vlan_bridge_join(mlxsw_sp_port_vlan, bridge_port,
    2668                                              extack);

Most of the time this would set ->fid but if mlxsw_sp_port_vlan->bridge_port
then it wouldn't

    2669         if (err)
    2670                 return err;
    2671 
    2672         err = mlxsw_sp_bridge_port_replay(bridge_port, mlxsw_sp_port, extack);
    2673         if (err)
    2674                 goto err_replay;
    2675 
    2676         return 0;
    2677 
    2678 err_replay:
--> 2679         mlxsw_sp_port_vlan_bridge_leave(mlxsw_sp_port_vlan);

->fid dereferenced without being checked.

    2680         return err;
    2681 }

regards,
dan carpenter
