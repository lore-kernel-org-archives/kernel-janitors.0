Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2443CEC1;
	Mon, 17 Aug 2026 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985178; cv=none; b=INuPY7bNDkKhI4kLLsUtR9YjJQACzBUMJvL9JJWNInm/G6CmYS2lWCq/T+hGBOnRqUG9mFdcCnPwWrF1HUSfJ8gpr+I6xZZduRULqXVqw1a/1FD1qOb/N9v1cRelqC0mObcBMn3loYzIQdHSZ2I95+Mc/Q2LwUqNnKpekIx6zow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985178; c=relaxed/simple;
	bh=vAYKvzg4S3bfPdJdZLs5UeigyS3IQBoWP0fYaEBOF1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=he8pqpdG4OniHNpA6D3sZwiPnskJPUpSqOOb3kCKPUOqd6z/L491PXVTiOyw+UvKo6YMSkRcpZ1m6TOp28Yl6Ag0ZeOB/ArVMMLtvmGq3WZJ03gxfgc6bKytPVkvOTrzE/NrkFNAy2P/kkMI2QrjfgsW51mjBd18xubKjg23Bgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bEeXWx3D; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bEeXWx3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786985168; x=1787589968; i=markus.elfring@web.de;
	bh=i+0shAmddluGlkdasno03D0BaOQp7GVSQ2XsXCsT0eo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bEeXWx3DBAdLXwfPYSfU5ZGfuKgwqmd6o1WQCrcLSzXqlv9kwFRxjYAbiZwgyCFU
	 gggQ1CeVSyCjOv4GcmCDJh33B6gigzsLf6R8IQ33TiO7agLjhvmExX/Dx4ljdA7vV
	 uOg9z4SdYwXD9LIr8NcAVSclDJiSHfc/gxagf+Q0rjTXC1u/I7o7sPGGHOAPx7ezL
	 tE1ij182+cliA8WNIMBwg9nf4VQfdaBIzkY7j8RyBjVI+CySLj2hDw5GXaCBi0BXP
	 vGWJgmWPO0pq3LsHDaMx35BflnGdPPkEZwIYJBBITpWEXX1aVsWFEwqlpQCwYDQBn
	 6ZM3LzVrvCNKGcnwog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSFY-1xRNSM32EY-00UiRp; Mon, 17
 Aug 2026 18:40:36 +0200
Message-ID: <d593bdeb-e6f8-44d2-a444-e9197a8ed1a3@web.de>
Date: Mon, 17 Aug 2026 18:40:34 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/rocket: Check allocations before use
To: Triet Hoang <triet.hoang.dev@gmail.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Igor Paunovic <royalnet026@gmail.com>
References: <20260817093009.22359-1-royalnet026@gmail.com>
 <20260817140110.148873-1-89897892+HMTCT@users.noreply.github.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260817140110.148873-1-89897892+HMTCT@users.noreply.github.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:38HBkCXeJPF8UZaJYbpbZzq5mx3vaFZ2h8q8XBv/C4uNdIWjv0g
 W+6VhQdiNJlxRwXqrRuPUv+DoQKWejqy5UnVIc+wy6pT8b+luMy0t7IDp0McK6y4HBx9/cw
 VVk7DNonLNlR08Nua8gscPcyHrsnQmYNLvdP6vT2hWY7i/QUkjrt5rCkvwKN7THlUsKY+HM
 2eOyE8fbon1wUbsB/Zo1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nVeSdFix+oQ=;oB4NR2hTthp3vN7XYHedpsfZI83
 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
 Pnbumfg==

=E2=80=A6
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -192,6 +192,9 @@ static int rocket_job_push(struct rocket_job *job)
> =20
>  	bos =3D kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(vo=
id *),
>  			     GFP_KERNEL);
=E2=80=A6

I see opportunities for corresponding collateral evolution.
How do you think about to apply the attribute =E2=80=9C__free(kvfree)=E2=
=80=9D also in such
a function implementation by another update step?
https://elixir.bootlin.com/linux/v7.2-rc7/source/include/linux/slab.h#L142=
0

Regards,
Markus
