Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942CCC433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 09:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3938464EC0
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 09:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhBSJze (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Feb 2021 04:55:34 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40274 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBSJzG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Feb 2021 04:55:06 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J9sK4D182930;
        Fri, 19 Feb 2021 09:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=PzYocZZngcWLs529+0jRRftRgXTvbBB9gytSJVgpAUM=;
 b=ACWsSB311Zr9m4Vpu2BzQqONNK4rHoQFj+Z4PG7qvIfKsBQuVrS0bJKxFI0CNUefnfiX
 59rBwHtdc7AWefNeZmfOeiiYyLivABdcKpnlvpP+LpDAyMHYJ0X6ZoNBelBc0s/m5Sy3
 YBm/7ieFte7KbkwyQTcaQNCr/5UMBZYHvZ85Ud565duFJlbiENtHzVHW3RhtI3lc2Ya5
 caM4Tb9/pBthRwuog+S1tVTk1hOu4HaVTFXWaaC3ECyhUqtO2YpgipIxbgZZ7nayD4R5
 m2SFlb9Xg+3gpbhNmMKFnV47SGUKHba4rIfG7PI2hGSe/85Yoy5K2KfvwxVg9GxZRRg0 tA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36p7dnrtwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 09:54:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J9oEEo180360;
        Fri, 19 Feb 2021 09:54:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 36prq1q84x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 09:54:18 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11J9sHwr015982;
        Fri, 19 Feb 2021 09:54:18 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Feb 2021 01:54:17 -0800
Date:   Fri, 19 Feb 2021 12:54:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vladimir.oltean@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: dsa: tag_ocelot_8021q: add support for PTP
 timestamping
Message-ID: <YC+Kwu7aO+yWAilC@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190076
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190076
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch 0a6f17c6ae21: "net: dsa: tag_ocelot_8021q: add support for
PTP timestamping" from Feb 14, 2021, leads to the following static
checker warning:

    drivers/net/dsa/ocelot/felix.c:1331 felix_check_xtr_pkt()
    error: uninitialized symbol 'err'.

    drivers/net/ethernet/mscc/ocelot_vsc7514.c:554 ocelot_xtr_irq_handler()
    error: uninitialized symbol 'err'

drivers/net/dsa/ocelot/felix.c
  1288  static bool felix_check_xtr_pkt(struct ocelot *ocelot, unsigned int ptp_type)
  1289  {
  1290          struct felix *felix = ocelot_to_felix(ocelot);
  1291          int err, grp = 0;
  1292  
  1293          if (felix->tag_proto != DSA_TAG_PROTO_OCELOT_8021Q)
  1294                  return false;
  1295  
  1296          if (!felix->info->quirk_no_xtr_irq)
  1297                  return false;
  1298  
  1299          if (ptp_type == PTP_CLASS_NONE)
  1300                  return false;
  1301  
  1302          while (ocelot_read(ocelot, QS_XTR_DATA_PRESENT) & BIT(grp)) {

What about if we don't ever enter this loop?

  1303                  struct sk_buff *skb;
  1304                  unsigned int type;
  1305  
  1306                  err = ocelot_xtr_poll_frame(ocelot, grp, &skb);
  1307                  if (err)
  1308                          goto out;
  1309  
  1310                  /* We trap to the CPU port module all PTP frames, but
  1311                   * felix_rxtstamp() only gets called for event frames.
  1312                   * So we need to avoid sending duplicate general
  1313                   * message frames by running a second BPF classifier
  1314                   * here and dropping those.
  1315                   */
  1316                  __skb_push(skb, ETH_HLEN);
  1317  
  1318                  type = ptp_classify_raw(skb);
  1319  
  1320                  __skb_pull(skb, ETH_HLEN);
  1321  
  1322                  if (type == PTP_CLASS_NONE) {
  1323                          kfree_skb(skb);
  1324                          continue;
  1325                  }
  1326  
  1327                  netif_rx(skb);
  1328          }
  1329  
  1330  out:
  1331          if (err < 0)
  1332                  ocelot_drain_cpu_queue(ocelot, 0);
  1333  

regards,
dan carpenter
