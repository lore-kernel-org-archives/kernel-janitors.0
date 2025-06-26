Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629942580CA
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979728; cv=none; b=Mg2n3cIyWtimtWceYwa0xJ0FPf3XvN0RKHmuNRXJXqqqO2sj8hVv6UBtdlxe1vsYVb20tsLxm5fwkrRy1Er+D9tddLdL5gs44OHYNg3iBBbcCNczsfD1IvuxTdboNd2K7AUVtkNo7c9BV4oa0Y1TLbrp6OxIikHAnObKTRYAgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979728; c=relaxed/simple;
	bh=k5K0OHaAReQDoeWKEKaljz1uxPTCHcqHA7iRro70KgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VMGU7C3sVfpnQ/+0EGbFX+LzJ7ZLdz7EX1bFW9RBFKVimzwqBH9bSikpd1C6B7UiAJrwmpnAEH0qbo+i8Pz/nd0ZBfBdn2c41kI246uFhs2V3MNSHl+lnKzopE3XMM6KAAW/IdiPO7y73suBiTL6XoWIi/wqL0p2+E03z0n+Uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDs/csn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDs/csn3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJdOku013240
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=; b=lDs/csn37OXesSg1
	qhfHsdcd5nbgCJF68KCe+38WJTCDJGc4Eh5+NoRNxHK6myX4NyjPIHwx1eCwr7a6
	UKo4xFk8XLd/jeu8jIv1Rn9xaaIQ/rTUZ4CdVapfQAsUdxnfVc2oNJ8iq5RkW6sK
	fX6YZUhGDd9KCTgt1NcscjTwsFaPdoWLhGxTg5D8rYMxi2zII8nQIpi7YWq2MO9d
	d/2p/YaNMnKfGtaeVvoQyeO6C/Nn1MSl9hT5KY6kglrnlNVkeN/uytEBkSDZtpt7
	85NEsyirFOGP5VENZyugZl/7A5QTbRTqcpdudm0B8gg/kIjGGw1x14awKil2Wd4p
	U5TCXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmt34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 23:15:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235dd77d11fso13547205ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 16:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979714; x=1751584514;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=;
        b=BQ6Mv1VTgKDwVBxDFtunDyL7yo1dnLHzePUy89jy5dX++DHYls6tHktUh6HbhMRfl8
         DYTO/Yb/1zBNhK45FdLyu3ZBGIcD5/OPgQkL234nCgm5W40GCTlkvfoe71RgNDJPqzRD
         jqXdfoepAzqZFFelTk4n46TZinZos6sz913kO7SvFicHfuVE72VINdf9sQC0VPp7eLMq
         WcW0+i6Wqr7E/hpdm7iWloLNhW9ju1+ewr4K5zXr/foakdjwr2t9073b4JnaTmDYVK3/
         2pbaflNFSZUMemuzQ4NnG42xf0hteelNlW/HPVCU/TK/6nETfOfkLbM8/X8fyVPzt8tG
         Z7GQ==
X-Gm-Message-State: AOJu0YwOG1AIDfPbelCFfvixTECgPp7jfWfA+XVdG/bxFKvhTqqNBC58
	Lxrp4P7UDDkwnNiHHeKcWTo5VDNmqcOBLYnhAV3uTxdbCRx60zg0n7nGd7x6JwtAvWZjtdFvHZ9
	v19yrvhWH9CwJIYX9KJtpKgVrb33sn5vwTI5O8SDc/aMnL7V4fHd2Ajec5fCWMjLBbHVj3T8=
X-Gm-Gg: ASbGnctjTY4X++zPFv1XbH/o9HLhYFI6DAzPGvLpDUVxorNEXsZu2nFWZnCvf/IxZKz
	NQ6mQvH1TrfdONDyaJmlRgsxveAE6G0/H3AjwmOFPfrdGiwj7Gm8r4cZgBK3bN/uU/cxwiHQEVn
	TaGeMB5fvpxpdVUfyg+uUKSA1/ZNj5wULrcHFKfntucdTgKY7QynYWqULfbHcykxIshS7IzzVBy
	RjcaC5eRcHkH4d8ZpC/RVRkPYxsTGbxnt8DXQlNkSpH0Uzi6dLRVAAEfVnoa9ocvdIjlfvZYO32
	skDr8s4OA5/9208oLMycp0sA83oxznldyDLAD1A6JHeYCcctsVRcyaUVpb4=
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15454155ad.27.1750979714456;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatQQA1mUCt08p8uWEuxkLDupGYZtc8mgpT1E0dO05P3u6qH6lqBdVuZv79lzu/hrCr1rIEA==
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15453875ad.27.1750979714115;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Message-Id: <175097971319.153431.8225006080279921985.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:13 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: M8ofdERX7o3ssixK9PDqEenHzkk91-B_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX78WckAJiifIT
 vPrtoza3OPd1CYh/neZJIJGhlovsS8x8ijZHdsDWgWDB50DgO2WRr1Bn9Joc/BAj/Lh5Dkw0hkF
 BWIefn1grYTMkfAj8SBZvdm3lt08pUYTtsVr8VIXskJ+pLfBdMeqXfpDEkKplPMcApMsHa7kR+h
 rOhLauZl2XTYEXs7kFzIHKRw3IBrHqpSgkKmTRyzvM3+BopWIkFUB5SiBwlau0RnPMkl1QfLxsG
 xgbszn2ADDh5l+DoRDk7iZ6q96QdahhG+EJVMrO+7kHnF1kBtHg13z9PnxoJPXdWKYKkFdWtrgk
 jnPuRqhqjhumqumKT1TU+xf9jr1piEqtH2LE5R1dfO8JtXYgyKqxbp2tp4eFXkMuxjJ3bUkZLwm
 VEvLHaETWqkIk9dRrfY4pBEpKu0ZCIPkeLnVtz/ggbHdgva0SLI8CAyiERaYkob77g4xgMTe
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dd48e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=TBCri2Webv1PiB2955kA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: M8ofdERX7o3ssixK9PDqEenHzkk91-B_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=886 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200


On Thu, 19 Jun 2025 09:20:10 +0100, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Make read-only const array svc_id static const
      commit: d8f07889e920493845fd628407ff0debbe96fa09

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

