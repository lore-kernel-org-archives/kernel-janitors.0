Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5936F438
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957170; cv=none; b=UQt67plKiwTcFMgp88ZEfYz09S4tKUcoKAiPZzUZKw+0+z3C2sdLAlmtKbLYYRwgbQdne7ii6SS+z3R2vkFdmnsgC1bdIwxR+SBrwIs6mJDezOURj8DQBKsvI//zA4V5ZJ09iFYyqa3PdYv9SfKNb4Rcr7eiVfndZT4bGViWWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957170; c=relaxed/simple;
	bh=OjfTlHP30sayTpbmYqiyqSKJ5L4X/Jv4ca7vmhYPKlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F98LmGb1shwIuyuWhGrPcPIzjCwTmyyY2er3f6BNd6PTDzQqvQ2YyWI2qCWgGUp4jyXRq20Q8xZniKjb+OkHLoKwFUqvlGRCmmNUZYJkj4Oz1KMXWHwB8kUjkPzmTOqaTzlJE1N65SUNzZDlw2B2I7W2fT050SIrT33pqKnQTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbyj/eGY; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbyj/eGY"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-651d692e833so6979156d50.3
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776957166; x=1777561966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrPRGo+qS+qeL6Wzz6luFmnxa6JCnRNWW2bTUTWg+Do=;
        b=Vbyj/eGYxPySXm3oAfoGmfN6kpvNPdqZfx74cPqQnXAQhJP6QhPM28gpgGRNNCkncm
         ET3zKUh6xXN14bkfl1oRA7hK0wpFZ2jK1Jxt8Jq1nkZp5fZboxaEEuu91v8+7Vip6soN
         Fn8nbDgp0UhTONE5W6GKC8o0CwFeAhPWk/kNsEsV5QsXXZaSAayKxsVE54WZfAb3uUwY
         9Eoic51FRYM7RY31X7OiZxIAHBJxKBJHjHIkFq6OUQyIt6UpLiB1XfCVJ0DIS2SWoP0N
         T7Jbx+LubkhWwGMww3nvAxnwjsocPzZJujpCByrYwVXqr0xNZPN6W3lfTr6DbSnM3NNZ
         smVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957166; x=1777561966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrPRGo+qS+qeL6Wzz6luFmnxa6JCnRNWW2bTUTWg+Do=;
        b=GW6Nj8npuSRalFHyT9x3Fx9QFc/ulZY/uuiWnkLKK/xjz4uvTByT2xB/ZUTORYISsQ
         vDolzbWUacdk3C8o4r64fQaSEV0Q74bGwMCWiKxTpFRKWV6KBDv/KiNItdr+W1lo1WOa
         BmXDgz1Dw9TdXPE79UFM/48uai4hRuhWJw7CedPM4eWiri3ShkKA8gnGNuKGQy4tJmdf
         RVtt47DRRavARala++Y1Q/orKd9W+D5KEVIH0NlCDzlUiW7UjhV7Ek896I/Duet55RK5
         3SNDZtBrOFbdPgn9o/Jjeei5hAXeL1UT+V1knanxpC1pjZWYY+msyt7V4jOqYQmwbs46
         7E/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+rk4Girwp2EeiJV60lE/D5llchLEvytCmQivqm21dTajpybbfJGSzATWwhX1yhT7caJ0FLFhxt89BI1fUH4pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYj2aTKkgTutCMLvHFMt4Xs2T/6DkEy2aheR7rXmCtSHcVRpf
	Ymk6MIXdmmHYIxdMEOVXyoulVIdzrndCFGSbi1gWkoGfsusH2UzmPdt8
X-Gm-Gg: AeBDietKqoJuIQD01qG9jlHZCV93/WE9GxJgZR8ReFqy96NaEr2xfoC3bPU6G0fBhuT
	WNMzKHCU7gAmM7YnuGjUvSfZHciAhSPJQE+EAJtSFHtwk1cUu89Px0xb8BIofTZDyzkJ14paiZV
	oQpzbKWnuW/ffWsETeBCSyzSQxURx7GuV349MfrxcL9p/cmSRufSOBOXZi6ASuDJqyr9TXblzRN
	jWVa3raUWi1aOx/48oKFV7Wa8kAxFkAkgC4x5/dyBwflilThc4ddczKqywGFCYzCd79wDPRWyLP
	LVJfM6Mqoinrox/j5gzZ0uYyQEotMr7o1dT6s9spJmfbc9J5LLJg0EJS9snBelTC2xHVlOSEoHW
	Fsk6cZmscoAvBnJtvHLVhc/7jTBBlE0zY6lhU1sYaf/CxufurR04n2D5xn1VdxpGka8Ls5nRsaW
	x8inJdVjdOAYzWrXqf4RTjFmeqTIsHyzAKjungvdY=
X-Received: by 2002:a05:690e:244a:b0:651:b741:8fc with SMTP id 956f58d0204a3-65310a29b69mr18561124d50.36.1776957165961;
        Thu, 23 Apr 2026 08:12:45 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65441e82f54sm3532337d50.14.2026.04.23.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:12:45 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:12:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: intel-thc-hid: Intel-quickspi: Fix some error codes
Message-ID: <aeo25zL_XIoFZ7uK@stanley.mountain>
References: <aenFyk36rTnrD9s3@stanley.mountain>
 <7e6c43e6-7896-4504-bc13-5f12025596b1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e6c43e6-7896-4504-bc13-5f12025596b1@app.fastmail.com>

On Thu, Apr 23, 2026 at 10:51:10AM -0400, Mark Pearson wrote:
> Hi Dan,
> 
> On Thu, Apr 23, 2026, at 3:10 AM, Dan Carpenter wrote:
> >  		dev_err_once(qsdev->dev, "RESET_RESPONSE body expected len = %u, 
> > actual = %u\n",
> >  			     read_len, actual_read_len);
> > -		return ret;
> > +		return ret ?: -EINVAL;
> >  	}
> > 
> >  	input_rep_type = FIELD_GET(HIDSPI_IN_REP_BDY_HDR_REP_TYPE, reset_response);
> > -- 
> > 2.53.0
> 
> I think this would be throwing away other possible different return values from thc_tic_pio_read?
> You'd be losing the -EINTR,-EBUSY, -ETIMEDOUT conditions that might be useful to the upper layers.
> 
> Should that block be split into two separate error conditions?

It doesn't throw away any error codes.  Writing "return ret ?: -EINVAL;"
is a short hand for "return ret ? ret : -EINVAL;".

regards,
dan carpenter

