Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64274CD13D1
	for <kernel-janitors@archiver.kernel.org>; Mon, 18 Sep 2023 07:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240177AbjIRHnU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 18 Sep 2023 03:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240435AbjIRHnE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Sep 2023 03:43:04 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72DF1A6
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Sep 2023 00:41:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so69761641fa.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Sep 2023 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1695022893; x=1695627693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTt1CKkREHcgcY4fonMIYxazACYQtCCJw6Q/RC6xDoI=;
        b=jBrXAMDUpgSoLirbh5y2nNKTIriiNrnDDhzZc4Pbtjyi9Iz6LHYwtxfIgNv864IFMK
         3p5RCH+Vwt2yaQZgx5hCpKNbv+aq0dSv49iZMgYzuAwUXDyyLzF6eJyFwsrPssyMflwH
         T7PFc3UpB/jUsn53k3qxwjUTwcprI+7/3N8eX5rUAjq7WZ826uUMcjwRKCguw6W7DAsv
         ftgFIsToHkGgxaBmz6Tgp1Zq7E0irFG8uWtFNscXME9LsShBkePQzYJzTkCpVBfMfB5I
         rSb8Q9QjuFS8py5Cndr4ihn3v66l8RLmKnkZGS3ELNhoVel+aUOSOrAxtdCaqYrqD9m5
         2hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695022893; x=1695627693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTt1CKkREHcgcY4fonMIYxazACYQtCCJw6Q/RC6xDoI=;
        b=eRYbcmspEUQuQirIznZS8uNmuM+PfQDIeaPBRlzGYvuj/4WhEgQWDOCrq3tf2VuBhZ
         sKL4HvAj08QBT9Fqlqrok0HQHX7hyFo39xIuG8MgzULg9Gh2to5sF57s4bIHQx8BIh22
         4rjGOfXCYt2yCBtdOnvECd6Tte8w/3guHYvmc/vwOXBDhBWFP9h/8OVONXK7FHWpCKkL
         HUsabnrEdsL9dqQLY7dWrGb1kGlUSKSaVmdXfIXKrk7YAQwGaWkayMIKgI2r7XPCvO9V
         OGX3YSdj+3bHFWjzbxJA+x4Px4OPq2pEPui4eX3QDfUTVJfa7kgUM0CNkViyFmpjW7ju
         9s9g==
X-Gm-Message-State: AOJu0Yw4hZpSeODJAT3/HokZp6Uvx9Q/CTulmCy8jT3LJmXd+7Nfkg+S
        sqZp3LMuiqebW2VIS8Pt/skktw==
X-Google-Smtp-Source: AGHT+IEj3KyYjkOTAYe13bZjzB5BYjMWHe20noDEQ40HDsu76mXZvQyeu5NrSgaesk4r+SonDZRoww==
X-Received: by 2002:a2e:330c:0:b0:2b6:d13a:8e34 with SMTP id d12-20020a2e330c000000b002b6d13a8e34mr6326602ljc.46.1695022893001;
        Mon, 18 Sep 2023 00:41:33 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id vb1-20020a170907d04100b009adca8ada31sm4866950ejc.12.2023.09.18.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 00:41:32 -0700 (PDT)
Date:   Mon, 18 Sep 2023 09:41:31 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] devlink: implement shared buffer occupancy
 monitoring interface
Message-ID: <ZQf/K4ovliLtJJ16@nanopsycho>
References: <e483bcad-10c6-43fb-9c49-57062728885b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e483bcad-10c6-43fb-9c49-57062728885b@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fri, Sep 15, 2023 at 10:12:47AM CEST, dan.carpenter@linaro.org wrote:
>Hello Jiri Pirko,
>
>The patch df38dafd2559: "devlink: implement shared buffer occupancy
>monitoring interface" from Apr 14, 2016 (linux-next), leads to the
>following Smatch static checker warning:
>
>	net/devlink/sb.c:699 devlink_nl_sb_tc_pool_bind_fill()
>	warn: missing unwind goto?
>
>net/devlink/sb.c
>    651 static int
>    652 devlink_nl_sb_tc_pool_bind_fill(struct sk_buff *msg, struct devlink *devlink,
>    653                                 struct devlink_port *devlink_port,
>    654                                 struct devlink_sb *devlink_sb, u16 tc_index,
>    655                                 enum devlink_sb_pool_type pool_type,
>    656                                 enum devlink_command cmd,
>    657                                 u32 portid, u32 seq, int flags)
>    658 {
>    659         const struct devlink_ops *ops = devlink->ops;
>    660         u16 pool_index;
>    661         u32 threshold;
>    662         void *hdr;
>    663         int err;
>    664 
>    665         err = ops->sb_tc_pool_bind_get(devlink_port, devlink_sb->index,
>    666                                        tc_index, pool_type,
>    667                                        &pool_index, &threshold);
>    668         if (err)
>    669                 return err;
>    670 
>    671         hdr = genlmsg_put(msg, portid, seq, &devlink_nl_family, flags, cmd);
>    672         if (!hdr)
>    673                 return -EMSGSIZE;
>    674 
>    675         if (devlink_nl_put_handle(msg, devlink))
>    676                 goto nla_put_failure;
>    677         if (nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX, devlink_port->index))
>    678                 goto nla_put_failure;
>    679         if (nla_put_u32(msg, DEVLINK_ATTR_SB_INDEX, devlink_sb->index))
>    680                 goto nla_put_failure;
>    681         if (nla_put_u16(msg, DEVLINK_ATTR_SB_TC_INDEX, tc_index))
>    682                 goto nla_put_failure;
>    683         if (nla_put_u8(msg, DEVLINK_ATTR_SB_POOL_TYPE, pool_type))
>    684                 goto nla_put_failure;
>    685         if (nla_put_u16(msg, DEVLINK_ATTR_SB_POOL_INDEX, pool_index))
>    686                 goto nla_put_failure;
>    687         if (nla_put_u32(msg, DEVLINK_ATTR_SB_THRESHOLD, threshold))
>    688                 goto nla_put_failure;
>    689 
>    690         if (ops->sb_occ_tc_port_bind_get) {
>    691                 u32 cur;
>    692                 u32 max;
>    693 
>    694                 err = ops->sb_occ_tc_port_bind_get(devlink_port,
>    695                                                    devlink_sb->index,
>    696                                                    tc_index, pool_type,
>    697                                                    &cur, &max);
>    698                 if (err && err != -EOPNOTSUPP)
>--> 699                         return err;
>
>Moving code around means re-visiting all the static checker warnings.
>:)  Should this return genlmsg_cancel(msg, hdr) before returning?

Well, as the message is freed when this function returns !=0,
genlmsg_cancel() is optional if not pointless here.


>
>    700                 if (!err) {
>    701                         if (nla_put_u32(msg, DEVLINK_ATTR_SB_OCC_CUR, cur))
>    702                                 goto nla_put_failure;
>    703                         if (nla_put_u32(msg, DEVLINK_ATTR_SB_OCC_MAX, max))
>    704                                 goto nla_put_failure;
>    705                 }
>    706         }
>    707 
>    708         genlmsg_end(msg, hdr);
>    709         return 0;
>    710 
>    711 nla_put_failure:
>    712         genlmsg_cancel(msg, hdr);
>    713         return -EMSGSIZE;
>    714 }
>
>regards,
>dan carpenter
