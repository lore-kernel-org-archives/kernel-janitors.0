Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E272FC41513
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Jul 2023 15:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjGYPBn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Jul 2023 11:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjGYPAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jul 2023 11:00:52 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572F61BCC
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRtpi7kOEYyFKuh7mDlWLsVIV9xl4cFt/NFPOYaBiQahQotLq1PWEh9mFtsz5KXZwxYIOPBGokJCxfDxhaMQpw/wzYe7YcEJexWLgIEgh4d+qi8S8DlnMnAsibzscBn7lhPQ0CtZh3uj1N9DOL9bDQGz+dEd5lbic58t/cEv2ye+ln0GI4pC+XW8YGWcfH9PHXrGKT8S9P7ISDyImDY5/bo1lpCrDvQEALcmx5Y7uRHpvEPcfd5g/W6ODDWpydcssi22oPF5FMa2wHD+uxGs1l8sdFNCQEyocbRXsFYAjf6miZq8/yNqrVpY3LLfXRBL22ZC+X2+/N7YJmvw2udAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhj7/18TQLak3/jbHfzgBvM/VoqlDLfpuIE/tsK26wM=;
 b=SAmTAPqnxOVtCGFNYs+J/4rcPlVvJ1H9V3g60FcKF7Pz55ZvxT3Mx6LBJyZlk6d2VkqdDVPD6AUJoGAoOxMN61juZs1eeShVmq0MlHGdGiGVvVpuf+AUmR+VLM9Wqre32SPY/e4yTDOt+lAHhQXCbq0WbvI1KNFCkZloMrkSb6IlzwJkSCThajkKX4VuMD60HdSj/asIY9M6qTcJlCPV9ZXa1312nUb43IAK84yS3hCshXoBvmv0PKvGZ7QuX6kCPzDNvotphZDV0Wah3vyijaUi66ZNIH84oiDXtZitkxvZXXwhKQQKhdqIGoTQE2RNN4UCG2OmvgIHXZ4ichVFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhj7/18TQLak3/jbHfzgBvM/VoqlDLfpuIE/tsK26wM=;
 b=euKClZ7H6/PV/TiueB025G2s9S9fPfF+CUw0XwvVIZXHZ5TtYfnmbVski8a7BSt/Zc4MerEsBlBvOVcNsMOs0h+vycRgO4yoxiWc2arFWdZOxOyucS1u8pJag1/M4OfDVnmi21C2yfzvKV5DVy0JnBKh0JSU4Wx28m0Kih2qVSaM/97psQ4k7fLgPLtefjBaxriRfCyLQfVzgDtPXxBmf1ZKrVC9AMcYZUtk08x1Iips14Fg+pcT/c5lML9EgD0FA+iQEQZSMq89UAKJ+MFfyhMs+kUa+Jmf239x+TPflEHP1DaqU4ZJYkOfa+04wx/O59x7o3x0tQW28jUSVSQGmg==
