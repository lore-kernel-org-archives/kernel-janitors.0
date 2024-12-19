Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46661A08C4
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2024 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630900; cv=none; b=lWQ43cjT2wdH1DiRMyGYmYtvjucjnSqYVSWOJyE6kR+nYPw80iWoXX8IHwgA6DDk17OX62hin/fngs2bV08s6mejEoAlt9drp/eCB8bJ+x/mu7qbfIvS16p5OfE9fabEOFcLWmWQqJQ1970YNd75r1b1ix55Jjs0EKntTLx4rWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630900; c=relaxed/simple;
	bh=oZwRqy803An+355ixhKoW0TKxaGqD5dbK2vsid0b4SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uS9SyeOl4i5XKZPAr/ji/EgCrlnt2kDVABehMn6jqk6K98ymSyzK9IVRnQtC39JJKXJicnmTg9HAPxhzLn68lN+oca6XbK7f5blzJlce6msH0luUqVYMWrx6LY1UqK8sJzUP2Y/IjpW6774PpUAn4VRITBc6D6tLP/UlMIBLNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeSb80QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeSb80QG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGIxaJ006161
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2024 17:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VA7tV2ui67rX61THZ5+FlVRr7eM0epEaxOyh5+LbLho=; b=LeSb80QGhzC57pbQ
	vy0j2a0k9IR6erOWMy0LMyZSYm/pcNB5JyhRgokuipyW5VUh56ghcmmuoRmMWGVJ
	aRkhtGgUC9iv+Pwsz4sOEdl/OmOL8yqvlesQHe8JP7E19Ok24zelaiLv1GlJS0EJ
	AReBmd1aLV3VtYrs047hbM3zLpFoJDf3kUGgOX0U2rZ8y64kK2m0g2Kpo2ACcgHm
	tyq+VL15c0brZl2tPWSi1ZMhfEFW772Ma7ZFiVDqwg3u6pn5NrEfNp6KxiG82h7F
	VxiQ1CAY5uDq2PYcMrGJqIBWSj1NnBxa9Yt5Q47QYwCswr4L+4/hbA3iKNoA+1p9
	jLaQvQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw608jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2024 17:54:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so1388311a91.3
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2024 09:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630896; x=1735235696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA7tV2ui67rX61THZ5+FlVRr7eM0epEaxOyh5+LbLho=;
        b=FpfR3x4Y6JSX2EQWwaF0zW7jfQVsMsdekCXu/VBrjQIJyXAk6GCVao1/sVrAWJUx2y
         3KKj8N/69g5DILfenzlWTyaB5WrSC3CzLYIol5FWGr+tBdLD7qc/ze4VKI1O75yd7IvS
         mq86dX54oSzSOflzugg1GQG5axe1tgd3TozLCrfAin0K07x6L2a6L3+xG/2Z5oE+ETL7
         UgaBYVyzJkwveQKbLR/GjtF46Yniudc4bcA/+ItJxCsjCxUFbFMHN8yuXqbS7bzQfUTN
         4uqsX6rglrUStUpN+pKwbpnxgH1dicfFwxFEBp9amifAikWFI9joJBB/ojHmodkUNjHc
         k9hg==
X-Gm-Message-State: AOJu0YwOxdyPuZRzW1Gzj872SpR6/wPAQz5WNbZP6Wk98H2jnaOPdaI0
	KPnhVXEm7UGXDGLnGFslNbvQ9SuYOOovntLIn1hiwlNipFlS/I2LAOZ7l3/tX0JJcMkbUK76gMX
	vKeSJebKZieKelB/5GUf/WgQGeX7Fw9ftdfSxsapwYKkjSMW6z5pHdshl89WGzVi6hbI7wQr37N
	c=
X-Gm-Gg: ASbGncsKUeekgsE3WGtGQEdUxbHEUd2aDSQdUg/qIj5OZt/Vj5/pWgR+9xOJOITiRJa
	ArdFagXUJHGlstxQ9E+JDMkeH2nSBj6OcnDGlwRihrvLtl5kL//SXZMdFqFYbiOUr2fsreXZF2k
	Mtff260uSQ3qKcmHHJNySVdwZRsAvQavb+01sGPuJXODEWqymwqFYWAXfBFz1PfxKFwtEL/JdHj
	kshYVbmrPLubDDHRzWQbI5s5/OJXuAewn9qhczQeA7EmkfXaYWDH1Qtp0dj2PDRi9QVLSO53+t9
	tG4Kz8yYXcB/MGXp6Q==
X-Received: by 2002:a17:90b:50cf:b0:2ee:f1e3:fd21 with SMTP id 98e67ed59e1d1-2f443d454a8mr5966929a91.25.1734630896238;
        Thu, 19 Dec 2024 09:54:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELG3UMWl1CbADJmhXEaU2YZ7TC+6nbgzolRNVUIHmnFsQx0hXG9D4OQTIDGnY8nNs8qGa/+w==
X-Received: by 2002:a17:90b:50cf:b0:2ee:f1e3:fd21 with SMTP id 98e67ed59e1d1-2f443d454a8mr5966895a91.25.1734630895835;
        Thu, 19 Dec 2024 09:54:55 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm3630628a91.52.2024.12.19.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:54:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241217105505.306047-1-colin.i.king@gmail.com>
References: <20241217105505.306047-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] wifi: ath12k: Fix spelling mistake "requestted"
 -> "requested"
Message-Id: <173463089453.2609009.334897453986903182.b4-ty@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 09:54:54 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: za2wkTP-jrwIioqCgA1hK1xYSO9XiLhA
X-Proofpoint-GUID: za2wkTP-jrwIioqCgA1hK1xYSO9XiLhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=967
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190142


On Tue, 17 Dec 2024 10:55:05 +0000, Colin Ian King wrote:
> There is a spelling mistake in an ath12k_err error message. Fix it.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix spelling mistake "requestted" -> "requested"
      commit: 578f6fc55c2ced5f68a7f87edbf6db3663dc6b57

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

