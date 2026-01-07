Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098513019D6;
	Wed,  7 Jan 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780319; cv=none; b=Jawpyu7reOOmBeUtJPI+xGiQqMqkjMqelm+Kd+RP+qSrGrWtzj8mYVW5fxD4cZNs6LNJv46ShinuKNAV6/r+8eV3Hdsb5WWijP9KWsS/uaIADLEXkxUxYHe1HTZoilXx+k1DmEVWdyaldZshCIZVdBJRbFH1egJUB7cQkn9Ew/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780319; c=relaxed/simple;
	bh=6b0Ia4FBMtdG/AVptJiOoygDqWfM74AUH10sV2SFuBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVjiaAarIhluedXqCDILqNadj0muor5gY7IAC59wd86iZ7Mpj2xVOYKHnGCrHl0Op2OGSns9bWXSuJqj2wTf/O2vyOv9cF9ufFYbynUqy10+5La4QRO167mBpzu/npt0fWHOpTzrCqORrxUVRUDRUpUpSB1GSb2W22sJ6uW0j7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdYAnRH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdYAnRH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09118C4CEF7;
	Wed,  7 Jan 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767780318;
	bh=6b0Ia4FBMtdG/AVptJiOoygDqWfM74AUH10sV2SFuBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdYAnRH85O6gLzZy0zTYi4YShlSfdLMpLTdb46LuuNIU5TtN/SRGIccbCW+Ua6B44
	 QPVCE9xS2DyUniq/VxcP0bA5RvJTafU/iIoFzPk68pxPpZkVVYD7VKVFjKLJnLwZ01
	 AhW2b7IP0F7xiCs0OsoOXLdNp55g1u68WNf7QDnTuf9+5T7ThLBZB6MMKkFG+SaUyG
	 8s1sPI5lWGc4jrhkfHBPeBWkI8acQXbY4J4L5TyKeMu5hawjtT7QOWEyQJPnMqGGtt
	 nW7G8XzNQoSMIA7Jmr5NCO2lyuXBsCKxkeOJBEW135kliJD69SG3y8CSDQCLIZxAOl
	 Vg88HMlZeMzAQ==
Date: Wed, 7 Jan 2026 12:05:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Alexander Graf <graf@amazon.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in MEMBLOCK AND MEMORY
 MANAGEMENT INITIALIZATION
Message-ID: <aV4v18hvu1OublI_@kernel.org>
References: <20260107090438.22901-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107090438.22901-1-lukas.bulwahn@redhat.com>

On Wed, Jan 07, 2026 at 10:04:38AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit e8d87911a204 ("kho/abi: add memblock ABI header") removes the files

The commit sha will change because it's on an unstable branch

> in Documentation/core-api/kho/bindings/memblock/ and adds the corresponding
> content in include/linux/kho/abi/memblock.h, but misses to adjust the file
> entry in the MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION section of the
> MAINTAINERS file.
> 
> Adjust the file entry in accordance with the changes of the commit above.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b28650893f2b..1ec85c68dd4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,7 +16454,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
>  F:	Documentation/core-api/boot-time-mm.rst
> -F:	Documentation/core-api/kho/bindings/memblock/*
> +F:	include/linux/kho/abi/memblock.h
>  F:	include/linux/memblock.h
>  F:	mm/bootmem_info.c
>  F:	mm/memblock.c
> -- 
> 2.52.0
> 

-- 
Sincerely yours,
Mike.
