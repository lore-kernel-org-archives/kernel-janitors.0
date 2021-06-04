Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C59EC07E94
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 13:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 410C3613F9
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 13:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFDNf6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Jun 2021 09:35:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7370 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230108AbhFDNf4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Jun 2021 09:35:56 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 154DWbOp004186;
        Fri, 4 Jun 2021 13:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=HQFaYdVAg7BshdjcFRPC0TGKWBbKTM0PuCMY2lN6yIM=;
 b=oyBPxK1f8stcRLBdPQXWbUr5Wx7A7PYkmID3m9q4SqR7Vo9Njxbg66cfPtFaDa+PhtAZ
 Cwf8wsRFbAiwwTvkgqnw6sXKb7s43mICimmrUzRGDvYVmYAzZhh9GG8p10QH7U4ZNqdQ
 mAHOP51WfpNKVt3G74td0iyUuo7CqfWUerols0VEw8ceJYqFXg8W75XSQdbon74g+D2Y
 St5FMZ3piusufPbIExzkkPQlVHiomN+TWJXYA8qnHnY9trNcr4C5U6j5GFxYFl2uyRVi
 InLaiGTHRL2ud6KKfahVn4vPVy7WlIsVpsGwpzHr37ZWTdYC0vTQS+7nwR5sxLFH/U2g vA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 38xwxfrfqj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 13:34:09 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 154DVhHk015604;
        Fri, 4 Jun 2021 13:34:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38x1bexg9d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 13:34:08 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 154DY8EU018631;
        Fri, 4 Jun 2021 13:34:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 38x1bexg8y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 13:34:08 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 154DY7wg032131;
        Fri, 4 Jun 2021 13:34:07 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Jun 2021 13:34:06 +0000
Date:   Fri, 4 Jun 2021 16:34:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210604133400.GL1955@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
 <20210602144752.GC10983@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602144752.GC10983@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: -Wh7C9kmFf2a04c43cxsb8r14eeLHbJ3
X-Proofpoint-ORIG-GUID: -Wh7C9kmFf2a04c43cxsb8r14eeLHbJ3
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 02, 2021 at 05:47:52PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> > On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > > The other thing which might be interesting is if you pass a NULL
> > > to IS_ERR() and then dereference the NULL then print a warning about
> > > that.  This has a lot of overlaps with some of my existing checks, but
> > > it's still a new idea so it belongs in a separate check.  It's fine and
> > > good even if one bug triggers a lot of different warnings.  I'll write
> > > that, hang on, brb.
> > 
> > 100% untested.  :)  I'll test it tonight.
> > 
> 

I also added a check for:

	if (is_impossible_path())
		return;

to silence some of the false positives.  But the results are all still
false positives.  They're "high quality" false positives, because often
the code looks buggy.  I think that someone went through and fixed all
the real bugs with this.

I reported the snd_media_device_create() bug and sent a fix for the
nfs_init_server() but the rest, I'm just going to leave.

sound/usb/media.c:287 snd_media_device_create() error: potential NULL/IS_ERR bug 'mdev'
mm/mempolicy.c:1293 do_mbind() error: potential NULL/IS_ERR bug 'new'
fs/nfs/client.c:701 nfs_init_server() error: potential NULL/IS_ERR bug 'clp'
fs/afs/server.c:652 afs_update_server_record() error: potential NULL/IS_ERR bug 'alist'
fs/afs/volume.c:322 afs_update_volume_status() error: potential NULL/IS_ERR bug 'vldb'
fs/ubifs/lpt_commit.c:583 next_pnode_to_dirty() error: potential NULL/IS_ERR bug 'nnode'
fs/ubifs/lpt_commit.c:583 next_pnode_to_dirty() error: potential NULL/IS_ERR bug 'nnode'
fs/ntfs/attrib.c:2188 ntfs_attr_extend_allocation() error: potential NULL/IS_ERR bug 'rl'
fs/ext4/namei.c:2375 ext4_add_entry() error: potential NULL/IS_ERR bug 'bh'
drivers/pinctrl/renesas/core.c:1144 sh_pfc_probe() error: potential NULL/IS_ERR bug 'info'
drivers/mfd/ene-kb3930.c:165 kb3930_probe() error: potential NULL/IS_ERR bug 'ddata->off_gpios'
drivers/mtd/ubi/attach.c:409 add_volume() error: potential NULL/IS_ERR bug 'av'
drivers/mtd/ubi/fastmap.c:185 add_vol() error: potential NULL/IS_ERR bug 'av'
drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c:57 nvkm_nvdec_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c:104 nvkm_sec2_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2108 gf100_gr_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c:59 nvkm_nvenc_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:181 nvkm_pmu_ctor() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c:56 nvkm_gsp_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c:430 nvkm_acr_new_() error: potential NULL/IS_ERR bug 'fwif'
drivers/clk/clk.c:417 clk_core_get() error: potential NULL/IS_ERR bug 'hw'
drivers/platform/chrome/cros_ec_chardev.c:225 cros_ec_chardev_read() error: potential NULL/IS_ERR bug 'event'
net/xfrm/xfrm_policy.c:2785 xfrm_policy_queue_process() error: potential NULL/IS_ERR bug 'dst'
net/xfrm/xfrm_interface.c:282 xfrmi_xmit2() error: potential NULL/IS_ERR bug 'dst'
net/ipv6/netfilter/nf_reject_ipv6.c:327 nf_send_reset6() error: potential NULL/IS_ERR bug 'dst'
net/ipv6/ip6_tunnel.c:1161 ip6_tnl_xmit() error: potential NULL/IS_ERR bug 'dst'
net/ipv6/ndisc.c:505 ndisc_send_skb() error: potential NULL/IS_ERR bug 'dst'
security/selinux/hooks.c:3157 selinux_inode_follow_link() error: potential NULL/IS_ERR bug 'isec'
security/selinux/hooks.c:3212 selinux_inode_permission() error: potential NULL/IS_ERR bug 'isec'

regards,
dan carpenter
