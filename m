Received: from smtp93.iad3a.emailsrvr.com (smtp93.iad3a.emailsrvr.com [173.203.187.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7F12B142
	for <kernel-janitors@vger.kernel.org>; Tue,  6 Feb 2024 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224212; cv=none; b=CtF83PcgEZDAUCLrGy8yq8Z3+UljxKjCw3es/ZIi+bp5gmu3ZSwYbhz1d0Owy5YG9ASZGewxrwBtLnHNOLkh85H4rDB+KGtGhpcTKR/ONpmZ4ZSzjc7Bdri7cOoWHaIswnmxIONNuWW5eTK/A69KbJ1G5MSPz5Jal1dQNOyfeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224212; c=relaxed/simple;
	bh=mCXHlMsrALtmUvBNu+kuM9UWAh6UhPaYeNVpy42lO80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/gLzvRt3bQTA0GzPQZGYtldM/yg/lZ4fktZWveHTZZyq1DlgQP2/RJ0MPkgy0InyBv2An7Bc5Yf10FjS0/TQJrT6lgM0JJIZ7PAyd1HIIe2OY9CLngNQTb31ZzfPshUB3MniPHzexo77NO8M3XvVqaqFFjrUvdAMU5rwwNaTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=O5h5sb4k; arc=none smtp.client-ip=173.203.187.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="O5h5sb4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1707221983;
	bh=mCXHlMsrALtmUvBNu+kuM9UWAh6UhPaYeNVpy42lO80=;
	h=Date:Subject:To:From:From;
	b=O5h5sb4kot0BzOpfh8MMvbiJwPf2rUYy28Pr/uYnHylFZxsyAy3EQP0kwmaup50bF
	 ZB+6zmkcUd1a5H4KbnhVsmv8n0vDBQx67IoZlIXqk1HxSP1JNGovZ+cdVGpK2MuI4b
	 IIeYBHJdbWQhxJ2nLGQIlaRluO1TP6s2EMnvQyBA=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp28.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 625823885;
	Tue,  6 Feb 2024 07:19:42 -0500 (EST)
Message-ID: <f61a1401-bc7f-4b8c-90d3-8327b9692422@mev.co.uk>
Date: Tue, 6 Feb 2024 12:19:41 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] comedi: remove redundant assignment to variable
 range
To: Colin Ian King <colin.i.king@gmail.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240205180436.1841706-1-colin.i.king@gmail.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20240205180436.1841706-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 8fa3b390-ade1-48a3-85c8-0a992efc5f2c-1-1

On 05/02/2024 18:04, Colin Ian King wrote:
> The variable range is being initialized with a value that is never
> read, it is being re-assigned later on. The initialization is
> redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/comedi/drivers/das08.c:180:2: warning: Value stored
> to 'range' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/comedi/drivers/das08.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/comedi/drivers/das08.c b/drivers/comedi/drivers/das08.c
> index 5d5b9174f88a..49944ce1f813 100644
> --- a/drivers/comedi/drivers/das08.c
> +++ b/drivers/comedi/drivers/das08.c
> @@ -177,7 +177,6 @@ static int das08_ai_insn_read(struct comedi_device *dev,
>   	int ret;
>   
>   	chan = CR_CHAN(insn->chanspec);
> -	range = CR_RANGE(insn->chanspec);
>   
>   	/* clear crap */
>   	inb(dev->iobase + DAS08_AI_LSB_REG);

Thanks.  It looks like it gets reassigned to the same value further 
down, closer to the point where the value is used (within an `if` 
block), and so it doesn't matter which of the assignments is removed.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

