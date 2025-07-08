Received: from sxb1plsmtpa01-10.prod.sxb1.secureserver.net (sxb1plsmtpa01-10.prod.sxb1.secureserver.net [92.204.81.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C217C21E
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Jul 2025 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.204.81.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752001541; cv=none; b=Pvsmb+YcK9XPm0BFn7idlJ6qS+4bsUU2F548lhgWgnQeHokXSY8R+toMVl0ZUL7FecDBkQhH1rGKEFsvmcpSYn+CuZCUX+LQFT2HhoS0KyhxuRkYNc6AJxouPPIQHOFXY+/eA85HPTOkDJ4WSZroDCu9SCaoDIWuFT6ufU/WdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752001541; c=relaxed/simple;
	bh=yAQ+3eNyKoSsXuMWuDS1zpl1TkhsHSIpKJWm9VfR+Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GaMEbCSxT3jCTvZe+YgLhTtg5VL2XJBwx93ZqB1sjKZ/VXuH4R4FISsyhHu+rX9f2lBwFua60tPPagw8cFAOVqGw8+iyMRLoFlb0X7qW2Nj04lG0tO+OUa9IuqaUsQYOZpjEu34oj2PyITjwPcWqUak0Yc5CEis6kwg+R6Ydo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=92.204.81.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id ZDasuBU9C1qPIZDauuWlgP; Tue, 08 Jul 2025 12:03:09 -0700
X-CMAE-Analysis: v=2.4 cv=WeEMa1hX c=1 sm=1 tr=0 ts=686d6b6d
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=FXvPX3liAAAA:8 a=D4SgTZjGj28YDSeKNS4A:9
 a=QEXdDO2ut3YA:10 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <d19d4a84-00b0-4c39-8b11-b3cda95967e5@squashfs.org.uk>
Date: Tue, 8 Jul 2025 20:02:47 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] squashfs: replace ;; with ; and end of fi
 declaration
To: Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250708114900.1883130-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250708114900.1883130-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCjnCkpuKzHpHY3/IEPSIilfvGECGK8NsCVxOFcWsYJjv1NFFn2cj2PyKSzQGEEqCrFIW/CXv1OLqpiprEPp+jycBHdsa7LW9Bmuzfzvm7XPPe6dKwYC
 fGDm/T3LzKUZlO+ZdQrB4Tld6A/GVF3OLmixBRAMiEPhL3t4vlZpA7JKgLwVkI83nb/BH+XmAYi4vVjcAkWI81d0WbgFcoQ9/asvXlo4as8v0ZR0gPe2KzF6
 1/ppehi5G6XfthwKaXGHcWxTgN+hzrBJ0f+wy60iB/Ls2pyLfVPw30oGMsx+fiZzx35Aw6wFFS2ab0Dh7dxjRkUQHwwyNHCqdwP+D/Prr1U=

On 08/07/2025 12:49, Colin Ian King wrote:
> There is an extraneous ; after a declaration, remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Thanks

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>

>   fs/squashfs/block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
> index 296c5a0fcc40..b3ae3b1cc0e5 100644
> --- a/fs/squashfs/block.c
> +++ b/fs/squashfs/block.c
> @@ -83,7 +83,7 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
>   	struct folio *head_to_cache = NULL, *tail_to_cache = NULL;
>   	struct block_device *bdev = fullbio->bi_bdev;
>   	int start_idx = 0, end_idx = 0;
> -	struct folio_iter fi;;
> +	struct folio_iter fi;
>   	struct bio *bio = NULL;
>   	int idx = 0;
>   	int err = 0;
