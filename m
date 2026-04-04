Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F824DD15
	for <kernel-janitors@vger.kernel.org>; Sat,  4 Apr 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775320185; cv=none; b=MzYmuDUepwh7O9ed3IW43QTadsxESkJ3UR1E6pA6jcvNonih49hTTx+UQbpUNm5N6bLrB7le/A64an7uXqEVjUAx1pO6jnrO/odAuBbMAtAQXWshSwW6ttRcn/1j8UqdEh+Ny1bfaBkOe4l/6m2d4fInjw6CYlB1wgsE3bmB3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775320185; c=relaxed/simple;
	bh=EzKA5qD9jp3Q+Mdek4D0cNc0RXoTNw57IgVpH5BL1+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PYL3IAlD2QS74AXi+rBPM4+eupvy3ew+GbNMnS0E6tQpRjNA33KAryh1Tk+TPtONmAXAcEdNSb0MwGdozS8dUf0JJ3ZYLO+JbMo3K8j7dNPPfU6SdcVVP66RxtSv+LO8QJnTpWvjDuLZmy522wvZt/OAa+OQr4ThaG01NLfCEnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0xNBpPB; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0xNBpPB"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a535e7c00so26625947b3.3
        for <kernel-janitors@vger.kernel.org>; Sat, 04 Apr 2026 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775320183; x=1775924983; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj9reR5y8AuS7E49fkAglr5pGm0dlgNqh+b8neQU3o8=;
        b=b0xNBpPBMVlC8OdomORq+2HClSGUu268EOi3/vVpKefSf4hKkOqvl1kV1wUnRjC3Ft
         fFQ5zIOsLfDFh4Hbyc0XskIGzMUVdKq2uI3dQ6QRE4RIYp4kml/MugmdvsPcinQqyTZt
         6F0xeJQDCOdv1ng8YyYum4fUEy2QzIGP39jYzA0rHS6OQre7jD2qznPCurkKIITWWKxU
         c7utdvzf3ZHPSshxZVG5flHGFJwkQYFiv3S50Ubk1/Oc8SVO2bDGo0geC7AmM/KVGGMt
         gClqfyf06QuniztKxCEt9DB1YMpH1ZZOXOs15CbNT/00RaLAHGni0c9jRlHLpqoZ4HqL
         /UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775320183; x=1775924983;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nj9reR5y8AuS7E49fkAglr5pGm0dlgNqh+b8neQU3o8=;
        b=lg0zEbcl1JEac+g0f5xazyRxnCTCsmq4tiswsxik4aCq3e0/PZorZh5ERemG4qZSoL
         4RmImKd16zBOnJjuJ5JfweBTLTbrNo+3H/zydrejSPlqL2cZa+UekUpv82YvC3XJk2b9
         HD384LxlDgil/C4s0B2clFsyzzqvwUEHXJtHOsxaiVegIZkVksLhpQ8JPZjNSa/NXMVM
         UMfbW+OR41r9GgpW/qdNkCiAmV2PrSrhsVJlC+9Rh2WavNzJI+Xr0bIaJhj7iFouMsO3
         cQTrPwFttYMvB1hgHTB55is7juWFjL22dBXgvjkzz/3jawMt8IJcX3u93aq5QFQm/oJG
         igBw==
X-Forwarded-Encrypted: i=1; AJvYcCWHLN03HlFK7ZCADspWmbycaJdI/GzXJrF4TWVmzPOmo6Cz4YVVs/fkGcRd647HzPGLGhhSZqcbcNkxX502EOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnu+GPWaHn1K+MehIORUiFFSsvlDVXgB+wuui+DHRIsf/WzPF
	SGp8sVreS6VaoWauFhAtpnVU4i7AiCkzsAiZfOYwdN2bNAb65mtG+I/J
X-Gm-Gg: AeBDiet4yv9QripyLi8OONpyVvnGg8fKOT3olgbu4BT17uE+hJqvqwjPYyuKPpK3wiy
	VIIT6PjHasMheEHWUT+YxxggqJuI4eYaoe9bck3BCfAWLiKneLwT0Rgg0nvisWDQr6tWeLsn4tr
	Vwus+aHPT784jCFbZ2KY38w46wcJk21+/MH/yxs5EXYJTJMJK0LZC70eMesf/BvjRkFCtviGng9
	WFpq22lIo0rkUIgnNs7kli2ZCFKJ100K3midxwIv7pk/JiRfuC5dywiVx1/PXyThuonkVL4PA2u
	3Ge+zjSamB111P92aXjlz6NMh1rPQENAcFbqA6buVGQOjwauP1tCNoV1lxHp+lEm/WZv35H+xLl
	PGkvpnb8tNy/cuSrRUDH5iCJCCZxHxLd6DOYaljLl+mjwSmI/wZkIxQP4FoGR6ojxwmPEcEI8sx
	BIe6FptJ5jBxiobUyaVppSFzZwRClcXL1ZiZ9frg3Kp57Bh4IiVEZ+yV3yLaBy53OPIMX5i6WaU
	XX3wxvw+hXrgdbXwbCd37cJz4jtX8Q0AnpD/8Q2NHRd2rJOjJEhb7raRLUZ1yETD2GYApUJbjt7
	CQ==
X-Received: by 2002:a05:690c:6989:b0:79a:bc1e:a399 with SMTP id 00721157ae682-7a4d84c5acfmr69027537b3.35.1775320183087;
        Sat, 04 Apr 2026 09:29:43 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:70c6:b5f8:68a7:2f7f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df17c1sm34104167b3.37.2026.04.04.09.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 11:29:42 -0500
Message-Id: <DHKIHCMOORTC.SSZLY4MXWBH5@gmail.com>
Cc: "Dan Carpenter" <error27@gmail.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>, <kernel-janitors@vger.kernel.org>
Subject: Re: Status of kernel-janitors?
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Julia Lawall"
 <julia.lawall@inria.fr>
X-Mailer: aerc 0.21.0
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
 <acrhsqvXp4R-egW4@stanley.mountain> <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
 <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>
 <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>
In-Reply-To: <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>

On Fri Apr 3, 2026 at 4:12 PM CDT, Linus Probert wrote:
> On Fri Apr 3, 2026 at 2:01 AM CEST, Julia Lawall wrote:
>
> [...]
>
>> You can use the get_maintainer.pl script to find out who could be
>> interested.  You could use the following options to avoid getting too ma=
ny
>> people:
>>
>> --nokeywords --nogit --nogit-fallback --norolestats
>
> Thanks. That's the command I've been using.
>
> I submitted it to the listed emails and it got merged. My concern was
> that the patch being written on staging-testing might not merge with
> whatever branch it now got applied to.

Typically linux-next is want you'd want to use here.

Thanks,

ET

>
> I guess it was fine.
>
> Br,
> Linus

