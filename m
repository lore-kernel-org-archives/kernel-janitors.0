Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D001DC9BC;
	Mon,  6 Jan 2025 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170954; cv=none; b=YDi+ncyWG7bx9o51uPDan9bseDTyGaPCL08oxv1HHJrEDd4TA58/H5l4/jh+yulnBBp2BWFViSLQFjWw1Gx1ZknaQPEHYzgPmBsNHwxgXUTZxRs+U4Tsck/QAppKcm7v4Ub+VVHZAhpqphGf2uaWw0k5mAvGMeok/tea9LE1sOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170954; c=relaxed/simple;
	bh=Ev5f8dAAcIF9LpH1BkPepraKqcL6PPnqZqUcMS0z/R8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rlVErMZCQbSC64vOrx+boRR3fqHKRRObeURrnNGoUqQXbUDPkqR7Rag7cAI3GYsyOsnU6YRPoP2u8nrQG+AMlY27xA6DH98HA+DaUz+eFTmO28ERnUHP1Mx/98b3D7RtV8osiDC9SHILXbBzlM32NtzpUTXnC1NimAky7XB7mNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ra5wQQ7S; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ra5wQQ7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1736170914; x=1736775714; i=markus.elfring@web.de;
	bh=hIKi5tvHgn4oTtsQ0CTNkhMCpwV6e41GG155vwUVdx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ra5wQQ7SOWCKVOlK0dltQ012zpUHubByQ2Wq2og0VDBV2PenPHswIBZSySJ5EmUK
	 DJBPmHJQEQWVYP9NcqPN7q1dj3f6NVX3LGSdctnxilFfpfpXd0RLWDQahaPSlmHhm
	 6/PSZKC14lVSHfuV4CRJATTmxrr86TjTMd5iTi7q+JSXsfdX7+xRHjtSEyNsR7LPB
	 Jk4z9Cnxx675j1QlHDTk3IkiAxY4v+ZLzSAO4z8ZytRime9kbTLQC3lmsF3FKiGDo
	 F8DrkKS2/+Qo1uZZEVCSP+vYeoeZXMuTWY27x+WGwdP88p27UAHKG8WNVr48f/rn4
	 RCMjmuWoLMpfEQckZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.38]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWiA0-1sxjfk2S4W-00SY5k; Mon, 06
 Jan 2025 14:36:00 +0100
Message-ID: <484f8c43-2c50-4467-be3f-8fe02f36e6b0@web.de>
Date: Mon, 6 Jan 2025 14:35:51 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Ian King <colin.i.king@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250106123241.161225-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Fix typo
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250106123241.161225-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uvnSiY72c0gNk8bkKVCMJNKPDVix8JfGj166yYbGYi1kojtpQM3
 DoX0jzxO13Tdz2m+X1lbGxtK11KwGFgNrpYw6SsMthzelXqTGlc9dLkBv/A49h+JJUpjqgq
 4TEcgDX6oyiO79amjYPL8LpWEpmr8NqisOcR7SPrBrfq2ItVxgtt9MHAIaPZCb5YM3rW8iI
 625UjMFnolUwdobkqORuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wGKTVeYmOPQ=;vBjDB6ty8VwHfATNkcHldKvUIPY
 cpmvk2KbP3USKIgeCG8MxrorBvbB0wcFw9bLu7NidLFpOezC4zegXn5pUt59k04i4WFV/iIqv
 Jr0QOblTzgazRqvFYDguyxd19o4gum1nk0I6xc7TfGFNVbXIJlRqIVIbGRNYvJXOr1idZkdlA
 GWvp0wT4eT1SzKyiDyvEc/UvhcwySkicBh+EpVTcZOMhiGRZYL5T9sp9Knx/fiAa25UHqRRyk
 drjQsVfjJIEgoUXQxTjwZvlqMDux4onWNqTddwgSyCZ0JvLKGTh5hNyUudBfVe8D8Zrfy0V/3
 NXcBnLP1l0jP6qRI5BuYomL11lSLluc+CIuk/WWjAyLAeDQVpAQtkePUTiTEJTuJxf9QTrGFZ
 czRFeVyoTq3uxemGr6K36sO9wWe9zbx4VpGBxg5IVt1RhO3UeoBLXwrSvgnEELth+s7P5Tnii
 Zmu5E/7NgDWQIEbIuWNVjUnvORaAa8WzGrR/pQhJS/6Fc+kJfX2X1xvujUCftsM7ZUBOByp4/
 1w72AFmQEnk/BigzGLo6Jw9xkYTWAKRalW3HR7raeagVdDgiHs9oIYsAA0t1Pw/s8n1sE7UAe
 5Lvz7WAIHpR07pkyiLsCiBHONGJVqhCds4QFemwkEViRBMzKOykYsj50fhg+NPTir5NmphYin
 pEiREY7q3qsXMe0lMj0cHksLL6Z5CjsIsNgxyy+Y+j5km/DQC5fIjgi027P3qsnI9nG8v23ix
 PeacAfQunTFLFo/KCrzLRTCbzLcNxbb3TCBs0TafXi8JLtvYN5legwNKdztjGImxfmGPxjf2p
 UWn4EWDN+7ahVsYI84ZWKbu0O1dhC6fkVM0Bqg0WOvsqM0WM7rpAvei6L5FjEZSjLtqqxXLEV
 W6RLuLDH2pXiQqLVSZrdvCAveWPo/SyLu99BsKWGg8CrXSCHnqkWpILzDqrrkxESaR9sUcJLt
 IJ+bI8sI3gUr2zmM1fJ9wJFjKVLHQ1Zqo+kTO5ti+xgKN1mrIk0J2/bFvCiQWQVqBgnovwVaB
 tZOk7neYydLKbZixfzHWmAVnQtRLNr+gQb32yEgy7SIxWVquy85L9ETQEPg02qRyVm4EIAF6Q
 +NmUSw3Sw=

=E2=80=A6
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -490,7 +490,7 @@ static void vas_mmap_close(struct vm_area_struct *vm=
a)
>  	 * address. So it has to be the same VMA that is getting freed.
>  	 */
>  	if (WARN_ON(txwin->task_ref.vma !=3D vma)) {
> -		pr_err("Invalid paste address mmaping\n");
> +		pr_err("Invalid paste address mmapping\n");

                                              mapping?


>  		return;
>  	}


Regards,
Markus
