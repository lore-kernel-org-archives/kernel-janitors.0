Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A153A7D91
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081027; cv=none; b=QDqTmQ4qZ1323UGaVO5imOephPC6A/i5WIHMHG/HuD6AqOWXMeZdzEfxes1T8SkVGUyO6z+iB9cO/JcJUxcNJoi2ThqlngazDgCNZhIwzn6sCTZzS/XvI68UVQeG5j4I6PsfL6hdehg8nCpOlWMrrrA4WifLDBshCKphGnsTrTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081027; c=relaxed/simple;
	bh=DOizCFycxSE4gaw75Ag9W7ZrA9Bqh3jtlIBueFWxsvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJTED0NP7G1PaQO7Zo0devTSo78FMS/Jv1ShuL+h4h60U5lY11zoXYQici72eWR02r2aH58h2FaMSkI/yOdYhEtdR1bC1HH0nrlxppBjOTpoczQKkanb5CFhBmjxNB+huwBxUbrs+Qu3tHglLePH5gCTzI5O/4q9LDPtuuZQEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FL0BpXOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk3xChSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FL0BpXOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk3xChSJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IOL22143711
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 02:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=; b=FL0BpXOHuXsC5spq
	8iRCBZXopVQXW2LLhZtikxlZ+ZZoY5v41pgoW/hIFaf/hQV0zYLFg53I1sSlV6pa
	clr5gVO72MuPt20IQ0P95QVcLOCOMDHGjoJsQnLGST0iiNMc7YTp5FP430QWYaaM
	jAlRfO2ha6ZOPU8ClVffI4Hngpif+onM12PAAxJYUzGGHjF/ZAe27ZN4ihb/nqzT
	OhZ3cmsQssIhALu/kptc2P3xs12pCc5XcuyB6IjvoiGQ3gu3Ivkkbx1Cq6P1mXAE
	Xfs1LZV5oa+Nqqt48jVyadjyC2aHf0VSp7cMG6YNIKHKtjat5Q4vldTGiVQvcI6/
	jJ7jzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq2ukn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 02:03:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a651759a2so799812b3a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784081025; x=1784685825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=;
        b=Sk3xChSJjx7+19Y1DRN0sxwbFh6404Rpzz9izGkxfNkuOF0/6BhsGm0S2mZbmVocCB
         2t7acinpe1p+hIFV4qAhMxsbEn8FKnmfAA/mcQPa/WLVmP+nPfjPaH2ChSDFPRlfNaZG
         SIqJINcPhl67Pa4Iw/QqIuSs1kulr/WgJ6EcwzpC/q9S1E02hSfruxthSJV14ByGEtZV
         FkylKscJZb+rFvIW72Okp3Cc1e8q9XYoC9xiAjXpI9LNm83pFfdSR+X9LhqygUcWJHjg
         xFZCUy30emoI1M0MEWi8mTzm05/J+V5zhKhbpdgYA7KuNpzoW4BQoquUYTIFjC4ianU9
         eI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784081025; x=1784685825;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=;
        b=qXG7H1NSWfzPMXCt0nwCg6we3eJTIuBfy8fkXEnNRQFuh8zYSXo6+BqYbSkkOr4u1I
         vtoPovL4YExHaOuClZlBh/P6TuzXyRUytk3nCVxNg2I8oCjMkD9Ha/oRGpkFMGBTuStM
         FkYhHz7iHuYrSOxa60zIs8exMr9x3SlAALqqEDkx3XeHNofiP9wo69IsFm+RP9hFE1VE
         Sc1458bcD5yWBw1PUCEErsZCBSfjYTrAlKcwXhhVdW2Z8WFrZk0mLHWQDBdqHa/1JVlF
         5rTxxAb20yigzBkMYdFtaWzegIyO4fbCu9utNtRUyhGqZo+APQod6+wgiewgKrT9Xz2U
         RmLA==
