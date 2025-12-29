Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BE2248B9;
	Mon, 29 Dec 2025 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996395; cv=none; b=S2DpV6RbSWVvnDbqPW+nZQJLgCpyQlXgsxokI4L3OoO3zNNbGdzQAk0qCCh6FUDU8tbFNoP4Pz3x7TowgHQQAY8VcWoN0+BMI9qThQaexFEaZ4tzuZ3JDH8+z9NBte+H64931sQUr96NZZhLq6x5etTSk8gWLCAz2OfNX/nhjrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996395; c=relaxed/simple;
	bh=D6LPhPx5OVM4VCDlCYNJgnzInPSWs7gL5XZvB7Y7/lQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I8FhsHcISjhBcJ0nETZ96cfFcgCXHwJymr/g6qRPNj/QDlC5aTrleKrImiZcvPL4mKZzMKxZhvf9Kb+bHcjGGFYMvkX1HJ+F2GZYCWfpy2AQxitRMOmJne9/el7lNTFpWdnVFrzB8uT4/OLRUnDXJtFPFJb+cCNlX+MA3luNj9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lLB4sm14; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lLB4sm14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1766996379; x=1767601179; i=markus.elfring@web.de;
	bh=j1ThLRQyHIDweVLjfaoObSeSIbqtv2WtMM+/ZLETnkM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lLB4sm14jcy+RafUYX/8f9iZdJPD6oPCWeZ0/izkWFoIIXTzQNHOYgFUPF2Xaxai
	 Sr3ev7Hrk9dgHMEOktdl6UG0KpUpthdJrK1H88GOSlnAPinQBe95npKWWZzRk318v
	 x3snUapF3BhCPy4/OOoIPxqRj2K8pn8ksHkuTnWHChNHJe82+8spX0SsplPAq4mGC
	 bNQqncAbzEOvPpyq3a7t9O/pOo1sr2iYDaInd6zQClPJ08WdpqoI8n3hdOgaoQTEa
	 x5mnWWCr1lt0EFPVsJxZXNAfTck7yxc97+OGfsqqr2nf6GC2l26mE9rjsAVYBR/HI
	 faBsYJXKZGoPjx9YjA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.231]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N5UkQ-1vxvrE3Img-00quKN; Mon, 29
 Dec 2025 09:19:38 +0100
Message-ID: <1d9b46ba-728e-459a-9d82-0f49e2fe08b9@web.de>
Date: Mon, 29 Dec 2025 09:19:19 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianhao Xu <jianhao.xu@seu.edu.cn>, Zilin Guan <zilin@seu.edu.cn>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20251228162636.3829733-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v2] soc: mediatek: svs: Fix memory leak in
 svs_enable_debug_write()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251228162636.3829733-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2R9t5g8+vO1RbE9qB5N19dDxuB5vRmvjLbdSqc8I0XWu0qdCIme
 vARL+ww0knbI2Zn/XhhqaSsjSexRFnrcuT6JFcXdYd654Dxgoj09xzeJc0wi8TzK6RfAtxU
 RWCES5d7SnWYum6UGe+odU2RW5yOgg2cwSEZcGcTcKFj7YUyJTuSVcMLGK35y0YDl8zd3Mv
 O8gbpYcEKJX/q7QYngRPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U94XEdgalC0=;N3iDBY5+lejSgasMT00dIntgiat
 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
 FYwlHtT9IBBWDWE/Bt5/Xbsd/5dTP+cJo9T1sI

=E2=80=A6
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -789,7 +789,7 @@ static ssize_t svs_enable_debug_write(struct file *f=
ilp,
>  	struct svs_bank *svsb =3D file_inode(filp)->i_private;
>  	struct svs_platform *svsp =3D dev_get_drvdata(svsb->dev);
>  	int enabled, ret;
> -	char *buf =3D NULL;
> +	char *buf __free(kfree) =3D NULL;
> =20
>  	if (count >=3D PAGE_SIZE)
>  		return -EINVAL;
=E2=80=A6

You may reduce the scopes for involved local variables,
don't you?


See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc3#n262

Regards,
Markus
