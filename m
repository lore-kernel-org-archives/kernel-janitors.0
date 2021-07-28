Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF73C432BE
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 11:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FF1A60EB2
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 11:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236145AbhG1Lxy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Jul 2021 07:53:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6034 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234631AbhG1Lxx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Jul 2021 07:53:53 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SBlP6l022779;
        Wed, 28 Jul 2021 11:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=uCof0zRxVbaDhyLoXK5sODC8do8ZOpc9ip4wtIm2ORY=;
 b=x4vLZkqVwvXskmp/D7rBX63rBLeNlyK6yy7oe3NIOqlHkZtBFgeObT/ZbpZe8vsQAMe3
 YVEap+vZCX3j3f6yfHB5XL9zgY6f28M4dapOhhXFXvATR2/c+Tez3dX4K4SssLxwJgN8
 IVvykhkjTXOU1GvTvvZVuEgbyn3Wx9hDn9FcXagO01r1YHYXLZlmzPAslWAK6KMbTHNH
 bLuQ9st4+sCFuqb2unh69nJr912m3zNh3LhJKAoOhJIqY8d8g/IbmZ5emqoHIoJs1XIt
 Ah0KuBHCd17SOLc8DrkXVEYZXa/YlJBNpEkZsw1e+YgAeyRnAwryN99MZ/oY1QXwwJeI xw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=uCof0zRxVbaDhyLoXK5sODC8do8ZOpc9ip4wtIm2ORY=;
 b=ln/A0v6IQMgJRfk8v5rIdDTGGydUF9dau7KdaKFL4lvQ5/II76jE3R+U1cEzn0d8RDOF
 nZvKZNAcD2Szj1CpkXVlJ9qx0FZi99pabl24LVU0vpsViletvn7DE42ZmzuADk5YVJuc
 FM5KqZDBgYtg82MV9IhH4Z+7BKbX/W0G4an5c9Wot8nXUJuZzPJlWaAFizsjFnUZnxGv
 MiIpYnBmYnMDMY1sW4kPa2+5EZXRYRY9EdRsH3awclVBrDyGDUYK9vNQVcaFbACuOhdb
 2FT5Jn+LsR38yRlWzi6UuoN5U16C+S8SxYAuiGHlZj5h6SD0Xivvm+bX89KKwEEI2mdh ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a234w4bx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 11:53:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SBjm5Y052287;
        Wed, 28 Jul 2021 11:53:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by aserp3030.oracle.com with ESMTP id 3a234c8ws8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 11:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFPmW0xcLJwcDkiffqmDraLTyal5m+g4dYF8Uu14E6WmXS3mWg4tJ7+xSVcCJdTvdxZ9+qn5QHxSmGkDnIzBE3P44tXG1Yf8Nx/yRBYYdGyikxDpIC6IW7zUQtIK80JdVKZ1C2zibiTJ4c44uAy3+VHL5XtwfsM8Lsa61Zapc37JXNQdCgPZlet7dFbKg7WL6CvNIsVwXc10JOLK6w0rW2+92e5cp5aE/QDqD6cXPFdXsjKilxHObfS94MXYujpmvCGaCgGVFlNoTGAIbMFnGhl3NoZwAvM9PaF4uZ95/NPt5uQSDIBmWz8ApfJ4gNxIxnD1dR7hMCu6h8KMtCVamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCof0zRxVbaDhyLoXK5sODC8do8ZOpc9ip4wtIm2ORY=;
 b=EnrEsrFzh2b3Y/SMtRZBF0+N1c2KgvQ+9SkAt/lptU8IXa4pQ3EDdHaJU/b9QY4b+G3EI8uE/q2CjMKBYNmQCvK+pPoyyhcc3BZwJAc+7JG61NbKLThgF+JgTJaEN7EsN3e8W2V9NW5x7UX+XDO+Xo5iD/HW4nvD9l3tuKu2MfzJRYW9jpiP8JqF2DiumyOTtscvS9ksB7+B2nOGx/7JOQMUuDXP8Cfl4vV3UZkkRfWyEXGpiHQ8RXbeOMUvmIkAFAmnvgPTql4r2SwvTkeJ9KlByjmPAFBEr/6dGKrC4wPfnWa44HCgvEQjwdeD97QhsaSX5RxKVuwr/gcfaHPBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCof0zRxVbaDhyLoXK5sODC8do8ZOpc9ip4wtIm2ORY=;
 b=eKU0CZBxAfwN6wGkwowIMsK7JkKzrBZxNfCOlo+is2ufj3mz5Jr9OkEWxhaXCI6ZvJcuQsQbIohFd5ryooZ7fci2BfTGPexN9e/+cUODxGZdLo91uqCgZ9aoOc3doVttKTbGW8iTBJzf/TDUel+2SwdJR21TxoAc214E0o2tpn4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2366.namprd10.prod.outlook.com
 (2603:10b6:301:33::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Wed, 28 Jul
 2021 11:53:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 11:53:48 +0000
Date:   Wed, 28 Jul 2021 14:53:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     akira215corp@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] w1_therm: adding resolution sysfs entry
Message-ID: <20210728115338.GA29672@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 11:53:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1308de78-a2a5-4e18-b7fd-08d951be5c60
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2366CA5BC83BF598F48F64E38EEA9@MWHPR1001MB2366.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: raZWHMK9EED4md9kqInS7LMsQ/runu3UNPpML2Zjlvh0aFfVv1N2bWBWZcfBMwf9wy0bNN5QtGj2mDlHee0j6Rukd+BgtlIooBbO+oepTd88gTnQwi8viTA4YdAg0P3uNrljY9egOCH/boxpSY0+ZCKgc+46n04tdcN7KTsWVuilqOLxV5wX/slf2g5ICVXIpfCft5jqkJCkL7SGHHM4WXtJ7+DOYc8746EIQg012FFrXBFDWdv7iy4hlPx8hj9I2d6lPxAanLVCE6CexXsH242LG7EwfoIfLHFVginmHI8ueKdDF9vYebu6J7Y/LZ42SKy6nCWwXX9DKKP1a4yKGSfadtY5LWFNzIAGEnIBctfnq15yMJw1r1PqiN8oWrISLnhuDQXLZTq0dXgwQiPkSgZ40dWkjuA7gLJGBYentncweAdBaI5+YTHkysUvnCdeLnHQJ5+nTpEjnHFU95FyaY98fiHzlTW3fvZwtyJeW+/7gyFDZJIoamT3ephAzRTraJ7ynQCqdBajOGifMhjyBgLYfpnCrDWhD1cyu+WGTq2zdGo1o/EDNh6MK7NbD4RJQfpL3xUX28aaOE0ohFB6FHrukwBId6ybHVq4Dd4wUWIDo0hm1qupL+/seIgh9EjyyuERdTtRz/mLC4+Un0gBIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(376002)(396003)(346002)(33716001)(33656002)(66476007)(6496006)(52116002)(55016002)(2906002)(66556008)(38100700002)(1076003)(8936002)(8676002)(316002)(9686003)(4326008)(83380400001)(5660300002)(86362001)(9576002)(6666004)(44832011)(66946007)(186003)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJE5P4cLWbiUId7XrZp5WtNFZvQXgL3kRuk6SqjDzCzgeFEsO+byMWwNwxQh?=
 =?us-ascii?Q?QS4rSwOxruSr3TR68ngD2E6PVi3L8MKapSpN+UjCW5jJ9iT+VsTpMCquQjC+?=
 =?us-ascii?Q?UEQqpPvgtdPma+Wzd3BkB2Dn/TB3EhQ5L+Dwtn8Aruxb6dzwDJJrlBAXVpAN?=
 =?us-ascii?Q?h+oZ91U7rYVE0/XSyPDGzpdzGwv2dkxc3OF6h0sjApnqeNr7Gl4jOxPFHDB9?=
 =?us-ascii?Q?+Q6J1ZSEZDG7PZx8iEgOCIoHAjERjCENYoTTYKfzLyeUldX2Z9eveVOOwwP0?=
 =?us-ascii?Q?j4EsuDl1DSxDijFIOQMLWR/naoerKIKoioYtUkzpzTsqEh468TLvqeuy5w1z?=
 =?us-ascii?Q?wLwUf5josCVqN4H+9+v1d0jktTJULdZmnVyByoJHG+BPGQvYSlqtnMPF/AEH?=
 =?us-ascii?Q?ukDs5agKQQniPsXgM9FVTpUtvkkDQTwd+d7mhISUFScuI0DA9dUnNczaxp4D?=
 =?us-ascii?Q?iT4VoSPz4wWI2WE0YF3Utkx+nnr4+5gJO7iAR8hONuruVSSO5W7llLDZjzA9?=
 =?us-ascii?Q?rCUsmSlHR/xgnjvflFC/oqhPJ4VUXLKdl0F0g59mIPUIzrGQh8SyAtdS1xj6?=
 =?us-ascii?Q?fWnVpFSWJ3OQpvq70zqeG0pAybglLNxekljwtOnX2eFv1SrC5eEDDSiMnI+E?=
 =?us-ascii?Q?rXu5M5gViuifDGnR0YmGMwaON5wKm8Ai54F12A7rIY42K79BR5Xqv9QOyXoq?=
 =?us-ascii?Q?IaaTkKScYpAyZwwt2XJC0q6FFkMaFlNUeXVZJNqVt18x1V4uWrAg+orD0po4?=
 =?us-ascii?Q?ieTC+DSHQ412e0IUrKvCpidy4FMIXNudmE1qqKIHkmRqPmzvv9Vp3R/6Ayxf?=
 =?us-ascii?Q?D16RshvMflA/M8GZwqc0mRcS95K31j2LdxmvyomET6QAHUjZhChqmUYkhKLI?=
 =?us-ascii?Q?ZNrufbn1mHrT1wJ6HuL3+TuT/ws9SgbChuCyXLZxKDnn581PBO3uDaSFFGhA?=
 =?us-ascii?Q?UdhglZuAVjAu2GmhC9AAYCGa/GW/1VmHN5Ll3I+m9VwXJAeGVzRm58o+KcVM?=
 =?us-ascii?Q?gTA7ChtmAZnn9c6odSDTHqY40ErGlZ4RpAsqGm/yayBw0WL9Mc2Yzx88CAHw?=
 =?us-ascii?Q?WDuXnTgeAMcBPqkzzNilzvWM7PetbwKCBTYmjY0DA0uMEmFCJJVGj8ds1Hu2?=
 =?us-ascii?Q?XQu5KBuN43unYTEr71C6zf2l009CT7XnY+JsNMulQnzlMGQNYG1zvnVhVOgI?=
 =?us-ascii?Q?OGIE0yCbTt4pt4X94mlmgbVKWYzSoVYC5gBqxS1Xh7JlZMBLsOrhl1+qkm9X?=
 =?us-ascii?Q?OgziYphP/R+ErvOZ+rAOd37X1TrPhGjqWnR7l1XaAq3MVvJtmlJH0JUrmGyy?=
 =?us-ascii?Q?jhuwqYQo2PvXDK2AL/9hySGu4gXLdrJfZCONKiqPsVrdaaZMJOxg3xypA1eJ?=
 =?us-ascii?Q?ajTazps=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1308de78-a2a5-4e18-b7fd-08d951be5c60
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 11:53:48.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlrpXJ4fP4SIx2yQeliWQbcwxvbpzF3mI+x/ehkIiqmgByqjILE2i0BkwFkKQnUID49XtfrHVL/CWvYNOF73X3GTbkdA44gYA/DeUcYkmO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2366
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10058 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280066
X-Proofpoint-ORIG-GUID: iV7rhPLwhiAZaY2Y8uq9q3oKH5vJy1No
X-Proofpoint-GUID: iV7rhPLwhiAZaY2Y8uq9q3oKH5vJy1No
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Akira Shimahara,

