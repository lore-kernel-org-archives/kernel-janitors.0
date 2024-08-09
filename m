Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985A629E4
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723228942; cv=none; b=J8gnEZJ2cNVBP2fZE9wrvyIgD7+7t4gwu/opZwoz/glYWIZUoeWh1JOBTNE3kp/YxW9U6fvn7xM4MPcCPAq71mkzNoD1sZeS+JufgyO1ULP0c/On51HpvROb+v06ulNwCMtQgHsh8/R1jD5yU2moN2ty2q0+ONyZ1q2ITqjVRy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723228942; c=relaxed/simple;
	bh=o3gI+eWBz9OdExdT/y37sLpjS+ho3xXPI1CduZtOCuo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fr2b9/RAPoFhq+Yk0QFjNvGI2f7Jto8OOyYMKoRdDk89lFCM/AACDJUed24YFkOkP9JsSOj+dGcNxiqFbp9EnJHOpEd4sjTNxXOJ06JH6XyfFsYoXSksY+24Mas11qwdavF+gwuZBL6505lphVrr4cNpCxWS7rLcSifA0VZlnMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAl3UGdo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAl3UGdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723228938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTmJUzIYH5xdCwgnyXYAGeRQ3EOacpMfgAoosgsxAQU=;
	b=EAl3UGdoVzbKPU4Kd0qVBHEozF6ZdJ8gceN85knxz3Pr2w9lA+fOgiRIypr2AGunMpy3ZM
	8tK91tMMK4agViOk7TYU9tc70Vj+0w3BCysOIRvLZnzzS9fyoz3PZBdz3sh9R4Yr1+oEof
	2Ec/HXCTYipctWx+kQHHQmVqk7t+j9g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-m7zbLOtvM6KD_olGYjI8Lg-1; Fri, 09 Aug 2024 14:42:17 -0400
X-MC-Unique: m7zbLOtvM6KD_olGYjI8Lg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1df9ced6fso317617585a.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 11:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723228937; x=1723833737;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTmJUzIYH5xdCwgnyXYAGeRQ3EOacpMfgAoosgsxAQU=;
        b=a9G/NZSEnK90zgWHwtF6RNz6/6hRdCAl7iQ+fixvpTYL7subeMSUf6ux4ffhDn5+4G
         h/LKsyfR8ZEFljhN8W9780zFmSEFrKBA9Ax7W2/pMv0xP3ABXKHn9/LU1KHZfAgIe3pj
         nf/tEkGAMQjgd59bHKNYUX4gqnYYvGHg1Z5qi2bLLeaDZx7zdzq+cbhzmLlGKosrdoix
         q7+m4zkNGeWzO1uRgSmRcrVIXvGA8uP3k0pV19f/rA1KDVDxHwAPA3wh6Hk24+zuQocs
         tbGh4PvamSb/mP0/8yBHJDcPLHZS7Y+xD88IHfYSuFxSjSAxncgL03hpZwqhrM9S4KZa
         ncPA==
X-Forwarded-Encrypted: i=1; AJvYcCUnQcgCaRJPsmwBoGvhbroZooIYY7j/hIyGMS1ZBKWbtBvC9MorRJ7oUt9+KcIBhyifNifIvsQ8Qk1nqWK5x8lSpL+uPsRtUGlpQo7BctOh
X-Gm-Message-State: AOJu0Yzx1TPs1wuubpTIfv86rx15OClX6oZYxF+5mCZA2f6Vn/T6zfLW
	02+F+6kbcVWXFANSesg8VasZk9Jre8Zzs6c35yyXMg/mmzJzPYnKyTvBhA3Db0rjYsnZrAPEATm
	x0flkYoLom5ioZkFdDWDD9IAO6AFxVBPShEd5VbJlDdMOSuUFo56v29n2xFEDNG6Nzg==
X-Received: by 2002:a05:620a:24d6:b0:7a1:e001:bb1b with SMTP id af79cd13be357-7a4c18c2d1bmr260014885a.60.1723228936978;
        Fri, 09 Aug 2024 11:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXXXCv7azVX3+7vSHxmPbJNeW7P2HuAh5Ji2ZQSlJNOIDr1NBkSTa19JwsluzgDU1JZcECjw==
X-Received: by 2002:a05:620a:24d6:b0:7a1:e001:bb1b with SMTP id af79cd13be357-7a4c18c2d1bmr260012185a.60.1723228936553;
        Fri, 09 Aug 2024 11:42:16 -0700 (PDT)
Received: from fionn ([142.189.102.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d7a531sm4115085a.58.2024.08.09.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 11:42:16 -0700 (PDT)
Date: Fri, 9 Aug 2024 14:42:13 -0400 (EDT)
From: John Kacur <jkacur@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Daniel Bristot de Oliveira <bristot@kernel.org>, 
    "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
    Clark Williams <williams@redhat.com>, linux-trace-kernel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtla/osnoise: prevent NULL dereference in error
 handling
In-Reply-To: <20240809140545.698f654e@gandalf.local.home>
Message-ID: <25b597bd-bdc4-411f-e5d9-78ed4d042c4b@redhat.com>
References: <f964ed1f-64d2-4fde-ad3e-708331f8f358@stanley.mountain> <c73c51ae-99da-793a-6dcb-2fbc6871261d@redhat.com> <20240809134133.751723e5@gandalf.local.home> <7ece353a-36a6-6154-97d9-b255728b9807@redhat.com>
 <20240809140545.698f654e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 9 Aug 2024, Steven Rostedt wrote:

> On Fri, 9 Aug 2024 13:53:33 -0400 (EDT)
> John Kacur <jkacur@redhat.com> wrote:
> 
> 
> > > > Although your fix appears to be correct, I wonder if it would be better to 
> > > > create a second error label, such as out_destroy_tool: as described in 
> > > > section 7 of the coding-style.rst
> > > >   
> > > 
> > > There's no reason for that. It's the only error path. That is, nothing
> > > would jump to the original out_err:
> > > 
> > > And for a single error, an if statement is good enough.
> > > 
> > > -- Steve
> > > 
> > >   
> > 
> > Ah, right of course.
> > Okay in that case, Signed-off-by: John Kacur <jkacur@redhat.com>
> > (applied the patch, built and ran)
> 
> Note, "Signed-off-by" is for the author of a patch or someone pushing it
> through their tree. I believe you want either "Acked-by" or "Reviewed-by",
> and since you ran it you could also add "Tested-by".
> 
> -- Steve

Thanks Steve,

Reviewed-by: John Kacur <jkacur@redhat.com>
Tested-by: John Kacur <jkacur@redhat.com>

