Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B23C8724;
	Fri, 24 Jul 2026 16:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911841; cv=none; b=XSeBKyzKE0tkVPdGA/SJowIlhpRUoDhRt7C8kjMVIFg9Yc34Hx/0rfuKlrb4GDV2pwlm+O41fsbvw+wuXcjkbqCWo+erC49VUINxNdCyoVtw8dG19qFhQt/pddj1YFDrARNtu+D1BFDvzu1UoA1tNKgHBS8Ylb/oLj5Bdpuczco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911841; c=relaxed/simple;
	bh=DMrVp2Ces8bfWyRqN6L3wN9B4VPTJjJloeH7Q/btr2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gck5rmaWi+f+YwKgyebtI1Re1C5DAo4tZ2q5ZtJgaUQej2v8JSuPURCpdr8UZUdzR8GlILIIIpoyaX7MvSObpVIRqCuWVQOAg97DWkl1muOHu74/jlclCuSWilrJyaf44HdWBeqHGtqF49nU7yaB1vnTuuMYzx/meb8eWN3lHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZkvOZ3t1; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZkvOZ3t1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784911834; x=1785516634; i=markus.elfring@web.de;
	bh=DMrVp2Ces8bfWyRqN6L3wN9B4VPTJjJloeH7Q/btr2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZkvOZ3t1OsA9VeHS4QSuYje3EDD5Sw8b20pz8e2tgB8mGZW45bArMwy1E01SQabG
	 CktmT/nQAl5tGtUAO8Qc/9maCLCGbQVKF92n27YkwfOndWcmo/tQRTYAhNzyhKlaK
	 gwAqC+UcDhCxy+oxHHI6ZpwR6LI8Z2Tu4iiTF3y3anTAEAI+yDL9I1kUGmkZzvhFd
	 cxUo3puKVW8KDgcW+lTdp4tWDshaaYYg5YdEJ9b7OaSTRCnd7fIcw5qEPKmUmn2DA
	 IRWCQxXbjYGjc5PK/XAt/kqicpFMnVoCOMnH4WpKO9vdZ4XeEMMZc/npVPUDDZHb/
	 uQcpqK0N2Ara+HKxSg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMpCS-1wWs9O3Fo4-00Y1k1; Fri, 24
 Jul 2026 18:50:34 +0200
Message-ID: <dd2eae55-e428-4f81-be08-e11b2d445fc2@web.de>
Date: Fri, 24 Jul 2026 18:50:33 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
 <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
 <CABFDxMFYvuAZSGcPmhAj4H43dwYBG01P2-UQPGa=-M=yRE8YKg@mail.gmail.com>
 <73b974fc-971b-41bd-a039-7566442ccc63@web.de>
 <CABFDxMEsXs+kJ1utqQveP9NNi+dVN-2ReNt3zWvf_TU=xofohw@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CABFDxMEsXs+kJ1utqQveP9NNi+dVN-2ReNt3zWvf_TU=xofohw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:frLsPRDz/2CYPE5AJKxjFAu82q0LByA7UwdFafdEI6+XP/o6IdJ
 vo25dak/AZlgpvSk8a6p3TznuHhUPj0xvc7P1HR8yZSZY5Xqn3FIPzCEwBFxrm3cWnujgmU
 6WHLVup3cfsYNJmKq1D8nmPO4nYXsnIMBiNDb1KYPx8MHVg0hY/slKFzYE9/5ITFSRVxTAR
 ra6AMcfTqX0BeXWpw5pZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N+jfw8b2j5Q=;5IL5OojtjriEebGSVYyPbayCUCU
 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

>> Further metavariables can eventually be shared for an SmPL rule.
>>
>> How do you think about to avoid repeated search efforts by separate SmP=
L rules
>> (for the patch mode)?
>=20
> Are there impressive performance improvements from merging the rules?

I got the impression that representative benchmarking systems are not avai=
lable
for detailed system tests of the Coccinelle software (including coccicheck=
 scripts)
so far.


> If so, could you share an example or numbers?
The evaluation of some SmPL scripts gets occasionally measured.

Regards,
Markus
