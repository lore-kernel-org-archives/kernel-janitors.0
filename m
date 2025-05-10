Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5B2459F7
	for <kernel-janitors@vger.kernel.org>; Sat, 10 May 2025 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746892650; cv=none; b=RnG97fcIRg9Nv0J1fhRSP/j/Nx6IW9O8rCYN5T6WwAqgFt2YP5f+sD2qyBKPUtSYS/KwNbUrm16i82l6oBY93IW0D67rVkxXII7LW36pW6+HRGQfhidXXjmkyIQHDGN3SaS882JdBWqXcEOWLFTfglmP46y3HKyO2omtjvzb7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746892650; c=relaxed/simple;
	bh=FQQK5W34RIBPsjpwJ9YOa2hCzQg34LdKieCcggOppRo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PguJQl1U2W/pjFFcH/8fPXnHyNHe759rX34raqbVsGHAGJjInjjIXIG31GehDVq7Yz+xbqMqQHOC5CauBj9jUpuMcoBXLc8Q0moPLjYlNKUF6bwQMmoZlUCWsGs0pQaTfdWwQwRVmzDkzX7T06WTotaf6m5tTaRoGe4BVLUB2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mgMHKa43; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mgMHKa43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6dB0joes4cRnLvB5pATgEVyfBfySFNvY9ktJVChk7co=;
  b=mgMHKa430bhr/rDj01/42czksi0qCchDWil3fsTzvMZ30zuae7iP88eo
   Sdh1RkRy02g2QNcW3ZLMSjVVVrQnQWg7i0esmwiv35DUX6/VOrgM3RdIL
   tyDqR+OuB/rsBMOBo/VtiatdTexCQEXAUeJSzskh0yAkt1t92cOq95OCr
   Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,278,1739833200"; 
   d="scan'208";a="221410687"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 17:56:17 +0200
Date: Sat, 10 May 2025 17:56:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Viswanath <viswanathiyyappan@gmail.com>
cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Fix grammatical errors in i2c_msg
 documentation
In-Reply-To: <20250510204058.27258-1-viswanathiyyappan@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505101755200.5446@hadrien>
References: <20250510204058.27258-1-viswanathiyyappan@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-981299435-1746892577=:5446"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-981299435-1746892577=:5446
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 11 May 2025, Viswanath wrote:

> Fix the following grammatical errors in i2c_msg documentation:
> 1. Makes only sense in → Makes sense only in
> 2. may have changed those standard protocol behaviors →
>    may alter the standard protocol behavior
>
> Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
> ---
>  include/uapi/linux/i2c.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
> index 92326ebde350..aa751389de07 100644
> --- a/include/uapi/linux/i2c.h
> +++ b/include/uapi/linux/i2c.h
> @@ -24,7 +24,7 @@
>   *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
>   *
>   *   Optional:
> - *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
> + *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
>   *     in kernelspace, because userspace buffers are copied anyway
>   *
>   *   Only if I2C_FUNC_10BIT_ADDR is set:
> @@ -66,7 +66,7 @@
>   * @i2c_msg transaction segment, beginning with a (repeated) START.
>   *
>   * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
> - * passing certain @flags may have changed those standard protocol behaviors.
> + * passing certain @flags may alter the standard protocol behavior.

The meaning seems different.

In any case, changes should go to the maintainer, and not only to this
list.

julia

>   * Those flags are only for use with broken/nonconforming slaves, and with
>   * adapters which are known to support the specific mangling options they need.
>   */
> --
> 2.49.0
>
>
>
--8323329-981299435-1746892577=:5446--
