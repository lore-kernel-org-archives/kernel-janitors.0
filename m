Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB83C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 11:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6283365020
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 11:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237368AbhCPLkP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 07:40:15 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:46438 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhCPLjw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 07:39:52 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GBdndR096768;
        Tue, 16 Mar 2021 11:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=atOhdcXUKCT50ELEExZue/NkvXYtUzdYbx0+LTWSGRI=;
 b=vpVASmZawJk5/v0FwhGBjwLHvamdaKK3Dh8DuQLTJ2eyJCFY8msyoNNOI3fzXrTu7d8p
 L5t5GMEn95N+KMzP8EDQ5zbMePXEugH1Dro7Le3EOeD+IPBBySArgfU7ReNGkFUlnmpH
 dzGdSR9/Cc3HTeqFZCkVtw+QpTlyG1sNML1DmjIelwZ72NIlIucrXJLR8PMKO/qP/R45
 OvtpAttNZk0kU5HQc6ZHNNXx78xvxI6O6xkqsKbLyVWiI+BJIFEbaQQ5j15zRniUr2FQ
 +SPjGimKdfVlxovRyRcx9bWn9LYUWyMDkL72eRYBvX0nJmc7z9jJ1GmY4TqR7bR/7acw jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 378jwbff7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 11:39:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GBacgJ004324;
        Tue, 16 Mar 2021 11:39:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3796ytawsb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 11:39:48 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12GBdlQY007204;
        Tue, 16 Mar 2021 11:39:47 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Mar 2021 04:39:46 -0700
Date:   Tue, 16 Mar 2021 14:39:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 1/3] staging: vt6655: remove unused variable
Message-ID: <20210316113939.GT2087@kadam>
References: <20210314145943.1933245-1-eantoranz@gmail.com>
 <YE4zVDlsYzB/CqkW@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YE4zVDlsYzB/CqkW@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160081
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Mar 14, 2021 at 05:01:24PM +0100, Greg KH wrote:
> On Sun, Mar 14, 2021 at 08:59:41AM -0600, Edmundo Carmona Antoranz wrote:
> > Since its introduction in 5449c685a4b3 (Staging: Add pristine
> > upstream vt6655 driver sources, 2009-04-25), the values
> > stored in variable byData have never been read in the macro
> > PCAvDelayByIO. By removing it, we are getting rid of a warning:
> > 
> > drivers/staging/vt6655/upc.h:45:16: warning: variable ‘byData’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
> > ---
> >  drivers/staging/vt6655/upc.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
> > index e086ec6e77f7..f00d0fd90003 100644
> > --- a/drivers/staging/vt6655/upc.h
> > +++ b/drivers/staging/vt6655/upc.h
> > @@ -42,14 +42,13 @@
> >  
> >  #define PCAvDelayByIO(uDelayUnit)				\
> >  do {								\
> > -	unsigned char byData;					\
> >  	unsigned long ii;					\
> >  								\
> >  	if (uDelayUnit <= 50) {					\
> >  		udelay(uDelayUnit);				\
> >  	} else {						\
> >  		for (ii = 0; ii < (uDelayUnit); ii++)		\
> > -			byData = inb(0x61);			\
> > +			inb(0x61);				\
> 
> Are you sure that the compiler does not make the inb() now go away?
> 

This is safe.  The compiler can't remove it.

regards,
dan carpenter

