Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A53C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jan 2022 10:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353850AbiASKkT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jan 2022 05:40:19 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47304 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240089AbiASKkS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jan 2022 05:40:18 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20J9TupG031906;
        Wed, 19 Jan 2022 10:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=0XmWA+BUZhV5mx/7QyIqksqiWqgmb1rvnTZKtEL70vo=;
 b=BaNTTw4ag3/7p7+G3xoBdO1eYUeEnVlDagwyA7WSTnskphNIOUcza9l6VksNv48yaBoi
 /3Nw+PsQliEszwQMsYT/yR+93LunOfvYMSeu4wh7aXWnMkt8R9lS4MDAZSJ+0DTfK2sd
 Ku8ea0eWZVoRmlx1fHh7ygCRqF/uFu2jvaDw9pEf5KcIqZh9iGdrIoNyfEx9+RiTWXxN
 x53je/kxDSk70EYeUgroTZzHYaFXg/qUS2If8xy0WyxSYyduPgNrsoJ/JQ/iCFgJTHiW
 gBtmqsqf4KKzbqlzOLXIKUnsuy1SnrZQ96RvVrXH9VcRA5jeBzirvhq6PfFqwrg09dde tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vmsjf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jan 2022 10:40:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JAU6Sk051087;
        Wed, 19 Jan 2022 10:40:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by userp3020.oracle.com with ESMTP id 3dkqqq4gn1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jan 2022 10:40:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq/bmdijPtMxlE4RSq4UIERdzvrsq0mTVlOpXJRl/b4PIUCVHWf6gAUPkx2jU/qDSrSqaf5HgrjYEmnNc6yHk1tHRb03goY+KFcP8xFZ6h8w+cnwTIbIV2NyDVq7aupdfNLZ7Tf04kCvUw364f1ZXaM9YGmsMKJgz0vhp6+kIVWWnyYLxORN1kw1XczDqcawiQ6iyI+Q+hVuE9F0BGJHEpMJTr6RQ0zXlPDuVuV0gGZGoN5yh1C7kfzA5JOb5PwJFBEOuz+0QDTjAyZ3GWHWQ3h2j9J9bVAdrFL8cT2WI1oSJ13Iys5ZVQOUtSiP9iSEswQwC2r56PT9MZ3UH5wqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XmWA+BUZhV5mx/7QyIqksqiWqgmb1rvnTZKtEL70vo=;
 b=djBWdta/ispd3hhx6cSPgHUiQ4oqJNrO9Z95txjNEIjz1RbA+Zbv0fZiaUgHTgNFS1dax+dFoBvjg1+YTAFNf1ZdRzk3hCTZxvtLRuwjtqMO7JfG/AEv5aDaWtlWctgG3YjMt7LYmCbH9+JYJVGonUrB6q8U7/rpt05OS0CFW8mjZyGILyQpjLPaef7l5WgEv+bu3f6pKJIGLw6//MW4nWB/OeZ+R4WdmZVJ5JW+Li5VZRqvw8ndPJIyrsR1OMtWGjRwKVKnTETS697ghs2gPytvoDzdZiSFmzO1UnoGz58oLsm298IUbYkovmBWHl7cQgtP2QeRX4xPudHt6Jmk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XmWA+BUZhV5mx/7QyIqksqiWqgmb1rvnTZKtEL70vo=;
 b=Ff5uJJsZWCYlnPGQzgQztEGCE3hYdJyPEVkGlKfUlDm1YQbatu+xqkigU/Thkp7VP+iEQ4ONYPpf5JsB/b03vynaTizkKTRGOFN9FeEqnKBFJIHQLT4sz4iGQ5ULZXmJfU9j99Tqsp136NoZbyvAybHmd+MiWoG0yMvvBbjYs/E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB2007.namprd10.prod.outlook.com
 (2603:10b6:903:123::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 10:40:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 10:40:11 +0000
Date:   Wed, 19 Jan 2022 13:40:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: lan966x: add support for interrupts from analyzer
Message-ID: <20220119104000.GA2730@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26214a37-a4af-496d-2ede-08d9db381127
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB20075135AFBD207F83BC32F98E599@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfD3r6HesbCzD9vaoksaeumx84WR/T9uoy/PaNRQyk+gbu3UDoYvF7LbeKa+9rc5D1FKUQEv0JsZ2AzuTbemFJAVDfPJXpy1AUQYElv2MI0ymiIaF+tnIyc3U6sYKJT5EPd73GZckjkcgT7Pm2Qil0/nIeeZ9cp/6yxigcRVPClZDTihKaEWVMGPjVme4Pmys/3vwT043AhQ0mB8GyYajSEXDV5i/w7yE1ZEnQWo74bqvvWBkBQ7vbcQQWyhiuMEfJTammvpB3c4HAoZo3gBbWCycD2cnBIegEN0J3XL1kMdRkp5XDBuAHhO1WHxwsixDqkcLLJ6fGQHyf1xZgSq6n8hinIg6Hpmg4Uxh5hZgmKhiaD4mG6qflx0I52mI53FKil7OqRt9dRGvFnnrUSidY/B7bDOC6eon59AuwWspMDrwv4SJihryxGseW0qablK9nbtbbPJn4xY+sCxDGTWX1c9jTQgT1N5XAn33mJjJinqOrqHgAMzMFrCsRIWGUhKBJH27RLMbZnyAB6hFLUcvy9iFDCM0ExQ0WsU2aKmh+no4v62C8BrCrZn6jjCU43JVHcCxUcex8kzceHmqoJ+icpkmW7mrtyanAMg3HeTXktbrg00x3A3oKiTmHhAX5HJKAlt+J/Q811RvX+yvOE66GOHKW3lUfO+fY4jjOVXKGNbYsve+UmzAu8jcE/sz1c489xTZnxEDj339p682KQNsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6486002)(33656002)(316002)(5660300002)(86362001)(6506007)(4326008)(38350700002)(83380400001)(6916009)(33716001)(9686003)(26005)(52116002)(6666004)(508600001)(66946007)(38100700002)(44832011)(8936002)(66476007)(2906002)(8676002)(6512007)(186003)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qRgpFFj3tAkMtv9fJOJm04z1cVo8uV4e0D7KdmUK8YTE3Ie5w+AvJYyP8fQL?=
 =?us-ascii?Q?MTUtEvQeTvzL5YaRFX3gJvorytR6zp1VRFxuBW0+mRnQaDLq4A8l/ke9NVj2?=
 =?us-ascii?Q?SwG5SDjyYFK8f/8D+QduaB4bS2TYC0sOoWn6tup/7Y5yiw5Jd8z2sToNWXin?=
 =?us-ascii?Q?4LF0pzuTTnM/tm+iMoTvOHyOOGHZFRngVIMRe28tfMsyfT1pCmMlHgQCj56l?=
 =?us-ascii?Q?y9W4WVsOr7Fd6k1EdLQX7VNuzPwzvQ0frKgMRXnofgSTHAgRGKHX1ssxLv0K?=
 =?us-ascii?Q?y+cSUX8MWpko4PwbK17OWcowPgELgkYhGdBXTdV6aJECoTzMe7K+//TcrC3z?=
 =?us-ascii?Q?zH0xWpCbSBRr1ZZGRiVKjqwrMayTInwN4LcGQWupDU1hEKEPxRTF/lIegXST?=
 =?us-ascii?Q?5gcSe6fDLBTVSyezgbwE9RaPCHE3nFzIOpnIGSZ8MvrVG9U8ZSdsOyHjiwYX?=
 =?us-ascii?Q?KvJRTJSe+2PaUSlUcpiUT6eB3qyFda7cKHnVLBBB4dYOkPnUJ1UkmfkyhRxn?=
 =?us-ascii?Q?1wh+5ho2VBwozrXIKYSfXST8waQzVnbXEJO7gsLdSDmAg1EFDt00wUoaDciM?=
 =?us-ascii?Q?HrUmszNc70XYix1L3b9I2Xg0UQ4OQmO6yjPrS/VUR5dVtFVEXdZj8y2KulnT?=
 =?us-ascii?Q?hf/OFaiXYM6AIVPdQiMi6oUwuSeJZ43AI5bAu16l//5fdnLyQ8lx/9tpZWQr?=
 =?us-ascii?Q?XShA0QfdaRkKa4L5N2zorVhj/s6YtKl1XOhR+CiKhbIyhGwqLNYoOVXVD4d+?=
 =?us-ascii?Q?nY081Wt54FZr6OdVp64uq0LqsTwH04S+3C9Y6zu6qY8y87DNXLAcRg8FMnvC?=
 =?us-ascii?Q?zSPtUWJujdORxOUDfG/pCJkp0pOg0oIe+JMPZvc9tOh0vGjgPzn7U/9xV32o?=
 =?us-ascii?Q?b1gsoiLqCz+BZFv3kQCoSZK3T3Yt9oZdGSRxxFu5qZdebD5xxW69J0LpZHha?=
 =?us-ascii?Q?X7yjK9DsZ7ixqnKAsA40/VmnFx/dNBvTKcaHbplvPt+1y2juGs75ZXM2hsIq?=
 =?us-ascii?Q?cPjN68MKkx9/2KSnDsFfnUMIW3jlbU9+q/BZpnwjfuH0ho7Q5XLzASnnrDmL?=
 =?us-ascii?Q?Gjns2/xaQl31dUlLmc+8sdsKkvQiJuZZe1uFACM/XNe+KVZHmjYX42kY1Qn/?=
 =?us-ascii?Q?/Gav43ulaoc3YlWUuCBld6RNXnk7u5QLZXW5i82wrMTmnJZs4iET8DN++ye9?=
 =?us-ascii?Q?Y2YgkiJwKmR2Rpm6dI9FiQf2o93dqqJ5d/oQCZ7TDdQbqYvG/5Jlk0G0Oxv7?=
 =?us-ascii?Q?wEThfKoCDBMsauDR461D6owiByDwuNN/Olj/XdOBK0hnnTQdjnrA9evMWYES?=
 =?us-ascii?Q?JchbfYlZX9vtv3/KPRoOQ7Y9hKqm7tn8ebK5AT6iizdVNSOFe9CfwXCcqB7E?=
 =?us-ascii?Q?176Ikk0j51ZxGoFmCaQtVhSPLPkp5M0aOci2I/6njdqdIJEyCnZOO/Y2ObU6?=
 =?us-ascii?Q?jnP3wFYmu+qja+wGl96YBziFTTyn59gDWgJHRp3TLuKJ96eroVFE/X8maVNM?=
 =?us-ascii?Q?+1TZvoIz9XW3TPUbmqEsXQoIpwEJnS+mSSr5k7zuoIpPBvriuIh96Rk2DP6/?=
 =?us-ascii?Q?e2B/hl5yklgbOxwrw86b1tmgH6Wo9dBoI4xakVf/IN8kI2JFoIwNMJzTTydC?=
 =?us-ascii?Q?U/xuKEettcGQKVP5bzF39bmpr+52bNEnTjouO7ZYcwoZlo6x7folj1vyhnXf?=
 =?us-ascii?Q?hCVfgsrupJFsGcS20Dnz5MglhAw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26214a37-a4af-496d-2ede-08d9db381127
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 10:40:10.8630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOyHnDnc+DN3CVt3nFmxKWh2lQJrkeKklM8VmdIqaiPlvDYBUXi7UmJiypMb7SnKRv+9Ac68ajteBQDwjmOU0WXwbCr/lqPFj5hbL1QeCTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10231 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190057
X-Proofpoint-GUID: vkfCDCSX9X0wVffOGQEITI3PHIMt66rK
X-Proofpoint-ORIG-GUID: vkfCDCSX9X0wVffOGQEITI3PHIMt66rK
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Horatiu Vultur,

