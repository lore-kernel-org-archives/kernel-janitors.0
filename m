Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63817C433C1
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 16:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F510617ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 16:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhC0Q2R (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 12:28:17 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:34664 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhC0Q2Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 12:28:16 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12RGQZhk143321;
        Sat, 27 Mar 2021 16:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=epw4jaLOGCLq4mMFlEeZQ1ergFUc4K/uHCfszGz9fnk=;
 b=P2IjiFLz+NUXxot4poLPlmVqrjpGN35fURclLE1+7hXvaVPxMhLMtiAUj2BHPAbTL1Qi
 lmqwTxSU1eUiwVBjRAdCyR+Ir9s070M4LixmX4fSAqXaGJI8EzpacWaxgDvN+ZmXvGPm
 UnMW7/78ydEFrUfD45WOLupn1MOWth2YAEsWCGYFp0j/YqC73Qlg8sqz3c3HfNLcwDu/
 aEYq9RWPEq1AgxSBxunRoSdk406vq3/jEtMjwr00FiDdrJlXP3j4oDrWjf7XMF4m8GCw
 yV82fPyMLBJa0lud2Vxq/GJ+N/ga7ToPAYYw+9qOTF5LbYHr5LxDkb7fN6w3/B/5jdOf BA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 37hvnm0n77-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 16:28:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12RGLeeK154917;
        Sat, 27 Mar 2021 16:28:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 37hstsjd34-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 16:28:03 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12RGS2au028898;
        Sat, 27 Mar 2021 16:28:02 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 27 Mar 2021 09:28:01 -0700
Date:   Sat, 27 Mar 2021 19:27:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marco Cesati <marcocesati@gmail.com>,
        Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 5/6] staging: rtl8723bs: mark some variables as
 __maybe_unused
Message-ID: <20210327162752.GG1717@kadam>
References: <20210327001736.180881-1-eantoranz@gmail.com>
 <20210327001736.180881-5-eantoranz@gmail.com>
 <20210327081758.GJ1667@kadam>
 <CAOc6etZaqnDXU4dgBmx_qd8iwpmEjDhs=7JnLuCUFxs65=TRHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etZaqnDXU4dgBmx_qd8iwpmEjDhs=7JnLuCUFxs65=TRHQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103270130
X-Proofpoint-GUID: ybhMCophKy2gtsWf6HTbP_oxDswkzYCY
X-Proofpoint-ORIG-GUID: ybhMCophKy2gtsWf6HTbP_oxDswkzYCY
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270130
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 27, 2021 at 08:44:29AM -0600, Edmundo Carmona Antoranz wrote:
> On Sat, Mar 27, 2021 at 2:18 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > This is just papering over badness.  Leave the warnings as is so someone
> > will notice it and fix it properly in the future.
> >

Take a look at the first example:

  1277  /* define REJOIN */
           ^^^^^^^^^^^^^
This is developer code which can't be turned on through the Kconfig.
Automatically that means we are allowed to delete all the #ifdef REJOIN
code.

  1278  void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
  1279  {
  1280          static u8 retry;
                ^^^^^^^^^^^^^^^

  1397          } else {/* if join_res < 0 (join fails), then try again */
  1398  
  1399                  #ifdef REJOIN
  1400                  res = _FAIL;
  1401                  if (retry < 2) {

This function is now only allowed to be called twice.  What the heck
sort of function is that where we can only call it twice???  Who calls
this anyway?  Something to investigate.

  1402                          res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here we are setting "res".

  1403                          RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("rtw_select_and_join_from_scanned_queue again! res:%d\n", res));
  1404                  }
  1405  
  1406                  if (res == _SUCCESS) {
  1407                          /* extend time of assoc_timer */
  1408                          _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
  1409                          retry++;

So, okay, we're only allowed to succeed twice.  We can fail as many
times as we want.  Weird.


  1410                  } else if (res == 2) {/* there is no need to wait for join */

What does 1 is _SUCCESS, 0 is failure, but what is 2?  It turns out that
rtw_select_and_join_from_scanned_queue() never returns 2...

  1411                          _clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
  1412                          rtw_indicate_connect(adapter);
  1413                  } else {
  1414                          RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Set Assoc_Timer = 1; can't find match ssid in scanned_q\n"));
  1415                  #endif
  1416  
  1417                          _set_timer(&pmlmepriv->assoc_timer, 1);
  1418                          /* rtw_free_assoc_resources(adapter, 1); */
  1419                          _clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
  1420  
  1421                  #ifdef REJOIN
  1422                          retry = 0;
  1423                  }
  1424                  #endif
  1425          }
  1426  
  1427  ignore_joinbss_callback:
  1428  
  1429          spin_unlock_bh(&pmlmepriv->lock);
  1430  }

So a lot of this is nonsensical dead code, and the "unused variable" was
a useful clue about that.  Probably all these are nonsensical in their
own way so there isn't going to be one answer.  Look carefully at each
warning and then think about how to re-write it completely.

regards,
dan carpenter

