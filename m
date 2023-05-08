Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8556C77B75
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 06:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjEHGcz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 02:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjEHGct (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 02:32:49 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C19E4E
        for <kernel-janitors@vger.kernel.org>; Sun,  7 May 2023 23:32:48 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 347LtIF0013245;
        Sun, 7 May 2023 23:32:46 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3qdm8t53ef-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 07 May 2023 23:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loBQONzpGBIc6ulNJIHwnb8DHCyFymoICUIKjB8nATKom4pdilFIuIYFXjzxsWg+op5lq7EP8TQ3XcNEcqg3CvAnGa4Mjh/PyW6lFbNIDeIeP/yhceBYWJuWROxVI9GYXhhzUp+2U4J443gDUaxPl0DAS81UgoIUoMRYtylPwQLOVfjj1/+pjBtNqrG7I3TEHOXnImXSyZeePgMch2TZBjke5mAxF9iZODBkCK06lPeaNu3j8Otkbz5ZAP7I4EOmAZ1w6+NTOnxmAEhqcexgoPIVDBU3uIHXBnO3t5qjDWvX+ZK5wLOy8ZhUJMCwTP2A4GgEAvzM9CfFrNtWxu0WRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfpg75wQAFexFlZ6KlDrdaFJnFCXqv+Flsz3QHCSEN4=;
 b=NxxuTqx5Z0EfB4v3QWhfk2OdbduV7tGioVR+BF7wgCPfUpp56d1E70WhaPYLlOaP/MijotyoziEyej6FvrpJHRMoQKKZI3NbM2qIZ9N/EimcHfhSvy26RvYbTS2SESOPd/F22/4z6f0RJGcbTzUNBkpETk2FsLkLQ+YHG0oczPl4THPKno33gDsG22pAjSOhWSBXhbdDCTIM69QDcVYmGRgIV+YFNum3kl3iCu40Yk6w0OErH6dgXbblQI4XKIP6biz6mwJziRXmbELOzgMkigz6AgxKb6TtBwbEwnuypyYhqNxSlMX1/WqXE1yVYggUchUAMTUS4kN+z/dWdYq0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfpg75wQAFexFlZ6KlDrdaFJnFCXqv+Flsz3QHCSEN4=;
 b=PDbcfnXvnsF6DQrqpepbnD+i0uUTF8CW51OfN6U58RAI/YVkuva8yDCvvayByTAhhzkvAogG2yQeDaqQ+pF0aS7b3K/Y79B3HYNBmCs1DiMqXWL84M+xtcdtxAMVvQsbrovLV+fcMBQZmZT0KxYXDfLppqyb3Z8LV0Ty/J/ZEEw=
Received: from CO1PR18MB4666.namprd18.prod.outlook.com (2603:10b6:303:e5::24)
 by CH2PR18MB3224.namprd18.prod.outlook.com (2603:10b6:610:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 06:32:41 +0000
Received: from CO1PR18MB4666.namprd18.prod.outlook.com
 ([fe80::ead5:44bc:52e0:bf88]) by CO1PR18MB4666.namprd18.prod.outlook.com
 ([fe80::ead5:44bc:52e0:bf88%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 06:32:41 +0000
From:   Subbaraya Sundeep Bhatta <sbhatta@marvell.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Sai Krishna Gajula <saikrishnag@marvell.com>,
        Naveen Mamindlapalli <naveenm@marvell.com>,
        Sunil Kovvuri Goutham <sgoutham@marvell.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [EXT] [bug report] octeontx2-pf: Disable packet I/O for graceful
 exit
Thread-Topic: [EXT] [bug report] octeontx2-pf: Disable packet I/O for graceful
 exit
Thread-Index: AQHZfyipoIVY5OmyJkOaclsvpgq+BK9P7iJQ
Date:   Mon, 8 May 2023 06:32:41 +0000
Message-ID: <CO1PR18MB46668C391787FCD6D988898EA1719@CO1PR18MB4666.namprd18.prod.outlook.com>
References: <3a065906-24a5-417b-b59f-fa35596bdf16@kili.mountain>
In-Reply-To: <3a065906-24a5-417b-b59f-fa35596bdf16@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2JoYXR0YVxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTIwNDZlMzc1LWVkNmEtMTFlZC05YzVjLWJjZjE3?=
 =?us-ascii?Q?MTIxOGI3YVxhbWUtdGVzdFwyMDQ2ZTM3Ni1lZDZhLTExZWQtOWM1Yy1iY2Yx?=
 =?us-ascii?Q?NzEyMThiN2Fib2R5LnR4dCIgc3o9IjE3NjIiIHQ9IjEzMzI4MDAxMTU5NjMz?=
 =?us-ascii?Q?ODMwMSIgaD0iQnN0YXQ5ZEdxbzZITG84REJickRaK3pwQmZRPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBTWdNQUFC?=
 =?us-ascii?Q?OUZOemlkb0haQVhyMCtab0dwVDdNZXZUNW1nYWxQc3dVQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQllEQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFFQkFBQUFscFg0WXdDQUFRQUFBQUFBQUFBQUFKNEFBQUJoQUdRQVpB?=
 =?us-ascii?Q?QnlBR1VBY3dCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHTUFkUUJ6QUhRQWJ3QnRBRjhBY0FC?=
 =?us-ascii?Q?bEFISUFjd0J2QUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWXdCMUFITUFkQUJ2QUcwQVh3QndBR2dBYndCdUFHVUFiZ0Ix?=
 =?us-ascii?Q?QUcwQVlnQmxBSElBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQmpBSFVB?=
 =?us-ascii?Q?Y3dCMEFHOEFiUUJmQUhNQWN3QnVBRjhBWkFCaEFITUFhQUJmQUhZQU1BQXlB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-refone: =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdN?=
 =?us-ascii?Q?QWRRQnpBSFFBYndCdEFGOEFjd0J6QUc0QVh3QnJBR1VBZVFCM0FHOEFjZ0Jr?=
 =?us-ascii?Q?QUhNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZd0IxQUhNQWRBQnZBRzBB?=
 =?us-ascii?Q?WHdCekFITUFiZ0JmQUc0QWJ3QmtBR1VBYkFCcEFHMEFhUUIwQUdVQWNnQmZB?=
 =?us-ascii?Q?SFlBTUFBeUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFB?=
 =?us-ascii?Q?QUFJQUFBQUFBSjRBQUFCakFIVUFjd0IwQUc4QWJRQmZBSE1BY3dCdUFGOEFj?=
 =?us-ascii?Q?d0J3QUdFQVl3QmxBRjhBZGdBd0FESUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFB?=
 =?us-ascii?Q?R1FBYkFCd0FGOEFjd0JyQUhrQWNBQmxBRjhBWXdCb0FHRUFkQUJmQUcwQVpR?=
 =?us-ascii?Q?QnpBSE1BWVFCbkFHVUFYd0IyQURBQU1nQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVpBQnNBSEFBWHdCekFH?=
 =?us-ascii?Q?d0FZUUJqQUdzQVh3QmpBR2dBWVFCMEFGOEFiUUJsQUhNQWN3QmhBR2NBWlFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reftwo: =?us-ascii?Q?QUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJrQUd3QWNBQmZB?=
 =?us-ascii?Q?SFFBWlFCaEFHMEFjd0JmQUc4QWJnQmxBR1FBY2dCcEFIWUFaUUJmQUdZQWFR?=
 =?us-ascii?Q?QnNBR1VBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFB?=
 =?us-ascii?Q?QUFBQUFBQUFnQUFBQUFBbmdBQUFHVUFiUUJoQUdrQWJBQmZBR0VBWkFCa0FI?=
 =?us-ascii?Q?SUFaUUJ6QUhNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBd0FBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFB?=
 =?us-ascii?Q?Q2VBQUFBYlFCaEFISUFkZ0JsQUd3QVh3QndBSElBYndCcUFHVUFZd0IwQUY4?=
 =?us-ascii?Q?QWJnQmhBRzBBWlFCekFGOEFjZ0JsQUhNQWRBQnlBR2tBWXdCMEFHVUFaQUJm?=
 =?us-ascii?Q?QUdFQWJBQnZBRzRBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnRBR0VBY2dC?=
 =?us-ascii?Q?MkFHVUFiQUJmQUhBQWNnQnZBR29BWlFCakFIUUFYd0J1QUdFQWJRQmxBSE1B?=
 =?us-ascii?Q?WHdCeUFHVUFjd0IwQUhJQWFRQmpBSFFBWlFCa0FGOEFhQUJsQUhnQVl3QnZB?=
 =?us-ascii?Q?R1FBWlFCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUcwQVlRQnlBSFlBWlFCc0FHd0FYd0Jo?=
 =?us-ascii?Q?QUhJQWJRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFiUUJoQUhJQWRnQmxBR3dBYkFCZkFIQUFjZ0J2QUdvQVpRQmpB?=
 =?us-ascii?Q?SFFBWHdCakFHOEFaQUJsQUhNQUFBQUFBQUFB?=
x-dg-refthree: =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJ?=
 =?us-ascii?Q?QUFBQUFBSjRBQUFCdEFHRUFjZ0IyQUdVQWJBQnNBRjhBY0FCeUFHOEFhZ0Js?=
 =?us-ascii?Q?QUdNQWRBQmZBR01BYndCa0FHVUFjd0JmQUdRQWFRQmpBSFFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBRzBB?=
 =?us-ascii?Q?WVFCeUFIWUFaUUJzQUd3QVh3QndBSElBYndCcUFHVUFZd0IwQUY4QWJnQmhB?=
 =?us-ascii?Q?RzBBWlFCekFGOEFjZ0JsQUhNQWRBQnlBR2tBWXdCMEFHVUFaQUJmQUcwQVlR?=
 =?us-ascii?Q?QnlBSFlBWlFCc0FHd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQWJRQmhBSElBZGdCbEFHd0Fi?=
 =?us-ascii?Q?QUJmQUhBQWNnQnZBR29BWlFCakFIUUFYd0J1QUdFQWJRQmxBSE1BWHdCeUFH?=
 =?us-ascii?Q?VUFjd0IwQUhJQWFRQmpBSFFBWlFCa0FGOEFiUUJoQUhJQWRnQmxBR3dBYkFC?=
 =?us-ascii?Q?ZkFHOEFjZ0JmQUdFQWNnQnRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFB?=
 =?us-ascii?Q?QUlBQUFBQUFKNEFBQUJ0QUdFQWNnQjJBR1VBYkFCc0FGOEFkQUJsQUhJQWJR?=
 =?us-ascii?Q?QnBBRzRBZFFCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFH?=
 =?us-ascii?Q?MEFZUUJ5QUhZQVpRQnNBR3dBWHdCM0FHOEFjZ0JrQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reffour: QUFBQUFBQUFBZ0FBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQT0iLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR18MB4666:EE_|CH2PR18MB3224:EE_
x-ms-office365-filtering-correlation-id: 72bd90ef-e31a-40f2-282f-08db4f8e0688
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: liNdaZgC6XgY14/bGNedr4IYmBzpcwiM8iGQr5EwZdHr0Ff2u27I9+0UV2LokiY7utr87vJ1FHCDpF+LpjDCzjlt3B2h+IeEwCpFSmmOMn67JMAGzm7agR1VmK5PX55lUdDE0Yj8lTxpOhF6OBAUTZZC/PvTIpvq83i7fzuIXVN2DKiVW5P81BPjKa/Tgp1DwWU35bBaBvILm0+CixXcbFYS22qxQU1rvEw+cPOn2d1UARNSZ2qImBf1btavocTBcc5ivOq4J5fro8snX+uDl7PskFqMx6PVcsA4lkmqupu7VFR/qsc9QqsYZEMLRywnnHcV0Aov+svE8WBYDE6iSplcou7iCT7060FPAKJuilyW6AQTjF57GL76zPEv+iaYBxLjvTzpvs7mgZpmVUF/IdI/OmvcVzxqAQG2LHyIGxqy7XXbAlJpEfviEuTTjixEtI3K0Udo5J2mrhsUAcXbfvOXo18nzLVuxWRRF7r3Fo+l1g9g4N9YbEq69X4zwKfEHOy8thnjPYsUeXcqYixtRb5N9wjmoageZidDxjvldDjFWyxO1+bVbf1F6AGZTDRnq3HyilIXc5WMIwvrA+P+2hEJSjKho6lmasX/Rg6FFrj7xU5FnAYArCJEDuEjPzr3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR18MB4666.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199021)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6636002)(4326008)(478600001)(7696005)(316002)(110136005)(86362001)(33656002)(83380400001)(9686003)(6506007)(26005)(8676002)(8936002)(5660300002)(52536014)(41300700001)(2906002)(55016003)(38070700005)(186003)(38100700002)(122000001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iD2tuMQ1aaP6/orn6fsfytd4qk30BeiLU2IVY1WXHMuqSBEYvdjctNVbh8bk?=
 =?us-ascii?Q?s8ceyRTob3NUAY8TflJLlXMP3GdZ9yzhCef3iFvVV4y11SzR2w0IxNvY0wZE?=
 =?us-ascii?Q?5TSNQZ6q3UPKWUQI40u8KvAPpGFjJWodVaE4oSzegmgknpGePkKrsy0P7J24?=
 =?us-ascii?Q?/fGthhVEDmmmigPIIqzTKo0HlFIs4iAjTHkOLSb5jd7zpbTarjZy+o/1Ctsc?=
 =?us-ascii?Q?idO9QuMLatSezshPCDFTINI9ckZmADmJ2LdHDpo1LYzfL2BEczCUFMe3iEOc?=
 =?us-ascii?Q?pmBqF95VB0zo0hGO+I5bCd4KqmASORidPdhbRHScHyouwCx49JLTIvTxvwR7?=
 =?us-ascii?Q?MtoFmGtbOBJ1yYs81EXzWcNUEFuJ7oCT7n7gzbPzZK9uueP1GGFLW+0p0wGM?=
 =?us-ascii?Q?OipKTSrT8K7NXCp40EbHMPFvYMlxwmpdFIHbOYFsHRSGEXAHty4GLyBBz0we?=
 =?us-ascii?Q?RgHdW9VLyh9y90rAoqZsQAp7/FQYBqeAnujreq/xlnnMBCZmOj0hAgAG13Rw?=
 =?us-ascii?Q?o1ZcTDjDcip01o7zNdQYOcJ4apyX3Y7FhY17HcRKEw7R7i4ouocfMdmya9rD?=
 =?us-ascii?Q?eEG+/EgEumm6c/8JcBSUL3eUY/rJz+EBKRL2ffyAdx/WO3mlkFxR7pYmY0Rs?=
 =?us-ascii?Q?WEEXZvmQ/358FqVPzUcJeMidvHCazsmPODj/90gNStZwCyb5upmtucO90pt4?=
 =?us-ascii?Q?bKRykGK2cuGya/+3mXm/ETtUkzk+0VvrZHFI7igcRqQOesFdHvAfbYj5qDbA?=
 =?us-ascii?Q?ogpLNTnVSnRkStEDVIFulG3jbZv764bYGlufmW5/R6Jvsbcef/HxFL+O2kWt?=
 =?us-ascii?Q?nawY9HZ2Zf8b0fFl11nO5V8iszmB1lCTPI+uQk+maEpjH7NZMBl1iA6Xk9Ob?=
 =?us-ascii?Q?JyHfp0cTB63jJEN3iFTg4SXBVcf3+1DWpvXYbwBYcUNufjlVL5Og2Ooq0ISp?=
 =?us-ascii?Q?/pHGYz+gxQyqIWt3q+rPa4LvHeXNLvCaDVmKnV3djlHGzb15MyUgCMWOlJ0F?=
 =?us-ascii?Q?hSwPqHT+8d9QBAZgnUDZ1W0MUr37jTOdL2fNRSokDZPcla7saXC/SyF7aKG7?=
 =?us-ascii?Q?tlDRBT9CdFT/jWudXFUEp/YsWlWiuINE7enBt/8YnutrWCMkSBMRBBa8w+ac?=
 =?us-ascii?Q?JI+2lbbX1SFZ8KdCyGhCMuIh9X3fe8myz//ao0SWtppnzPYlOYnXrx3sVU2P?=
 =?us-ascii?Q?cKqAmLgzQSvUmZp/kCMFmfnke8aybUGHkAUg9INKmM+dZ6Bau4lVDD5heRPE?=
 =?us-ascii?Q?aqzcwC5C9DmjCZgJBqFXfWurmqoQez2OOpAIhlyKvgryYjKSyR5godTMAfEB?=
 =?us-ascii?Q?oxjY0ji7LF4XfyrQeDGTWoAUkBhWJK6JrezIVBAuPwCfDbAIAflOVoKmIHDa?=
 =?us-ascii?Q?ogAbS4uMPk6JnVRSyseFRYTBx+B+h6LrEgoSKwX9NGXsWAIGXcNNFW7v7a7l?=
 =?us-ascii?Q?nn17L2/dH1nc/Pad7GMuqKt3YM9KSNJn3wleiaXmT8HltIfUYixNXSpFYl+p?=
 =?us-ascii?Q?+FaEMHivAg3Nu4EIoDoUoIYLMavBqOnlgafc0EyH7wejTprbFaGi1oDgBEr1?=
 =?us-ascii?Q?O+uMH1N8Kr7kCHG04kcwL1KiBjEnFIGxrSR0mTy4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR18MB4666.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bd90ef-e31a-40f2-282f-08db4f8e0688
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 06:32:41.6191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8wsfcSAKyKrDJFyamEIwIQolgbe6JoxfP8j0oXMRMiXS2wmIaan+42v1OmvFQ1m6QMFFDHNf6M6h/PZM515LeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3224
X-Proofpoint-GUID: U3i7fvc_qBmwdqXGJzK7uo546czJFBRJ
X-Proofpoint-ORIG-GUID: U3i7fvc_qBmwdqXGJzK7uo546czJFBRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_03,2023-05-05_01,2023-02-09_01
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

>-----Original Message-----
>From: Dan Carpenter <dan.carpenter@linaro.org>
>Sent: Friday, May 5, 2023 1:37 PM
>To: Subbaraya Sundeep Bhatta <sbhatta@marvell.com>
>Cc: kernel-janitors@vger.kernel.org
>Subject: [bug report] octeontx2-pf: Disable packet I/O for graceful exit
>
>Hello Subbaraya Sundeep,
>
>The patch c926252205c4: "octeontx2-pf: Disable packet I/O for graceful exi=
t"
>from May 3, 2023, leads to the following Smatch static checker warning:
>
>	drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1843
>otx2_open()
>	warn: was negative '-EIO' intended?
>
>drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
>    1833         /* Install DMAC Filters */
>    1834         if (pf->flags & OTX2_FLAG_DMACFLTR_SUPPORT)
>    1835                 otx2_dmacflt_reinstall_flows(pf);
>    1836
>    1837         err =3D otx2_rxtx_enable(pf, true);
>    1838         /* If a mbox communication error happens at this point th=
en
>interface
>    1839          * will end up in a state such that it is in down state b=
ut hardware
>    1840          * mcam entries are enabled to receive the packets. Hence=
 disable
>the
>    1841          * packet I/O.
>    1842          */
>--> 1843         if (err =3D=3D EIO)
>                            ^^^
>This should be negative -EIO?  I think it's the return from the
>MBOX_MESSAGES functions which return negatives.
>
Yes this should be -EIO. Thanks for finding it. We will submit a patch.

Sundeep

>    1844                 goto err_disable_rxtx;
>    1845         else if (err)
>    1846                 goto err_tx_stop_queues;
>    1847
>
>regards,
>dan carpenter