The patch 5ccd66e01cbe: "net: lan966x: add support for interrupts
from analyzer" from Dec 18, 2021, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/microchip/lan966x/lan966x_mac.c:43 lan966x_mac_wait_for_completion()
	warn: sleeping in atomic context

The call tree is:

lan966x_mac_del_entry() <- disables preempt
lan966x_mac_purge_entries() <- disables preempt
-> lan966x_mac_forget()
   -> lan966x_mac_wait_for_completion()

drivers/net/ethernet/microchip/lan966x/lan966x_mac.c
   261        int lan966x_mac_del_entry(struct lan966x *lan966x, const unsigned char *addr,
   262                                  u16 vid)
   263        {
   264                struct lan966x_mac_entry *mac_entry, *tmp;
   265
   266                spin_lock(&lan966x->mac_lock);
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Take a spin locks

   267                list_for_each_entry_safe(mac_entry, tmp, &lan966x->mac_entries,
   268                                         list) {
   269                        if (mac_entry->vid == vid &&
   270                            ether_addr_equal(addr, mac_entry->mac)) {
   271                                lan966x_mac_forget(lan966x, mac_entry->mac, mac_entry->vid,
                                      ^^^^^^^^^^^^^^^^^^
Calls function which can sleep

   272                                                   ENTRYTYPE_LOCKED);
   273
   274                                list_del(&mac_entry->list);
   275                                kfree(mac_entry);
   276                        }
   277                }
   278                spin_unlock(&lan966x->mac_lock);
   279
   280                return 0;
   281        }
   282
   283        void lan966x_mac_purge_entries(struct lan966x *lan966x)
   284        {
   285                struct lan966x_mac_entry *mac_entry, *tmp;
   286
   287                spin_lock(&lan966x->mac_lock);
   288                list_for_each_entry_safe(mac_entry, tmp, &lan966x->mac_entries,
   289                                         list) {
   290                        lan966x_mac_forget(lan966x, mac_entry->mac, mac_entry->vid,

Same thing

   291                                           ENTRYTYPE_LOCKED);
   292
   293                        list_del(&mac_entry->list);
   294                        kfree(mac_entry);
   295                }
   296                spin_unlock(&lan966x->mac_lock);
   297        }

drivers/net/ethernet/microchip/lan966x/lan966x_mac.c
    39 static int lan966x_mac_wait_for_completion(struct lan966x *lan966x)
    40 {
    41         u32 val;
    42 
--> 43         return readx_poll_timeout(lan966x_mac_get_status,
                      ^^^^^^^^^^^^^^^^^^
sleeps

    44                 lan966x, val,
    45                 (ANA_MACACCESS_MAC_TABLE_CMD_GET(val)) ==
    46                 MACACCESS_CMD_IDLE,
    47                 TABLE_UPDATE_SLEEP_US, TABLE_UPDATE_TIMEOUT_US);
    48 }

regards,
dan carpenter
