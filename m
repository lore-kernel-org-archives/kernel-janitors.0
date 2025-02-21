Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95371FFC66
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Feb 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740125506; cv=none; b=e7V8B0a9a1OqOzPbhIlZXRQHbRFQlN7HpDJmZ1locLnnNL4vXsvPy9fjn8cXSbMvaMaGxmKMUYBcMiznzb6qwMm3uQhKTrH/OW63iqGZzGHNXS/XR+t2WZ5nrAD8du2fkMhDY7sSizjJLkihKoWrc6jxfcfQX5RlkL0QprkqkKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740125506; c=relaxed/simple;
	bh=hCwB8kSF7aboWe9MWosKA0MPvltpikkpS8eP32SogpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbYspQYX640Y/Gg+s7fpqQrCvApDVQT9xNB4lhjRQt9qT+LwpWkQqvvr3Ev2xjBEKQPdYPMEvgHeakvhn3j4R5pPqCgoTtf7O8wcvsa66syMbC+DqqyFk/ySeKoL8WaIl7ULSdy4DBXwek9iqbYAjxRPABry1jPri7qMtCsHE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2hT8SRZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2hT8SRZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso346494466b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Feb 2025 00:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740125503; x=1740730303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCwB8kSF7aboWe9MWosKA0MPvltpikkpS8eP32SogpI=;
        b=v2hT8SRZdMvTB1ggAqXj5t4H5JOYRhCTSEgRmsDR2lns6DSaiNg/T46BhMz8Z8DtZi
         iHoR1m897dt1+aBEIiFzVNpcmgVTiAieUow3jDrsqcpduTCvleCLigm7F6wkUhYpAqlX
         pUVQO5KjqTW/VyR6SDF2UtKbmDu74tjH6jWhnvVblXJVXiYATj3q5MzV//dZ5BQXD4f1
         RO9bcfXo2vb4LI6iUequLqJGCqBaX3wSN9mpY7QWdTQVuojbGOkCNbT7217C78v+Ps6r
         L1Pjq3/WrE9w9HNHUL7R5fOC7o3iU4ZPyTq0PdGAFWQMaZkOSg6hg/EqsTpEtOfJcr9l
         X1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740125503; x=1740730303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCwB8kSF7aboWe9MWosKA0MPvltpikkpS8eP32SogpI=;
        b=VCH16tcOYV3d2/35ipnLV3DEwmx04yxoMIvolAwzHQ/WT1vKFf4vhEbwlbu/rpMlx0
         /ft/llQkd5QMdqFTwQtbFSSxpP8HILnFWkUKDs+FIduCoRrahahSRwMzSIfcwNu651o9
         wNP92IqTOk4aFGbGs/zkcDhsRXaFBln6C4nUUySzaLaVsey1cxocFyOiyod6MvxAE4uc
         fIIE27jVorY1ARpXSfJQNyHSh1NgOrXfzESl5D6drjwHcUupdusROUEgJGKbN7VKUXPX
         81Yo6U/ipyJSbdT2Yri1co5WJEZ8/FUIlxPWhoPC2SZIC8VTjkSXOokpIieaNemM8n2C
         uVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXji9ENHYJUHSaVOXWP98Xme3akOaL5yNtWcm5If5TNI6RoUmlKrsQLJKo9zkO18t5BbOFxontjerYo6hlccJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+tw/rVc5P5s6P1IE+7gKm2o9p+Fuzi/lK0B0di87NwrPYPsa
	M7E6vdnm7FwYhrW2D1qx6bgjQJrtuHHYOE+a2EkgPeDj9feCeJw9bqcw+uouPXV3QDR/9Fum4Vo
	F
X-Gm-Gg: ASbGncs0siLFqAUrf8g8Fi3CvGclWIo7sNFlrvJmCtPxRDIxd4Y+P5oD5jMR9DVeG5T
	0lcasU+Xdeb3S2nNi+o3DcT9jMwkITejuDtGge+cB+YsT5Su9UoTXUDoF3IJGCc0DI7qasLm7GO
	9VQASz4EhPYXfKJKVIUn3g2S52yE0kIL+aq3a5rsRukk1RcDqpaQ/wqNj3dsKl7rcX/gHMsBonn
	cg6D/+AIliWdsqAnJB8F4W7vtMU8GgRCPcNtcotPgC66e2cwluYkAVAGh40I6f6aO1qBYajgOXV
	e0PaabCwz5fXOHMDBjdmWlufoQX9x1E=
X-Google-Smtp-Source: AGHT+IFuU0kFfUB+9CyBx7lXud4c9haNcdYJF6e0i3cVIr8FWn1DAHV4Txb/+etbyGDMWrWlIiVGAQ==
X-Received: by 2002:a17:907:720a:b0:aba:6385:576e with SMTP id a640c23a62f3a-abc0ae1aed3mr186595766b.3.1740125503011;
        Fri, 21 Feb 2025 00:11:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbbefd080asm648847866b.179.2025.02.21.00.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 00:11:42 -0800 (PST)
Date: Fri, 21 Feb 2025 11:11:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Josh Don <joshdon@google.com>, kernel-janitors@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Ben Segall <bsegall@google.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v2] sched: fix potential use-after-free with cfs bandwidth
Message-ID: <9f1f3ff7-b4dc-43b0-993f-1f062f85d0a5@stanley.mountain>
References: <20250221012335.233404-1-joshdon@google.com>
 <05f3fc66-f11d-4cda-8ea3-91aac650ec20@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f3fc66-f11d-4cda-8ea3-91aac650ec20@web.de>

Markus, it was good to ask for a Fixes tag but now you're just distracting
people who are doing actual work.

https://lore.kernel.org/all/60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org/

regards,
dan carpenter
