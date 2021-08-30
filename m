Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFD2C432BE
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 09:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6EC96102A
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 09:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbhH3JF2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Aug 2021 05:05:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57050 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235258AbhH3JF1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Aug 2021 05:05:27 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17U6wrmw020836;
        Mon, 30 Aug 2021 09:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=21bK0TxxddCyUTiTCNLH5sag1o/CQap3tSmWlbyeYvA=;
 b=sp/A9C48PMolRwU50BsoLGW+TDqxcZ5WXiyKlftZto/O6WV9Dyl5ny0tyInFqpR6Z25S
 S4gN5CnI4wtc+Yaq3k81jrRvOR8t818iqu560dP4WAQMx2XHrP2Us/+B4/B9QZopzHZY
 FSPNzvnxYIo/CD3fUZcx5eqN86TvYMD0hLu1YRyT815HA+NBHQfK9dbYyGyGKNY4ozOr
 FL1LEf1JwsLWDb3qB1SfaI/FT6dFfKQqaF6IqYRcaXdspA+pHG6lA8yppLCCXZJWMZw+
 JAKbBGVkyccBwiV0o3VU1O8PCflL2Li/uhPuV74wNO5UC6bV8O9lTxyT+aa6e+Hi+7Ni zA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=21bK0TxxddCyUTiTCNLH5sag1o/CQap3tSmWlbyeYvA=;
 b=cCWJ+q9uId7ue9OmMI8CAK3RZtThwgEixcEsKYf/sMjf/NeLsZOKoY64hbMZmSok2mNB
 Ns4RJFUpB7Sx0a/FxGzdWeRfQCNzb7ifvnH5GgAoCuSVpcyU0hB8uncssXdw/hg8cgmY
 k5enxe1KB0IxzK85JNtMtU6hnKPHLcEUIMUBAmIDaduQcnWB1Ua0JENBVrrmwUFas1dg
 uduRo3YbKnGdTH8AsYv5SYct+CNWZmBz+XUmwuxI71ehEA4/4DKiUB7caBQqGjYMKlmh
 O71meloHuqW5VeHucbhfRdpoDS1/3uKuF4pVlVVGe1Pfr8WQo+kCHI5J4D0C2AUcGkLT KQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3arc1a12bt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Aug 2021 09:04:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17U909YX139467;
        Mon, 30 Aug 2021 09:04:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by userp3030.oracle.com with ESMTP id 3arpf1yxdf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Aug 2021 09:04:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTfZ12WIx0SYf/UslO+3PWRwNovOOL6I77ftlOvF0F8F9ZCWSLrzhyhvR0uLAgQUFkdq9HD02wlzpYgIY4xb9gc9xfdO6dssYj1rUYmdfT0oNk3z4NRxN5xnyf+Phqp4mjW31eoDLO+MQNDcwchLNzjSA1KJv8UTTdAbXDQGiIyWgDwuxit8WtDxmSe52pu1auMcvJSrEAcHnFN53wpPhGQeozfzoPWN+3f+bRmdM/gIzl0UanHZwfGJ6MRZfIxMba1yAhxMlBk16JNyhKCanWiACZcvmCpkWWq2rp8+MZlFpEO6N7dWBt7EoD7/4rbUBb2DGh+lVTdp4d5T1af3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21bK0TxxddCyUTiTCNLH5sag1o/CQap3tSmWlbyeYvA=;
 b=BrrU9Lslzw9MGDvSVju32KA6cwh9wHe6HYNleErNop4VApzKNVOWdCXgAZGtC+jVRyiZPeN6spCW6FyK4Ko7lMEDBv/wjMF2Ebtr3Rv1NoMhy2rUvkNyXmxqfYKIVw8pfNnjXwRjB+3o3L0GlvyWQEdvnh/P/nbLW0wmoG4mhaUlUeVYnkRFMfTHZB6xxxWd5z5WoXfgbDu8CHfP4vI74VTjBLhE6sjoP+3Qjvw0tPIJMP2ct3FIpdwdNqKdn6gLeo6hC6wiOE+V3y8nIs25xOSBJb/QJm1vMqz+GxzPzPmROr2/lgsTPiNhMtvTtfMR7hO3QAL1JLLIwyOSb7NC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21bK0TxxddCyUTiTCNLH5sag1o/CQap3tSmWlbyeYvA=;
 b=mQCoR2t6U/SyD/9CDlBqM90R2Z74MIz8b0VaUH9kXOGWe0EJXgI9pOgjMn7JlQDO9D85PCPHraxA/IC9B+5KHOA2t4deHQBpZH2dsQHhGMQv0dwMCnyF1CphLSYWzKQXugGFN22wlGdGLY9zYl/qhiUJp91LSVfZfqg65lcS6ak=
