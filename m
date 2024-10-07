Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434218BC31
	for <kernel-janitors@vger.kernel.org>; Mon,  7 Oct 2024 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291164; cv=fail; b=OZNJNRLgTIWJIrC7g8X1y4rIg6i+EqjJ+Zu14lWB7Iq+l15K7jISrt/6fv+wZ2kXmNQfvO7wRTcqIGiRnP8G/rTu7KPkUmKCKD9QNK7u6ZJLQGMawJKI5aaeKCfvkX2H3xxU1cJiKv/waUCvd/WMY5rbt+//68RNFYi5UVu1u0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291164; c=relaxed/simple;
	bh=Ze2YYQqFk4eyctuumuW6uZNTGdavZjzKvUIQGAJLmu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gQEepoPkEnEZq0cDNlBmLqUlNOLFVoouGy2j3Zcpgsf9phxcjM+k6sjcpvLE1eDZS4dhFZbRXa8r68Be51dAaUqi2zDJsbAX+uAj/tM2pGjFMS2Bb5dBMSENKtu5MWCoM72qzb/uH7nG0sZ1QFFA7C1Ks4IxAf3sIOXIJvfXDrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=UsvK3CTT; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="UsvK3CTT"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974e0r9021939;
	Mon, 7 Oct 2024 01:52:35 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 423p77htgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 01:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lav70Q9tX2HbmDUzRLdBfkSqSByZQnzPQCnIRCdQ2DJVflPc2qxkkBw341nXEODskePAjGBX99oE0mSSaIunydF1quX7YD6y1FA/hVlhgWWvEUZSYFI1bTUVNxNrc8r4aoObgYEmwY1ZmuS/uUQBoKIheWntqNojqxUu5CtIxzaw6VNdwWVKkCEsd0qxmfui3TQBF6LwF0e9+jdLxRzI+OtT7rgUiwoL1FuQ89Nq0IPGLMynJsNC14S4D5wy2t4txCCrRF0PY13aQqKPRfkyP/oW56saR0C/m22G8WB8HipEegOON94t2X9CNLNQbaHlex95WjExbsgFVRV6Sx0MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze2YYQqFk4eyctuumuW6uZNTGdavZjzKvUIQGAJLmu4=;
 b=q3kTxKbxeCW8OSGb+ywjbUBmbsTcnDq26UJVwxn/A/P3Xcz97ktTgek5/2lIAWU5gc0AQUtjPotQxMER//ib6d6hMeGRxgpnEjPWGmrNAMd8ygoyWypsruexW5c559SqbiFJequ+3ihi7TcXrn6MCh7tBluOjkjnHxNu5JaA09HW1h+Ae1s8102KrptvjfX2FmFUjAZKjUMSaw9aTUfMLhrL4C/yMtKaPNZJSWwTYeNgUQ4QZxkGFd81O4rF9ux2nhw3ZWBlKYqHfvLoJ5RNvur61YywwGLFj0WfZKFLSHW6hTLF87muQfu2/7MkqP3ebdEv9ZJ8+MbekZbqCvAeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze2YYQqFk4eyctuumuW6uZNTGdavZjzKvUIQGAJLmu4=;
 b=UsvK3CTTOT+vEH28keAFEUEG6qZtnH+6aV68aey34lFj6VgFUMsIGCKe1/5zAMi0zpjTKwbZB85/keJ9J0RX84K4gLgAv1JZu3A34pRemZ6hYRpxVAjEGf8161nV0g+XG7F9uUoz1mheqkddFjXgGv66Eyj7U8tB0PxnAc45scM=
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 (2603:10b6:301:68::33) by SJ2PR18MB5738.namprd18.prod.outlook.com
 (2603:10b6:a03:576::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 08:52:31 +0000
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::85d9:f179:1b30:f4e2]) by MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::85d9:f179:1b30:f4e2%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 08:52:30 +0000
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
        Linu Cherian
	<lcherian@marvell.com>,
        Geethasowjanya Akula <gakula@marvell.com>,
        Jerin
 Jacob <jerinj@marvell.com>,
        Hariprasad Kelam <hkelam@marvell.com>,
        Subbaraya
 Sundeep Bhatta <sbhatta@marvell.com>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [EXTERNAL] [bug report] octeontx2-af: Drop rules for NPC MCAM
Thread-Topic: [EXTERNAL] [bug report] octeontx2-af: Drop rules for NPC MCAM
Thread-Index: AQHbGIHQRwKQ5pZOKk6FyGtc+HwxGrJ6+TmA
Date: Mon, 7 Oct 2024 08:52:30 +0000
Message-ID:
 <MWHPR1801MB19185D6FEC479B01BC4719B8D37D2@MWHPR1801MB1918.namprd18.prod.outlook.com>
