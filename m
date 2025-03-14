Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC62E3362
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970910; cv=none; b=Qh2lqfAFZE4nCVPYgyra8BF1zAcWjzqop3bzJmo4UorkFwpno0Ia0pIC79R5Bs3fQsT8vqxYm4h+ZMrACSZjmuuXRuyVelcxTT4c9YNqa4TTxLe+ALLckGi6sfDQFkS3nkuEcmto1tlVG0/FlRAsO4H+gaavJgV0JhRi8ypgoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970910; c=relaxed/simple;
	bh=BBphB9Ni9HCU6GQ/JeDL1EksZRG2kNJoG6TyDZDa97k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhRkQ4xXCNMUZm6v5sbjyMUTAuVx0AsSPwvp1604EBS/s9FAB+QuTUIxn7Z/6aL48h2zprHQuRwBKoiZH9ZH8KiFnXHd+4Jr3cSaW9/2AhfpLN/S/Ygl6HlH7R6jVAjJRqG15XgL2iHJUKXBbU+Sn976Z8Z2vlySnZ1VGo6cRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6iOGLmj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6iOGLmj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E80DRj022209
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=; b=l6iOGLmjMQ2zmro8
	GC+8PR3GoStWrvUfBkdmqlJgewPAKU1nMTb0XJT9eooxpUvaMWzqzqMRQhMEUMsW
	eoGiUfOHXoGNK2NGg0qDhEdUwhsxeisOAEtY4qrX7iNL9ZybQpgGhidrpqdZ+v1H
	exebn8Zud0X0BUDdArC0sSJw7FPOrt+qul5gKetTF5NJNxdN2UujzNzvC8Dj5lhz
	sbrlB6IcFOHCtYo3edCw0X7ZT3td3+CaF5IJxf2RjyuiNyTgFAsamhC5wLVN2j66
	+z65QrJdvO3l8p2j0Ieu5Ee+FMOSTGueRN8hde1Dn9coSbGBHmWbFq2ICMvvhvHP
	Kn+TnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07mu1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 16:48:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225974c6272so36286125ad.1
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 09:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970906; x=1742575706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=;
        b=IMIh9lHjG8WYMClU0e6M5za5al4UPiIBN6smvDpQlKgbxPizPNbiRHCUXTFfTzSbM0
         tU2Z9S8/9cusLM7z1czKueCBwx7VB7ZJy4KELcOLhWC0HhJ7ZjtjQKvcB7BbpYC5/ct/
         SORVvb9N/VUbxNArSwFZTxI//2Ct6QYA6jHaXQeme9YqpjRc8vC42nXQhPZmRUjsSuYz
         6KzRjwMXInn1Rj7ij1RAmRoBdciYElFiV4nFJVs/uHYQUtXhYeUe/FAHxDaswggmi5/V
         i/7HXOnzhRquJPwt+Y/2FrsP83wwIFDFRYpp9b8ZVWPnKg5X39+P276fBUzBDAWYPw/o
         KHNA==
X-Forwarded-Encrypted: i=1; AJvYcCUugtEjFdPGyEC3Gd2aTqGxzLVGNyaJU2bMgJ+H79JrpbA85Wd0Al/rn6vKkhJWikMp7/UiqO4sU7ukvmEHxO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDiCvTh8AGGFLmwf8J5ONrPopXi1IbD4uTI0zZRlna+URXefpZ
	Rjgcl9weeO8M1NnOMtMoBpV2P8iDzWD4MQ6a6nn+bB5AqdaGm0R3fVQLAtzutJ1vc+4BEaG68+L
	YzvNQ3QHr2/4JPQJihEaJBsXxvYE5hNq2TR+08JdFnfSOs4yNPodovGCoCHA6Bdzd4NI=
X-Gm-Gg: ASbGnct8OlBMREIgothW/q6NHtZA7tPUl+FMJR1Fmq4u2wLRyOZnXuXU3s8c6j55uM+
	Rx4PdQE0hUef7wWRqNWOmpJwIfMQL6lsf2o6DqlJIafpFSuncQHQZqxKLdXAnw++6AruSRlfgQQ
	o8WPtQZNr71P7uMEjLwAgm7UwfRW7yFxMhM9UkXQ+JOMEgUBzvrhZjbNCefcxzhkRlqIlJ+xNYV
	0+C9Cy7IAYTvgo53ZRNwnFBaPF3iBdZETutIaQVOBPRqKpcpcZN+YzisJIe2EOTYbU5FORzbwKL
	+y4dkTiuK3q64F6+8lHPbLHxRy3ro/nNLvhoNCEt3Z6emTnpbh3p7fkxTfAVMuxzNQ==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id d9443c01a7336-225e177d49amr44873675ad.21.1741970905925;
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX2caCviEFQxG1FsGN2Jptlu0lqSidyR/Aam+mWuaIlY9mkeg1dHFRkglzhAKx+lkbrUfCZA==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id d9443c01a7336-225e177d49amr44873495ad.21.1741970905534;
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa5ffsm30735845ad.82.2025.03.14.09.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Message-ID: <96e4aed4-aa08-4bbd-baaf-99418b0aaf0d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:48:23 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Fix integer overflow in
 qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KCUl9EC2mNC0u-RTkiI8IwOhox1k5hSl
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d45ddb cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LlO3PXAvtcZV46L7pkYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KCUl9EC2mNC0u-RTkiI8IwOhox1k5hSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=826
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140132

On 3/7/2025 1:41 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
> the math doesn't have an integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Pushed to drm-misc-fixes

-Jeff