Received: from MW4PR03CA0277.namprd03.prod.outlook.com (2603:10b6:303:b5::12)
 by PH8PR12MB6748.namprd12.prod.outlook.com (2603:10b6:510:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:59:55 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5::4) by MW4PR03CA0277.outlook.office365.com
 (2603:10b6:303:b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33 via Frontend
 Transport; Tue, 25 Jul 2023 14:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.44 via Frontend Transport; Tue, 25 Jul 2023 14:59:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 25 Jul 2023
 07:59:43 -0700
Received: from yaviefel (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 25 Jul
 2023 07:59:41 -0700
References: <049ee4a7-441c-4e76-8ca1-fb4ac1c3f389@moroto.mountain>
User-agent: mu4e 1.8.11; emacs 28.2
From:   Petr Machata <petrm@nvidia.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     <petrm@nvidia.com>, <kernel-janitors@vger.kernel.org>,
        NBU-mlxsw <nbu-mlxsw@exchange.nvidia.com>
Subject: Re: [bug report] mlxsw: spectrum_switchdev: Replay switchdev
 objects on port join
Date:   Tue, 25 Jul 2023 14:43:01 +0200
In-Reply-To: <049ee4a7-441c-4e76-8ca1-fb4ac1c3f389@moroto.mountain>
Message-ID: <87ila8jaud.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|PH8PR12MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 69df18ba-fb09-4f94-87f5-08db8d1fceac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IayyoXWM3jokfOgkpqvs0NC/YIEIjYAwFVE721uLM4zoWbsoapoPveIcmZ91cVEq8dnzFsCYIiUSZl+LjuZFiKmVde2Jxkbf8tfuILAI/1pafbtjmTBVghsqMv0rSUlTf/CLHjul7tdhwIXuhIhfU0lJ/WCfv9fJts7SM2t8081jDYlU+QT/gSIu9g+WBsUYgGSwhlROVm2r9BKWxIkF4oltuO9600kAWzn2HNWc4ro+FdXR5Qi4GCltH5tFF+5r+/Ya16+xcY6LKuM2PBBzYzJpFi/t6jnKxkGfc4DcZbBMuTJ3zmqYn6xom0+yBPA1wbo7BGNeOAZIlHwMh7b0HQ9jaUCqsF5S5ic8QDYIeVMEO//OSNXGjv3ty3FH6NCqYaFMql52zLOHj7G/zkh63hRIQOMMr7QTD8sx7V6AwmMNWyT4d2JZPehCeVv0wbm170tolljTEJcgeK2pxRHM/xjsgFFadKNp2Rl+aS5lq9oKJ26Qettyp+40hcNV5qzqfvG5KL1l3tSMYfeEJQYOe7CZmfT8y+7fIzHIDuQv3oN5CNmayWCE6ADwqV/8Vy2hGgXY7nIqN8vmT2slfDIXujqwBEXmss0jk2tlzbswx1Vudc0DKdhXK9lmwRvgai994eAYwHstBk1snC4zBFCdxYSbV5a17yWjQlxLQu+QRBIGSKOj3jaTrhDGzVXuVEDiuR5X1uPcHEfhsePs+irkyVFCChiSmeO5I7om1EyVs+93xGI7Gd85sNg8kDZnmHPk
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(26005)(186003)(2616005)(336012)(107886003)(16526019)(426003)(66574015)(36860700001)(47076005)(83380400001)(4326008)(6916009)(8676002)(70206006)(70586007)(316002)(8936002)(5660300002)(41300700001)(6666004)(2906002)(54906003)(478600001)(40480700001)(82740400003)(356005)(7636003)(36756003)(86362001)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:59:55.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69df18ba-fb09-4f94-87f5-08db8d1fceac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6748
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Dan Carpenter <dan.carpenter@linaro.org> writes:

> Hello Petr Machata,
>
> The patch ec4643ca3d98: "mlxsw: spectrum_switchdev: Replay switchdev
> objects on port join" from Jul 19, 2023 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:2679 mlxsw_sp_bridge_8021d_port_join()
> 	error: we previously assumed 'mlxsw_sp_port_vlan->fid' could be null (see line 2664)

Thanks for the report!

> drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
>     2642 static int
>     2643 mlxsw_sp_bridge_8021d_port_join(struct mlxsw_sp_bridge_device *bridge_device,
>     2644                                 struct mlxsw_sp_bridge_port *bridge_port,
>     2645                                 struct mlxsw_sp_port *mlxsw_sp_port,
>     2646                                 struct netlink_ext_ack *extack)
>     2647 {
>     2648         struct mlxsw_sp_port_vlan *mlxsw_sp_port_vlan;
>     2649         struct net_device *dev = bridge_port->dev;
>     2650         u16 vid;
>     2651         int err;
>     2652 
>     2653         vid = is_vlan_dev(dev) ? vlan_dev_vlan_id(dev) : MLXSW_SP_DEFAULT_VID;
>     2654         mlxsw_sp_port_vlan = mlxsw_sp_port_vlan_find_by_vid(mlxsw_sp_port, vid);
>     2655         if (WARN_ON(!mlxsw_sp_port_vlan))
>     2656                 return -EINVAL;
>     2657 
>     2658         if (mlxsw_sp_port_is_br_member(mlxsw_sp_port, bridge_device->dev)) {
>     2659                 NL_SET_ERR_MSG_MOD(extack, "Can not bridge VLAN uppers of the same port");
>     2660                 return -EINVAL;
>     2661         }
>     2662 
>     2663         /* Port is no longer usable as a router interface */
>     2664         if (mlxsw_sp_port_vlan->fid)
>
> This has a check for NULL.
>
>     2665                 mlxsw_sp_port_vlan_router_leave(mlxsw_sp_port_vlan);

The function mlxsw_sp_bridge_8021d_port_join() deals only with
VLAN-unaware bridges. It is invoked in response to netlink changeupper
notifications.

If there is a FID in that situation, it cannot be a VLAN FID, it must be
a router FID. So leave the router. So as of line 2666,
mlxsw_sp_port_vlan->fid is NULL.

>     2666 
>     2667         err = mlxsw_sp_port_vlan_bridge_join(mlxsw_sp_port_vlan, bridge_port,
>     2668                                              extack);
>
> Most of the time this would set ->fid but if mlxsw_sp_port_vlan->bridge_port
> then it wouldn't

mlxsw_sp_port_vlan->bridge_port is only ever set in one place, later in
mlxsw_sp_port_vlan_bridge_join(). So if it is set, we have been through
that function once already. In that case, mlxsw_sp_port_vlan->fid is
already non-NULL and nothing needs to be done.

This is only relevant for 802.1q bridges, when PVID / egress_untagged
flags change on a VLAN. Here we deal with 802.1d bridges, where it ought
not to happen.

mlxsw_sp_port_vlan_bridge_join() then constructs the proper 802.1d FID.
At line 2671, mlxsw_sp_port_vlan->fid is non-NULL.

>
>     2669         if (err)
>     2670                 return err;
>     2671 
>     2672         err = mlxsw_sp_bridge_port_replay(bridge_port, mlxsw_sp_port, extack);
>     2673         if (err)
>     2674                 goto err_replay;
>     2675 
>     2676         return 0;
>     2677 
>     2678 err_replay:
> --> 2679         mlxsw_sp_port_vlan_bridge_leave(mlxsw_sp_port_vlan);
>
> ->fid dereferenced without being checked.

And we rely on that here.

>
>     2680         return err;
>     2681 }
>
> regards,
> dan carpenter

