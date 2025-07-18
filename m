Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E877E281372
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859723; cv=none; b=H0JBmP8qnVHIyclCevJpzo+ZWCoHHcDBn27cZ1zd4WP8xz/wvs/CBq2uEDQJMxcbydFikIjQpJ2Wi7c9JaTnQodxZzuwoJZphDZFM9100kQU2JAwn9qWd8dScmJluug/hJLLdsn0N/VKGLUmV+R+ymdt8Zr+hs8gvKMOO65fgb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859723; c=relaxed/simple;
	bh=tHym/k0wWfQMHYQVdHi5JfPV7kabZ4jWC91jK0udNSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0xWrsLK3h5Bou3apxzHTXc0pwFtwhGukbp+oBFNvf9DKWJKxL6AqaTYBArXNUqqMxowzGWDshtx3VLRr79x0Oz0YdDVJ7hpYVpgg5NcJYVKCT+LRThDeqiMMR/51HoJ78LMYbSwiNF6l6c7MvrNR8SLkXJHQjxDBWW1KNUxZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOjihzHU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOjihzHU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGgJeJ011166
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6yNaiRLHAcK+6GC8eMfTdPL
	ypI+sKJ1RhRN3e/m+tM=; b=TOjihzHUobpA6dFi1+++Hpb9xgD+bHm3xJHRqLqd
	CV4XWt9vKzLLg51HQ9F+OCmYbxK2s8LfdHOPNyCjtr+1qujPhZivZxfVHGnTjjIl
	OCg6TVvyjhWZvUYXTpjTQy6AnCUtShf8RUcL/+rOxqYWsRRNj6AsyyczA/dT5D2d
	SNEl+EFiynDyIT/mDLsDmGQOhE8CAwmg1hhv5IfU7xzibtcW3chHD4isF52Gqomd
	APa0HuB0GLjFDnwYzvB3859uVjnGpRro63e7kUcI29A+bs7Se991AjQiw6jGc4Uj
	g9fIwhGe8Tt5vJIWUu7P5yCA3kmo+l21eoeKHIlQcDJaDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64nts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 17:28:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e1b7fe85b1so392243885a.3
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 10:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859720; x=1753464520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yNaiRLHAcK+6GC8eMfTdPLypI+sKJ1RhRN3e/m+tM=;
        b=AsUSNCwXAzFJ3OKH+r1O2mQprpbbxvoRYmPLrUdfYkN5IzuJLSOVzxEum/REjz2xAq
         TEJ1tyvXRwJQxLX5tSG8YbzVbtA7b5k72a0cZxCSYRVnlyNXAN0HK/A5BpZD0GHtRoS/
         ZNPfRV4lRAqLEb9G7iheBrfaQchwFQf5wqzp+XYrreWYDhOngHvqBEL+/pP1baH/Pwtf
         KYn1DVdcoNrn/ceS6KkJARlNWw73KQgvD3nb7Y8qT36hVKQnQImpvF4lHkZ61jvb8fzd
         Fp/nc2066I+2khCSesufQ222Nmd+Elfh4kBzPn9h15SbJxKo3Y63j9zXBjA+vN+w2gCk
         2lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwcXCJZYMz+Mx+LQJ5ww0qKVpY4gtz2rrE5dCnk0STTMwAf4B0Fk8ciVahsi2+FZw6goJduy2FWsArRK8UUc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvfrErYFFTx3JNilcMvwisa5uayYtCjdYjLfS8l/XAVblFNfhw
	7bkLxOaZ3jvYR4LzBFDrDSx13pVvB8iC0zbphgFlMMznYVfspY3ezP06GLtf3PzMBkSgDpOlBy/
	nnHPN/Q5PSfK350hidclmNBGkTQgVIESSJvjn+bf/WVt/5Q0s5toweyvAH1ImOvnGJ5fz8rI=
X-Gm-Gg: ASbGncu+b1V6pIVkrOG4+RA/Cwe5/VQKsjlOQmii2JaQPDTSh9Pjkni8UNq1PrbHla+
	XJHp3+6jGArKWa/d8aJiECVVnS0T+MwG3kdemUFjzyH4qbShUIfXBMKXfeuNoKkTdkKtroqY3AL
	SdUEIsTBq7CgZX/fAxFR6u+7YsXvff58meAb30c4Bdb2Gv8h+36YX/FUjEZAF0cDA7DE7UatTW/
	K/vvXe4wa08COOp3Mjq/b+f57ZVlb+a0Gol+kC+9/+buQql3KTsjVQUSWLoDy5593IezoT0CW5J
	LlJDLenWanPDUQdG3ZnQjmu/JNfJm8gy1JJUGrVa44VD8nV+YTGsOtZB3I4JwYW/dCAJO7jsbYr
	op9NK+x2m3Y6LpUa91McLz2nB5PEf7xR8dcxHHIRVmWoIj5uUrRPx
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id af79cd13be357-7e3436253d2mr1626777285a.46.1752859719430;
        Fri, 18 Jul 2025 10:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1w3sp9zVGjYWBmgKH917pY8I7F8sCh3F9gp3Q6iMWVLnWjt4QkDQ8fFwWBHnJpBaRVJQW4A==
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id af79cd13be357-7e3436253d2mr1626770785a.46.1752859718706;
        Fri, 18 Jul 2025 10:28:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac76bsm336325e87.68.2025.07.18.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:28:37 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm: remove extraneous semicolon after a
 statement
Message-ID: <qjvxpdibdt76vvw2capf6mupiuqvjlcevtfl66dkqp634ot2zd@eau52bnkh5ec>
References: <20250718133404.2047673-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a8449 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xHVDqe4EictJAN7MuBgA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tBrOGvxzs6qLSENOQh4vF87uqCQqJ2hx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNyBTYWx0ZWRfX37UFAFpDv9SW
 4ubgjAfNgGHeTcyovtifdR1xQnjSjWQN+u7xXPRnXTkz22Y/VRaxTxXEgoNkM9Idcvr545Nx2rx
 R1wTkRBHDR32Fjb79cUwXJt27b0uma68EVQHgx7qfJnoPaoGKDd1VLLJbseBylAwnZ1fNRlSQ/z
 GG2/m+U/FAK7JaHB0Wlqms+TkWnRr6YfrYC/2Sq6d11eT5aphwWuSaDLUpG/ufK1LeRzJH+vX2V
 zwHttZqsqgeZMfYEnbwFT2GpHLamLyAcyxocY0Ji1ptZoSnYklfAIMgKMmPsnqReY6P5jIMVMTD
 yQGx04S9oYa4Snx36pOCAfYo5sFO4ojPcOOHrelNBRcsw9lJMLrhWZdLBolU5ZU9FjLySbGnWFl
 LYOCyGU8yDdZvEyKD07pC4j213ailRjSUR8soOZE62TLOA8QiYIA4dC35O4S2HCvOlVIfMhz
X-Proofpoint-ORIG-GUID: tBrOGvxzs6qLSENOQh4vF87uqCQqJ2hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=708 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180137

On Fri, Jul 18, 2025 at 02:34:04PM +0100, Colin Ian King wrote:
> There is a statement that has an extraneous semicolon; remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
