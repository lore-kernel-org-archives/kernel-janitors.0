Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DB7C07E94
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 14:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 492F56140C
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 14:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhFDOQf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Jun 2021 10:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhFDOQf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Jun 2021 10:16:35 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E85CC061766
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Jun 2021 07:14:49 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id g6so7553209pfq.1
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Jun 2021 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1x7sb1Y2OFAXkDcWcbDF3pGGsssnY8a8XJ3r0exQTqs=;
        b=qJpZGSO7x9YLcyGKeY+EjAZ2fCICwacul7Hayntp9mNH+0YqE0Ej5Lupj9+3DCA+iU
         t91mf3Bl/D94En5uTOw08UYaKcibOQ8ff2AL9Vsjc7WN513nVpGzNcC8BAVmfpfrQDRf
         FD3PgplQLmrfLIrDWhQHi3MBcxPBLlQFcoMtgRD3Z1FiXkYzkoIW4VsMor+qVh1fVCj5
         5XFU6ASWFhnAU4sVbQyKA5JndYdVdA2K5klcQCx92oDZqdgsXbHMBSGQRHF15YN1pI/V
         Xj0DlQpOiWxHNoQL9WpDVDv7M91KatdgMXH5xjbIh3xgjueRTLLTwnH8sCmPayDo9epp
         ZpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1x7sb1Y2OFAXkDcWcbDF3pGGsssnY8a8XJ3r0exQTqs=;
        b=ADiagQBuxjv48oV8Um625KQLVGqGVM8XDHYxmERpaXUvYXF5QtRkVPIBdrbuzKBKRA
         X9AUKd4pADLcutwJ57tVfv7kXOFJ/NCvwhKQ64Yq1LCZFMLFjEiZhjwflXWEx0lBISZ7
         N0/obeJVKmLF7QeUYNWmvpUApcS1UnviGtR7BQRctoWwtWJZBoasJPepmDAljg9qTzL1
         den/suYVCZsI8TEWBKB24EiXnTmgZzZ6n+f0AidxEaq+0lZ7e5ywPf185HiJ1UWPgmaN
         A5pm7heWUHTaNFaV5a2k3/9+sHN9nXE0NRZJJ5REuMkfM5Yc3VLQ9ltJSek91XXRSnOP
         LWtw==
X-Gm-Message-State: AOAM5332v9+RtrC1Y4+H34dBxkp5IlgTPux6KJbC5NpGv/J+8qpMM8Uv
        AIetbRAFHq+qUB3KBK453/U=
X-Google-Smtp-Source: ABdhPJzNOgeoTDJnbq3ev3i+Qxu0NMhwhVXz487bDLbi6MevfCtjmuMcIkM7UH0gEx5ZZn9b4NCnbQ==
X-Received: by 2002:a63:1b0b:: with SMTP id b11mr5215426pgb.410.1622816088791;
        Fri, 04 Jun 2021 07:14:48 -0700 (PDT)
Received: from fedora ([103.125.235.29])
        by smtp.gmail.com with ESMTPSA id o9sm2184796pfh.217.2021.06.04.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 07:14:48 -0700 (PDT)
Date:   Fri, 4 Jun 2021 10:14:42 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <YLo1Ut1A6fIp5r1t@fedora>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
 <20210602144752.GC10983@kadam>
 <20210604133400.GL1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604133400.GL1955@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 04, 2021 at 04:34:00PM +0300, Dan Carpenter wrote:
> On Wed, Jun 02, 2021 at 05:47:52PM +0300, Dan Carpenter wrote:
> > On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> > > On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > > > The other thing which might be interesting is if you pass a NULL
> > > > to IS_ERR() and then dereference the NULL then print a warning about
> > > > that.  This has a lot of overlaps with some of my existing checks, but
> > > > it's still a new idea so it belongs in a separate check.  It's fine and
> > > > good even if one bug triggers a lot of different warnings.  I'll write
> > > > that, hang on, brb.
> > > 
> > > 100% untested.  :)  I'll test it tonight.
> > > 
> > 
> 
> I also added a check for:
> 
> 	if (is_impossible_path())
> 		return;
> 
> to silence some of the false positives.  But the results are all still
> false positives.  They're "high quality" false positives, because often
> the code looks buggy.  I think that someone went through and fixed all
> the real bugs with this.

