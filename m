Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B7230D18;
	Tue, 14 Jan 2025 03:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736826318; cv=none; b=HPzJyFBAP70LXxvOMesZlqpkocM1ZZWBr4IP92y0mU9hF1JYi66j+FaVHUNBr43VNnDpI1qEIVVxORxWOSnR4xjgvXtVxUZGZActb48T/S4mrrMHQqI263pWeA5tVw1P1HEP+k7DqqzJEbYYpsp52HrMXLjHo5g7GXnd0GjjoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736826318; c=relaxed/simple;
	bh=iakEcEVzsY1KI6fYd3RRSjeAAq+EvgAh/li5kBJRgRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmRvWWGqDwEbaHSZKcgBOSccyGUa4mVvvs/fcAQsg6nbciXcLCNXDJp9xH5TFIBz1LS477Y8gf6H52gMAgLbK/UEMNcsE67kNEEo0vCf4X8ISCpySWA90tX7eXm7nuZZYyWubuX9XHoHMUVMbFnm+z4pesU0DGHVUy383YOQWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Q1G9lqCn; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Q1G9lqCn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HEFDJLqQ1GkQBkH2UkbyfuYOoNe1v5gsOz4ep+YnusE=; b=Q1G9lqCn0IlqmCnA2cKlZm3rLs
	7/v23FqVXw2CqPFEDnGtUYZgOMO3awIV3eX2+mhufvQJvnBCfpyhfuc4zwnuVEto02WK0H8hENVLt
	ZR/N46e8e+GFHcAXe5E9FJmzOvZxHzYZvWxUbjom7cO1v27MglXIyoQ6bU4lAXnTcV0p1A7lMIZFK
	fkR7NZ8nLnQuSIFTWwv2ylxd9sFVnZpgcdaxmW80pboBaLbYLdQLZQUtx61pEkOCgB7GQWEq9qtzh
	M9pgie+t8ljdH9X8HpwgfXzjKQxxS02zvZ45I4T+f5zntuZe0utzxGzheRLwRj30wsOCMzssAVpoD
	Q2zULo9g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tXXeY-008xc9-1V;
	Tue, 14 Jan 2025 11:45:04 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 14 Jan 2025 11:45:03 +0800
Date: Tue, 14 Jan 2025 11:45:03 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Cc: haren@us.ibm.com, ddstreet@ieee.org, Markus.Elfring@web.de,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, anupnewsmail@gmail.com
Subject: Re: [PATCH V3] lib: 842: Improve error handling in sw842_compress()
Message-ID: <Z4Xdvxsnezp-tLUn@gondor.apana.org.au>
References: <20250104184951.3481-1-tanyaagarwal25699@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104184951.3481-1-tanyaagarwal25699@gmail.com>

On Sun, Jan 05, 2025 at 12:19:54AM +0530, Tanya Agarwal wrote:
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> The static code analysis tool "Coverity Scan" pointed the following
> implementation details out for further development considerations:
> CID 1309755: Unused value
> In sw842_compress: A value assigned to a variable is never used. (CWE-563)
> returned_value: Assigning value from add_repeat_template(p, repeat_count)
> to ret here, but that stored value is overwritten before it can be used.
> 
> Conclusion:
> Add error handling for the return value from an add_repeat_template()
> call.
> 
> Fixes: 2da572c959dd ("lib: add software 842 compression/decompression")
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> ---
> V3: update title and reorganize commit description
> V2: add Fixes tag and reword commit description
> 
> Coverity Link:
> https://scan5.scan.coverity.com/#/project-view/63683/10063?selectedIssue=1309755
> 
>  lib/842/842_compress.c | 2 ++
>  1 file changed, 2 insertions(+)

Please resend via linux-crypto@vger.kernel.org.  The MAINTAINERS
entry should be updated to include the mailing list.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
