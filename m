Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38376C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 12:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00A9D64F38
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 12:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhCRMMF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 08:12:05 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45166 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhCRMLk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 08:11:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ICBcF0064028;
        Thu, 18 Mar 2021 12:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9grBAC0g3vZ+WWkAksZTcuLBKTG37Ns8quMVzS/BJj0=;
 b=nVNgFk1nlw51TZM3CkS1idmuCI9mbKDAmhlWgR1D7MRH/urskS2aj1vEK2WLU7tsL7k/
 t+31FwgLO5qeuQzhY26BWzhyPXmtNY5kdj6diLHBgcqVBjmzoOZ9oG5D5iZlb1dLR8SC
 SOUDjSdU5IZo1BB6ItsJ98/ZKx37gxQGUt3pJSb/IiEelTSsjxowRMrySna0WaC2d/8a
 mcz6WfnMskRH9q445VN+r+vcXiNWz69hK+7ytAXNxvidl1LXTE2NgXaY4wsaiUY0NZRm
 R/p5M0dPANr6IK27Q/EUo5sdX6XU+xvwfd1qGMUqfaSDsdJUkeYSTQ4pywAQ9BGQk39n og== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 378p1ny7xf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 12:11:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ICA7DX014748;
        Thu, 18 Mar 2021 12:11:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 3797b2uqe4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 12:11:36 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12ICBZ1D030643;
        Thu, 18 Mar 2021 12:11:35 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Mar 2021 12:11:35 +0000
Date:   Thu, 18 Mar 2021 15:11:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ocelot: Extend MRP
Message-ID: <20210318121128.GA21246@kadam>
References: <YFNChN/C6JwVAV2t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFNChN/C6JwVAV2t@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180093
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

See also:

drivers/net/ethernet/mscc/ocelot_mrp.c:254 ocelot_mrp_del_ring_role() error: we previously assumed 'ocelot_port' could be null (see line 247)

regards,
dan carpenter

On Thu, Mar 18, 2021 at 03:07:32PM +0300, Dan Carpenter wrote:
> Hello Horatiu Vultur,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 7c588c3e96e9: "net: ocelot: Extend MRP" from Mar 16, 2021,
> leads to the following Smatch complaint:
> 
>     drivers/net/ethernet/mscc/ocelot_mrp.c:180 ocelot_mrp_del()
>     error: we previously assumed 'ocelot_port' could be null (see line 173)
> 
> drivers/net/ethernet/mscc/ocelot_mrp.c
>    153  int ocelot_mrp_del(struct ocelot *ocelot, int port,
>    154                     const struct switchdev_obj_mrp *mrp)
>    155  {
>    156          struct ocelot_port *ocelot_port = ocelot->ports[port];
>    157          int i;
>    158  
>    159          if (!ocelot_port)
>    160                  return -EOPNOTSUPP;
>    161  
>    162          if (ocelot_port->mrp_ring_id != mrp->ring_id)
>    163                  return 0;
>    164  
>    165          ocelot_mrp_del_vcap(ocelot, port);
>    166          ocelot_mrp_del_vcap(ocelot, port + ocelot->num_phys_ports);
>    167  
>    168          ocelot_port->mrp_ring_id = 0;
>    169  
>    170          for (i = 0; i < ocelot->num_phys_ports; ++i) {
> 
> This loop tries to verify that all the ports have ring_id == 0 otherwise
> we return.  It's slightly confusing why this matters.
> 
>    171                  ocelot_port = ocelot->ports[i];
>    172	
>    173			if (!ocelot_port)
>                              ^^^^^^^^^^^
> Assume the last element of the array is NULL
> 
>    174				continue;
>    175	
>    176			if (ocelot_port->mrp_ring_id != 0)
>    177				goto out;
> 
> This would be more clear if instead of a "goto out;" it just did a
> direct "return 0;"
> 
>    178		}
>    179	
>    180		ocelot_mrp_del_mac(ocelot, ocelot_port);
> 
> We delete the last mac address of all the ring_ids are zero but if the
> last port is zero it will crash.
> 
>    181	out:
>    182		return 0;
> 
> regards,
> dan carpenter
