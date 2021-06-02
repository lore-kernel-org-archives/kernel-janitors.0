Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE5CC47083
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 06:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486EE6101B
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 06:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhFBGNh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 02:13:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10392 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230264AbhFBGNg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 02:13:36 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15268w0Q031635;
        Wed, 2 Jun 2021 06:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=L2yjN01CcHKVsrPRDPCbi14lEGOrHK80IgeF2BTqG9Q=;
 b=yW7l3D/mtUuLxj7ESVaCmiBnvcPsCA0RXfp+84jNc3hStlf3zjOSEiw7wZSqj+5morxD
 mXzoqeYnoZQmdyJ5tlyG5J47qIYSqSulNBnVUGo0MbNCqfYc7rnuyhTebvIqSM+T5HKW
 j4MgXRq1J4ERp0/j8nf/Bak7BZ5ZSY0ItyEiHjcuu+aWfUrMEknhrVUsO9d3qzYK3E1d
 y5iOw/UkgWiZ8ssmcq2saRxkUktt7mlD0sH4C/PGZBFMyuZHp5+WKv3hCd8mjzkFHXHL
 rsB99ceg9c+EQwTIxb/Suxj6N/ARsg82AhtUasrjmv47kcBY4JtCZorDmO6xl/wxDHTV +A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38wr5087sp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:11:52 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1526BqoZ032416;
        Wed, 2 Jun 2021 06:11:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38ubndrhpv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:11:52 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1526BpMp032393;
        Wed, 2 Jun 2021 06:11:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 38ubndrhp7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:11:51 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1526BotB005901;
        Wed, 2 Jun 2021 06:11:50 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Jun 2021 06:11:50 +0000
Date:   Wed, 2 Jun 2021 09:11:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210602061143.GD1955@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
 <YLalYt3m8jzoL4ie@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLalYt3m8jzoL4ie@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 5He5tJ3jCKZAJNriuNOQjM6uXju0ChX5
X-Proofpoint-GUID: 5He5tJ3jCKZAJNriuNOQjM6uXju0ChX5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 05:23:46PM -0400, Nigel Christian wrote:
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
> 
> Ha, you make it look easy. Let me know if I can help with testing
> Should I just add below to my smatch and recompile,
> or is there an experimental branch to build from?
> 

Yeah.  :)  Copy and paste that to check_null_deref_after_IS_ERR.c and
add it to the check_list.h file then recompile.

regards,
dan carpenter

