Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D33DD84B
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696716; cv=pass; b=Fm9tLhpNDSRTaB1uzYHU3eUTvtw9iphDvvuS+NwWWjM5JX8bDXi80bV0v5+tT3HrOPdcwRT8NEI07tOzyeDpSgrmVnIKEhhq50JiJUZPmJ6fer+BtEkyCABqgKKQwSrpmkD32zuRklh9q+lxYb4eM0GM1Mes+DOfeoSTHBxV3+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696716; c=relaxed/simple;
	bh=JXF/NtNXqIudGUVL9dq1A2Ay+iM5y8zPNP9DPstfm74=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNZmkVDQ7UFksfsfJsbDOvQ76Xv+tw4jE6dJds2IyAAMLo3GO30pNNw81UAyA55TT5B6p2XlduZczftCosAoS4kwK1FfGTdDTPuPoaKsQZJPzMQsKNd7tkYQrW/BNMHE+B/YC4k/3kvmy/z099WUj62cl7el1/PH0FEtIyhl70Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aJ8ThKSD; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aJ8ThKSD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bcd3c190f71so1506306266b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 01:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779696703; cv=none;
        d=google.com; s=arc-20240605;
        b=XsKv35+VvGBZfgRonC/66HLLIObRhogcB45sJ4iAjseNaM6hY73g9nWigbfFjsN45m
         3KDbPH9Z0aJHmRk9UNPVB7ZncTr7XM7ftLhYQ45sXitpTTFCap52J/0BQZD0Tpl/IIUf
         i88xMyDJF2enQyjHk9NnwK6BiE9ErlfPizvy9EdZvw2zahkNmTN0UCc0enxEz6HqL6BU
         b4rCidqeFla+ObV5Z2267x+GB0uPyok6s5y7uls5D0Eaf+gljEDCipAh0tFmvjp/51DF
         SActo+onFtea+wViW77IKisOSSBW/jHvnE4zXxhuLxGHCt61tMMfhFYKrAxvMc+Kg/ON
         7byA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=YYL5Rx1E2cwUzAfwlvFTjehRWwkmIxgXyzUFXFIYTfY=;
        fh=FL7aMmcjwfeCNT51nytb7ErX0J5U5nPcSu+Nzw78BMs=;
        b=PrBERx8ronJMGQkNxt04sbx02Ykn6XuP6S+rEMXWhHLc9oPOrw8YkC8rmNu4KH9GbS
         ryiuZ2/GnI88WE3Qh/u8vxJMhJxOBfY8bBwIR7790UgbqhAWEpjpKmCP9PqfUD/givK/
         3USzmmRhKphvwk29eDUfL4emGvh1mCvH6gEOuGSrIm4I3rbGdjdUHan2CrAAeLbHsbXj
         UVtgPGa6czqrydb2IGzOv4GkX45hHNw75RgPLW8ecB0+oANIztX4XTng7qoiQPoAlNuN
         P733fidpXUBCTbpbge0bVNXQOos7Or7cyvlINYLwu7Hu+DsGSmSJp8HWFcwLYvpRTy55
         a/VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779696703; x=1780301503; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYL5Rx1E2cwUzAfwlvFTjehRWwkmIxgXyzUFXFIYTfY=;
        b=aJ8ThKSDlfJDz4gQUZghcL/iWl/OfP/QqDTU4I+/Sqzb+bDa8ZdDGEJapKXDdqg0Bc
         BEppSpnxtSPiPPg0KHXqppOY+4JHwQzVYoIx54wIW/dciCn9L9Nkiap4CwnYSOE65VsO
         pwswsUxfvRl6RwuYCfMKVhHW8IQF58NkVGEElXBYshMXJpSrHXg15yl0T3IHtYgPcgwv
         yKP7tkHRZpgWYRPuSTZDd29xlUOmAHhQjvzVQN0L0DVS1H/OahpmXhoFNkF0VibQ5/SJ
         RicQzksyM1hEoQDMrRMBgvlBUVKvDkkfOc019skQe0p+/5ciSCzdPFo1AKrB/LI7BMGM
         zMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696703; x=1780301503;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YYL5Rx1E2cwUzAfwlvFTjehRWwkmIxgXyzUFXFIYTfY=;
        b=StV/jJJVmicCUQpKshM6Xab+4RcjTX2wR1289WLOPTqqB0FIFg+cNcQa/JIW7WB+VX
         g+ZorC8xeEVMwXyYgEB78796flLRTBAF679VTkme6IyQYFnwPpSIeedWp+RlavB8GMmo
         GCK3vlHRjTiwCiHrAi2TiAKJZEvGhfERRilWSBiYM7UXaieCWEFKpdOG05e4VVsxpTsy
         aKL0seIDAAYDdCotX5bpeOIhCiz+nE1iJG2Nvd/bK3Mti3Q7wtEmRDHIaYsuf32Av1j5
         UdPNEHlQwuocyxZ4iW1BcJadbVlIJSD3pcdDn9PjpozFbaPTTGJPWZqyur8Nb16vJR9h
         FrHw==
