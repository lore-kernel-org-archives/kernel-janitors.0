Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E659818756A
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 07:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483011; cv=none; b=EjYOFPnydnoO6F3jggHgaDYIy1WLt9m3yeA+x8VraWSFNNDsLyFFjaYZMpoz+FOak5U//PjrQ9QTmmzFTxqXKdbSHXaPSAccTIdHCVgi5vYCjRWd9xLTb8UxadOm2tYdxEmQe2URNl0RaTLgoV7aLgdbnlDYNE2l7nxNx7rZGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483011; c=relaxed/simple;
	bh=l2dpkgHR0uQGBjSGB7gc6ZtrypCqbzH1UxzfrPQZ5GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZJhqVLDasQtAHHE0o5q1iQ/JUrWGIXh5f8Fkbw9dFhnmMKKoYFES2x+y9mmdmI5R40SX8ZjvymvC0mD6pe0rAJqbN02zfPU3fQDx/87MdOvyskBe8H0SQ6peTYoDgepVWuVhqlgbiP7C5KjykLVpCB0xcqyvfZ03dLYjb7Q+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nn3qbr1D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nn3qbr1D"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so57743115e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 23:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731483008; x=1732087808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4IuARDO3Evul4kxIkl8TTn3LXh3CmPmdXUBEhhatjE=;
        b=Nn3qbr1Drh2K/sWBtcMxb2QoA76hMwtq9DQX7YqdMAtg5C2+M8VGGIkpLAftdtYXny
         RRoulG8m9vgj7cGOGaSj5f5ZRn7S2pgsoIvKl2gMNs1WqfY8b4NxlXCdIwuBGFUnsGrg
         kqdMJtoZAQ5rb/yeE1Tqs4+xapMVpy7Bfu4Ecok16ktMk/EJeRnFE/UZDVemZkQIdKWO
         iRs8LYmpdIiWZpTGccVijSKI7c9BxffT6BlYusYymuOHPHRMeMPnJmY6tqNU/0C2JBaT
         o0CVz71owwiRNJJR+zGYvPNB3tx22IDPzBGL7IJRhJ9Vwhhb1ruPOJfl5hGFfYcAT+U3
         ujLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731483008; x=1732087808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4IuARDO3Evul4kxIkl8TTn3LXh3CmPmdXUBEhhatjE=;
        b=pgKSWmdWpM6A+GppNUkBqjv+GLzoR5Z6e466Yk1xdELb0W8LS3atCE/+imxWqPoHyR
         SsgBox7A1P1iz7fbOThGI96/aDEyQxQYcl6/kf2NWhM7bHNA9b6Ore5lRKlxtBJqeX0L
         X/z3mFY0lTOwVF+VFsct5UcK5GhJw1iJJKI2C8vS/a0XmE8ytB+67574gMZCZqG2NPmn
         9HqJ2UKWxd24EJYLBlpU+fEqlCyYbefhcXaCKMzYXvlmzWNXX01sEG5COATPCcYfR4tc
         4Sx7DpLl+Jk/Hl8vPrGiQmJe9GWRIz69BjmVB0BkZ4EEanCxRq2c/7iOf0kEVtocyJqg
         0wBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiD7D2QCaxHVBeiDcgOdR9dlDt6bfxZ5t16hWGSMhEkd1jl5O09FzAzayRiVTNYxRCtBFP0xlKkcFhwsHdcxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyloNHgWooLaMXwDI7nYVCOhiQpufFImaCudhaThrJaB4kT9d
	M9SaWP60Agh81l0K0pUK8q5bvgZwt35jbB/7m1pjxj9bncD3sXVQvSjtO0G5W0U=
X-Google-Smtp-Source: AGHT+IFkqSkzLWSfdLmaBKYzjshncmU8+jMHsCEEtMRUn4exwemMLplXc4LXPzuZ/KFJgQF38AC3AQ==
X-Received: by 2002:a5d:59c2:0:b0:382:7c7:ffc4 with SMTP id ffacd0b85a97d-3820df8881dmr1256090f8f.37.1731483007925;
        Tue, 12 Nov 2024 23:30:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea4c5sm17806407f8f.76.2024.11.12.23.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 23:30:07 -0800 (PST)
Date: Wed, 13 Nov 2024 10:30:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scftorture: Handle NULL argument passed to
 scf_add_to_free_list().
Message-ID: <9c1bab5f-4e72-4fb5-bf3b-1599aea59e7c@stanley.mountain>
References: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
 <20241112162023.glRj_YAz@linutronix.de>
 <ec532c16-c7c3-4029-b996-284ac32f9820@stanley.mountain>
 <c7b02e51-d738-4523-b76a-c8a84be35124@paulmck-laptop>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7b02e51-d738-4523-b76a-c8a84be35124@paulmck-laptop>

On Tue, Nov 12, 2024 at 11:48:41AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 12, 2024 at 07:30:03PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 12, 2024 at 05:20:23PM +0100, Sebastian Andrzej Siewior wrote:
> > > Dan reported that after the rework the newly introduced
> > > scf_add_to_free_list() may get a NULL pointer passed. This replaced
> > > kfree() which was fine with a NULL pointer but scf_add_to_free_list()
> > > isn't.
> > > 
> > > Let scf_add_to_free_list() handle NULL pointer.
> > > 
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/all/2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain
> > > Fixes: 4788c861ad7e9 ("scftorture: Use a lock-less list to free memory.")
> > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > ---
> > > 
> > > Thank you Dan. I had to look twice, that `scfsp' above looked almost
> > > identical.
> 
> Queued and thank you both!
> 
> > Yeap...  Me too.  #LowHammingDistance
> 
> That could likely be improved, to be sure.  I am one of these strange
> people who wants the pointer to give a hint about its type, something
> about pointers to rcu_data, rcu_node, and rcu_state pointers all
> being messed with at the same time.
> 
> Maybe s/scfcp/scfchkp/?
> 

What about scf_chkp, maybe?

regards,
dan carpenter

