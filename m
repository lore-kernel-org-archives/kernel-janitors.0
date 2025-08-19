Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D2929E11A
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 05:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581243; cv=none; b=sw974tw/xwWNOzhQ96ZlTd2WwF1xUcBpceeHWRbJuSbj08Vpb0lHT5/6YqXWrX4guFRZ+x2o+8Vnt0+ZgvDGQ1zbY0n9CDe9IXthkv8AVuS2CApGilXlSiyTjLg3OQF307UGEpWd7do00Ai3yT1/ZsE6vW3T2xcS5K3HfZQYSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581243; c=relaxed/simple;
	bh=m58pm/y93ex8Ncv061DlagzVcecj++xj/Do3CRly1jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjqdGmNmeMUXyO7zjmbFfT1ad9+EALXVVldSPry/MwNHvb6sKjoS1gqLblpbKomvFD3gDczy0S960U958Uf+yEE4t+E3iN+8SFlbN1luKATzc2jGvbdomQptIiAVb/5UbMNcx/Qb+8PGcyuQEpsQwC5RlvosQKTGDRqbWp61JIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zPLpZ0HC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zPLpZ0HC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so3129512f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 22:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755581240; x=1756186040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=POjRSSun8byVdEQqP9DQ7UyrlJnob6YXd9k0xYVJVr4=;
        b=zPLpZ0HCZkNozIEAPnEkxbwb6aFyUO7jvyzQiDo1EpGW48gD8lw/iejvSJXlX1yh0T
         c5UYxE0/Z31W10ilKCSRs5MeDdkcD+OxGkPHHvZcHnPyqtQRnY7vRAosKkIc06mHumbF
         Myi11mLHljGKPLmEaHRsAt7hpptzXH6RswpmiSiubnaUxfOiHtI0pm5EiADf1pnr8O1/
         C12Nov6eLKolum/j6sq4Kqsl+PbqeJIGiL6/VjCCHM69aikjtruWFwubwyUU0ElfVOkY
         F3XkPgpcYrS5zznIjVuofxJTbHfUskIkxZY2Io5Uc6ylEg5WoxdMN0Jk2dZOndapUFna
         YFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581240; x=1756186040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POjRSSun8byVdEQqP9DQ7UyrlJnob6YXd9k0xYVJVr4=;
        b=w+t1X8O1jXTNcP3yXHgoviSB4fl/SLJEy2JDbysM2/J9fy1+zZQPsv+4JWZR9q4J0N
         nl/ZCrQqfAQ6Ubcx7f5zHEDnuyKgxqJNYY6gE+PYFPD2aFAXkcDl6jXdwhG19GC0eO6i
         t6/BprfXpoBH51/DMZhCRFEapxRqtG5y1EkvF8Xbu868an8e9yRcwgBkwBS1llxRjgdy
         nkmaoInhVeosE6z0BqHCGpk+A1fs4mMyywYVFHa6k8O+EGr1sYkCy+HldoRcUvp83bl1
         iS7IJjvP7JplCHp9SJg5dnDW1iyG0qSPgMB80JNFcBDADcg2lTVG4QMUViY89uaywM1r
         264Q==
X-Forwarded-Encrypted: i=1; AJvYcCXc/HIzXegAu9IUOUQc2jg+LWNph1YPt+n++h5mECfLgRYeI/BoWJTYil24vmpeYgK8ve2BRAB8bnTR/4tK6fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7noow5hrNDieLIn3uwoia7u5PPbjkbMls1zhqael2CwFEql0
	yDsl9Nu7V+0ms9h8uNgUMU15Zz/6SGC/7kTJThXKvPgbmoveB8WNcRPqJcAZrTWu2S8=
X-Gm-Gg: ASbGncuHqtPTrhuFWP6rXGOZnJzNTXt0ViGYbdYmqQFE3ghdnJ3+rRTA5viDzPXRtcS
	S7oaAOpF5PW07nWPRUE+vqlMsm0SjZzPIT0hXQtUCpked+tmOiHmd1sglcYM8BewP6WAmttByn4
	YVGTbA+vHeUelrbJ42baJB5OuEd0VU3Lu3xiU0Q8g/wqddi3W5oxXXdiOio0XoHcDXuC63Siqhe
	pRXyEF25n2jr374kb9mEdGX7WPBmBfORWfE4hOWOC1R2S4nJpPfTKIJWJrtMoIC6Zy8VwgvXLVC
	2Cc77ZpEUXE7hYz0SmFOaUlc9zo+gKCvgD/n35g6v2mdyq2RbTd9TH/y/PfE67fUEWnmw3bTEW8
	fqYgFmzrUPCd+y90BPaOZ42Tzjiw=
X-Google-Smtp-Source: AGHT+IGKYSqUDzbc4GjhgW3BDdJh5Ev2IvdZsejLJPAp4FscOBlrz16sEekNNDLRTobugxi8K9O8Kg==
X-Received: by 2002:a05:6000:2f84:b0:3b9:1c60:d795 with SMTP id ffacd0b85a97d-3c0e3337785mr885643f8f.22.1755581240310;
        Mon, 18 Aug 2025 22:27:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074879864sm2110199f8f.13.2025.08.18.22.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:27:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:27:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steve French <smfrench@gmail.com>
Cc: Wang Zhaolong <wangzhaolong@huaweicloud.com>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] smb: client: Fix NULL vs ERR_PTR() returns in
 cifs_get_tcon_super()
Message-ID: <aKQLNODuSBvUP4_F@stanley.mountain>
References: <aKL5dUyf7UWcQNvW@stanley.mountain>
 <89a2023c-e383-4780-83e3-ba8f9e44c015@huaweicloud.com>
 <CAH2r5muVjS+Y_NFSWwYoisPGfynyTkmynjpQHi2_Kk6Z8AiG0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5muVjS+Y_NFSWwYoisPGfynyTkmynjpQHi2_Kk6Z8AiG0w@mail.gmail.com>

On Mon, Aug 18, 2025 at 04:41:52PM -0500, Steve French wrote:
> Since Paulo pointed out a problem with v4 of this patch, an obvious
> question is Dan's patch "independent enough" to take or would it make
> the v5 of your patch harder.  Let me know when there is a v5 of the
> patch so we can do more testing and review
> 

Probably it's best to just fix this in version 5 instead of sending a
separate fix patch.

regards,
dan carpenter