X-Forwarded-Encrypted: i=1; AFNElJ/bmKSNn9EoVPynxBsr0eY8Mxee8/fDzFk9uGC3eASv8pYPTQcLAZ0wkMzkTYXkLfAm5/yu8FxSXPIbWKfid70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQPzmUq5ODQkeUVO8+jj6qJjhgmppLvfkt/kL4ZVPUf/3wRX+D
	lq6r7VkGgmHplfkaeuOvF6VcOz9SRc6cChEfeXB8B/eGzVP/1ArGNUhXaUSUnHE3utPvIqC+WsT
	PP7mrs7goPFmtYtFRAB/tk77ESE01GEXa8RQ8kvejSQ==
X-Gm-Gg: Acq92OHepJGcQzAuhL3dhghkVDNeoY1psZu23vNSLn3g2DrH21uv1LRZ9W3yta+XETz
	dct3xP2hJtfxAnDEizYyNc368CrmiJTtbGvxAH1m+hZYXld0iye4pFBqBgS2xHCFKZBpLrGsOvH
	nAKeRlvsJHy+qoU8OXh1bb/btwFTT4jcyOX/THn23e/gOiboEwHbpVU5PVjV3W8UUvP8dNrnpvv
	lkd0Rt9LsL4SeEJvBxV4Z63RIBNTnfrbkJ85KXriNEduCwGd/SX2cJiQdmfUOAGIugIamf56rSa
	4XJH9iYzZg0bk3d7fxTZ/TOS2QAzaa3oaxKD
X-Received: by 2002:a17:906:4785:b0:bcb:a95d:f745 with SMTP id
 a640c23a62f3a-bdd2503c042mr769683166b.16.1779696703345; Mon, 25 May 2026
 01:11:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 May 2026 01:11:42 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 May 2026 01:11:42 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
References: <ahP3IjYJ87bNc1De@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ahP3IjYJ87bNc1De@stanley.mountain>
Date: Mon, 25 May 2026 01:11:42 -0700
X-Gm-Features: AVHnY4L9gYruU_LyRfiNWVRq8svGeh4BM0woEevKh5vvYGIpbUKlfHo9jW6e9Ys
Message-ID: <CALSJ-wCcZ9XNTrcvq1TabT--vA5v0gritbpfNG6n0aKRXuSiKA@mail.gmail.com>
Subject: Re: [PATCH] iio: dac: ad3552r-hs: fix uninitialized data ni ad3552r_hs_write_data_source()
To: Dan Carpenter <error27@gmail.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, May 25, 2026 at 10:15:46AM +0300, Dan Carpenter wrote:
> If the *ppos value is non-zero then the simple_write_to_buffer() function
> won't initialized the start of the buf[] buffer.  Non-zero values for
> *ppos won't work here generally, so just test for them and return -EINVAL
> at the start of the function.
>
> Fixes: b1c5d68ea66e ("iio: dac: ad3552r-hs: add support for internal ramp")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iio/dac/ad3552r-hs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
> index a9578afa7015..6bc64f53bce9 100644
> --- a/drivers/iio/dac/ad3552r-hs.c
> +++ b/drivers/iio/dac/ad3552r-hs.c
> @@ -549,7 +549,7 @@ static ssize_t ad3552r_hs_write_data_source(struct file *f,
>
>  	guard(mutex)(&st->lock);
>
> -	if (count >= sizeof(buf))
> +	if (*ppos != 0 || count >= sizeof(buf))
>  		return -ENOSPC;
>
>  	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
> --

thanks for the fix,

Reviewed-by: Angelo Dureghello <adureghello@baylibre.com>

it looks like this may fix an additional overflow in case ppos is near the
end of buf[].
But i am actually missing the use case when ppos is non zero, can this
happen from shell "echo" ? Or some fseek/dd is needed to trigger it ?

Thanks,
regards,
angelo



> 2.53.0
>
