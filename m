Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93600C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Feb 2022 14:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbiBAONB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Feb 2022 09:13:01 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38494 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238941AbiBAONB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Feb 2022 09:13:01 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211DOP3W022579;
        Tue, 1 Feb 2022 14:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=C5WQPsaPNdNBptsMt85wH7LQn/kgRNDuP+TAaJCDG9M=;
 b=Y01JyAes7j8aw1Td82fz9LcPuaYl6UKKbNpO62Z1wHb41UA1IJW8WrgKXvnPcUQ8m4GZ
 thMmw29T52WPPc4JYSL4sS6e9+z8rHeyJNKiQAZyqJidPPkf32qEPC6KngZSmGd4wwsB
 Cw33UsSfLb3ITMoqbjoNhfrn21ObGvaEPW8WNHeXZbSA/YmEQ+zvEii4x1kW5B4HXcLV
 XMeXipzgHBeV6uhAFoLnzDd5S9HFoKakd8hcEe8rsgMZXXcqh8o8bBPxdHq1vioV+x9y
 gBLAAfn7CJKZhwEYVMVovQ5UesmiJO8NmkEzTDj3olmUgad1qt0KmvItyWkL3/VUuMJh dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dxjatu3av-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Feb 2022 14:12:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 211E5MO8050472;
        Tue, 1 Feb 2022 14:12:58 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
        by userp3030.oracle.com with ESMTP id 3dvtq0cyw3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Feb 2022 14:12:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLcOZISbdkCof/SSUUuUEsKaBlqcoTrcoKuLVrrBD5zHhB2cRvOXjefWA/5ToFY/MtnqrhEGThaMcVHf2QPqvIezIYWaPGPSoWoL0YlE07jalAAEXkQLlwHjAI2oLLibUjoWqEviEeceBe3FD2441/NtkFjMiVUl1+2+ylcnGsHhW4t1tIlNqQyh8dWdMkNzld7ZLwq5OdcVawSnyoVmEEp/XRmdZ+66oKF+a8DI/NuJOcW+fZngu5t+k73KhaUydKFJCR8dq0TzOHy4ginOhbeiC+N8g0l9gXy04oIU4vJSKfL5Z3ZgjHL7gZZAgjz6OeO9d/IIW3yiBPSfRzTepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5WQPsaPNdNBptsMt85wH7LQn/kgRNDuP+TAaJCDG9M=;
 b=KsuS1WePG8W7uUl7kb2/KsS5h3OoL1oNkd+hPWPN5VS3b+9AtndM1X5xwPjJS9C7lSeRuyiwT2meqmK0qok5Zd9+WnrCb44qWWd3gek8ucoh6P/6zQODE+D+OISEXiHsGmbYb74vcwMPpZ0nkiUWeOvVBYEw4NnOLtxv9uszDDWdwuSXf3pxc4poywW9w7+NqsHdqMfa9+LcL/+JfEVGSLownSRnDSa1/DbEDGvnoVDcIWJBwf9wTfivL/lrz58WavjZ74Y/JQTD3o4T1LY9NJ+3yZHuNx2uTaQLl5T2bACxCjTKTF2x0Sg4/iW9ADj4CaPkp/mtbLhCcQ+b+qYNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5WQPsaPNdNBptsMt85wH7LQn/kgRNDuP+TAaJCDG9M=;
 b=eQL8TtNse1EZIF+VZnbAGWM1Uy79adkZqN5PeWK0mF2RxghDutOrnbC/mn2fmt8vjS/f4DzZdHHAKHBKmDaPU4nwBTpPgb5i0DdROEnCMYqGqxboOL8pkt/N23n9ilOF2jzFXLo7QBAgnlcq2XOqNyWSab/LTMqEYTueKJzYlVg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2635.namprd10.prod.outlook.com
 (2603:10b6:5:b2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 14:12:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Tue, 1 Feb 2022
 14:12:56 +0000
Date:   Tue, 1 Feb 2022 17:12:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jaswinder.singh@linaro.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: socionext: Add Synquacer NetSec driver
Message-ID: <20220201141246.GA3361@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30987dd3-bda7-4fad-6876-08d9e58cf144
X-MS-TrafficTypeDiagnostic: DM6PR10MB2635:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2635DA58A9A6E2FF376E77158E269@DM6PR10MB2635.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMLBMX0fNgfKbVxv1l2rI+FLQ6EID51SQT5D3n+PudZBYrju8v6eZpsvHNTMcHAOKq2K3pn7XSAHY9d2o21kF/CfrA2wnT+p6wfZfIu1ST2LP8LY9mTQudiCGmE8c/9wYXHO5S5OZF+ACl4Yy0G9x8w+GVOWKt6g7irIWgvj0sYuNdC9W09eT3qiHEUT+UMe/6u3cYn4sklqpcTLlzFEozdASg7y7BAqdMiwfnKG5tC9aCeUcRf34XzCYe9WWJpDjB2DMo5IFW0VwIrkAjM7ltBVkqMVT28Wvf+C4jbAA+gM9ckTrJow5Hpy93mjsMW0Jri4v/6HEZm5EBXE8dxHbqUREvyH2Jb8efWHmQkRg7eGEHoIOY/G0E98sWPjGBP4f5uBytnYlIU3B0JckyBGKFi9pl/XnE28sEc4B1yVB9CgenCMW0X/Llsp/zKNf2+yu5ZAurVdu4Bl3ducrJoCcCr47teI+yW6EhVFCqcf8xNqdX6ddtI7EgH9WYwr1a/fk+/zTlQSMYBnQnx62HA47e6MhCq0fpnj7VHCC8LhYdlBY6icd1Aem6M8+SPNSZumwmk+gjYKEsacfTGiQOBtABVPhVoWkNGrprdf5o+lEHE9/H59iTFQZG5B+BbsDnS81dIrXv+3NO0vF7yb4D63BLVFri3oxt3yVsDUm0zzA5GFtaNqvU8ewANaxilYpCPZwpOoYwqwdNELm6k8LK+1ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(2906002)(4326008)(66476007)(8676002)(1076003)(83380400001)(8936002)(186003)(44832011)(66556008)(5660300002)(86362001)(52116002)(9686003)(6916009)(316002)(6506007)(6666004)(6512007)(508600001)(6486002)(38350700002)(26005)(38100700002)(33656002)(33716001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14OTBCa/ns5LTJHL+ZI0fMfqgVbnX57TTk9Y9VZ9+2WByNaPaqviNv8VJI7d?=
 =?us-ascii?Q?1SxI0svkzsgXu4ajEG0aX29OhZyNSQGc1tC/EFDg03zrcXSRHq2ci3t5bHqG?=
 =?us-ascii?Q?zwk0tPSauAMFre8oVpo1AUfzYzTUeai53japsomexDvUrxZnAFIvH9iAaaYV?=
 =?us-ascii?Q?376veP6NXEtZQuzdPp4JuUEyhhXdQCLGsgYUuLKfWivhyEkHn/lTbLO/rS/M?=
 =?us-ascii?Q?s3l+3sCLO5X3iWn/HXfQFZET8KAovIkXfKluDYFEJaBVhSf57Wy9nEOvb04w?=
 =?us-ascii?Q?RGvLtCiDmeR6nb/YxLXkeelH9CovAR9FqAmgi9NAOu8u+5ys3qw6FqeOOnLW?=
 =?us-ascii?Q?95wCbGw1HHSpusrClqWTVGA4Qjh1rVNt68mKSSznaOk54FlFHa2SJAgWmyoV?=
 =?us-ascii?Q?mUsqJJchq7UyijPozuYbT2979yFc0dKnEt4DsjhM26gDPfr5/m/rVMeydZUE?=
 =?us-ascii?Q?brefAX18m+xgAwwV13PCT7FW7Bi2t4AMKpxGOnIEF/W7rLAj7kZ8kQh/IWB9?=
 =?us-ascii?Q?k6ERHURxuRaXplLteZEXrh6+kbyME6mCmr8c9sZvCHNeCNmKSnWFop7yFsD0?=
 =?us-ascii?Q?Ts9/r1o85oDP0obIrZUdMhH2EDGzvXm7e75FqtckdqkZGu9E9txSYq4plLrk?=
 =?us-ascii?Q?SGCpPhV/VJMZ52d+/YfhtrhQ6PMEqUOD78wwnJCXLgtFZmHDpjfAdKg0uRkL?=
 =?us-ascii?Q?8a2q2ZvEZGiCdS2CQr/dpwqHUsGHhkQ4E3UJyXfIddVrLCY28ApKUkYOousP?=
 =?us-ascii?Q?VvFsaurXrEHGg4DeIHLvfsERGplwnmw4/owc/+2v4sas8h42JjQTnM3vH59n?=
 =?us-ascii?Q?YRiUeys4SJvbPgA+LriA5jXcvBJnseR+mRlqS2IaftkTD9KS6EYfVRyzisFE?=
 =?us-ascii?Q?yxu+jr0lvsR9LqCtrWVkqVJgRb6mloUd3yPSsgV8vS0mvccKXOzoBPvVNpv1?=
 =?us-ascii?Q?o5HrrU+38SlMmeFtmOjXVfzCkoP0gqA4mdLITkV7eex9xOfyfaYEgBQftp60?=
 =?us-ascii?Q?O9pAiTHpRCW8qJlPyIXuEYWyG02jpEUv8kJgPqxsZV1pMfQiexa0QbOwgLuV?=
 =?us-ascii?Q?7JT9tgFGV7aUq2IGh7PSD07xT/q0oxsn75PvFVwuVCM45qfI3ntU6YmABr+u?=
 =?us-ascii?Q?wKy3XFms3gm2WCDJc8jjROz8J9cmRzZOyAX1mfX9VXB92H97VUzGFtv5D8A8?=
 =?us-ascii?Q?FCdbJ91xP/UA5Siq/r9Uo83pc4o1S/Lf13GnDCZ9Xcg9adgUEQaayyT2thYt?=
 =?us-ascii?Q?LrDfa99hWVX24no5T51p+FOcKsFYw+30vilUmjOd26UeLCFQn1GEJvVphRzh?=
 =?us-ascii?Q?4qtoKai2EuTo6WkvSqk7XYnxROB23404swGOHj3dg/q9NSW2pbm/KIteldEL?=
 =?us-ascii?Q?URkmcHIkcTNBHzZn2o4eeotyKiZV7nuFdedzKd5+OcclzD/3Nz/zd0FitEfC?=
 =?us-ascii?Q?9fquluHsee60AYUyzNv4qqX7KyDrdlO8Wx3nxppczadYgB36zAYicdvPizQ4?=
 =?us-ascii?Q?wvC/bL4Ji8OmH2kBIdhAbDdhzwhnS9My1VGkUYd3jMUVdp+FJSgObEzF6zyh?=
 =?us-ascii?Q?/v/qigvT0OBhCU1AQQD8jaQQy6Ogl9AHqsFZ0jgu9jiiRRj+EWPk1F8S+X8/?=
 =?us-ascii?Q?tM2vLTSmjUVlo+pW+ijygsXFpV59oh5+8qtbdfnWE09w3NwIwuCt3/OLbD9Z?=
 =?us-ascii?Q?TjJMek/AGOWkaXBdyjthlS/bQEU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30987dd3-bda7-4fad-6876-08d9e58cf144
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:12:56.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HY7TQ1i13bltCOmvUCDUVBATHqbDUXAZTBoUcYH8vFtwJVWKvie6h3BlHzjL9dAJ94bLITksM2VIpiPzIyjxAeBxDtRvVGqueqbMQ8pqPcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2635
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=637
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010079
X-Proofpoint-GUID: gYVP4W6UwgM-xTFUJxFIK8ohJR4EWLlz
X-Proofpoint-ORIG-GUID: gYVP4W6UwgM-xTFUJxFIK8ohJR4EWLlz
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jassi Brar,

The patch 533dd11a12f6: "net: socionext: Add Synquacer NetSec driver"
from Jan 6, 2018, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/socionext/netsec.c:1975 netsec_register_mdio()
	warn: inconsistent refcounting 'bus->dev.kobj.kset->kobj.kref.refcount.refs.counter':

drivers/net/ethernet/socionext/netsec.c
    1913 static int netsec_register_mdio(struct netsec_priv *priv, u32 phy_addr)
    1914 {
    1915         struct mii_bus *bus;
    1916         int ret;
    1917 
    1918         bus = devm_mdiobus_alloc(priv->dev);
    1919         if (!bus)
    1920                 return -ENOMEM;
    1921 
    1922         snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(priv->dev));
    1923         bus->priv = priv;
    1924         bus->name = "SNI NETSEC MDIO";
    1925         bus->read = netsec_phy_read;
    1926         bus->write = netsec_phy_write;
    1927         bus->parent = priv->dev;
    1928         priv->mii_bus = bus;
    1929 
    1930         if (dev_of_node(priv->dev)) {
    1931                 struct device_node *mdio_node, *parent = dev_of_node(priv->dev);
    1932 
    1933                 mdio_node = of_get_child_by_name(parent, "mdio");
    1934                 if (mdio_node) {
    1935                         parent = mdio_node;
    1936                 } else {
    1937                         /* older f/w doesn't populate the mdio subnode,
    1938                          * allow relaxed upgrade of f/w in due time.
    1939                          */
    1940                         dev_info(priv->dev, "Upgrade f/w for mdio subnode!\n");
    1941                 }
    1942 
    1943                 ret = of_mdiobus_register(bus, parent);
    1944                 of_node_put(mdio_node);
    1945 
    1946                 if (ret) {
    1947                         dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
    1948                         return ret;
    1949                 }
    1950         } else {
    1951                 /* Mask out all PHYs from auto probing. */
    1952                 bus->phy_mask = ~0;
    1953                 ret = mdiobus_register(bus);

Why not use devm_mdiobus_register()?

    1954                 if (ret) {
    1955                         dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
    1956                         return ret;
    1957                 }
    1958 
    1959                 priv->phydev = get_phy_device(bus, phy_addr, false);
    1960                 if (IS_ERR(priv->phydev)) {
    1961                         ret = PTR_ERR(priv->phydev);
    1962                         dev_err(priv->dev, "get_phy_device err(%d)\n", ret);

No unregister.

    1963                         priv->phydev = NULL;
    1964                         return -ENODEV;
    1965                 }
    1966 
    1967                 ret = phy_device_register(priv->phydev);
    1968                 if (ret) {
    1969                         mdiobus_unregister(bus);

This path has an unregister but doesn't clean up from get_phy_device().

    1970                         dev_err(priv->dev,
    1971                                 "phy_device_register err(%d)\n", ret);
    1972                 }
    1973         }
    1974 
--> 1975         return ret;
    1976 }

regards,
dan carpenter
