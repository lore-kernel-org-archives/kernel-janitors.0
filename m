Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297FC2076DA
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086001; cv=none; b=cgbLd0wzkVOGo7aRcjyeYCBNrpizjwZ6behqcebFQisCcMSdRolGqeBO+npkn3AOT3ZM9rY8Dcq394+duPkHQsxRiYDqYmOwjbJVDayBBELXPlLMAZcv4iK2q0Fh2qQyWuoNGlwlcXk7AjR2iiMZoVMmBM5jL0rCQh6Wm2Ti6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086001; c=relaxed/simple;
	bh=CH8Z2vUGmqSOv8MdEEAfce6v4Ceq6JjaXoXH43jMqsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBWGnhGZQoAW6vBBz+fIPDexcr0jMbgOuRKnVaDZ369zqRFhheHHZg0pgEdKv6N6IGRrtWH1VV5dw7yGnuwFNlWmoPZx+YCcpwMLJPr7VOKinKad60bRsfAxyZBC5Zz+QN2UYHTIjmNIClAJrhjaj5pHBlpNIqifgWVI9nnNwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GY0rAtI1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GY0rAtI1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso322990566b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729085998; x=1729690798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gtc/wvZtgZRYhU7nCyuDdZx7Qqo7TOKN4gjIik7fZg=;
        b=GY0rAtI1qPDTf5lMMPuU6QUZDYKr2mASZozpq0t0qfzcwDzWKyXRzHTA1+8l3ajjLf
         a6kul5DJRw48mlssDBmEWFGrtJctgjD0FLOsnApjaKE7xqmGbw70kDvdfuUKJg02W5Jy
         CIbVqhJxac+ZOAFIlh6QQQIneTyPMN/szAcCCDZO9mAjnLxigyYv+dM61S++bDo2RwDp
         dfKsacjHcxt0WWOMR8VRzPHgA1bba20LJPdDxYcglH3nvlFamncGSAy+MMaxlHfYwtNR
         a85l4SIqKp2hgI4veCgC5ipnMHpQNWb5WLtMFddIHYJxVLPEvCD0N8OEgxIGy7oIpAxC
         0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085998; x=1729690798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gtc/wvZtgZRYhU7nCyuDdZx7Qqo7TOKN4gjIik7fZg=;
        b=ZuZSsVQpcI4PRJ56QpBujgzSRE01TByyJKH/u8xktxeUSTXqmO0SPb1fBP2KEop2HG
         eIg9YhwDxhvbYYxD11tIPlIoT1CuM+X/cH1IC76pHAL+SZx9Yv7QMHIsRXmbvoi5k82Z
         X4qzHpin37dnvFlcznWWQelDRyms27hZcw1LOktEU3fC9Q/UlzABIidjBfV8GH7JmJiW
         3IwZxiXqmEpSOeB2d0IrEZQ9gw9SJIZj9kg9fv/wWvNZhR0y8goqZzkq3plBbTdarm1j
         brf7nPe7dVdAUT17RCVcMEXEySTjD54UwmQ4IQ7sFoiP6f7IDDYlj6Q6OaXIbc7epLmk
         rC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYOdjZbtZPi50aMY6FRWWZZtxxU0Y16gE/LvVANi4ojB+Iwk1YDp2kKarCcgSUIZN/97TBTp5emeT/tPrjW3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCFb75wo7Mm4UPuKcVeJH/fl1EzGg23vVsspv8jnXbzNl477A
	oDdOJ/FxVwD6V4Lf7lYauWQiOwGXSoev+yLVKxZ6pq/l4BvGaS1aY/sGvIQwLvM=
X-Google-Smtp-Source: AGHT+IFAfsjHoVSlLzL1ZP/h9wEBchAr7uDR6VPsl4lgA/a6ZqvM2Wm8rkF3wN5KH+JSqUuZ0s+N6Q==
X-Received: by 2002:a17:907:7ba8:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-a9a1778712cmr810115566b.20.1729085998546;
        Wed, 16 Oct 2024 06:39:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844899sm186338766b.178.2024.10.16.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:39:57 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:39:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: ds90ub960: Fix missing return check on
 ub960_rxport_read call
Message-ID: <18412b95-7d34-4a80-940b-e5fc5bec3ec9@stanley.mountain>
References: <20241002165329.957739-1-colin.i.king@gmail.com>
 <20241016094111.7f5e899a@foz.lan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016094111.7f5e899a@foz.lan>

On Wed, Oct 16, 2024 at 09:41:11AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed,  2 Oct 2024 17:53:29 +0100
> Colin Ian King <colin.i.king@gmail.com> escreveu:
> 
> > The function ub960_rxport_read is being called and afterwards ret is
> > being checked for any failures, however ret is not being assigned to
> > the return of the function call. Fix this by assigning ret to the
> > return of the call which appears to be missing.
> > 
> > Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> No Cc: stable. Please follow the submission rules for fixes as stated
> at:
> 	Documentation/process/stable-kernel-rules.rst
> 
> In summary, all patches containing fixes shall have a Cc stable. There 
> are rules there for the very few exceptions where a patch is not meant
> to be backported:
> 
>      Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
> 

I don't think this patch belongs in stable.  It's doesn't fix a real life bug,
it's just static checker stuff.  I also don't think we should forbid it from
going to stable if it's required as a dependency to backport a different patch.

regards,
dan carpenter

