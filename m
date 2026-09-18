Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07824F3EA5
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726588; cv=none; b=XbfGeT9WFspCas4ImUPON3Gk0rEtt5pzwZPuX2GytmKHegcvQkdbOgYH/p404D8XRu8zOvmoig6gyAsoqSLg2ufhsjDBej8GLoS69dQ+nT2BzALcOUh+2L79rob10PadQhQkUQm29gKZvBoZdBjUX7p+6EKwcrbGBwWfiDluXXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726588; c=relaxed/simple;
	bh=GKSirKHvfn9lZan03ZeAgUC1tA3Nnr12Pp3mvCfeg8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDhWkm7TWMM74SjThUzJVZHFaCZ1KJOzMQrfcQhjWMEArCDiOrdZ9JC2LZkvnPB3zeD91uD7SY4BICPRo8FD7v8fWCGhky9rqobpuSuEq6LJ3MAUyXx5OlFVTEWi4Z3MOvguceW8RncCgqs94fsbP4jIKLtj9pddcpble6ZTVBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m62CTU1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ng7N7n2Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m62CTU1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ng7N7n2Q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddwG3801914
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 10:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=; b=m62CTU1YnGapAeDc
	+qy7Soc6UKFvvtv+bZtezgCUvRpCy7x9WoLiUAuzSwXaLcsIs2vpyBQiqiD1qxlg
	4gu7HD2oaZnE2c7oBLTBTO+ZWNzFqctmWuwsEiFldYgdTJI1Rc94jm1zTORMfwdN
	Enz3kgmWZ7vAm8RKEXb5U1ZAo6GvmEqCjfSiyLzXlWYp9N82JQ0iDG1ZmXKQAU1S
	k92qUVLmxi8kWdJo5RtKARbqTr9LqLWILs3fYPDOjPlkn2jQ4D/Y3XpEGvCNjPOp
	IX43ijDUmFzVlZqdhl1kH0lIZtaqNdTTlzNNRRWDhO1K3MV6JGS43+G8Zm/8vCwc
	aiiiwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku20g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 10:16:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso90677785a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726579; x=1790331379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=Ng7N7n2Qt9EHMGJEV0tbpOphKfQ7n6eBEPwF7NODJLVbhpTNNgFysN0/zeXVHGgLiM
         48FV13CfdpDyvrgUBJrWck7LuDvISq4OQ2Sypnid9FQkuSud2kLcmiV1X3WBttqQ6bbC
         nn8FYPUI8+JYerDca85f6GRbsyjU7qstYAQETUcMz1zA/wR8TITttWwPtZLER9ntM5lw
         X+ffrunBK0PHZ4hTz5jE6xOvno5sx+Bdp55uhDxFqABZbzeTN9G5uBSMgy8DoDnfX3PO
         6TM3CP4W+L9qHwDEh9xQl3/r53cxTQa+yQERhVciegosBtHjcmBWr2QGS0dUvD1ikfla
         YpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726579; x=1790331379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=pW8EuYrvfVrcpJE8ETMWR/UWREMyDc24EcR54P9+0j2ntXLcL+mR+NuPiHj5w6zHby
         UsHVc+GQN+yHFLFPa7fSg7NQSw2KxBpoCQtX/rTOzJ7IUwnhvvlY+c1DJ78pnu9k2hVp
         /NpWs+y/h+r0UXxFY3AUD+CvVzQq+gWIIu4TzS/79wlH7ruvXsc2MfNBOJjJuWm/CbPw
         owdhDuUeauMAobRNEkExIAcr00zPVzbjUlQ/cRq5olE6ZcAZnaG2YRPPnrZ0TGvQJCVA
         dzXuMz1l/as72WyUaXHjzaV6Y4J+idt0cVqaDfdUt5hcfiK7Gmi80n+6g8BqW4cwtAS5
         kEwA==
