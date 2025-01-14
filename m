Received: from sxb1plsmtpa01-12.prod.sxb1.secureserver.net (sxb1plsmtpa01-12.prod.sxb1.secureserver.net [188.121.53.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D320E005
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736889255; cv=none; b=GRZPd8xnEnGAuCYYRrolQvHXqDxTZywMNoN3ZiTUJenc3N+w45PAw0kI+ZVY33w7rA3KkdHC9M5ZwzszvVUJ0Bm3Na1MBn0PF3EUhiBKyJGJR2YGQA4fsXDTqjEslcJhRjyCHkkBqpBnC5rW2WQ7BDSJBkJj6AL2LEVU9BXn1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736889255; c=relaxed/simple;
	bh=gAzQgdwxvmLjjJKc6AQmzRosNOPZA5/hTTHgmMR0yJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZVlVF0TZXgEwTTJy+x5NyCIJf9SbCFoWKY80d8JbNE6Y4YBiSc/pQxZpZvr2xkJTUoScHn9ERQy9/f+U/qbUlbruJD49YxQg3qwLKwrwd4Yexbgjg0iRFicYNMRSGxCbpaxdUPph08IozEVtLurhQmHX2zF60cLSj6nqE4y/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id Xo7Lt55fOxZ1ZXo7MtRqcg; Tue, 14 Jan 2025 14:06:32 -0700
X-CMAE-Analysis: v=2.4 cv=S8MjwJsP c=1 sm=1 tr=0 ts=6786d1d8
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=KKAkSRfTAAAA:8 a=FXvPX3liAAAA:8 a=a5sIoMY38lD32Rg_RhwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <d4adbf20-2d14-4a0f-9f2d-5132f87ec493@squashfs.org.uk>
Date: Tue, 14 Jan 2025 21:06:05 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] squashfs: Fix a NULL vs IS_ERR() bug
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <7b7f44d6-9153-4d7c-b65b-2d78febe6c7a@stanley.mountain>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <7b7f44d6-9153-4d7c-b65b-2d78febe6c7a@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMrlhComPLR0KI3Be1MAjuVz2frrrPieBA7E03NCCsYWR9cZUP2jTdbjiKLVKWZBSCH6wy3RGVjWPSAA4xKndWOj7NPDSwOQDSr1PEQ52eRVfFGLcj5R
 6BXtTWCr9HBzSDzxeXuBie4ywfiO9VAghvVANN+F452k3aQRGXGc97zYh9JG6hq0PtN+CaFaY5cgpl+zcu4gOu2v2NPi5UBhR8cWYcPu7KCI18XDpwFX4EeF
 pmZNXlD4raE5tqHs3h4eUFbkNWLKYZ4mR5Ym4pniNHfKcrTmGTzE/UvJ1HyQiEC19JmYtdKz94CrEaPgaN8W9VnhOdu6Lw/KxlFGOw0HgzTVx1+Rh8UBcHz6
 gocTSiEg



On 1/8/25 09:16, Dan Carpenter wrote:
> The __filemap_get_folio() functoin never returns NULL, it returns
> error pointers.  This incorrect check would lead to an Oops on the
> following line when we pass "push_folio" to folio_test_uptodate().
> 
> Fixes: 43c73ba98b2c ("squashfs; convert squashfs_copy_cache() to take a folio")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>

