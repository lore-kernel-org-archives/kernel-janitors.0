Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C03C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 07:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEE0F61B08
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 07:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhKQHXj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Nov 2021 02:23:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51264 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229973AbhKQHXi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Nov 2021 02:23:38 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH6Rfox019192;
        Wed, 17 Nov 2021 07:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=dJ1557xHVpiavdb0rjel6k9Yh4pR/cL6H78MmweFyTk=;
 b=REXITo/+6Al+B12Rd+6nnaQql/AQgPD0/TaC3LoV8+39aS7tsDJav69a3f8iHR4w1PEd
 PD5hqXyiL3SI9//VRAdGnoSjgQIg3p25NH+keVY8TPur0Vxn4CJw+fNERHOWt3tFqm8i
 oA1ZTRWve44QkC5sb+7EHRiwBluDJPRIcqQte6OytQXy2XhPrOjEdUr131azB8Rsi0gH
 j4SmSWxEKkZ6rZxWph7fOe0c5fCa8pl7GJT6UxVnAIOANFUSWNE+vIfN4ynB/5zlaV9P
 BpWk1gVrcL3rlXyDZVomR4+Y242vhgNZwMdWq18RhxLf+93GGyUVvVsyGyXxDruIlp/U gA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhv5efkg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:20:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH716as177658;
        Wed, 17 Nov 2021 07:20:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
        by userp3020.oracle.com with ESMTP id 3caq4tu33p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiBXeJRw++Jb7Bqh6wSqbuzyb5VUIxhbXqkJwh1hBOEF7iacXUJXtMqryIejQzTP2MEa4nFLqzdfiHybOrzjSbtiXaMWosrogqH0RJXOiQmHkQVqKacQGvQ1xuiH4+OdSjlGXuHuIYKC+7fRxBBXmWsTqxb1Ow0qNy+SshPaIFALN1Aqd2adtpcWmKLdzopG2r432UgjBnhMMlFI46IjqOQgXni+qvuIM2Vux0QHv042iu9odO6OypgdIS/2iSAbvwUankTbcza/Cwe/RoRQ2u91XGMpqKTmZTgjCtTxg7au0sCN8j4Zt+HIx9idp6q/G3aSsgZ2ABY7yunIsyFiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ1557xHVpiavdb0rjel6k9Yh4pR/cL6H78MmweFyTk=;
 b=f8ri8yQ5oS51j+2A63HxR2Uk3VMwsXhJmkcOcP8RLgaUn9y0QHElBopyCJzQ5qSZcgSY9ca05ZnzaMxmMIeYeNIYShGdklCnMZiJvMA7XKaSBhafzR27dBqtClkLZaFycM/hqwFAT9kaaG3e78LHXtgoJsX/i/zlcFsmEmrZWBg2IFZDYITi3NMf1sx/bjpD/QcF2gJZBD/h6SD8XtYtVIOWoniKuAR+UurFCKZkMWTzdIQFVHXv8t1Kwhx/OykdQx6Ot9MfdEW3CFyWi8J6tF4SdWuIW/XOcC5CWUqUltCVbm5F0rZs9bWCj9jmEeN8smOMF0Y7C+8MrNgGMHoZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ1557xHVpiavdb0rjel6k9Yh4pR/cL6H78MmweFyTk=;
 b=qF37bSjJRQqRUfdGFBT8Wxe1cOM7I9693cWfxcddFLF7zHiZqy3VXsgNQgk9iE57aVtbkbkFPg0YLT9a96TuVUuWfwMnkuau8eDA/my2ZQ9+b+r2GBTCYbV7dhfh0NzR/WJVUqTWGTl2Mkxto4qcwre0LCOWcJs7fipht5zvNPc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5807.namprd10.prod.outlook.com
 (2603:10b6:303:19a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 07:20:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 07:20:28 +0000
Date:   Wed, 17 Nov 2021 10:20:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     William Durand <will+git@drnd.me>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Saurav Girepunje <saurav.girepunje@gmail.com>,
        Tuo Li <islituo@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix use after free in
 _rtl92e_pci_disconnect()
Message-ID: <20211117072016.GA5237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 07:20:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1619e867-974e-427d-7933-08d9a99abb49
X-MS-TrafficTypeDiagnostic: MW5PR10MB5807:
X-Microsoft-Antispam-PRVS: <MW5PR10MB58075F1BE3536B06F97211088E9A9@MW5PR10MB5807.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTf+Ax5+z1YKUdMfOf8IQvzp58wsplMQ7LZhiEBtJiTnErPKmLvVgOTEYimjB8KcXbgfdlfaD563lcYS0lHbsxd33fwKH0+R12C+5IkoTo2bQ0Z2tGMTcQcD4wn7Leff7S/9zKrnEMDBjLE0PerSBSDlqzaw+v7FS0AJ2FApqA4A0MktwctlO1oQXObnlLtTdvDQweRm9CBcOaIeEOtcJIg0h6EAYDpI44BtkcUdJC1KatgCR67RBkbRglOEB+hOWz2DyoSP4YJKHaVSoZlOY5Mk0ncxqDXCByq7gat6W4kXzDBqp8RY01IQei2cwZxTn238SDpAlblEGZ+S4Cz5vA/DEiWELLRqynWq81XQRcRnGfNwKZ1J6mBQWeNZd7g8oxEOkBfv/I9mlSJ9STdu6Xk3vL+cmgZB6kQlAo8DaAbH2AWY63lD2l9g971mePERwRmkf8ISx6wPYyGnWiHvoAyzqm27zboOmQWBDRuEJhBG6Xm7edcJZbKzBY3eckma2h06K2DsTPu8CVbvCk7qpH4TmbAusQJeHN6rCyIYsHGoHeDebbCk4BaI503BUNVwF5yYKekEJzB6saNE2We3dhEdMnwAv5l5b4kY9wAFcvFDw6OhkToLP06uqA22poTEbe1he3yzqo8CMvD9f/x7z1yZbFT6Iu8sP8DVSx3lo4CYPQSx6ZVWfJnElMJU7TgBjbfgRE5RYiajVxPUz5bn5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(66476007)(52116002)(4744005)(8676002)(38100700002)(6916009)(956004)(86362001)(38350700002)(1076003)(9576002)(83380400001)(6496006)(508600001)(8936002)(33656002)(6666004)(44832011)(2906002)(9686003)(55016002)(186003)(26005)(4326008)(33716001)(5660300002)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95HTgiIjO+e9SLcUudrTXM6sP2t1Myi21WHjvMxYvIIa8vYaJYeBMJcnqNrE?=
 =?us-ascii?Q?G30F9jHLuM+kLkJbLLrqygocTwNgTALbbi2ZyTfjmHOazsNeo5+e54Ovw8vE?=
 =?us-ascii?Q?XNYR89oxLjfIopWFzirAraqdUJjVW0p/ecED9+qUesc8Dz5vypXszdu21C0B?=
 =?us-ascii?Q?5f+5h/DRGBqBYunW5mF1B1LW717GjrMBDV6+Rr5bfc6VBuTMpuyMQgKkfozs?=
 =?us-ascii?Q?4MroCxWxn6cOI6w5eYOwkqETv8J1N3h3EPd/0gIIc1eDfqBwVQxNM3JJTGo3?=
 =?us-ascii?Q?Uz1gzvwAI5VhQ6hiaKOAcDMVtbMACIIFdECXYt5ffGh4siUM00geFpKtSMBo?=
 =?us-ascii?Q?3OGogja2cZ6ifFsLU1ZP1YhWeYp6YjuZZYysoPdwffLJnnE/pJRA9ZYPzVVe?=
 =?us-ascii?Q?iuknOoSY5LtFC6I9npnHJjvS9eJBV3y/42lJFFfdw6Y/w4gOLeUw7w+2oGy9?=
 =?us-ascii?Q?QMpefzpNbVQQSL+euJmMddttdDMWLK5wKGKlzHHcK3U42AFOieunSEtWDTS/?=
 =?us-ascii?Q?z6CgKTFtW07TphiiSaiu6YZvO35VAJQZ2bSDgVXQUQbV4NNEYQN4o6B3y1W8?=
 =?us-ascii?Q?cDpmf0pU/EnZ48wtak3rCV6u8pOuARZOYEtzMbvBi4TCS5omTfLPRs3DxjG1?=
 =?us-ascii?Q?BxLqe3k52gp7uyVjdq7MIEqBinc9/PsjMwGdE+BGOQ6M3HX7wNtAZjE8tupk?=
 =?us-ascii?Q?6Uj/v8WzQe+L4C02V/XDNyiVgGXBB0/shqokg/rRDuDPWGlqm+D+9hsvMFs8?=
 =?us-ascii?Q?YwQbcVPOqEnpnkCpbU5201ekNYRfsK1yZsG5m9NKfkLtUovUlMw3+44Pf8W6?=
 =?us-ascii?Q?OnNh5V6zE7JFBZtyRMMoFl3WqL0qBWWnr3PTdg4aBwAKPe+OAh0vUQSsNSzr?=
 =?us-ascii?Q?hGQHwLUdJN7iYfPrdtTT8XdXjRXDyyV1rAlOQjVPvzoDCnaTN6xKNrXcN4/z?=
 =?us-ascii?Q?yeDgvK+urY7J0Z5PYLN4qg7hRwQoYxs8jWZqj3/VwiZvCH7GXwH6IM/0vAph?=
 =?us-ascii?Q?++MKbtzJLiEPwJ8QDqrV2VHzZABdlsglpUx1j/mvo8GdXJO0peJ+ZxwlkzsO?=
 =?us-ascii?Q?z+0chBTagWV5KonG/DUs3p7sQhiUVYrUySDTNBzTHm05dsoD+qOaZH5wvOxr?=
 =?us-ascii?Q?gBJsWUOWKC+y6jFeE4q8n5C92PH1U2uuHfkdOElAX24Gk5zWN8Qf4XOEJVOY?=
 =?us-ascii?Q?rEndKQe9/D0t5tSUaSlSUg6+noKiR8MFeR3hw1kP91JLOo74HHICGutm2upu?=
 =?us-ascii?Q?Xz8Lp4JLFlvBA43Jks/GGecgDqpoUDTaR0w8mQyiQlI62whBEbaZCkQ+Uc2u?=
 =?us-ascii?Q?9SmgMQ95xz2aXoAn6bd4E0yToT3g8OCzM/FBm4zdvXJxkeAGmx60bzJ1KuPv?=
 =?us-ascii?Q?wAIKJbfm64updTZR5G8pWI+Agq7T7xGqdxiPcg8QOq4nssIEYl4ZfzMBN/mP?=
 =?us-ascii?Q?0diy2aIU369F5m3PTon8ayXmlFQva/qTtqnh7gx8toZylanaXgtqntZJ5/Zq?=
 =?us-ascii?Q?JqvCozp2aSZTYtPCy8LdLeuyZPCCCtC/7HWYn9p/2wX2bC7ELIaKGOI936cA?=
 =?us-ascii?Q?dUdtCoRy/ASkxcmVlTQt4ZmXZzLEfIMqyU62uclGlm6MgRQUqSpFR80a/D4V?=
 =?us-ascii?Q?CxbVwl0PLcE0i6mScTU6T2P8AZRSINk8J1HeIUc95i2cuhzhvmF5Fa7oo0tE?=
 =?us-ascii?Q?i2BLX/EssZu8r18ndgNwa6jdJqY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1619e867-974e-427d-7933-08d9a99abb49
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:20:28.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYD0vLK6xDlHhdu9x0NPUd+uBFzhGlxVwreEBcxXg4n5HXVaoDHX6gtycJu6qYe8KHdKcid+bqec58KqjJjOGQc4uJNwnAEDfLnUBp8OpzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5807
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170033
X-Proofpoint-ORIG-GUID: IGALHzWIiUylWyyMrrcE-I0a6OhLP0Ep
X-Proofpoint-GUID: IGALHzWIiUylWyyMrrcE-I0a6OhLP0Ep
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The free_rtllib() function frees the "dev" pointer so there is use
after free on the next line.  Re-arrange things to avoid that.

Fixes: 66898177e7e5 ("staging: rtl8192e: Fix unload/reload problem")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index d2e9df60e9ba..b9ce71848023 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2549,13 +2549,14 @@ static void _rtl92e_pci_disconnect(struct pci_dev *pdev)
 			free_irq(dev->irq, dev);
 			priv->irq = 0;
 		}
-		free_rtllib(dev);
 
 		if (dev->mem_start != 0) {
 			iounmap((void __iomem *)dev->mem_start);
 			release_mem_region(pci_resource_start(pdev, 1),
 					pci_resource_len(pdev, 1));
 		}
+
+		free_rtllib(dev);
 	}
 
 	pci_disable_device(pdev);
-- 
2.20.1

