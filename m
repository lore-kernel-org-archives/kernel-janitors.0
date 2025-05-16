Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00535275110
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417250; cv=none; b=OK+psK9vj3kjDf1qisumI8F8vRUdsWry2+5hREhr3zTUXRbB7Y/st6iPnfyn3NLsGfXwX+F0ACixRkeFn5Tadh97gWLcevGQo/dsiXiLGo0PUna7ei4y0ex35SU1jjZHsFPKARc5qaDuk49NJuCOL3FlX/DM9q0jlMn+ULWLdSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417250; c=relaxed/simple;
	bh=e9do+4dlGQovVQxUDIwDKoB5RJKvYweGM0c+P2erRJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QjU7tQeaTgIBDuMjwlnMxsRHwQJQshBpY5JUWIGSg5EyvALlcrSWR4srF9Lhc9wqFRQ2xb66kRU2JCbvDU71e6ZwpbBf4bAoYAJ48jRnVrUAMVjHuTeU+z+kSIxMqm8fepLj1XmLqWnzAjBGV8TBKKXdkV59qayahPNly//JSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQBFLzay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQBFLzay"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBApiR026149
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8pWKVxaMh1kzxVLK0M6ZtTeykbiXElVUESVt8rZ1zQ=; b=eQBFLzay5QsvcWew
	h+AOdyRqrCxzMUD/Lp6KFYb9lSOHN81UoQnq/AlS9uxhQrOHXA/E+DOJftKgqbcB
	fYKW59YPYu4FKopNoyAkaaZfLolAydYugSWeaZ3NYAqbhVVGZ9WIR/IyKhJED/Jw
	waoXnU4p9gfWjMHMaUBMhSPMLCFS8KQXdvDJzjCYFwpn07UbbDKkEHyjjJCkkgns
	ZoQ6EgUXR275fo8q5aHQgAEoOJIuJ4GUUgIMWHAKM7th9GOFV6TSOEKiCvT4n2c/
	YE/RMsrIq6yMCgJ0gq3Cm1NhUCEADaj6IEuCkv+dZZLo35dK0NtQVWxMxzKeW4Sx
	w8hz7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcytyq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e50d4f49bso33397935ad.1
        for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 10:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417247; x=1748022047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8pWKVxaMh1kzxVLK0M6ZtTeykbiXElVUESVt8rZ1zQ=;
        b=WtY3Hx+3a3y5DINJjG2zTmb5IqRPjFA/L8jPgwGPHoFGxctE/LolkL61aC+F8V28SA
         BUSZy9+RT8mpLTYoYT9KPfUFgN7V/MuCYVdVtZBCD1gGPV3QWq023VLxkPgrfbX2XQ9T
         3z7i0VLMAHp35T19LDeCe54Q738iTJBcHnCGlrTmR9bg/0SnAke312lykKAJcaeJEwFZ
         M5oI+F8rJ/+4+EtRmh8/jZPeofn9CFcU9wz3ugkYqqaHZ+EmLsA4fFrM410xLT3c0gOf
         pvZ3BCgXomBU01RBq5fPQeqFWDyMHu5km9nsBCsTxMYQGx605fHK9cde4JlZTATYk+Bp
         WDZg==
X-Forwarded-Encrypted: i=1; AJvYcCUn3twOyDEPY8qmmUxHjj3UnFCTdnigpF1gUqQyL+fykvSeX+DDL0xVKV8amL27jjeytd55FoL963dKFLxtxCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bOwGHDWTC3EiWMEtwLwjVLZTo4UcAdtpjYbymP7q2LlFG6rW
	IaHLp0DMn5g8kl4DRQBY9Vsowa2MbEvLD2HePkBVTiBPgb96KKnJfAovk5CWSzBmNdui89pyuwb
	M7ONs2BOsdyYyT7rbBX3Z/wmfXgyCPz4NCF43oYIzho3oFQZmd/KUnsl2JZ7U0M9rW22zqOKAcn
	lZuRc=
X-Gm-Gg: ASbGncsG3R/RydVpJluPh66GaO02Mci+HVkMOeczBrQkqCakAqEeWd7GVceW4gwyPdZ
	czWPdI8hPgC2I1Iegpua/9dCh9FiLPK0H4NG3/EBGbahYG+iu8ZeCYwLwWGlkk2g7ix25D11OAs
	l0htSJrhfoG7oUOP4Z35TSgss6EAXrszCUzyoo/A5ShKZ9Yc2FZpeIfwrlQNg28iiaYx+jnL+jP
	kA2vV2DhJ6YZyHyKVMOcdUq2unWmeBOxgE03cHCaky652gvLi/ZUbP1svwliN4Zp5XEfDwa5lUK
	JwY/+ESsa8Y8RVdYmzQcPtjqG3XI6nVQpmBP4J/RWs/u2Hlr
X-Received: by 2002:a17:903:2f4d:b0:224:24d3:6103 with SMTP id d9443c01a7336-231d4596d40mr61192085ad.35.1747417247084;
        Fri, 16 May 2025 10:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWa8ji6HOqJCeB/StEMfWMDUBnd1taWIOBSxPGp3Cgj8KNbuY90IhBKEkiubja+uA4+WbBg==
X-Received: by 2002:a17:903:2f4d:b0:224:24d3:6103 with SMTP id d9443c01a7336-231d4596d40mr61191765ad.35.1747417246668;
        Fri, 16 May 2025 10:40:46 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
In-Reply-To: <504b4d5276d13f5f9c3bffcfdaf244006312c22b.1745051315.git.christophe.jaillet@wanadoo.fr>
References: <504b4d5276d13f5f9c3bffcfdaf244006312c22b.1745051315.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] wifi: ath10k: Constify structures in hw.c
Message-Id: <174741724522.2935573.13839146888605668919.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:45 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: hVYUNnEMyjnh5iupjUqvkvlXQgaoKNWw
X-Proofpoint-ORIG-GUID: hVYUNnEMyjnh5iupjUqvkvlXQgaoKNWw
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682778a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=iT9tRhyl7QObuXKRkkAA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX+bVXtnCC3uO5
 2mCKu1CdVUQlxwLm32+fQl1kRiXzmQ6wZbuTpNwlKpGyFnHSU0xeHMcKZ0vuUIKJfg9jzWivuiw
 xPKv94utHwnamh0tCGUKuq6G38bSuxKvOjck4pSI+59/xkF0XysBn/30E05UXT3Oymhcjz1Ri8a
 oP3yxWaZLnZ7lNLASFXsmtE8AKWQXXicW/JqHskcQCl35VdRH6KO9XRadx5w3V5UbApHj5sXT3L
 pBEShjThOmLN7+Lh69J34bP910SMGpVMf+QgZzJWlHyqaFuCb/v/YXp3G4LtnSMVZmf/yORNhUp
 THl3+htDVwYorB5M2aABMUGtdhNchGCSKr9U0mBtXljxt6D5uYo2cMpB6Qqj/A7pu3dFHlT6jc4
 v0cjUz5DM/1Huuig6yG+Luu/4VCM4ZhhsgKWfZ6PbkS3aSFiWh7ibM4JtNxd8etF6PjhdF/d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=640 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160172


On Sat, 19 Apr 2025 10:29:17 +0200, Christophe JAILLET wrote:
> Structures defined in hw.c are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   10357	    951	      0	  11308	   2c2c	drivers/net/wireless/ath/ath10k/hw.o
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Constify structures in hw.c
      commit: bd8402eec9aa3f9d6c797bd51b3c5b4b029673af

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

