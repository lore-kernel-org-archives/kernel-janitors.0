Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724418A956
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747008; cv=none; b=XxB3IPTghZMsmryvSngyZUwpBGrd7Du/+dojD6gGfW0zFIO1x693ntx7V2vCdAz4yRVT+F+XnXNmTD4IDuVKMk6z0q0xMusJfDx0/Wkg2tCYvDqYVxqhhWZaKxK46JcybIFnws4VstDVpNUlaij0Tn9wK+EEbhmeM+NmWj8pgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747008; c=relaxed/simple;
	bh=y62j1qyv7cgXLbtLXC53Pk0kooT7stT3fh5DjyrzJJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akAGdyiI1ks7QTk27/VA7ZHrsKIHYl6jTmvaIE41I6fe+EbVmIPdTJFKtEfW5EqC4QO7Bpbmvgl7CuELwnxttV5yXrHC+kk+qXlcL9la8WQHa1x23CEDdRwrmbOYUXMiH3ncqi45Q6js+xTODmY8PAaUmoqm5QBYnduX8suw0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrlIEZxL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrlIEZxL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477563e28a3so16299915e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763747005; x=1764351805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DymXmqpOIrcn6HBsb6WiDUl4fGGkTlxCMuKU3m5KUbc=;
        b=ZrlIEZxL2Izo24hLTe+h5TWXYnatSLxVAzBWsxwCcmxdwk+x0eXXxGWJ7pfNgAZCEM
         NTN78O6KsRamILfzFnYmr4fqbe+dxGmJcUQuEaedGAaFgE1gH4MTzOO+JirDZOVqxxqn
         guduqzh3dghy9poZpBlNAPelGvktOntIpyO98aXQBT1Nm64vN2s6RngwKElM6fjBuOFL
         Hh4NYPcdBuX8j5HmQ4YB5IQBoENnt7pc062HrsqXGjAOWz6RqcMjjYtb622guV+kgOqN
         nWCZaETtrl/naXpTnlJR/LOe53uOJbgczQmKXbc4u5vIXWagafmzxpNfR/kcPbbG0vE5
         Jx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747005; x=1764351805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DymXmqpOIrcn6HBsb6WiDUl4fGGkTlxCMuKU3m5KUbc=;
        b=CAoqRhODiwqjbK9ts70JDY8GmNJVKSraBG3vTyHqZlb7aAPCr2LhmzUxUxT+lnkf+p
         US6pQCOAJPUjuPcT67wPkI+ogc3+Vscdb5MGhq+7UE4QZWgdKeQgQMmrH/GDzV92lHIw
         VJx0IDgCmzACawnj7en0Ym12SMk2m2bMrBKM9oXFFvbT9MTYvcLSLBY9bu1Byd12b5Rg
         MOZoyrgKP9YWtENO+0BJ889qiBqrUtUWVdUOdekoiBpRHHmsVFtfI0Ccaxe8c1huk4gA
         YmF3MC2ux6OIC3iqCu73JZrqMvtFxtRFzq5BAwb+Suolf1Ei+B+knpB030W/WD33pdJj
         cEag==
X-Forwarded-Encrypted: i=1; AJvYcCVI6wUQ1YcvCOU6KvWT0JeCyZILe9HbHjiTb+1AmVUzAMKG9bjBS3WogUKSszY8cJhg0m4nBf8xh6aDYQIRvFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzydB/LdcbzK8gwoGOvbjJrXhUkeINizgkQgMouZr6WHTOjMrCC
	Ak5g8bZfxYoMiIV/VxufCnhKvHLeTNKo6v3zpThASyVhHvWNcm7p2AayyBnfFdho+l8=
X-Gm-Gg: ASbGnctcE/7bMfH/OGwJNyjL/jt67uLU2ocp5tRPSVA2bORUBdoZoUtxanoKs+bo9CG
	XIf/esHkY90qMwckGAuEXnb6A8uBbi6rbP3InP2IBErg48FFuuORakAHQGTRDVE0o4vD8Kddyrc
	z026YEquqkt0EQYTh/QfhxQrWzrQ7wZ05+EdEzpnIa1aBNK++cdwN5AfMvILxZkYQwGVw8BGfyR
	VH7th+AMeWSoP3iV8ACRrLNK8D9ssOW9IKY5PnUfDt/f+S1rkMfdOKeK/b8sctLLvSNAlGejfW4
	omQ4gTjsPUmZv5gl+zAyPZ4GNyUbXyrJ0Qa7+LK0hvWEnIDjaFGHPgJZxM1IOFshwVr1zephL/j
	qXZoVd1epxgQFp3jQk5b7k+FFpKctUyNEBrjOj9dQTBMoCC2tZa//UYMk9KZxPY7Yt5uMK3UYcq
	QioOK6fHQ0GxWojgQB
X-Google-Smtp-Source: AGHT+IGFQsvgqlLXjo1LFzfHENKzKFKxBi/jQaStpJz5QhBM3ftqg50gqcC3p5JGniMbhRFFXcSeNQ==
X-Received: by 2002:a05:600c:3b01:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-477c04c357dmr30706095e9.1.1763747004919;
        Fri, 21 Nov 2025 09:43:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf22dfc1sm55987425e9.12.2025.11.21.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:43:24 -0800 (PST)
Date: Fri, 21 Nov 2025 20:43:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] fuse: Uninitialized variable in fuse_epoch_work()
Message-ID: <aSCkt-DZR7A8U1y7@stanley.mountain>
References: <aSBqUPeT2JCLDsGk@stanley.mountain>
 <873467mqz7.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873467mqz7.fsf@wotan.olymp>

On Fri, Nov 21, 2025 at 01:53:48PM +0000, Luis Henriques wrote:
> On Fri, Nov 21 2025, Dan Carpenter wrote:
> 
> > The "fm" pointer is either valid or uninitialized so checking for NULL
> > doesn't work.  Check the "inode" pointer instead.
> 
> Hmm?  Why do you say 'fm' isn't initialised?  That's what fuse_ilookup()
> is doing, isn't it?
> 

I just checked again on linux-next.  fuse_ilookup() only initializes
*fm on the success path.  It's either uninitialized or valid.

regards,
dan carpenter

