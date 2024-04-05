Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6C715FCE0
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Apr 2024 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311793; cv=none; b=Ekj3pTZZcgr8jJwnnLZdWWG2bQBQgLIcxV8SI1CoEzL/ZRzpdQnQSf4f/z6GCyf9lOxRgJqVzWNANYjRzyauEDzlmz0ePZnTGM5QT+9JXLvDuQSTVmu0el2qwgOThyOXIxhEFz4SV6sBkHpXV+2lTHJ3ByNt6oazKo1H+IM8GIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311793; c=relaxed/simple;
	bh=Y9jCXOyL+/kYvJc2k4cGYkDCZLAD9hwNT2qaNsfc0p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSVplDORyORTdL31K5sqgWqtApdo+7NslrQnaxubUkUltnre3OkLpAOAhmT5zhiQhCvl0wUv921VSte9suXUiXzzMwPgDLIDafD1l966pCs2jDK0RQFoqTkc7a7gLohyJx/BkplWpwlMA390aFYv01vWk1lCZlThIs7BwtK6OX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLqdYx9x; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLqdYx9x"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44665605f3so228896966b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Apr 2024 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712311791; x=1712916591; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnvpR1OMt7rMwYNMaCBfgDrsZuWA77CQfSce5C51edg=;
        b=gLqdYx9xwaYwdINeJ1LUXSLsHvhSg4hDQK3mHOqV5l1qZBjAhjF6LgKVXf1qQX59pV
         CGFKTSU3cjAZHccaY/eQXuibNNBaSw+2vJNLf1e3tkoBgO/YNcfRJch77LhSz3bzADVV
         LZhUh5nZscWmbETZitQGPcXAfikbI1Iuq4L5gZ9GXVDgPQNS7fFinS7njxaWLkngMZCy
         GTxAAWOI/JbZDqm7SOs0AG/aue0qKKQ16zOQCQtBkIzK6+ebsFXuw0+vKODSMpcpqCkO
         b26As4PcJsXloFc5qwLOa4S8utHV4CwskQcrlpuwbTTZ14WNKGUBPgEDB3Fa9vq+P72t
         QQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712311791; x=1712916591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnvpR1OMt7rMwYNMaCBfgDrsZuWA77CQfSce5C51edg=;
        b=T6QagXGEwoweOZHD9RDggcC+cFGivz0nakYPjpJ5jns3DVH7MrLed/UMEAGN9Oe1mi
         VWWwqm3tS7p3AJQWOoWOpEYqsbE6LZHXNPaHonVUWvY0B7oEvnDscrAWqc/897RMfUTG
         Db9rlcT6k82vif8URYeDJUYsavpBl1dExImtAWNwtJH5QdSYdFwVJyZvGrj+cO3PZ4kY
         H5Q7/DU9aq/NV74L3Ms/PGFMv51LN5oBBeOeLF1WoG5Dj4EawbzQ3Q2MpzGo0aYKvlrf
         +D9FOmKyNBhDGWDhatj+SBCtWjAi9jixQptDkEaY21UoRCUwLnvKtLf/CYUECy4pWRXH
         pnsA==
X-Forwarded-Encrypted: i=1; AJvYcCVqajZ5Pk6h0brVlPWJd4Ggc9XJipzxyxIr4VfvEc0QRMRyQGglVtnUG5MD6DOaB532uGkMOqmpG1gBC3hBOL0DayxsvvcJpL7E/7TS/Eo3
X-Gm-Message-State: AOJu0YzdOBmOgtMoxpDuDYZlu+SfcYCZkvvcZSChOoYP5nufslcqItpr
	fB7e3cB0m9k/aS8r/ItvECmujgL792IwOxXUFElKfKNyXICel9popyN2bRck+xY=
X-Google-Smtp-Source: AGHT+IEkcwb5yPaRESFanXTm6Wy+j1a1JXV23j9brieOwGePcZwN3K9YQcZhEhFHLI/WYeY+mMlriw==
X-Received: by 2002:a17:906:4549:b0:a51:a595:1f44 with SMTP id s9-20020a170906454900b00a51a5951f44mr655226ejq.32.1712311790196;
        Fri, 05 Apr 2024 03:09:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906b30a00b00a4e08e81e7esm658945ejz.27.2024.04.05.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:09:49 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:09:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: haribabu.gattem@xilinx.com
Cc: Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	kernel-janitors@vger.kernel.org
Subject: [bug report] soc: xilinx: Fix for call trace due to the usage of
 smp_processor_id()
Message-ID: <6265a58c-308f-4eb9-b008-ac938cb8b8de@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello HariBabu Gattem,

Commit daed80ed0758 ("soc: xilinx: Fix for call trace due to the
usage of smp_processor_id()") from Oct 26, 2023 (linux-next), leads
to the following Smatch static checker warning:

	kernel/irq/manage.c:1588 __setup_irq()
	warn: sleeping in atomic context

drivers/soc/xilinx/xlnx_event_manager.c
   608          virq_sgi = irq_create_fwspec_mapping(&sgi_fwspec);
   609  
   610          cpu = get_cpu();
                      ^^^^^^^^^
get_cpu() disables preemption

   611          per_cpu(cpu_number1, cpu) = cpu;
   612          ret = request_percpu_irq(virq_sgi, xlnx_event_handler, "xlnx_event_mgmt",
                      ^^^^^^^^^^^^^^^^^^
You can't call request_percpu_irq() with preempt disabled.  It does
sleeping allocations and it uses mutexes.  The way to test this at
runtime is to enable DEBUG_ATOMIC_SLEEP.

   613                                   &cpu_number1);
   614          put_cpu();
   615  
   616          WARN_ON(ret);

regards,
dan carpenter
