Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED4212621
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Nov 2024 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987821; cv=none; b=s/H4o1C5I0Qt2s9dC5wflMAQ2eTwG5sFtHfO3NOmud7pY0Xcv4+HrRwqTHPTss9pEX7ahLn5ZqUCszmabkSZKXqiYo1csZXqNuBR9tEoOYcxchtGQzDG1TAmlM2ewYVfoaxPblQcvoY3P8BS8B+BGx99c0Usuo8JfXhLMO4MQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987821; c=relaxed/simple;
	bh=qnMMY1EBIMFNCCj4m0hlU1mf5a1ROCT94LHu26I+oyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8QuMVhsg3ZBUkIWaZEAVC4twD+CoFXt1fixkUlku3KKd1NcaYeGGVN6T0gxT9CAcJVi/KFm9/ieDcIdafspyxD/Wr8WM1yfzYF47/iVt6DorYSZh1GZvSgHTY9vhCXSx88PAgxpKJ7vclrkHTCk2kb9rDZxmdx+fgU7eVg0Y/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SawnAXcy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SawnAXcy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so1399276a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Nov 2024 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987817; x=1731592617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4NpyOY6rUFjw/BWN7djSiT97ykyDTjSO50iSeMBEZ0=;
        b=SawnAXcytegrbHUxWE//kKaAXr7G9KednCrMy4cAOm/eul7g++34ldE7et0RmMs6bb
         Ar1d/Or9YQYGNF/DyR9iwP4E93glbPo/Yt+5dqF+/kyQhlbjII19t+7AyMv4PLLi16MN
         lmsyFc7IJbfUZ9Mc81tmy786aHNRz7cJ4qq26utce6MTcUIVwmGLwg3R8ej2yvfGIcFj
         vh0u1HIx16J9a79upEUKlbZr9g8ESqc+gHjn7mIO7oIOdL2cvFwTJqh5+M4D0IAzcn5P
         /EOtyT5RzNY1T+BtiduqBf4EQPzPX8TUBlbiq0WapWylewUEVLYt5PiMD8OmN/+g4eP+
         vZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987817; x=1731592617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4NpyOY6rUFjw/BWN7djSiT97ykyDTjSO50iSeMBEZ0=;
        b=e5q0zr7BLvIMefvcIb2727ZgMT0IMJQ/W8T5tqxpxPdoI1Xm085/epOQto72DdoL+R
         C1wLioXN4gM1hrriMyimAX2lIV7FNNdbuxGP7K66kGgoF29aZf9HWOJwj1424hP4jdqL
         lXo8zAXql1iBBt2K5T2sHzMTAcQdO/upGpLplWdgOp5G1ciOyJOEas+vpFkkkMcQ8wBU
         aYNumNfVUir0l0LRuR5ty257FDp5t7WSe9nNqCmzREDu7lUXZ2NUOtJZvk37N7vs9LNS
         EHDydjNYl1vW9nCkkygU+lhtFNdOrVXiCBRjAeoeXgTMNnj/fgMMEkf90qnJQaY+9GKc
         f+7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvISVCUEULrsceE3iGT5Ex9/AG49BtdD9VJ3SnrF9BAoJck7AUphm7gt8I7pTlJN8jJ9kTY0TyXR6kbKd9mvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvVJhym/Qv6KsnvQDIcOZuOpYrkcKqWTyCQdSadUVwjCycQSYr
	ESTA9+hovnVIdNGdfBxmci8rB8Nk7VvIWF/2RgV1DT7QmnhQkdAprmyyolG1gCc=
X-Google-Smtp-Source: AGHT+IGH/e4k1MIhd1tMRWeuprRyYe0nFe/9dywi2+snJ2+871SY5AWuiZ+eYzeGjIiiWkZbc4wxiQ==
X-Received: by 2002:a05:6402:d0e:b0:5c9:76f3:7d46 with SMTP id 4fb4d7f45d1cf-5ceb928c9damr15946992a12.21.1730987817587;
        Thu, 07 Nov 2024 05:56:57 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ed9fsm814147a12.62.2024.11.07.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:56:56 -0800 (PST)
Date: Thu, 7 Nov 2024 16:56:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2][next] fs/9p: replace functions
 v9fs_cache_{register|unregister} with direct calls
Message-ID: <d410dce3-36ce-4663-94ca-25bad2f91ad4@suswa.mountain>
References: <20241107095756.10261-1-colin.i.king@gmail.com>
 <Zyyt0XUv0Ypl56qI@codewreck.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyyt0XUv0Ypl56qI@codewreck.org>

On Thu, Nov 07, 2024 at 09:08:49PM +0900, Dominique Martinet wrote:
> Colin Ian King wrote on Thu, Nov 07, 2024 at 09:57:56AM +0000:
> > The helper functions v9fs_cache_register and v9fs_cache_unregister are
> > trivial helper functions that don't offer any extra functionality and
> > are unncessary. Replace them with direct calls to v9fs_init_inode_cache
> > and v9fs_destroy_inode_cache respectively to simplify the code.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Thanks!
> 
> Acked-by: Dominique Martinet <asmadeus@codewreck.org>
> 
> 
> @Dan, I don't have anything queued up 9p-wise so if you want to take it
> through the janitor tree it'll probably get in faster; otherwise (if
> you'd rather I take it or no reply in a while) I'll pick it up when
> other patches come in.

There isn't a janitor tree or any rush on this.  ;)

regards,
dan carpenter

