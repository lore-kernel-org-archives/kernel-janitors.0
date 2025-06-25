Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02F1D5AD4
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865538; cv=none; b=To2gxHb/x1haHTu2otFp/Pj6rC43mwv5WeqQBKQqv6S6hIC10FnJBqSbD1FLTjA2TdEPXzuW+DizO6ug/CXYWXFtww/eC0tmqZUBqSEzyKXlWsW4W7uZ+I+vr8jUEUgc0uPZTO5eff/iY5O5ym4q5IaEGKQ4v8tH/8b6HiuTF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865538; c=relaxed/simple;
	bh=I813X3EiTRqpw6wo324kYvor4rpxKNGrNGbvqJoqGYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgvkcW2gORMibPDQUFRjZZu37gmqqkrI1cAOQ/O/Nc09NOvch8EAdWYUBtFergMebKSdodjm+1Vs9pkXtpy7ZHUWmyLcBl3Aqy+ym9Mw6z93TL56suuDWGdRD1xMWcE26D1LXAxe6cDN6z19Q8aw0zJH2OUoH++O/ZtJS9/xVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2ttHAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2ttHAH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDhCPP014586
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=; b=bw2ttHAHNYzMxnOn
	hOLUp5wwm0y0ZTcVIAimXepUCyF0A2YfkqHE8xOau7c2c6X1jCrrr5VZJuCgZ6tF
	OzJoJDrzDD5XMfPCdDzUlS0wHv3/DmHOcgQ+buld14vkQkj6TykjMsgwbcM11Tnn
	cAOyzJeY9xnRVI1FWb0OutxSmrvzg35lUey4edVCal3cmDzIcFGvbB44y+uFVEBy
	y3r9eX9IxaGN8ZF5HidYKkzeKIg2gAM3cW7L/BHAGn8nLxTu7UK/8XdWb/OTn82F
	xbYiyFW/uxk/B/JBWUzju8gyos6uzEMfUpmwuaSpbGesasw8dNpL6ckADKsTW3io
	HaTgoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq0m9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so174149385a.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865533; x=1751470333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=;
        b=IPEPdpv+4SLpCOPnbhaX7AgpenAX6Ee2gHOvgoEgeGlQMuqCOGZQpFOgaixs6LGgf6
         CN+CkMf8nefKDq+cCPOyA4fXQjrJFsaChfaNGaX/iTjQI1QxqSs/i0Be/DNAlYEZX7X9
         S8YC7NDSokxFq+sTZ438yZyLJLQKF/Hr5BNj/Rv1pIn6QREslzT+gVHK5yCXgCga4fOj
         dQvR2bClzZVtFDDsZGeSztq40l7BfPyc/4aJWhLD6kU07CN4T9vuzIF77vsF4QoCitsj
         zl7MCUplMA8th4g/rNPt02zPBm3baEMjFu/blM1gwArsWM0fVLa1eKJ26pTD2peGbesx
         P69A==
X-Forwarded-Encrypted: i=1; AJvYcCUWkOt602DpMvR49+Ro+fMrTOV3TscmhsfWseBW7NaswJZMnO17ar3WsumCQZeJrTOvx59+lpeMSAJRhlDxcs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IkCod36vjkJuczjesiSl1Hg7V6/qoVfa7cyQDnjnssgu/jyL
	qGFsoagkrz+9GF4jt6HxHOxH/c+wY56m4dhWmKYiYoLiBvB90y1PKVXiiX4914B7np7B3UAGKQl
	hVMLLK5xA0MYu7GrOMaJd8UBeWbWYxnx7/zajvAk0VSa5Ny5fT2AHIiARAaCQj+ZIGU0vtAKotC
	xDhlQ=
X-Gm-Gg: ASbGnctng+9vLT75O+tgaI86LdPDskiKTMJqYyc85J2ds3F2rYGAn1rEzKYxUb4r0Vp
	T6PZsnQ+twj1T4RAQcN0o83e6nnHjw9sNwRBaNYl2dFXmr4qsYf4ue1Cya5ejIv0V51ocMKAyum
	OG9z509DzEoeiS2S+bCKRBuydtOE4L2qRXQmJg1ORVwgR3+B8upQgOu0hT6OxvS33CcA7xBLv+W
	lM1UHvm/NrCCaTSRdPVz8OlRcjhAzA9Fw8MCMdC6rW5oiy55VcLakFbA1XKt4wORmX36Vg3Kkq8
	8A8BX+FElHm6hi8lMLyL4gnzR9gy5+5acz1S6wz8DpiZlYcow0GWJnbrLyaryYsnKn+COj0tAyo
	+G5A=
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193092685a.3.1750865533421;
        Wed, 25 Jun 2025 08:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuBJ83h9G+qwXCNBTSoc+BDxPk02mWPCES2uC4O7zyFAuSLARJnDW3VJXs7MFVpfgTejIuwQ==
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193089185a.3.1750865532427;
        Wed, 25 Jun 2025 08:32:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm63243066b.135.2025.06.25.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:32:11 -0700 (PDT)
Message-ID: <e24c7bef-e94d-4deb-9ee5-a8e91373716c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 17:32:10 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c167f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7YHIwnd5pbqMA7mjMgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExNCBTYWx0ZWRfX4bAuUTveJh0O
 /f92YvXOJNbl7DHoXLiIxOrM1Kd8Uj8nt03wpjDUnZVGyezeRadQOzaf6f6J+UK+GxqtD4owAe4
 ChxHM9cOxTULA2+iwT0+VhIKc/GMgg4tMvoe650fL1LSCKaQVv+6QSvWEECLnio3rb5If+bViOS
 Ym1/g4DrlAtvrnyUQvK8KdhJYhEGe43G1C82fLJ423wdEsw6r/OZQnv4GvjS/vfkQkN12HlG94W
 AcDZ8o4eXIpQrt8ub5ZIT8iIlckuHCsaYU/dndHGeX7BM2Dbd0P98B1SaFLnmxamgVLUMcp1WEu
 8v1bTeP7wFz4Ue2Qk4MtWdB/wtPcbZK3jD6Va6cw4vZFjGC1OUsrMfjlemw93brmkP+2MnEKOq3
 XhCX6E+YHxs3ltZ4/9gUd+u2B6SQ4/HUwvD0sn6AQZOtpU+drNk6Eb/kYWFSfftl1AsimXnL
X-Proofpoint-ORIG-GUID: eq3TASBYkjmjQdQeYKXpl1W23IgWtEKv
X-Proofpoint-GUID: eq3TASBYkjmjQdQeYKXpl1W23IgWtEKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250114

On 6/25/25 5:22 PM, Dan Carpenter wrote:
> This function is supposed to return true for valid headers and false for
> invalid.  In a couple places it returns -EINVAL instead which means the
> invalid headers are counted as true.  Change it to return false.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
