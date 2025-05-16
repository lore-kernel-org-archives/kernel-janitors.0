Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE11B6D06
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417250; cv=none; b=nLuplncmOEemY7BspAh1EyxjI2/9QHSPZLYLmF3377adRbR3SedM1L+TwuLI8wGcdKsw55DOxNnGDBR8qpV+anqBe76VQX1m5T5r+HUOy2wEl0XiSBKYryBgsbVjI2gPi4a6OCOFagkkNn8Y5fXeSgN5bWSXpq3/kwtnKtn0Hfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417250; c=relaxed/simple;
	bh=0c1yrSJrjxCsVlYq4tbr45bgKKiXASQqbAogZUlWQRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F41X95ya7KwRuqzIv8YGFV1ODTXeJnB68zLRzsjjIt6EYLbQFLRztxFZMniBezWcxEE8bNgz6eCIV83PQYcMG4hZEtt/6dfvFT8BJp3hefEDS3VJw9urpwY5g3otE1FXvIDTlWWRbCzaf4+v+Mu0pQn9BsnOVUq3XVw7hmMSWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Og6rGCC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Og6rGCC5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GG4Hq6027951
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=; b=Og6rGCC5PoNgGNyX
	tWn4KKbvRjmChKrDiHMely+CPmhtNIW0Fr85RQnsZECXVYdlE6JsqzjN3pALKZ5w
	jqObYK4zDatp+vrlzMqB1BZxV570ZRxK/2nAGPBHpJDRSJvejPuulJXTOfG4AgDQ
	Z/hWDERlTEG69jVbZ22epvZV1+/Q/gKGjRexfN9efzSbUcrfpAuDTN3TwICDwogF
	h3xdo38hDAjF9Us3e1TXRIjwH6WoLh320zNWPlueuCnvS2xWi026dzQK+pabMq2W
	KGBVdtbP5szSC2zRvrG6VU/z9Ue5xMKotzc0TlVXpyam/cDkI/JEJEQSLGEwqqhB
	Zi0khw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n1t1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 17:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22c31b55ac6so37143155ad.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 10:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417245; x=1748022045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=;
        b=WMQnCrLcdHo995bhlaikA/4jI8QmdhGJWT9go70v6/xoBL9NIWyx5qsAORBBN8dop2
         9HBer1loOZYt/HCNqyzFFJM9kjgY41e4/fnuiMqyBozg6QwtkhZ6xoLMpwSWK5nXeQRM
         QNm2qVEPZErCaozMFdfUTO4baXWb6brB4irEqFehUpmwxwEfbPQYSBcD3YKtNmHqyZ2X
         p7wATzhSpA5nDZP0R3vpz7k/s/0pYunUqtOcfQGSp4aQ06Lofm+PO7mD86tlM9IsDRa8
         PxHkGCxPqpv6OgJBrTM5QdREwZVV8VY4iSm6aeitb8T+QnimTIcmUetmreKOMEzngwf2
         r0CA==
X-Gm-Message-State: AOJu0YwTxybctHXgqlLI4OI9Jb/90iVQJuKL3yZcUGf+rRcFOFvK9gk8
	Vm5y9qq001+D8wCNR+dWhjMHqFNXqoDZPtLVnsy1xeox54iia8KWIqX4AoXMxq8sCulQn/OOvet
	vsSsQ+ZQ3/y2wqoBfvbnKHy8HtfNTsqzTW0udImXP6KBbLzYWCBDygbJKbLv/CKbziTPh6NtrAT
	DxBHo=
X-Gm-Gg: ASbGncuzVFMa7Y8NquVI0m5FnS+yyn7IZX3SLssS21G91raSR0DuwEfu0BSL9vkVtMm
	4vCY3qDmgAPxxAFHKbKWPryRbIjCm6gI+n5QI3lVhzmmHwPRmyOZnTovMo6rY3wQv1cAQVkrSuj
	VtlX+LYAcGNNCy2hn0xQOIYU99wSMznloy6byUQeCRi3M8n7vAHDqpK2CbuWh7u4kfA4FuamQto
	Qf+zf6E8dKxHlbEVufHKRHi2GS3Y6645WQe12qXYjke3pYnDAhzlPfLBooT71svhMrtDtVodPsO
	Wek+kJVSFm8SdWb3g76pPzxZ/+MEdN4sadgxgL9WuMpXyMYe
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457935ad.16.1747417245443;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtF4TLFrrPoEt4gmfmLFTd9XEB50AQ+2oIAkdKuvYSP0egvrOWfC3m/7jstWY5dO6hzURnA==
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457635ad.16.1747417245053;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250418115627.534833-1-colin.i.king@gmail.com>
References: <20250418115627.534833-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Fix spelling mistake "comple" ->
 "complete"
Message-Id: <174741724396.2935573.18125129643312875821.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:43 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827789f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uQsNN5m5feiSJzJ953YA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX4PdiEgUcF+d5
 bxNh7CoeL0aDh4wIqnHHhILLb759Rz/DHThAOnqhvmKmMamn5GclCB8j0CywIour1N4c3z7Text
 M4LuagrjXzBKl8bywHbwQU7INo0hUZgNzADYo41WnkhTEV/JckJvuHp6ZvK7MeCfcXsQyUNpJXa
 Q1ajLlYFkYMrkKPrcboXVN9VTNHFsvE4BTwqftDB92FhEHpnK4CK55Ki8ErPhC3Qd+eJ3BhVyzf
 uW5n0eeqEZIUUXalu+fDp8kkYq9cKJHC0iUVF06VsgqiclF4/9sVn15IAjeexoK7J8b0Z5IKoby
 yJq8UBPwlJBkhuuU4KIV8EJ3s/gWl9IDA67LzmSdi0Jat8YtehEp1GbFb6jRBn2/vsXK0skBFIo
 wvYOV97pGeLPWDwD37BBLRGxhEIoh4HfEtT1SkjKP8VapenpCd2yanngJtnuLKvcN+sAq1xr
X-Proofpoint-ORIG-GUID: H7uuvO_AaQTtUIbEudDb2V6Koj959AU2
X-Proofpoint-GUID: H7uuvO_AaQTtUIbEudDb2V6Koj959AU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=786
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160172


On Fri, 18 Apr 2025 12:56:27 +0100, Colin Ian King wrote:
> There is a spelling mistake in a ath10k_warn message. Fix it and
> remove space before colon to tidy up message.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Fix spelling mistake "comple" -> "complete"
      commit: 2ef2d31925f0414ff0f37862b6c33f62b49089c5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

