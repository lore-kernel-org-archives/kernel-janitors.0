Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076951A3146
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Mar 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332546; cv=none; b=a9YmLf1cBu+HuQdEX7c0rJQFAXLk6Jbsd/a+F8XKebkRQ3bmRQ+9BAnS6Kw5JwBZEBBy2+5x8pguHQdHPqfv1IttR3L9PDUAvbDN2AixrlO6OBsvOnJ6eBtityEl3bfCOxb1e59aGG4g/7DOksFl7TwItE/IccGexhAg5RRXmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332546; c=relaxed/simple;
	bh=9gDxCWe7Zg/nWpvugHW1RCaJiLWtan81G00ApnN9AjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6xUCkslE7mZ4mRQHi6JSXM56LNPFG6jc4VZ7RJ+x4w3JIWP8tXgcbgRKd8KZd7KeIeYPRNgESoMYIr2kx42FRzEJU5phHtAPJFr6mojHhioPDa9zT4zBypXEcuPSS0+ZHatuGdVVQUyuUfrKmY2eWB8L0CbeQePvEofMcRhBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK1as5u2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK1as5u2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so16428835e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 23:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332543; x=1741937343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
        b=WK1as5u2xt9X1yvMW8HD88jMwxO2yDNfVALF+WGAtNT1A0+lXznPhkcjQtbwOY3+rw
         fqAH5tmoOqcKg9NiJO3QZTYeerFdwCSHv5mPhtClV30mNARl5Tlmbztgl42EovUqv0BZ
         6nqDX4ZyzMbA48ikYLo7bAomugp4Ov+Vgu3CZsnaKs/w754oS+Zv6or/tC5BCdxaFECd
         Lr5rg6ALuToHfwfjLVVdrgwL98vQutAV385Fe0iTCKjOymUu0miqX4Jrv/KIu2KBMVpo
         UFA0zilFQvlsNRArrhM0p0TU3/aGKeOdWbfC8vN6An4OG54cInqlc7oUJmww9G5iwFEg
         zA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332543; x=1741937343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
        b=oIZO9/PtltsT572QTOkLHdAng89C/beWjKpYfydOJIeYd4AQP9sR6YGvswoBfo8L8a
         Hc2n+oIme5W0TtdjDi6U9a7TPU/v/K0IG6VS5nkqKrY9ddI9amyOOopSlJnUwL/viwSQ
         TwVqXKDZxuDHQnr98Zu9CmUOsns4GnHVUkAKhIvcuuRbZeUoemiidfx4yHqHXIHp2YkJ
         RIA6GyrDwJeTn0EaxCGXvMI9BfNxQ5BxBYuKElJO7MSfwxgkbx2Oh44sgT72ZS1HRhgi
         swPD122LjmJXN41cxH3jiavOid7+joAsyvLIqVRHPyCk+3um+/H5+jo4F/w6BWXAouIs
         fCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVOccBrPMHup7FWh6c6dqgIV14W3exvSgoatxisTxIRGfoDMAyb1nn6E71NG6bsKdapcR09QeuyzATybzKCFEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7UjDC96DJ2rqhdN0WS1Go28PSNoGkismRiqqHvdW/Vp1N/pi
	GK3tkWnjhab5Hon/SABzw09zmEw/Mo1ypmy0/MbugL4HPqHYMhsBVSQExBwM32k=
X-Gm-Gg: ASbGncutvXv1BJfinA+G0k2VV17g1+oXT7JQ+nnYWWVJXU0W/bOhX3mub+BYOVZdJrQ
	o3jYEUmZnRjMMn5I8lUZj39p2JqTJiUqLGJBzL6F9ZAY0wH41g5c4Xbh498x1rrb/y74N3GdZQP
	IB9PZIC0yL9VBDyS7+AvTBnBwYBHXiorgQn9l/9l3J8kkvA71MfqvjA6JDAQtXeelwKnwpIAlY8
	9NKn5+PA5bOxhWN8dWWfR8Os0tXBYmMm2PbRbh1D5e9TsTcpF3vfjDTcMHLIIswZcmXkK5MtZLm
	68d0G3CfeLiC1JCxkXHRIuT9Z6SaBuqS1Oim0cyvVS7y3fWrOg==
X-Google-Smtp-Source: AGHT+IG7+0XvfqpXEa4bb2S7ULVZlAWD2yns/3fQUyBqRZKt9KtX+yqDgzdFZ1rvgJVCkq7kZRve0Q==
X-Received: by 2002:a5d:64ac:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-39132d228c5mr1671359f8f.17.1741332543129;
        Thu, 06 Mar 2025 23:29:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfcfbsm4355592f8f.28.2025.03.06.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:29:02 -0800 (PST)
Date: Fri, 7 Mar 2025 10:28:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <0716c1d9-46e7-4345-b005-314f5631aa74@stanley.mountain>
References: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
 <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 12:12:53PM -0700, Jeff Hugo wrote:
> On 3/5/2025 8:53 AM, Dan Carpenter wrote:
> > These are u64 variables that come from the user via
> > qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
> > integer wrapping bug.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> > index c20eb63750f5..cd5a31edba66 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
> >   		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
> >   			return -EINVAL;
> > -		if (slice_ent[i].offset + slice_ent[i].size > total_size)
> > +		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
> > +		    slice_ent[i].offset + slice_ent[i].size > total_size)
> >   			return -EINVAL;
> >   	}
> 
> I agree this is an issue that needs to be addressed.  However, it seems that
> overflow checking helpers exist (include/linux/overflow.h), therefore open
> coding a check feels non-preferable.  I think check_add_overflow() would be
> the way to go.  Do you agree?

Sure.

regards,
dan carpenter

