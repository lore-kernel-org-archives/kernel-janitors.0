Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B343C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Apr 2022 08:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiDNIKw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Apr 2022 04:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiDNIKv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Apr 2022 04:10:51 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA2B3D4B1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Apr 2022 01:08:25 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23E67UkO028053;
        Thu, 14 Apr 2022 08:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Pa/KfqeN5HnN5ptvNV4wJiPbz+vAbkYz6IF2T3u6ht8=;
 b=J3hSMi55LqDlW+Ip+0kKNARJstMa0T+X35aOm7I5zPoBHrtV82j2JPGIkAL9iFaa8Wfx
 eJiy7836t8ReKB+4SwzJFtE4muZIrOe4hbHvQLmCd9GSsiZOierpR3GKVszuHws0BX5m
 dhhf3a0mEocEuMH7B6BkMa5nSqwWIrFWssQ+HdVBIPeHlZNc/Db6p3cOu5xc8y6NcTXu
 aWp+7HAVJc75YPdUaVKE36H7mC5Mj4okTSRdhSwnl2cSGjmnHScbq0ythRJD5bjIz+H9
 OphmdOxsz3QPSLAMDUrwNHTcZ3V+lLpmIWHeiHz+g+n0cUcjATCIsdl9/6ctMi8puZsK AQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb21a3ncu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Apr 2022 08:08:20 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23E82VOP022779;
        Thu, 14 Apr 2022 08:08:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fck14rq25-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Apr 2022 08:08:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRwCcFS7IvrK8A6/LmfCxfk5NKEqHaSRnYrYjUggRGnU17MPZNsB4VrAr3N7JYyp+NlF6Qisv3oFn92xIooqJ1EIHj8QNMeTtyYOodSKqfR2xnltBW1XprJvdzgIXOZIMAYsWome7xDuFVoxWKx99GW3Xob9BQU+EQU7n4tSqjiW8dgiUN+W/cO8JsItDrD5Yo6sHXY+CgfMpQHQ5rZliX5I+Cl8jKRI6lvyxSYGDGb/BqMtk2wO8GMndTHn0z3iRBIvj0bDX9w9Nhj3I2lH7SFZZeYioTNhSDrrX+Pd2LEFRUrR/AHJu1xC8ij7I+ulqgmdLL4Flls/31NfAV3POA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa/KfqeN5HnN5ptvNV4wJiPbz+vAbkYz6IF2T3u6ht8=;
 b=n0iEcFU8xvrqIPoyp+syVEgk0jEjhXzlKfNWj3F8Y7r+FMuDvMVCFA7nL3Dx/Vrxgzr4/MKIATvfVxjmAm8/NUOuvsAUIkxIeQRtFvPmzz8Q8E83jobGn1ZaZZks7rUcd/RS8zv77qnb2K03EgMh41/M1eUZDyMxWTaynn9PjRwzXqN1xOMEkxTxfOzmJdtEQOLhonStn4msEXYZqf3iUkqi+aJETAK+xI0TjVGDWueonkElU5qeMSQOv/rMxOhs50wEOzf4/TLVoGqVb6o7bssi3bkS2PJ6AIekuheNt5Sn3zo49Ic/olEJbpw7ZGhfssqG5MvWXlFoCjomo5LvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa/KfqeN5HnN5ptvNV4wJiPbz+vAbkYz6IF2T3u6ht8=;
 b=KkcSMAjb/sj6awes6vB5z8hWg5uknwQ8FfCtFAtCgw0SEEimXwMX5x09aa0i4s8d+8SR0ffaTAI83ANV4H2n3Nj7g9m237kqvD1Y9VwFIydAq6U6R4J9g2t1v4fVAXHGPzIVuzrOVRiwRNcuwFS3NYOzPYO0pT6k8/8tq01ePx4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5497.namprd10.prod.outlook.com
 (2603:10b6:610:ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 08:08:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Thu, 14 Apr 2022
 08:08:16 +0000
Date:   Thu, 14 Apr 2022 11:08:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     phhuang@realtek.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] rtw88: Add update beacon flow for AP mode
Message-ID: <20220414080807.GA16289@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97344581-3e22-4fbb-b104-08da1dedee21
X-MS-TrafficTypeDiagnostic: CH0PR10MB5497:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB5497313AE699DC00F1652FF48EEF9@CH0PR10MB5497.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azkMxow8uNqd/I6yhCYMp8IGFngexQ9Dv7kEsxL02Wrx9GLraLTtwvdRS7bkfjyGTao4RL/mjMSR9If2aPyvpqkh1fDwamzRHUNMIUnj5WrLC8Spgz7Mr5XCud1bObczDBTEKt+5siUesstGXVXdvhth8STytH5dJ8zbHKadPBIcybr+cPFJf8YCyA69wCo6T/xkQsiGXG7bhzo5fo753r9EaGPqzfRld5eBS4Va3AqM+xNRInPEP4JdKFhoPqTHfQ4jyNvh19T4fRQSqMEu18rz8Por2fE4UAc8xk5T8N4KWJi7vWFwttxrD0LyJDIjvl6JWCWqV3pTF+TniSF1MpJcYbZSagxBaulSSau0TREl/LZfTzA+DyfvSqdWiSovn/VWOcpLQmipDScASJJsGKIqsynvg85owqQHoDt9/LhuMFIK3fQhkFxnFSxoG9vPjtBsP4iogYcPjPJ0lJ2nc8mXgwx4Cjobro3Rp/jcU6YMo0hQBpRUZ91z+774+Tm+VbvUYX4YyferaK+mwXsf4stwLtQSY2NamDAcpmTMP5/pL1IpkXRx8zwhOOsQTOCWBpzIYkRGRU6X6QGzJPFYpdu13142VoBOCgGXyuuWtxy0m8qBiemK3wIvmwxilKKNoC+stBQXBiu0NJTCGe4j9Cma6x5sp94FEyzglgDMvImBTHklS1X3iyMCmoQduN1zOUyRlAJMuFhfC9B3o/f50A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(186003)(33716001)(316002)(6916009)(83380400001)(6666004)(86362001)(5660300002)(6486002)(26005)(8676002)(4326008)(2906002)(9686003)(6512007)(8936002)(1076003)(6506007)(508600001)(66556008)(52116002)(38100700002)(38350700002)(15650500001)(44832011)(33656002)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JYdkYjcCHN0Tz9MkSLHUo9WpZLkwa303Wzh50H3QwmCQPte1+2LoDTycY6UH?=
 =?us-ascii?Q?+ptKWswAjDdqeergbI7IvYchRje28edVi2L4wM/cddmsangjs4oDX/ErajRc?=
 =?us-ascii?Q?BL2zVGSXFXEIUqo42Y1l04tL0nmWscQdXswzwZ0DPvUysUkKeEMc1idIkwzI?=
 =?us-ascii?Q?mP3fsAMvMu/eOM85C9oNL5jNDPK8tZRtyXKxNeZPz9CTpy9BptdLFlmUyS3u?=
 =?us-ascii?Q?Rq+41PESaazeMTRmUnGIT/gPbYwVS2/lFXBaQ5pATIvbHr5igcjCj5ZhrnZU?=
 =?us-ascii?Q?fnFwsbBg3VDVRRhTeoYxmyRNwcKTzYkgygoBcRtr0R1PGJkFCv8uV87fAXua?=
 =?us-ascii?Q?zxof64K838hc/j6dI5rX9m+nZO++0XTmpgSZB98w3ZZ1Fa3RyUpxVliXltA4?=
 =?us-ascii?Q?M5NXX1h2Wh4Jh7hP+TjvVA8gaWm3NS35EK90ashRBevmxbytgs6UCeat9Fjz?=
 =?us-ascii?Q?op69gjFn65EfTtGun+OhDox/3rOfEJRU8Eca0aAxMEtif8ACld/HjWFTcMAn?=
 =?us-ascii?Q?xN4ETT0CLNfSIEoayGxLyKpCPLvULXRFlTycL81UENaaDHTHN7eEYbZSynMK?=
 =?us-ascii?Q?J4ztNBpdnbTmR1yQ19celJTQ6K+nPeQw8ZyS1+EZkT/BHJxKEPmpGi79GIgi?=
 =?us-ascii?Q?b7xxXpwXFGFDOcVnj6oGq4/f1aL3ZvzKG3vdF55et40Pawrfr8G48CTb4Io8?=
 =?us-ascii?Q?UhbRFSDdPfmQh8zL9ZvCeuKgS+6kCUz79QMUkkwzcsmL9omCgbXT1TIZ0z6N?=
 =?us-ascii?Q?A9sMQrFVRBx1V5Ka5qEewBmNK9CPwNZcvPNuiL/yysd25Siwi2DUFxTu04eO?=
 =?us-ascii?Q?EehAVYYaMuHLoHWtE4GinYsFBXEXSCTD3Sb7aO/GILHm4dOn9csHikdeywC+?=
 =?us-ascii?Q?XzWCghZInPsI3aHahXb+x0w5QW8l74nU+OHcbmr1VYi1B07YLpuzq4BUX+6f?=
 =?us-ascii?Q?jV7lE5FJBQwS7kIW1uRLFZzGlaNjAQOKh1INAkOQiHxDWnpLOhV3RO9LaIS6?=
 =?us-ascii?Q?syt8P0kXzTAC9vJmR/w1tlvoHmqB1+iU+NhobR0Ldt2l6ispnotlhgORtZqO?=
 =?us-ascii?Q?avrtT5nE1YeR4LvVuN4lSZWLFdiKa/GUlEf7POAA+BhRTzYD6E9IEbSMZwOy?=
 =?us-ascii?Q?uy+DJtB/DCu1iTQG4DlmVdEW5mwtRKb7l5V4xUVKFXzTHmgxj7psc5hy8RA0?=
 =?us-ascii?Q?xGJMI7dg6fFEjypmFexXicCGvHS6PJySbkdxdPJcbQfkVTIm5Q7Uyn7cOely?=
 =?us-ascii?Q?rzgQAH0gKgGw4HpIlHtqG2rPyfDbzdaY2L8WuIu7G3MElqyNpA5gPqT5zSdh?=
 =?us-ascii?Q?5jAEyUYC2MHXMiuFrgu2DpK4su2dQrr8yZAx4aKqRz7IfHfE4+ZKkli3x3mg?=
 =?us-ascii?Q?PvE0+gfudSWgKAsEfRjuJIyx6JTyedlibbYEpP748WXWtjYRxOc6IcdxpDS9?=
 =?us-ascii?Q?yLeciT4ex2tlhY/6gt3Fvqttm3sLxUulOCtXvDghymgFbfLP9mH2fY7zZQ1h?=
 =?us-ascii?Q?23pWsukTVwyFwYajnnjugDLUYnNTPoL2i1RCZZCFz0BruQcH1voYaT1r30we?=
 =?us-ascii?Q?adM2jbVkxRMRlh8XXNVY8AFb7IIQFDJtSxVpt+UhF7juWQOaBmzSoAEK08fk?=
 =?us-ascii?Q?SPA0vkDCbCMPlkYiRE2JRy/EsA/hWk7wXFuQPY0ucllza42dIvC73S+pU3IZ?=
 =?us-ascii?Q?aJzbjA8fm2iH00JwpUju9hGYzJ01HFqGV4jEVeULdVxT1lAXgGSpYb633pVx?=
 =?us-ascii?Q?veoBWZCZ9VdgH8kmS60AXi8pnaPhKhY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97344581-3e22-4fbb-b104-08da1dedee21
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 08:08:16.7705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdXsuKCoK4rRgn8Ft/xq9SveZW+FyEHIyZlHDlhH45wCcpztVXvEZ0FxCTc+uk58gux+bEdhmQMUUXplb1M+koWpMdv01tDBiwA6wHLrmJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5497
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-14_02:2022-04-13,2022-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204140044
X-Proofpoint-GUID: LuHtxsk0qdamtkIpqzzqoLXFbx-wo1wi
X-Proofpoint-ORIG-GUID: LuHtxsk0qdamtkIpqzzqoLXFbx-wo1wi
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Po-Hao Huang,

