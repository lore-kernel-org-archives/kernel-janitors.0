Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF5286D50
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100110; cv=none; b=ksM/tg83f/WH1f8w/l4MLI2b/dHFmJlCUr3OVNWMKGJl33OZewpTzFR7jgqu+17xzDnDe74jPkfo8pcEbqxVmSQ7D3Ny6Ee6HsuC9QbP77ltvbUil/gLp939C2/RICkUQ6EuaklJwkOauH3MliuxHFAoV0cupMvXt9dH3AAZGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100110; c=relaxed/simple;
	bh=wjHKB6ug6QLTXYCJJQSW/nStYJh10pIv+On24g943d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o59873SUcV9aZ1wm5MjXOPmdQQTjIHY+WfCRmUHJDtcqP+ZUr66tvA9jMRy4RpC+f6diU9eAmo5G9ZfU5OVnpL+jBGQaOV7JFW+XomzCWwlweOhjhd75eZ9JHOQ6osSLCT/aMQtDHZZUjAIvAOLCwBC7pjQMD11ZALBsQUf/wy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXEORKjx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXEORKjx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a11a138faso11536495e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100107; x=1755704907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzS+q+xmuvVbEJJlZUoMjXta+/qBsEsWeg786ovz6b4=;
        b=eXEORKjxzjh0rcvUdlHlUDV9tP169uh9U+99libqU8DNeFvsX7o0fjS5kLLC2RguFZ
         szbdVX3rTZ6v7DFgtKuJVVUzkbFz6+9erzlGXh+k33ZKKSQFTjgaFmpErY6z5S6c+B31
         EZJXjDOy/mVw8z7dxHrrNrGr8gpldlUCC1acK7Su8IeIZD+Ot8faK4jI9iiX8zpWlH1g
         m39KJgwogUcrp6czEIGK/0Sd1CIZi2jaXbYVHAF3bAJc8SPtFtQIADw680b4KAA1lEfq
         cFZ+BMPytzoVRh/81qXAaOcN3cmB1Ym11tIMziJqbzZryvInUd85wDHf6d5QosNKj/RZ
         f59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100107; x=1755704907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzS+q+xmuvVbEJJlZUoMjXta+/qBsEsWeg786ovz6b4=;
        b=oy0/tsVmOXSTqIfvc2CIz2Bhca7CNj7cIJKhcijrdsNiLJN+exvXNEB1EKAek4ma3A
         rnoCIss6r6mH73WTqe+tS33vq7WTtBeb2YUUQnKPVX72Uhr3iYz/lBICtyBe0rvr8ksM
         r9dRWN8UD0PhYvihYqI1B2L11dygbeDeSDhtZqtoZ8wc9x7AD/9B7mBa+jLRhJ0lxhaG
         HuEu5vgaKTpoFRvJQJMLJE0Mj9Gxklr1/OpIx2qBkBoRIzu51hCUjutLPPxphPEjRHsv
         h7cYOwPBXtei7BSlFY4RdPqWT/pIt10d5AV57EyBCF8JROX+gRD6bQu7jjgnVwJVjF/q
         GXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUc5RFnebdTlwV+KTmqBOBeaRM0tzrA8nyffVgijTewuogia7++z9pfcp4CR+KoWJ0M8nFKMElj1npQrewToPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CFb+SAnEJayZlLUFfpJ1PShI5zonKHmxUWcjOvkyhtk3N3MY
	mOL/EqN0josvHw8s22XxiaF2dWLCfI2OFD9PGvfxk6bq7GtfB7MQvspnt/x4YUN5xes=
X-Gm-Gg: ASbGncvVxyVGFSf3GorAF/fHLvbNsZ5XcPI5kR5wgIl11gTuxBhieZWHj0NeGxGeKg+
	AW3GR6QN6GQwPIX2YLHhD+k+JGzCeKoKmV19sfnrRImXKZKJ9tKliNEKfeiSfa/RgFlhRURPlSu
	H7MJ3bBn7wXmMFFajZc/OX+AJtB5aW6X1zOAAagLvX2ZsXW/1fVN4oDjZsK+gutJEUFfuJnkhQ7
	tgWJuVLICa2QXfcqXqZJX8NhDhTTXqumWpNXG2lU3MC/vKd9NnxRQs5/0qkyoUJ21nMp/35k8lO
	k2CFsUxe/b87d3HkIOecxqN4tyETx6QbNQd2L5V1U9l3fISJ3V2Z106L4TKhzjo9I0qiiIQQwvT
	bOQy0B2dgNvyjHu7vcRLIhJvRznnThLB/KG9gIXXwXRc=
X-Google-Smtp-Source: AGHT+IFj8ACft23R4r1/k5qKQgq7CaowimpyYgQ/Zx1sb7i2e+C5jJeIrm0zk9PVrrfu2DCBJTN1cA==
X-Received: by 2002:a05:6000:2502:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b917e36d09mr3177175f8f.13.1755100106753;
        Wed, 13 Aug 2025 08:48:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1a53a5efsm7447925e9.23.2025.08.13.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:48:26 -0700 (PDT)
Date: Wed, 13 Aug 2025 18:48:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	audit@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] audit: add a missing tab
Message-ID: <aJyzxx07nycUmDde@stanley.mountain>
References: <aJwkwMRSxUAvI4dF@stanley.mountain>
 <9ec4a351-de59-4b6b-b200-3a2fd6cbd9a9@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec4a351-de59-4b6b-b200-3a2fd6cbd9a9@schaufler-ca.com>

On Wed, Aug 13, 2025 at 08:39:33AM -0700, Casey Schaufler wrote:
> On 8/12/2025 10:38 PM, Dan Carpenter wrote:
> > Someone got a bit carried away deleting tabs.  Add it back.
> 
> Of course, it should be the way you want it to be, but I don't
> see the reasoning. Help me understand.
> 

The "call_panic = 1;" has to be indent one tab more than the
if (audit_log_pid_context()) check otherwise static checkers complain
that the if statement isn't indented.

  1771  ________for (aux = context->aux_pids; aux; aux = aux->next) {
  1772  ________        struct audit_aux_data_pids *axs = (void *)aux;
  1773  ________
  1774  ________        for (i = 0; i < axs->pid_count; i++)
  1775  ________        ________if (audit_log_pid_context(context, axs->target_pid[i],
  1776  ________        ________                          axs->target_auid[i],
  1777  ________        ________                          axs->target_uid[i],
  1778  ________        ________                          axs->target_sessionid[i],
  1779  ________        ________                          &axs->target_ref[i],
  1780  ________        ________                          axs->target_comm[i]))
  1781  ________        ________        call_panic = 1;
  1782  ________}

regards,
dan carpenter