Authentication-Results: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1374.namprd10.prod.outlook.com
 (2603:10b6:300:24::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 09:04:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:04:26 +0000
Date:   Mon, 30 Aug 2021 12:04:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rdna@fb.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] rtnetlink: Return correct error on changing device netns
Message-ID: <20210830090405.GA6314@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 09:04:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e483787-4eec-4a34-eb8b-08d96b952b00
X-MS-TrafficTypeDiagnostic: MWHPR10MB1374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB13748E562321B443A8CE83B48ECB9@MWHPR10MB1374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+mlA9tI4nMD7j8s2urV1nXR+6xJofFoJYtrW1yOkDyQw2Bt4yS+pdOoUanScUpYDKNCQ7DO1OCuuHhi+6hrOzUNaEgJWRBU2caHRKaSzlrAL9LNnib2tfPO5Ajt9JOcQYzHwzy5sQF+6FoUnooZRLIRBTQBwAxBZEexysLRojgdzmjFGjxE017UCmyDPF5KXXno80LkaTs+/gnMxPjx20nMnCNwpucNhlx9AoSTzSlwOpzmq7NrTQVfakR2F2ui/CwHoAk+vOLbBRnRui/eJbk+tcpCiulncsCNBCWH0u7Gq9UyIukdLtgkk7oSfTCL9EU9j/GR/oKLrZXt6O90rB5lAmjkA6gifP8n6pquTVyChdAHCHbi2zLhXRq/mnWX0reYu3nikwsPwR6cKAV2FLxaGXYnjJy2irpuS+STl4TW7rj7+PC1J1pkZeXH1zlL3wwOYiT9XEnylO/ErxQpxshms7POTTPC0zW32TeoQOZYuE1jPrDKjWJRBQ/hk8JAe3w6dR2JWto21DjXoyGYdxzD8xQRg8uEPg90uXtmukXQ43uvZVZI2ryDsTP0uhaqbTmdhmal4ngnaojkzvLraJJr/ZKxMZnYVZFM4uduGy2X/tu6O+zwJ0P5xaEbbJnQYRhj0/kT2HJvsWFcA3uM2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(346002)(396003)(376002)(33656002)(86362001)(38100700002)(9686003)(55016002)(83380400001)(5660300002)(52116002)(66556008)(9576002)(186003)(2906002)(6666004)(6496006)(66946007)(8676002)(478600001)(6916009)(66476007)(316002)(8936002)(33716001)(1076003)(44832011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?flVdnazVnnMZmMLkMK16syWPm1pKNSJsYgpr3ZHz7PWDyzzNJaU9ejVeBzYV?=
 =?us-ascii?Q?o0huPW/aLKefdY5+BF4IOsTCA/QjVv0P1ptNoaeKGSoI84gz/qpsFRI4zag4?=
 =?us-ascii?Q?/r36c0FPNzpWPYvdECHppLvvblQ2xwUzQWfggJ+fySyaNntRN/Q1b5bo3giv?=
 =?us-ascii?Q?lynieWj2N0Py78QMvPTJQT89lrxrBdxU4aoRY3IWwvtgYFuegcKt/tqo5T84?=
 =?us-ascii?Q?FhywOWUAkQ6DQXkcK4/vpMQvXX4Zv5l4CGWjimCDPZSVmsAyx9oCvzWGfG5h?=
 =?us-ascii?Q?IpplWFsFQsuJgsHXoIiJj29uGViSi1sxpp5xjOsQ7ogh9SK+tXlFo4wsA+W3?=
 =?us-ascii?Q?qGhHp8Cx6Ovh4mG+1F90LlGURT5B54TriLFvONCwO+uAWFYREBiviQzDC3gA?=
 =?us-ascii?Q?gap9RjBnjNpAuSIfn+GZyDW9dMFbCahKU8uLYdR0O4DxJCF010Ut2L+qrr8U?=
 =?us-ascii?Q?c32LxtS+oxrxqGUSpaloltEEH472LK+oxjVC7uGbE4ATkIgrfyIxTHk8P3sG?=
 =?us-ascii?Q?fTYl9112TpVruB1MY7xdYkN2pVkpsouqy4eRfVBG0I5Tz+Z4IIpkoot8Va22?=
 =?us-ascii?Q?EnujJNFIIGToePVd9dPIEbFSIfJeB53k2R0ucBT+Xfc5z+E/A06ngY4PW8gD?=
 =?us-ascii?Q?z6IVAbcfwLebkMqomwwyiVPdTWoC6sGNyFu3mLmKURmvYKf6RRwBxTw4saLd?=
 =?us-ascii?Q?UQuqR3QYEGlyPtCvPJI0fHsK41WHk/Ehl1xYYTm1wqKnW+ru85LyTXa55AaQ?=
 =?us-ascii?Q?p1PoBQ7axPG70g3GY77Tf1JKylC96RLfHf+9TmQV9pXB7Aof6mRyF3ImheY9?=
 =?us-ascii?Q?18Cucr2xWkmfCcPJipBQq+NAxdjb6Xq4XsnqDXLBBleDOZ4mtzRRAkKWCl7R?=
 =?us-ascii?Q?0d3WE1Xs+KnkjfPUuJ4vol6c9ZZtBbf+i2baDjYzTvDh2Mdb3xMVmGtzG7Oz?=
 =?us-ascii?Q?M2+dlTdPh6Ogiwh3avY1XnlEALcg6PFcgXmLcdA225gq8R3AQ42aeWp7OWzx?=
 =?us-ascii?Q?QCrDGTKtP5qEFHPUZ6D1OmbmtxUCC/dpJLzoaTuFQPsn/sB07zSOdbCb5AGS?=
 =?us-ascii?Q?PwB69NXOKpJ7wyRXtXVXtF9LGB6EIiyM6ku55cwY8QM2GC2q0JteA2N9MFM4?=
 =?us-ascii?Q?60sGa/NaRpU/3GEm88i3lHflNBIel1o9yBut+h+6taRK9jtuNxzwSq62C5Q0?=
 =?us-ascii?Q?IGFH86NbgZixEVVRpOrr+nA5BxdEsbpaXcGji1ds3de3WkTgTUqFYeRztHWB?=
 =?us-ascii?Q?L16uFdQ37G80pMepbhm0GTHjI9BXpq5bdSTMfDQgkD2zsGJZho6ZZVeCJP/F?=
 =?us-ascii?Q?uSS7P5GV6vmseqokJXkNdsfCCCEa+hBH++vd0e5cSPmGL90Bg2YpMRuy6vN4?=
 =?us-ascii?Q?U2R1NTo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e483787-4eec-4a34-eb8b-08d96b952b00
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:04:26.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFkaZa9aC/aX8xle3lnpOn9J21z1zG3UFmNbJp9mghzfE2SxztXSZbCgKfpPCgNgdzdXfYSMDa5pY4XdfOIYL/GLT0myuxeJEt3Apm7lPxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1374
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300067
X-Proofpoint-GUID: xl5YqZgbEzzN_pnc1SP1gYUXvPbQ6tda
X-Proofpoint-ORIG-GUID: xl5YqZgbEzzN_pnc1SP1gYUXvPbQ6tda
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Andrey Ignatov,

This is a semi-automatic email about new static checker warnings.

The patch 96a6b93b6988: "rtnetlink: Return correct error on changing
device netns" from Aug 25, 2021, leads to the following Smatch
complaint:

    net/core/rtnetlink.c:2698 do_setlink()
    error: we previously assumed 'ifname' could be null (see line 2608)

net/core/rtnetlink.c
  2607		if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_NETNSID]) {
  2608			const char *pat = ifname && ifname[0] ? ifname : NULL;
                                          ^^^^^^
The patch adds a new check for if "ifname" is NULL.  Is this required?


  2609			struct net *net;
  2610			int new_ifindex;
  2611	
  2612			net = rtnl_link_get_net_capable(skb, dev_net(dev),
  2613							tb, CAP_NET_ADMIN);
  2614			if (IS_ERR(net)) {
  2615				err = PTR_ERR(net);
  2616				goto errout;
  2617			}
  2618	
  2619			if (tb[IFLA_NEW_IFINDEX])
  2620				new_ifindex = nla_get_s32(tb[IFLA_NEW_IFINDEX]);
  2621			else
  2622				new_ifindex = 0;
  2623	
  2624			err = __dev_change_net_namespace(dev, net, pat, new_ifindex);
  2625			put_net(net);
  2626			if (err)
  2627				goto errout;
  2628			status |= DO_SETLINK_MODIFIED;
  2629		}
  2630	
  2631		if (tb[IFLA_MAP]) {
  2632			struct rtnl_link_ifmap *u_map;
  2633			struct ifmap k_map;
  2634	
  2635			if (!ops->ndo_set_config) {
  2636				err = -EOPNOTSUPP;
  2637				goto errout;
  2638			}
  2639	
  2640			if (!netif_device_present(dev)) {
  2641				err = -ENODEV;
  2642				goto errout;
  2643			}
  2644	
  2645			u_map = nla_data(tb[IFLA_MAP]);
  2646			k_map.mem_start = (unsigned long) u_map->mem_start;
  2647			k_map.mem_end = (unsigned long) u_map->mem_end;
  2648			k_map.base_addr = (unsigned short) u_map->base_addr;
  2649			k_map.irq = (unsigned char) u_map->irq;
  2650			k_map.dma = (unsigned char) u_map->dma;
  2651			k_map.port = (unsigned char) u_map->port;
  2652	
  2653			err = ops->ndo_set_config(dev, &k_map);
  2654			if (err < 0)
  2655				goto errout;
  2656	
  2657			status |= DO_SETLINK_NOTIFY;
  2658		}
  2659	
  2660		if (tb[IFLA_ADDRESS]) {
  2661			struct sockaddr *sa;
  2662			int len;
  2663	
  2664			len = sizeof(sa_family_t) + max_t(size_t, dev->addr_len,
  2665							  sizeof(*sa));
  2666			sa = kmalloc(len, GFP_KERNEL);
  2667			if (!sa) {
  2668				err = -ENOMEM;
  2669				goto errout;
  2670			}
  2671			sa->sa_family = dev->type;
  2672			memcpy(sa->sa_data, nla_data(tb[IFLA_ADDRESS]),
  2673			       dev->addr_len);
  2674			err = dev_set_mac_address_user(dev, sa, extack);
  2675			kfree(sa);
  2676			if (err)
  2677				goto errout;
  2678			status |= DO_SETLINK_MODIFIED;
  2679		}
  2680	
  2681		if (tb[IFLA_MTU]) {
  2682			err = dev_set_mtu_ext(dev, nla_get_u32(tb[IFLA_MTU]), extack);
  2683			if (err < 0)
  2684				goto errout;
  2685			status |= DO_SETLINK_MODIFIED;
  2686		}
  2687	
  2688		if (tb[IFLA_GROUP]) {
  2689			dev_set_group(dev, nla_get_u32(tb[IFLA_GROUP]));
  2690			status |= DO_SETLINK_NOTIFY;
  2691		}
  2692	
  2693		/*
  2694		 * Interface selected by interface index but interface
  2695		 * name provided implies that a name change has been
  2696		 * requested.
  2697		 */
  2698		if (ifm->ifi_index > 0 && ifname[0]) {
                                          ^^^^^^^^^
The existing code does not check.

  2699			err = dev_change_name(dev, ifname);
  2700			if (err < 0)

regards,
dan carpenter
