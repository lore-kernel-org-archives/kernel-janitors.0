Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E2638E121
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928712; cv=none; b=ZWqFKFhfN1XnpnyQieCNjuDtapH621SkfZEjpXwoZmNskOO012mREV9N/79fFvhk5Omlz99jOklRzghOv5vauW2NAnTSxZPe3QZdw/jAhHX0EosESGWJRoKkXakaAHgTqUPMkhfpyHmLkqtz7Ad/zX1w5RcdPTjBoyvUIOyl+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928712; c=relaxed/simple;
	bh=TnzJti9awPEx8I4s1eEp9WCeD037s8OKdorXNslKnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qpt93Ve9AC5YFXxi9abwdsEEZihxZ2zAOp2AEE6qX6XeiT/gC8LiTqFoz6+4rbb/F5kr9fr3fhJjPYjKCmjrJ9JeF4HcPZS1Go32IvMmrSJlVB4IvSlqrGP2uol3+2HzQWGoaJL7qJtfTzcBbT6Wivr22+IgVqBLKNwrt5riHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZX0lb8o; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZX0lb8o"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a30bcadd95so580166eaf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 00:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928710; x=1784533510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JI9qKqUbDyY96qS77YO4lTn2EQ0dVAMQRTsX5tyDiBI=;
        b=bZX0lb8ovsq/uHFt0lTz8wwtjQSB/COni4267vcm8RfEUqMUPxTe9azI7q0wOgk838
         W8idVqKQ3i+8CFkamQqC/1baQ8eftDcQlLqtk2n9MqL/SGlRkjPvEf6vFWiW6GtoHM3g
         iKp0rxH3GlW1LFrrLx+83cki3wf5arvdzOjPeu58qH8FuEDgR3Rt3rU0Al1PsUGoXms4
         f/EqR/muou6cCT+MoEdno90/vlZ1WJWXXE30cqwXIFsVtMJDzTyp5u8Dj2xVTxXGeed4
         V5aNlpkCJ54uhyIgjsMPL6Eat9Av+4YY2tCNiZFpP57az8LwW8Fg+O2DTen0uzJCE3qJ
         8ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928710; x=1784533510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JI9qKqUbDyY96qS77YO4lTn2EQ0dVAMQRTsX5tyDiBI=;
        b=ePQOGjcNwa58Jq/fqWhiMPglwQf92jZ5+tSr6QbbirVRgjgnfVSPHfsy1k+3R0bKRy
         Acf5M9AL/pT8HkzdwX3giwtf9m7MA70Hl6HHey0HYJX0clliE6yiGw3sOP/NzwDbfgjg
         eZeI1CPHClA2sbN+Pz+ASgdWQfB1ziedACPnHUJxEqHIVI4wmdsiMwOZoOo3TAfWEBZ/
         oandcBP1ElZVCIvsZmvMCnlk1VY8B8/4n4MKfYSPn4FpLM0rT7ju/XKIb1/qNZVvffzb
         riLi80xrTMXU5kAiK0t06R0XmUjv2ZlP868Ijc+tJHFy+z+Y5kt8bAnTR0jBXgGB8ucY
         VKnw==
X-Forwarded-Encrypted: i=1; AFNElJ8/Oy7vNUjXBE5vBC+nQNvMDLmToMfO5Sh30MMN0Y8bI31ajToXrYfB/viuJf+OEckRDBxKA48b8UhVTTLMObQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyypc10pmTrtPMzS22AFmQbWlYIxTDCthnSPj/MPQT3aIWQEPXv
	qhdGDTPvos8FPYrQWa8c4zrDHXKgiacwdFIAMNLQMa7w2+DtAXR6pIPb
X-Gm-Gg: AfdE7ckI36djUKeewGrOsEHK68Rr0tSxClufIWBPiX9faCanqraunbgoHEWrQyDpGeV
	3bqV5lr4pQKWAxIMPqRIwpzaUw9q25ccrLTFWnxq08hoYeRICcPGag+TY9wSfQM8BNiF7wib/qM
	5zdlu6hYGxV67hfQa2MW1In7U2M6JYVKnRJpRtmPVSN26mlGRkVVTUqOkFeaqkxgVijPMclildd
	aIrx92fMsSeLGaz5Stq/UvHmR580qtNww1/jwPnS9xGHXiaBSWj1Ao2dKiAq7y6dH2bkY0ym+gP
	xJcrqIDHRDVDXuxK5qh1KWJkWIQ5BI49DhI0YUyeCQLsgALXnuSbCqd3b67I3jSp8f8y7rj+moF
	rFn6C5E5JILfGhZ90UsoTlliL4wBQv+4G0j9u0Xbvexj6AOfASopROIDp0D/AeskWVkRy1hGRLJ
	4C4O/r
X-Received: by 2002:a05:6820:f027:b0:6a3:778d:fd3b with SMTP id 006d021491bc7-6a38ba55a41mr6316745eaf.41.1783928709744;
        Mon, 13 Jul 2026 00:45:09 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-455b767413dsm3021268fac.3.2026.07.13.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:45:08 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:45:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Deepak Sikri <deepak.sikri@st.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
Message-ID: <alSXf7y6EzNf9uUY@stanley.mountain>
References: <alFJNUllC3JOKv6z@stanley.mountain>
 <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 09:30:16PM +0800, Zhongqiu Han wrote:
> On 7/11/2026 3:34 AM, Dan Carpenter wrote:
> > The clk_get_parent() function doesn't return error pointers, it returns
> > NULL on error.  Update the error checking to match.
> > 
> > Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Nice catch, thanks for the fix.
> 
> Nit: the subject is too generic and can be misread as a cpufreq core
> fix. It is better to scope it to the driver, e.g. "cpufreq: spear: ...".
> 

Oops.  Sorry.

regards,
dan carpenter

