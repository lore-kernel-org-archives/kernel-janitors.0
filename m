Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1797C07E94
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 14:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9320613FF
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 14:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhFDOXE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Jun 2021 10:23:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61486 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230124AbhFDOXE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Jun 2021 10:23:04 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 154EBaq9004446;
        Fri, 4 Jun 2021 14:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kbVlu8kiFpdqNBwaEhmFLBQTjX59APtM7HEUx9WzhU0=;
 b=OK2+n0IezZtTDBdKF1pupailCq09lmXUG19bjZN3E4dLokHC1OrmbSrStb+2TVAABV/j
 MPCU/O3cNqZAs4W927igEBqB6T/VTaapZjUrL5lUMTYhyA3KZ58/USnwsRMOMYYcV3oN
 P3ajw5aCTpq0uPMcqwUYBMSUV1caYt7MHl6JcQDqS71WoZLhOvlO2nE6FpEsjtKPVC4z
 /Pmy62cNSR7r/wMFlkhsD7ErUlOPPpOvvhlbcUl8aGnp+ShQHzLcGafbSJxGMTja6aBk
 DbgI6Ufr9LPvTc8q0wmeh8XGyaBrvZIfj7BlViq+xqxebC6rob5NGB37hhrbDZdb571a sw== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38xk87rpk8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 14:21:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 154ELG6I176422;
        Fri, 4 Jun 2021 14:21:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38xyn3q9fg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 14:21:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 154EK0CX160586;
        Fri, 4 Jun 2021 14:21:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38xyn3q9ew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Jun 2021 14:21:15 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 154ELEnH026404;
        Fri, 4 Jun 2021 14:21:14 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Jun 2021 07:21:14 -0700
Date:   Fri, 4 Jun 2021 17:21:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210604142108.GF10983@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
 <20210602144752.GC10983@kadam>
 <20210604133400.GL1955@kadam>
 <YLo1Ut1A6fIp5r1t@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLo1Ut1A6fIp5r1t@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 7zpcnZ3H8OYk0Vq8jIm7mBz6pLmzPeuc
X-Proofpoint-GUID: 7zpcnZ3H8OYk0Vq8jIm7mBz6pLmzPeuc
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 04, 2021 at 10:14:42AM -0400, Nigel Christian wrote:
> On Fri, Jun 04, 2021 at 04:34:00PM +0300, Dan Carpenter wrote:
> > On Wed, Jun 02, 2021 at 05:47:52PM +0300, Dan Carpenter wrote:
> > > On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> > > > On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > > > > The other thing which might be interesting is if you pass a NULL
> > > > > to IS_ERR() and then dereference the NULL then print a warning about
> > > > > that.  This has a lot of overlaps with some of my existing checks, but
> > > > > it's still a new idea so it belongs in a separate check.  It's fine and
> > > > > good even if one bug triggers a lot of different warnings.  I'll write
> > > > > that, hang on, brb.
> > > > 
> > > > 100% untested.  :)  I'll test it tonight.
> > > > 
> > > 
> > 
> > I also added a check for:
> > 
> > 	if (is_impossible_path())
> > 		return;
> > 
> > to silence some of the false positives.  But the results are all still
> > false positives.  They're "high quality" false positives, because often
> > the code looks buggy.  I think that someone went through and fixed all
> > the real bugs with this.
> 
> Double positives are good. Glad the bugs are getting fixed!
> Back to hunting for deadcode. That seems to be the lowest
> hanging fruit for me at the momemnt. (-_-)

I really doubt you're going to find much dead code worth fixing unless
you're looking at defines.  Dead code is pretty easy to fix so it's been
picked over pretty well at this point.

regards,
dan carpenter
