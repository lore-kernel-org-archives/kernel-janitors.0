Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720226;
	b=alWW36uj2hk/I2UK90IcYoPNroVKY4eVTzekUAu5klMzR7orj6olZAcwZeOEw3YjCExS
	 JBUBnNQfo6rXlsJD+K9sBkdPE5S9jrqwcmfgbt4PEy3mQHA4jI3ffcnNnkyBYxQc76tp6
	 aWnp/rKxa0kCcpIeifGwItw/c2W6z+92Go/0MI/6I64Ytf7/e6rR6VJhX747qddqZpTAJ
	 XVzyuHo6Pl3v5+y6Dxcu1QpsNv2gCHE6GxFhyWDjbBIZC2WlqHB/o6aTxpG6OUjPnujjV
	 OLqc1DD54ZSiBXuAPstjkQtA21SWsqg+te7YVUCkQRhJtiuAAF9HW6j+kXzNPJVW82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720226;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x/wJ3DGTD4aXi5Mbef/zMqUC6tC0zT5pgWi9hfdwqBo=;
	b=XY8m3NfjyP0ps9Qy3LQ58NiTTwv7kBXNFJ19EKTJhk/7GvlEwDztiRbjQ6thsz58yenG
	 HTEcdAOwLn/wfUlGeRLGZBev6hriM0W/AvXTSP/envZ6AycXYZp7hxduz8G0DTXCRq1d9
	 Wiq9FF5u7Zxcpr8PmPA3yMHuH7vPwCBJWLXBgSeLFFBYj5ThObkueWOc9eRi870dKIT3v
	 3X4qiWUSm2ebB2D58GQB4d8seQ3TpaOhiiUHIcgYIJcOxKE+T4XBoKle+phSSKJ8QErPq
	 B5NwAvN7MXZrPvL6sHFh30EGt1h8Nc1ZwdhPkTuLLyQ8KfxafraFQIBOTxBEppUP0HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwHjcn84;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAE606A324;
	Tue,  3 Nov 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwHjcn84
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568101F000C1;
	Tue,  3 Nov 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720225;
	bh=x/wJ3DGTD4aXi5Mbef/zMqUC6tC0zT5pgWi9hfdwqBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwHjcn84RS/VnBrF7xVdgMFmbL6710fBbcek1OEjy3HGkO919GSPcuNjeO8MS28na
	 UcQ5AXYwXMR0Qh1DphgOg+qxLHcs7KG7IreeCGwJRI2/SMVplYJ+/XRPFeRCeNSTYP
	 4Baz2B+xYcosKiMGOx1ql58uVvHum6MAUNu4pJ8Jx+UEkrQq7VMX7kO35n1jQe0BDB
	 l5eXVsVKs4q0+96BD/E0kOxCf/zcMRjr1xxerle/4DgYRldZjFKvIG4aJaZNoluRx3
	 EUBXbLc/87HuAirUcCNTEOvsG9nebdrn7ZIp2pKW+umP9ueoVN9JQEXL08G+GpK83N
	 o0LdC9KG7qZvQ==
Date: Tue, 3 Nov 2026 08:37:04 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvmet: pci-epf: Constify struct pci_epf_ops
Message-ID: <aun_n7DKm3Xc86hN@kbusch-mbp>
References: <3e4d3ffc4e3ec822759782afbaac1279c4a83135.1793482573.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e4d3ffc4e3ec822759782afbaac1279c4a83135.1793482573.git.christophe.jaillet@wanadoo.fr>

On Sat, Oct 31, 2026 at 10:36:43PM +0100, Christophe JAILLET wrote:
> 'struct pci_epf_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   90026	  19680	    768	 110474	  1af8a	drivers/nvme/target/pci-epf.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   90090	  19616	    768	 110474	  1af8a	drivers/nvme/target/pci-epf.o

Thanks, applied to nvme-7.4.