X-Forwarded-Encrypted: i=1; AHgh+RohUizQzzY5NymXiv/vzZK5rSIRo9fqewHxxnDUyXPpG6E8snnyYXgpl7QLJs38Sz8pBUoFCLyzaSiobCi+5Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tsi7KV29jxT3dgu6MeV84OiDI2zdQd40XQrElt2soiWY1/kY
	ZEc3GKiJSV2wfY+mAKJ9OmMCgJkxyC51/v+35ErVVKW4HbuuHRK/5nbE5Z5bc2tv9YbwkuqYlGM
	LGon5CfaH1ltQQRoZIBgrIjwIiyEyC8JxevJ7jc4KAG5BmMtNz9P5m3Y8SUdS39q5A2A/+NodUF
	d24ICGrA==
X-Gm-Gg: AfdE7cnvc7AIwblEiFyr4XD6DN0dZlN70CpdiGTZNZEJdJUgZ/J2Kv82O7VlCa4QFlQ
	L2Pjy8YrS8JpbKplXEZWaKPupR1I+ii/Z0kiJoD2/yZNzbtBWpYujNw7vIk6iPFRFK0CBOIZq2V
	Rwem8H3L1/F83SPlZN19pLeIx7+5d2n0Si1rtSlcwk31C9atdmVV3Xdl/oCQSfbcbg85UWFujGg
	DzS1pGk60wZWv0jky2Uq1MwfWUszeUwCO7xXjd0vQa9ENnsaJ03dqiZQAS97LcAxLlMhWoTc3L1
	+qG/Pfn8GtdH1HZaigXIdEzWBwhRN99yL4spgxIn9EcNJ3BlM1PqyjQp8i7+Q1hYqmbleHHTMqx
	ug4AN/yECFbQCiDTOGCzPMUXqYWDcshyOlJ9pT6lX1fwx916fqh4IQf0NBFzlj2THpJ6osnq+0n
	3BqCOUXuU=
X-Received: by 2002:a05:6a00:22ce:b0:847:8f0d:cc09 with SMTP id d2e1a72fcca58-8488970ab05mr14510494b3a.44.1784081024583;
        Tue, 14 Jul 2026 19:03:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:22ce:b0:847:8f0d:cc09 with SMTP id d2e1a72fcca58-8488970ab05mr14510481b3a.44.1784081024190;
        Tue, 14 Jul 2026 19:03:44 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a5f3sm2224727b3a.5.2026.07.14.19.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 19:03:43 -0700 (PDT)
Message-ID: <5dc0bcac-82bc-4ab3-9b56-f8b670c250e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 10:03:40 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a56ea81 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ZFVDk5XbsecVSkwzk4AAbuY6TVyvi3Gv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNyBTYWx0ZWRfX1SQBueQOsr5F
 G/gAty2URGrAgyZMLtptGWOLlTX5p3fckyd5VbE/hEqy5WP16NnS/eXzFRSvcARydy460P+gjp6
 1PRaiPuHxoZVol5dJR0tJOvdEzhGV+FU18u0W20A9JaihpiNvYyVijVQ8nrNscly3bAEiR6ffAr
 AzWPv1iiQ8LwY0ohhzoQopNo0oMGOZnlxi71e8ttXBJ6tImc7dXQ2PbZZwIWFJ2kzIjB2bSHKOh
 PF2+e9w3vzYAKLf0a8dmAvKxcBGbb+NuCikP/Xide+HmPOqWHHNEIfDEKnjEQZG0R/53XEWeBOt
 N8XOkWwD54ZT0Qzl8RubBEPYv2Son6a4c+fCdz8D1eRwq+jpOuBjmd2BfVKU6dKdYwwuUmjUOBX
 N8OGMEgr5HqPBeL+Ztumeu9oZtPie6qTNbdY14fCKn7i3awsnUe4PmZc3yZ3ZsY+QyiGyeW+KW+
 wFzRVblSZj3JbrJDGlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNyBTYWx0ZWRfX7IgT1jTEh3qU
 9YdM/f3LZqXWJlVhM/65ihelZDOelXrtm7jQhZ0GKIlcFh0RH7y3bbOY+A8y+LKzW3hMTr1VfqC
 owukRrDsW1r4XHSQB1TlH5KKbPzeMTU=
X-Proofpoint-ORIG-GUID: ZFVDk5XbsecVSkwzk4AAbuY6TVyvi3Gv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150017



On 7/14/2026 4:39 PM, Christophe JAILLET wrote:
> 'struct ath12k_dp_arch_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    6478	   3224	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