References: <6c9b5d25-db1f-43e1-8ebf-7be45e63bdb8@stanley.mountain>
In-Reply-To: <6c9b5d25-db1f-43e1-8ebf-7be45e63bdb8@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1801MB1918:EE_|SJ2PR18MB5738:EE_
x-ms-office365-filtering-correlation-id: 5d5ed742-72a7-4b8b-065a-08dce6ad60c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDArOU5vOWdEODRMOFowcGtYV3RveXFoTjNyejN3dnNTeHpPSlpEOE8rVjAw?=
 =?utf-8?B?Tjg5K3NNWW1wbWQxLzRzMVpjSlJhc1JOV0lRQ2tycWZCUEJ3WWdPTWRiR0lx?=
 =?utf-8?B?UXVPT3BkQ21udTJvSEdwZXJpTzFOOUttbkIwcDE2WjZJdmFhTEFqWUQ3N3pX?=
 =?utf-8?B?dUZwbm9odGZmd0ZaTW8zN0YvcExTQ2ZqM0pObzYrSHo5OUVIOUZPdXh6T2N1?=
 =?utf-8?B?YnZUNGR1QlhYWmVyWENZM2szNUlvYiswRkR4Z0xTT1VjYzNuVVc1S3VrbVUw?=
 =?utf-8?B?WkY4eXdVUGk2WTVsdHQ0c1NGLzVKSXJEN0RIc0VFMWZpQ25ZOW9EUFhJNkZs?=
 =?utf-8?B?V2ZWYVp4YXl1UGVadm9EdHFvanc5MXVEVFRnY0pQWEE3TTZsL2oxSU02Yk9h?=
 =?utf-8?B?QUlVMDlLNGRaY0VvaFdNbnRuM2h3QTZiaWxaUXBjV3BzQTlJTyt6aCsvQ3Fz?=
 =?utf-8?B?NlJsU1BnT2xRTm5uN0hrakhONkNEeHFKdWpSM2tBSVRvVk5VYzlCcW5JdTF2?=
 =?utf-8?B?STFWSjk2V05nTzNLZ3ExUnhLS1k3Nzl0OGVGRnhrY2lWbk9JN1Rka25LSThq?=
 =?utf-8?B?QnVBdFB5UURIb1R3Tm5ZYmVGL3RBZS9mZ2xKUng0SENyNDg2NlRjbjl4OGRZ?=
 =?utf-8?B?bUVGbkRrYzNwK1p3NVhHYURkNThlbi94VkQySVVKbUdzNVFxMXZGZmRRTC8x?=
 =?utf-8?B?d3ZNeDgzRENZaFIzc1FKRnhZdWw1a2FUdkorMnY5U2hTTGExOUFQTGxueDI5?=
 =?utf-8?B?Sjk4R0J4RExyYVVzYjFMSlQvc21uNTRNQlhGemxCdlVHMzBVZTdXZC9lMmhH?=
 =?utf-8?B?eGV3VlhjQXpwOHJ1VFkzeXROUGJBd2Fnc1MzME1DWGVxekxaRGpHWlc3STgz?=
 =?utf-8?B?enltMHd1NEhQeFREVXVGWkx6WlNrYWNUS3ZrRUVPTzRKUUpldHRtMUhFa3M2?=
 =?utf-8?B?SnRRZHkwMTJOUklyYVBmbzgyK2lzV1hpY2RzVWRoTjg3OXA1Y0txT3drTldJ?=
 =?utf-8?B?QWtXY1BYN2U3cnF4TmZyMnRqcWFTVlU3NDNTK3hhdXpRblhHclM0Z1lIektn?=
 =?utf-8?B?UGJqdExNWmdNZDFBRTRnMkp1MlFhUmFlaGxhS2tsd0E4NW1LdlhLaHljanp1?=
 =?utf-8?B?dFFTdHBmTmlzUGJuYWNvL3VoSERHYW00SWgwY3dlbmhpY21pU1NiTC9pMmto?=
 =?utf-8?B?TTM0MkhaYURKU3k0N2R3bTFRbi9mcTRTTFhrclBpV3hUbVVOVzdDVSt3VklE?=
 =?utf-8?B?bFRzRWdacUNlUmoyLzAzd251aUJNb1VXTm0zT1BQRlEwc1prQ04zUy9OSU45?=
 =?utf-8?B?UDI3R3IxajJtZGp3aG8yRGxyU2h4WC81V28ySkVzUEhLSzNnNHJnaUd1L3lu?=
 =?utf-8?B?a1FXN1V2dTFMUnBKRDdWRmgyaDBiTjZDY1dKeXhBTTFYY3ZhRXl3UlNBeHhM?=
 =?utf-8?B?VFRiR3pULzBNQmVNb0RWVFpIdHVFRzF4T2I1OFBUR2lwSUFrK3JVMys0Yngv?=
 =?utf-8?B?NkJ6YnorTVU3YWxvcUpaRkJVMzN2TEhOV2k4dEhIaGxTTjUyUXJuTEJyREZE?=
 =?utf-8?B?dFlJUlFLdG41QlVhNXZMMEFFTWZZZ2o1RnRpcFlKdWVWTjcvSXVObjhseHUr?=
 =?utf-8?B?VHFMNVQrcS9rQUFvNGVYMnN3YzNIcTlrZllYcTZSSUxMcTB5YXB3dlZiT1hi?=
 =?utf-8?B?V09XRG1HQVUwdkhPcUg3Rm1DYm0zaXI0NXpCQzROQ0FkTTZpUXZHOGtvYlE2?=
 =?utf-8?B?S3RKOHJXRUxiOTdnaDlYWG95OEVrYkpPSUNNbi9SdmFnUEtYK1c0bllqSXBw?=
 =?utf-8?B?OFBrcDJhUko4V054WlhuUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1801MB1918.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWVZNStJVGRzcFZWSzJIcEVYVzZCaGg4OC9JNDBqYnFDSUlBOEV2aGNvSUdL?=
 =?utf-8?B?SnZveURvQmg1VnpEVFhiODNSalhNZGN5bTNhbCtMQ3N0K09vOG9OaWpReWZH?=
 =?utf-8?B?YXhuWmJZTVJMWnhGZFA2Q0kzNCs2OGxyYiticnFRWVc4ZFpRbGVNZ0RqZmZo?=
 =?utf-8?B?bElhZkJRdWhncVV5RFZUenlpR2VPbjh0cytTWlNmeFRHeHdiQlczbXpGVzZu?=
 =?utf-8?B?dE1IZUJuVE5wYmdFMHRXWjhXcEtZQlBzdzhCYnRjZlMyR2tpUCtqQ3hhUDgz?=
 =?utf-8?B?YVhiczlFZmZMcDNmQXZVVWRDZ0RpV3MxdDJJNm1YMGZsMWNxeXRxSlA3N0VX?=
 =?utf-8?B?L3BPa2ZiZUtDcEtWWXdVWXhvRGxHZkQzVXpnVFNPNzE0WTNiQmd6Y2oyT0Ri?=
 =?utf-8?B?VnhHRUVWclhWMGFkMlpBNnR0ZFBNQlpNUWtQMkhObTk4NGk2RkhxME80UmlR?=
 =?utf-8?B?VkdMQThwQmFReUJ4RSt4V1lBSUJTc0Z3enRuMFhFUDVremVwZUE1WE1pNnBW?=
 =?utf-8?B?ZUk1T29wcmhGaWpIUFdMWkZwanh3TFUraVo3QjJQUVhTd2ZYOFZYcnNTQnpj?=
 =?utf-8?B?Z3BjMEoyc2hXRG9aTG9KWUdHRlprZ3ZHL1I2NjcrY2ZTa24rQkkrZUFDTXBH?=
 =?utf-8?B?ZDJ1RSt2eHovRHA2eE5VZmpTdWZ5YXpuVDN3a054UFhQalhSNzJzdGV4a1Na?=
 =?utf-8?B?cVgxSXI3cTlNNVI2NDNFTVNjeU1uTUxmQXNKcXBxeVdyMEJ4emZxOW5CRFB4?=
 =?utf-8?B?c0QxV2wvUmt2SmVRTTU0V2FrRHlObGEyUlZ0eUVoK281WUhmUGhRT1JWcStN?=
 =?utf-8?B?amFPTXdkZnh0UXZSTjBXdDVJbEhWSzV5ZTJjaENPaVpQMTNUR2JYMUJrVnZz?=
 =?utf-8?B?dmkrRzgvV3ExM2ZHY3RyRGttOENaZktNMTdJSThvOGFRVDl5YWlFMHRybEdT?=
 =?utf-8?B?ejJRYU4rQlZxUExnaTZzVm9wMlhYQVkzWTBrOWNQdS9UV2lLRjBNOWtLMGls?=
 =?utf-8?B?NDZpRjJvblBBay9jUCs3eEVkSk9qM1VXUTV5blpvR1dGRlJoNGV6RERuVzZM?=
 =?utf-8?B?Y2ZiMkpOT2xLMWRGUkhOTGZ5cWYzTG1XcjZYeE5UakNaaFpLU1hRMzJtMHRo?=
 =?utf-8?B?aEp3c3VYWWxLYlo3K0R4UjdBSDhRaWZBdWFzK1g1a2l4b1QySytaTDRQTnVH?=
 =?utf-8?B?cFpvYzVPYnJiMTJVSElDQ2orVFFNSzdEbVFXVHhXZ2U1OUpyZXZROEMxWi9R?=
 =?utf-8?B?MGxNVWRmNzBTZ1FmNU9aZFNCVEIvZnhvREFjZUtod3hWZGtxTzhMQ1lReHk5?=
 =?utf-8?B?N3VrSDBaYldGMjV0VHh0NmhURVpveVIvWGJUWERsaEtVVmJlRGNIS1UrT3JE?=
 =?utf-8?B?MkVLcGhHZlNDbnFIY2Q2Q25TNW4zZktaZldqaXdlVW0vYmp4M212QW82NEFk?=
 =?utf-8?B?b0oyS1VqUThyY2Y0c3JyN0tEeURiRVViaWk4VWlubldJVkt1Q3RQakIxcHBu?=
 =?utf-8?B?UlI2YWRrVW5paE94cGxJSENPY2NndzRlNGtWTEJvOEhaaHBtcnhhQmtpdWF2?=
 =?utf-8?B?dG5nUGQ0bDZReUhOK1ljdlZES2tMSzBOZHNFeUtacmM1M0pCaktoRWdqR2RH?=
 =?utf-8?B?YVRxZEhweFNxUzVzUnFaMTUwcC9EQmdQWlpVY0tUOEs3Qk8zYUdHZEt5UUlt?=
 =?utf-8?B?TEFQb2Z2Y1R4VEIzSmswWm0zQ29XdElpeVdtallNR0RFVGZmcnNlYzU0Z2Vq?=
 =?utf-8?B?aG52QUYrTXFXWTl4MDhoYVhhRlp5TXpPa1duN081ZHdyZVhBbWw1SlFGY09t?=
 =?utf-8?B?U2s1NktYU2tGU0cyd2EvNXRPb2VJaFQ5MzcvalEyL3RyUERwakxMNy85YVpr?=
 =?utf-8?B?dE5lYlNvMC9uK1h1S1hNUDRpTTB5aEEzMUJaaER5bWlreisvdW1UYWM4NVpL?=
 =?utf-8?B?MkJPTXQvUlVCbys2amg5UmFQZEl3V1daQWNUellvL29QSytyaHRwTzdmRTlu?=
 =?utf-8?B?bWVqZFBzeG9NUnBjeXlFV3JKWU1QaG9vZEJCT3cwOXE1VTlZZzlOd29TT1lt?=
 =?utf-8?B?UjN0eVFFSm0vZDJ5T0RFMDFPOGEreHMyVUZDNHhZQUpIZmhiYURUbTk0dG5a?=
 =?utf-8?Q?zz4rwKUSUvDdydA/X5liZX3yJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1801MB1918.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ed742-72a7-4b8b-065a-08dce6ad60c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 08:52:30.6932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZL4pyuhSIYtnBg2/sUeNWgs/x87R+akIbmg9c7Nf8KDNSrhIguIYX0JA8GhZ6xIxWKKU1PNr3cGbeWUgFNCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR18MB5738