Double positives are good. Glad the bugs are getting fixed!
Back to hunting for deadcode. That seems to be the lowest
hanging fruit for me at the momemnt. (-_-)

> 
> I reported the snd_media_device_create() bug and sent a fix for the
> nfs_init_server() but the rest, I'm just going to leave.
> 
> sound/usb/media.c:287 snd_media_device_create() error: potential NULL/IS_ERR bug 'mdev'
> mm/mempolicy.c:1293 do_mbind() error: potential NULL/IS_ERR bug 'new'
> fs/nfs/client.c:701 nfs_init_server() error: potential NULL/IS_ERR bug 'clp'
> fs/afs/server.c:652 afs_update_server_record() error: potential NULL/IS_ERR bug 'alist'
> fs/afs/volume.c:322 afs_update_volume_status() error: potential NULL/IS_ERR bug 'vldb'
> fs/ubifs/lpt_commit.c:583 next_pnode_to_dirty() error: potential NULL/IS_ERR bug 'nnode'
> fs/ubifs/lpt_commit.c:583 next_pnode_to_dirty() error: potential NULL/IS_ERR bug 'nnode'
> fs/ntfs/attrib.c:2188 ntfs_attr_extend_allocation() error: potential NULL/IS_ERR bug 'rl'
> fs/ext4/namei.c:2375 ext4_add_entry() error: potential NULL/IS_ERR bug 'bh'
> drivers/pinctrl/renesas/core.c:1144 sh_pfc_probe() error: potential NULL/IS_ERR bug 'info'
> drivers/mfd/ene-kb3930.c:165 kb3930_probe() error: potential NULL/IS_ERR bug 'ddata->off_gpios'
> drivers/mtd/ubi/attach.c:409 add_volume() error: potential NULL/IS_ERR bug 'av'
> drivers/mtd/ubi/fastmap.c:185 add_vol() error: potential NULL/IS_ERR bug 'av'
> drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c:57 nvkm_nvdec_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c:104 nvkm_sec2_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2108 gf100_gr_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c:59 nvkm_nvenc_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:181 nvkm_pmu_ctor() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c:56 nvkm_gsp_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c:430 nvkm_acr_new_() error: potential NULL/IS_ERR bug 'fwif'
> drivers/clk/clk.c:417 clk_core_get() error: potential NULL/IS_ERR bug 'hw'
> drivers/platform/chrome/cros_ec_chardev.c:225 cros_ec_chardev_read() error: potential NULL/IS_ERR bug 'event'
> net/xfrm/xfrm_policy.c:2785 xfrm_policy_queue_process() error: potential NULL/IS_ERR bug 'dst'
> net/xfrm/xfrm_interface.c:282 xfrmi_xmit2() error: potential NULL/IS_ERR bug 'dst'
> net/ipv6/netfilter/nf_reject_ipv6.c:327 nf_send_reset6() error: potential NULL/IS_ERR bug 'dst'
> net/ipv6/ip6_tunnel.c:1161 ip6_tnl_xmit() error: potential NULL/IS_ERR bug 'dst'
> net/ipv6/ndisc.c:505 ndisc_send_skb() error: potential NULL/IS_ERR bug 'dst'
> security/selinux/hooks.c:3157 selinux_inode_follow_link() error: potential NULL/IS_ERR bug 'isec'
> security/selinux/hooks.c:3212 selinux_inode_permission() error: potential NULL/IS_ERR bug 'isec'
> 
> regards,
> dan carpenter
