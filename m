Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB2C47083
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 14:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6536060200
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 14:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhFBOtr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:49:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34932 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230092AbhFBOtr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 10:49:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 152EaHev028725;
        Wed, 2 Jun 2021 14:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=exVD2f7ePlog2yzF9/hWlwYryvAlMAHhhrcKQO2PjXU=;
 b=ETx/sut6bEU5r73j6B0Mgyg0ojCBUWhBzW/n2j5Xr1ufs6WPx5mc3UaZ14DL+QaJ0OB2
 jlEEbhF0ONASrihcedP1n25WulOfWZ7Lay9/Mq8zCOlZ4HYs9BEfOZcOKs43ROoSXbaj
 KqyPRUt02xm4jW//7lyXjH6R+c5vyWON1iwds0XPFNZ36yM5IZMab/wzZDVszjgAAjc7
 Ysgsnqizqkl7LUiczUARMGuHzR2BaA9DHS2mqcTxBdDlk9Qsv8tpP9x77Phkl7bJ+CnL
 HIeDQ6yN7j6Jr4PW8Fw0ImQNGNSQNy/CBrzOHnGhRTAVR+LB20i08YhhAXPOFe0SJZNh 1Q== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38wqjf0dw5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:48:03 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 152Eb2VO071107;
        Wed, 2 Jun 2021 14:48:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38udec2sbw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:48:02 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 152Ek8UP149485;
        Wed, 2 Jun 2021 14:48:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38udec2s9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 14:48:01 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 152ElxoA013866;
        Wed, 2 Jun 2021 14:47:59 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Jun 2021 07:47:59 -0700
Date:   Wed, 2 Jun 2021 17:47:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210602144752.GC10983@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601205006.GA10983@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 1qmS0lphgiy3MlnGPHFDDrh0GKAmV5zh
X-Proofpoint-GUID: 1qmS0lphgiy3MlnGPHFDDrh0GKAmV5zh
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > The other thing which might be interesting is if you pass a NULL
> > to IS_ERR() and then dereference the NULL then print a warning about
> > that.  This has a lot of overlaps with some of my existing checks, but
> > it's still a new idea so it belongs in a separate check.  It's fine and
> > good even if one bug triggers a lot of different warnings.  I'll write
> > that, hang on, brb.
> 
> 100% untested.  :)  I'll test it tonight.
> 

This test is decent, but I ended up making a few changes:

1)  My devel version of Smatch had a new bug in it which caused some
    false positives.  Fixed now, hopefully.

2)  The test:

	if (get_state_expr(my_id, expr) != &null)
		return;

    check was not strict enough.  I realized that I knew that from
    square one but I was lazy.  So now I have introduced a global helper
    function and updated the code:

bool expr_has_possible_state(int owner, struct expression *expr, struct smatch_state *state)
{
        struct sm_state *sm;

        sm = get_sm_state_expr(owner, expr);
        if (!sm)
                return false;

        return slist_has_state(sm->possible, state);
}

    I replaced the test with:

	if (!expr_has_possible_state(my_id, expr, &null))

3)  The warning message was too vague and too similar to other warning
    messages.  It should be something unique to the test.  It's now:

	sm_error("potential NULL/IS_ERR bug '%s'", name);

I'll post the results tomorrow.

regards,
dan carpenter

