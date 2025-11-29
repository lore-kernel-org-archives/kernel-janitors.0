Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212101DF963
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435336; cv=none; b=Pp7z+gxXiASJHzTJWilqzIQgUQL2sMQ7TWZLGQU6RuY+mf477AhzEHBF8PMuW6gLnq0TkXoN5a0f7VZOp2QW5QR7T+Gh9SyBd/hQZrGOuT080N8XNuEEQMvKYjVfPMzApueYM6a43S4pbLBMVpYmTISWqn9r9R9ZgyPhpcPIjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435336; c=relaxed/simple;
	bh=qlUbWds/wehXTH1HQno5KVUt6k4FYPA1d7KtmAtnXqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/lPC6767f4x2GS9BPxg6IPJXD5S3k0hBWmquz3RXiZU4LCbONrfeTDnmPvDAfxvTVPLmX5beRcOO55D/HYcZtxgjAHjnY2Dr/dAY0G3Tbind4YinT/x3DzamqYsJwpllduEJG9XFViqphy2u1ArBB8j2waBU1Gf0j3pJBMP3E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=veTlEskx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="veTlEskx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so23094085e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 08:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435333; x=1765040133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77Gk1YMBqajScxJA+3inM3p8Y+j/nJiajP/u3YbDVk8=;
        b=veTlEskxKi4ZyKMLm1rgZ37tw3sVZm4FEy3e1J4OL5o7ii8bDq9BmqXthelwSDI4c4
         4PFxqziezjqQqEFclEHbMBTm+GLVGrPiD8Rc79Cqz28SqQguNK39PEQbpdXn54wPdK0R
         GP9Ayyq8IsmZvWL5636tgHpt2A5QhfZiiwb9k6ZXC+kcdungDbDxQg+meT2SkRReilxm
         j43aw9fHczzuXrqRerQYgJdbyDrV7EWPx1B+mzyyddCPa6x+rOVjWaewlBUCknj/MUfr
         q1K+8tb08V5QkCE6D+10PHOFYdF1il5N67kKgYnbUk8ciaH6JaRq8z94q+kFajryKqM5
         pkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435333; x=1765040133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77Gk1YMBqajScxJA+3inM3p8Y+j/nJiajP/u3YbDVk8=;
        b=bmDgwNX9Elf55hkG25V3SS9jpfOPRVo/KHWY0jxwEeWiSwzNHQ5Qw9DHpv1woNzn5+
         nvrfvUIn+gC1hM/RH1z5J8SzBoTCAw3ztt44TBnwF7kMTyWBIhjqgm/N4KwZm0ujwOMs
         yQ/PbDOFRk7nmk0CO/yk7CKknPzZHDtkxqXu/bloiPulFfbJz5T5QjqINJlnEKaiccnP
         ooTL5mfcliCsM9/Srs6ZB65oLSjuOQMqA8/mvg+GhnU/x+/srwkfM72ro9u7GJROZQ4q
         Hx5qFa/pk/8gxTvC9EfZNpe9hE17jp1lFHJL0dJr6OUVyRMfVWNkSJZO6aFxCBmMVy5o
         i1xA==
X-Forwarded-Encrypted: i=1; AJvYcCU/NUo1Fg10o5zhJfRgFojlnBHOhNRwYGtaNca9hcXk0yANUSXJ/0koRv6iow45mNaioMkKMenZuAAgk3J/Hrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbz7bBncus8xuCFhVg7OwvISJkUG7yCjCZ8sPaISKVLUyNUEwH
	vvXDOg8xYTqKkvDWztF4U288OTqOtTEBWWV082NdFem6GhYJqZy9PhHIqTp/FWCvVLU=
X-Gm-Gg: ASbGnctnWdtqRRCBmvb/UbH5xGqRvoVAN222+YRuRBay4T54VBbb/omiSRi5nWO3mBp
	+DybPxbhreNJ2HsbO8vtV+Gzz+EzkSB4Kr6VUOGRhQnhJp3JdwuZNo9bjio/Bn1Nc3mu8qKEzIX
	7fLxfkboBVJJupV33QTHLkFXPq+DBXe+ZkjpHmH9D0VJf7LyCNJFkZ17g0ssSJqdsiMi+fxeeXp
	xstF8JF90M49zTyMUC5HP1991FulNQm2x9JV9CwZU7uJD+QIHB8L7fsBHUtr1kzb7KQ09HjEu35
	leOrazs7gypfG8Rcomd4TBOYK5lTlHZhgFtbAxhMDB1jMKarJf/jh+qGy1n3kSOCEDtIpQDHpVX
	ETMEYwegTFPfh8axn/mn7mWDXjYHmXkSCWZxfcidPRIs63i7mr31Iywcc/XgJ2qVeVpms7dKEDw
	HJJCz8hVQedDBZDggD
X-Google-Smtp-Source: AGHT+IF+kyF9ZGPW0FxetMzX9dRbRY1L5phPRgBYahW/lukbKDMHN/qoaaW4BOKtk/emiQgKm+1/AA==
X-Received: by 2002:a05:600c:5252:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-47904b26093mr233047315e9.31.1764435333466;
        Sat, 29 Nov 2025 08:55:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0e21e8sm219871125e9.15.2025.11.29.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:55:32 -0800 (PST)
Date: Sat, 29 Nov 2025 19:55:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-alpha@vger.kernel.org,
	Chen Gang <gang.chen@asianux.com>, Matt Turner <mattst88@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] alpha: Use pointers from memcpy() calls for assignments
 in two functions
Message-ID: <aSslgTu6_HQfhbB2@stanley.mountain>
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
 <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>

On Sat, Nov 29, 2025 at 02:46:36PM +0100, Magnus Lindholm wrote:
> Hi Markus,
> 
> I noticed that the kernel test bot complained about some build issues,
> are you planning on putting out a v2 of this patch?
> 

I feel like generally we decided we didn't like the p = memcpy() patches.

regards,
dan carpenter

