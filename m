Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D43C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB32610A7
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238090AbhEJN6r (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 09:58:47 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60420 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244124AbhEJN4p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 09:56:45 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14ADsOkR026030;
        Mon, 10 May 2021 13:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/jZ9dmsp0noXhi3A13lb8Nb2kMyuabTqJ98lmp9CmZE=;
 b=vvqZJcwWVwAniRtAzrJR4lSMJgYxsI/jmar9pO8KE+LtpOWMYkmDTRj1W+oXskpYvQLj
 Ub9j4XewSDrGDAndPrUsIdyJYRTNpIN7Gu3mDntfuKddDf42zuA+XwDbg+kS5hxTqz0w
 Q+xk8LEIUFWD6wE56GhHemXDQkW2G35dTnNTyrs2GVGjLkubrdJemHTnItn9TG4aMtfa
 nm/dvxep9jfzVojA432wSh2KEOgr3eKCf9qfSywEo9qKzdU9s8fgddemzMCE6HwxfxxE
 mBpdoNP1vYmzP/WRrFYyOofwfbPp5ZTKpLlywWF/AfYSFDSci8ckDmw4q/uJ6yvhAk61 iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 38djkmba30-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 13:55:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14ADtXtK054743;
        Mon, 10 May 2021 13:55:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38dfrvfkmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 13:55:38 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14ADtcKX055404;
        Mon, 10 May 2021 13:55:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 38dfrvfkmf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 13:55:38 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14ADtbB1019301;
        Mon, 10 May 2021 13:55:37 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 May 2021 06:55:36 -0700
Date:   Mon, 10 May 2021 16:55:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ACPI: scan: Fix a memory leak in an error handling path
Message-ID: <20210510135529.GS1922@kadam>
References: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
 <20210510053958.GO1955@kadam>
 <CAOc6etbVZkANHVVmP5rss-nQqSYNiSFRXrg_nVUBV-719xKqJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etbVZkANHVVmP5rss-nQqSYNiSFRXrg_nVUBV-719xKqJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: eY_gAmGVJjqf5GXkCxzuqOx65b2UupAc
X-Proofpoint-ORIG-GUID: eY_gAmGVJjqf5GXkCxzuqOx65b2UupAc
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100100
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 10, 2021 at 07:18:14AM -0600, Edmundo Carmona Antoranz wrote:
> On Sun, May 9, 2021 at 11:40 PM Dan Carpenter <dan.carpenter@oracle.com>
> wrote:
> 
> >
> > The best way to write error handling is "free the last resource style"
> > where you free the most recent resouce that was successfully allocated.
> > That way in your head you just have to keep track of one thing, instead
> > of tracking everything.
> >
> 
> IC. So the answer is rather: single place to free stuff? Yes..... _but_ in
> a layered fashion (through tags) instead of having a single tag to take
> care of everything.
> 
> Follow up question: is it worth making a patch to try to simplify a
> function to have error handling set up this way for code that is already
> working? Or not really?
> 

No, absolutely not.  This is just my preference and probably the most
common way to write error handling but it's not an official standard.

Plus it super easy to find error handling code which is not working and
fix that instead.

regards,
dan carpenter