The patch 308bdb94de0c: "w1_therm: adding resolution sysfs entry"
from May 11, 2020, leads to the following static checker warnings:

drivers/w1/slaves/w1_therm.c:967 w1_therm_add_slave() error: double unlocked '&sl->master->bus_mutex' (orig line 955)
drivers/w1/slaves/w1_therm.c:1867 alarms_store() error: double unlocked '&sl->master->bus_mutex' (orig line 1847)
drivers/w1/slaves/w1_therm.c:617 w1_DS18B20_set_resolution() error: double unlocked '&sl->master->bus_mutex' (orig line 607)
drivers/w1/slaves/w1_therm.c:587 w1_DS18S20_write_data() error: double unlocked '&sl->master->bus_mutex' (orig line 583)

drivers/w1/slaves/w1_therm.c
    915 static int w1_therm_add_slave(struct w1_slave *sl)
    916 {
    917 	struct w1_therm_family_converter *sl_family_conv;
    918 
    919 	/* Allocate memory */
    920 	sl->family_data = kzalloc(sizeof(struct w1_therm_family_data),
    921 		GFP_KERNEL);
    922 	if (!sl->family_data)
    923 		return -ENOMEM;
    924 
    925 	atomic_set(THERM_REFCNT(sl->family_data), 1);
    926 
    927 	/* Get a pointer to the device specific function struct */
    928 	sl_family_conv = device_family(sl);
    929 	if (!sl_family_conv) {
    930 		kfree(sl->family_data);
    931 		return -ENODEV;
    932 	}
    933 	/* save this pointer to the device structure */
    934 	SLAVE_SPECIFIC_FUNC(sl) = sl_family_conv;
    935 
    936 	if (bulk_read_support(sl)) {
    937 		/*
    938 		 * add the sys entry to trigger bulk_read
    939 		 * at master level only the 1st time
    940 		 */
    941 		if (!bulk_read_device_counter) {
    942 			int err = device_create_file(&sl->master->dev,
    943 				&dev_attr_therm_bulk_read);
    944 
    945 			if (err)
    946 				dev_warn(&sl->dev,
    947 				"%s: Device has been added, but bulk read is unavailable. err=%d\n",
    948 				__func__, err);
    949 		}
    950 		/* Increment the counter */
    951 		bulk_read_device_counter++;
    952 	}
    953 
    954 	/* Getting the power mode of the device {external, parasite} */
    955 	SLAVE_POWERMODE(sl) = read_powermode(sl);

Assume the bus_mutex_lock() in read_powermode() fails so we're not
holding the lock.


    956 
    957 	if (SLAVE_POWERMODE(sl) < 0) {
    958 		/* no error returned as device has been added */
    959 		dev_warn(&sl->dev,
    960 			"%s: Device has been added, but power_mode may be corrupted. err=%d\n",
    961 			 __func__, SLAVE_POWERMODE(sl));

Then the comment is correct that we probably end up in a corrupt
situation.

    962 	}
    963 
    964 	/* Getting the resolution of the device */
    965 	if (SLAVE_SPECIFIC_FUNC(sl)->get_resolution) {
    966 		SLAVE_RESOLUTION(sl) =
--> 967 			SLAVE_SPECIFIC_FUNC(sl)->get_resolution(sl);
    968 		if (SLAVE_RESOLUTION(sl) < 0) {
    969 			/* no error returned as device has been added */
    970 			dev_warn(&sl->dev,
    971 				"%s:Device has been added, but resolution may be corrupted. err=%d\n",
    972 				__func__, SLAVE_RESOLUTION(sl));
    973 		}
    974 	}
    975 
    976 	/* Finally initialize convert_triggered flag */
    977 	SLAVE_CONVERT_TRIGGERED(sl) = 0;

regards,
dan carpenter