X-Forwarded-Encrypted: i=1; AKwUvBwCakx++T0DfUNbALiJZ7AN6bi+LkUi/qyhHdwRlGh0zn95U7uJyDuh4oubB/hSzQzN354VzxJiLTQnV7C5I7w=@vger.kernel.org
X-Gm-Message-State: AFuF++kdv3t9pZ8MLP+14U5TwADkkc5woJgxr5eZWzHudzLkwBZgoVnX
	atp0gozmDjDkZn7z1aWvWsh+gVq/q9KXmqlQOL8v+Gv6rhdA94B1GKZAvMJh/gYwlly9fAw+gpK
	Yay1CmBbsRjmx6R7oMRk177nNU5+NY5xiDCZKQUtd3OTwwcC3nMgJD4cxYUpSWntAeBal7mo=
X-Gm-Gg: AYBFou19lgnim0l18Mvhcbomo5OtMlA2rBJKmVJDnMLLCi7KfoeE3+0JM2xsV0sr4ae
	P3lNQuzks+TStHNEAvvrmOliVvoN9ZLT0fSPcVj4RO0IDnY7S6+77b1bqAVj3mPMb5k93C2i1k8
	Sf3w65rJjnipqLjtmGPz5+nojkWtBx2fdJjkCEgilnYOZ1/y51qEWgaVVM4bYimeW9alFN7aeQc
	+ox5YkAVWD9ogyYnX97RDJm/DiLSKWceIZlGjltcgLLMWrPAEL3wrTYB+xTWS5CdSleVI21ZKIq
	vXBghSkT6OVQtTSiGEwDzFKye6Sg560nzNtDgzzRfhAIyiKBxWvhOdaB5XLKrE1+FNviTi24Vlb
	Y9EqPqQ/QCRKc3kikH+RwswjXzZO6BA+xbh3AuFDHEYvNbjQ9FhctbxSS74birtQ=
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217943385a.12.1789726578886;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217940385a.12.1789726578407;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm147325645e9.0.2026.09.18.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:16:17 -0700 (PDT)
Message-ID: <dcf28454-a583-4f6b-a11e-483d63be3bae@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:16:16 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx9: Constify struct
 thermal_zone_device_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfXyuHgdkOLUvR/
 mbC6MnFjN41rBIluWAmzcC1cmdKi7ceY6LhhtFrmH4eqYIPh9MHeY2eB5/k0S2gKZKNgjFLAx2q
 5BfL/WfbgR6V981tgAFurDfeOlFjh2xS8CK5oP+I91Wwu5RKfqurGKZF5AMsqJvb+y1rtkJxt9G
 iNRKinft0fD4OfdvM/kU2ATCfDYfqxZO2R/pju9+/jbfsdDj94AF1ibJ4cPHSEtgsv7VP07b3zM
 P7EM4HZkvn79tVaGenK7eTt/QXtccJlONiJmPwKpGdgg2KLo6atZMVY3gydnjgbZveD9Bxf57Uv
 Cs1SDTrUgK9hWYXUVYro1eN+R1M6NLE3EyeqR5+UZZ1kbRmkG0mEDeZEEFOZd/h2iovnN73DNLt
 X7aYXL+x6sPOHstUIKRKdFJEGJfnBZPfffk7vp8OWki79beP/eXtaX2+/ierEZ/M+jsufdO92TY
 xjvgFuuQAaEKgceaDiQ==
X-Proofpoint-GUID: R-uIzb3MeXQPbcgZyPWkyB92zaHJyRGi
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad0f73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=_H6WjYdI7YG0SsD1Ov0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX65J8UiaIdkHL
 vma311foHd1KG82/R7vD4BRcwCtu34/BA2Pouh9Ht+kdL7uTjsp0llE9pkm3Hy1L12nHnUINqOE
 mvVpNgnzllZrt2Q1cM9FwfhVqWok/1E=
X-Proofpoint-ORIG-GUID: R-uIzb3MeXQPbcgZyPWkyB92zaHJyRGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

On 8/8/26 22:23, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     8567	   2144	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8695	   2016	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