The patch f2217968ffda: "rtw88: Add update beacon flow for AP mode"
from Apr 7, 2022, leads to the following Smatch static checker
warning:

	drivers/net/wireless/realtek/rtw88/fw.c:1070 rtw_get_rsvd_page_skb()
	error: uninitialized symbol 'tim_offset'.

drivers/net/wireless/realtek/rtw88/fw.c
    1043 static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
    1044                                              struct rtw_rsvd_page *rsvd_pkt)
    1045 {
    1046         struct ieee80211_vif *vif;
    1047         struct rtw_vif *rtwvif;
    1048         struct sk_buff *skb_new;
    1049         struct cfg80211_ssid *ssid;
    1050         u16 tim_offset;
    1051 
    1052         if (rsvd_pkt->type == RSVD_DUMMY) {
    1053                 skb_new = alloc_skb(1, GFP_KERNEL);
    1054                 if (!skb_new)
    1055                         return NULL;
    1056 
    1057                 skb_put(skb_new, 1);
    1058                 return skb_new;
    1059         }
    1060 
    1061         rtwvif = rsvd_pkt->rtwvif;
    1062         if (!rtwvif)
    1063                 return NULL;
    1064 
    1065         vif = rtwvif_to_vif(rtwvif);
    1066 
    1067         switch (rsvd_pkt->type) {
    1068         case RSVD_BEACON:
    1069                 skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset, NULL);
--> 1070                 rsvd_pkt->tim_offset = tim_offset;
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
tim_offset uninitialized on error path.  True but does anyone care?
Not sure.

    1071                 break;
    1072         case RSVD_PS_POLL:
    1073                 skb_new = ieee80211_pspoll_get(hw, vif);
    1074                 break;
    1075         case RSVD_PROBE_RESP:
    1076                 skb_new = ieee80211_proberesp_get(hw, vif);
    1077                 break;
    1078         case RSVD_NULL:
    1079                 skb_new = ieee80211_nullfunc_get(hw, vif, false);
    1080                 break;
    1081         case RSVD_QOS_NULL:
    1082                 skb_new = ieee80211_nullfunc_get(hw, vif, true);
    1083                 break;
    1084         case RSVD_LPS_PG_DPK:
    1085                 skb_new = rtw_lps_pg_dpk_get(hw);
    1086                 break;
    1087         case RSVD_LPS_PG_INFO:
    1088                 skb_new = rtw_lps_pg_info_get(hw);
    1089                 break;
    1090         case RSVD_PROBE_REQ:
    1091                 ssid = (struct cfg80211_ssid *)rsvd_pkt->ssid;
    1092                 if (ssid)
    1093                         skb_new = ieee80211_probereq_get(hw, vif->addr,
    1094                                                          ssid->ssid,
    1095                                                          ssid->ssid_len, 0);
    1096                 else
    1097                         skb_new = ieee80211_probereq_get(hw, vif->addr, NULL, 0, 0);
    1098                 if (skb_new)
    1099                         rsvd_pkt->probe_req_size = (u16)skb_new->len;
    1100                 break;
    1101         case RSVD_NLO_INFO:
    1102                 skb_new = rtw_nlo_info_get(hw);
    1103                 break;
    1104         case RSVD_CH_INFO:
    1105                 skb_new = rtw_cs_channel_info_get(hw);
    1106                 break;
    1107         default:
    1108                 return NULL;
    1109         }
    1110 
    1111         if (!skb_new)
    1112                 return NULL;
    1113 
    1114         return skb_new;
    1115 }

regards,
dan carpenter
