Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB882E6D22
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Jul 2025 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995011; cv=none; b=uckB+oH5Zn8QbYf7tch8jSGNApRr5+s3uFQJKhBfLj708bW5DgqGapHa3UjxyC3SEpt5cJQqQRoFRUb5E1deOaS0qRQtIuyz8XDNZ9rnPI6+2J6A9mXiKfeV/II5ORNpafGXhlqXontu/DrwXqiXHkPZWwRMu/O5uuO3QYzizi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995011; c=relaxed/simple;
	bh=RT4CQCtYmBJoslVEhDrjrl/fj+/sUXD7RCrZ4P/cGTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNmKB2TfTGRoyLWaMzp2SKd47VRe7CWgXzb+nul3CZ6wsZ2hPOW45bqmXCspdifm7ODVHeUH8rbAUJ4od3OmgF3psAz/NR/i33EwTpt1/FEFTx+322PiWGQZBs737XYgv8mxa3nm5YzvkxeRLi49+CaXSpXFmzD/m/f6I98Vlnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=r/yDgKGT; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="r/yDgKGT"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a4c557d47so2309315a34.3
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Jul 2025 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1751995009; x=1752599809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+8r9BFJWIuHw4v0fMNwjGf8h2YGSArWLMNGT0WpB2A=;
        b=r/yDgKGT16DTnev6LXck5+6afR7zvMUCZm3XhgANLVwOEbk8wGfs0lrPV69vWZg+cD
         WLoTVMWYGrx/RISd37ZlEVUWI/pbAg8ZrpxjGfga8GWD6XjL3cqLuxMcwr4L5BlvUQ+P
         Ecu/eP+9F+2mUOakpCBsrrphNzJIVDM4LeMx3qbCTgeEQfZ1u5LFSID8OgeZdp79gU6q
         aJaa8440hHLF3czdmHKmyx31MkOYIvt+mM79muRZKeOIfLwoo+RP4MfGOQpUoX85YaCg
         3yW9km4mCFcZUP8gEJKcZexnxyUVDW9wohUsNK9tlL6QOsKYWg6AwzPyexFuWIyeT7cf
         T7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995009; x=1752599809;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+8r9BFJWIuHw4v0fMNwjGf8h2YGSArWLMNGT0WpB2A=;
        b=WtkFxbQoaKUvG9aAXpgRyB68MQ5JB3uLyKzvwluMFMDZvZqcJcadPBKMxi/njF5e6I
         nRUX4HKPgDkRuQXhGoEdoZoYKTHrrsJqRUGXAfIMGF4Kxvu5gv9froQh5mvCe4WMcGaz
         SAp4vz2A73lhYLy1S7eQp/x0eU9oRZliNBieBzz0iiWiSyk1MNl4tun9luN6MdiTjnKs
         a4c7XuZfMdPUbjHmudrNle8kUrCIo0i/OJCsvnyEJldx6C9+r7g/4a14+LPCygHycxxA
         EUck1julg+1rEUT6jTHG4cdptnjMe8EJxJlJ4y3qrGFdTGHuvxY3v9rZY1oS+6ranWV/
         OaPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9mrEOl63b3Ksv6JW80QZV63vpcrZ6j0tTmGUWmo7BYtBuoK+6m5MDarFFZEz4Ur2Y7mQqsPIXgWG+nrlgi9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfvw/XRpzkY3zzCij6wXgTBPjmC5BLG5a32XKDFb9sXHoULYv2
	2eD/RH/q9GU6PuirDNUakp7FbmFN7h3S8GTdoJh9LYYLwj3SEt7cps4uYVZf7Vj46Wg=
X-Gm-Gg: ASbGncufc1y3ytiLEe55PhjiMy5VINeE6WroDwl+y4zNF+8NS4P0ZWeLcb2f/7WypEX
	+L49amDGkSiyZm16VQJWeHR+/GtXY+MxC49Au3qhb6PuBF/xs3Og1oV6ByEzaH1kpMIZtLbqJiE
	/FT1EESinY7BeXKhgY674X7iBEfm+crknum6duPXjymEoV96TnOgOeengxfk5iJ2tMeiEK8VjqJ
	Gp9M9y1PTRpuCIwpwCjBs10xBfwE0YHcWOmpp6pGKmWzou0S3eKZoVXQ4nLoK2kYYG0nzgxshuo
	gmsZJ8Et2Zcr6rk7LtNf6B4288uPdjulMoxVBjdPlZhHa9ESsnXweMG+uaHtyHG2HQ==
X-Google-Smtp-Source: AGHT+IGwzlWScb+PX06qplAqKrbQpL/HWUvLZSqvV8qVhQiQVG8BwS2EAlkGyL9WN55pk7m69XQJeA==
X-Received: by 2002:a9d:578d:0:b0:73b:1efa:5f40 with SMTP id 46e09a7af769-73ce3841a5cmr481695a34.10.1751995009227;
        Tue, 08 Jul 2025 10:16:49 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ec53:8290:86a1:aa7c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73c9f7352b1sm2058138a34.6.2025.07.08.10.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:16:48 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:16:44 -0500
From: Corey Minyard <corey@minyard.net>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: openipmi-developer@lists.sourceforge.net,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] char: ipmi: remove redundant variable 'type' and
 check
Message-ID: <aG1SfFoqU2pB2_wo@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250708151805.1893858-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708151805.1893858-1-colin.i.king@gmail.com>

On Tue, Jul 08, 2025 at 04:18:05PM +0100, Colin Ian King wrote:
> The variable 'type' is assigned the value SI_INVALID which is zero
> and later checks of 'type' is non-zero (which is always false). The
> variable is not referenced anywhere else, so it is redundant and
> so is the check, so remove these.

Leftover stuff from previous changes.  It's in my queue, thank you.

-corey

> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_si_intf.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index bb42dfe1c6a8..8b5524069c15 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2108,7 +2108,6 @@ static bool __init ipmi_smi_info_same(struct smi_info *e1, struct smi_info *e2)
>  static int __init init_ipmi_si(void)
>  {
>  	struct smi_info *e, *e2;
> -	enum ipmi_addr_src type = SI_INVALID;
>  
>  	if (initialized)
>  		return 0;
> @@ -2190,9 +2189,6 @@ static int __init init_ipmi_si(void)
>  	initialized = true;
>  	mutex_unlock(&smi_infos_lock);
>  
> -	if (type)
> -		return 0;
> -
>  	mutex_lock(&smi_infos_lock);
>  	if (unload_when_empty && list_empty(&smi_infos)) {
>  		mutex_unlock(&smi_infos_lock);
> -- 
> 2.50.0
> 