X-Proofpoint-ORIG-GUID: 4ks9ZyoOUKgs2u74G8QHA_rDn1dg9gqg
X-Proofpoint-GUID: 4ks9ZyoOUKgs2u74G8QHA_rDn1dg9gqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPiANClN1YmplY3Q6
IFtFWFRFUk5BTF0gW2J1ZyByZXBvcnRdIG9jdGVvbnR4Mi1hZjogRHJvcCBydWxlcyBmb3IgTlBD
IE1DQU0NCiAgICAxOTcwICAgICAgICAgLyogLSBObyBkcm9wIHJ1bGUgZm9yIExCSw0KICAgIDE5
NzEgICAgICAgICAgKiAtIERyb3AgcnVsZXMgZm9yIFNEUCBhbmQgZWFjaCBMTUFDLg0KICAgIDE5
NzIgICAgICAgICAgKi8NCi0tPiAxOTczICAgICAgICAgZXhhY3RfdmFsID0gIU5QQ19FWEFDVF9S
RVNVTFRfSElUOw0KDQo+U2hvdWxkIHRoaXMgaGF2ZSBiZWVuICJleGFjdF92YWwgPSB+TlBDX0VY
QUNUX1JFU1VMVF9ISVQ7Ij8NCk5QQ19FWEFDVF9SRVNVTFRfSElUIGlzIEJJVF9VTEwoMCkgLiBO
ZWVkIHRvIHNldCBvbmx5IExTQiBmbGlwcGVkIHZhbHVlIHRvIGV4YWN0X3ZhbCB2YXJpYWJsZS4N
Cg0KIA0KDQoNCg0KIA0KDQoNCg==
