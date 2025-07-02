Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A02D63EB
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489080; cv=none; b=n8fDDQejGSv/ZN6QphxvjlGWX4AINnzSjlz989oOEV/s2Rn8uQGUlJ1Gu9ZuhzvLqcntxoZJNK4893MpOwByU0Ge3d/WNy7X365d9xZCGSLaNrvr+0+5c8U4YGbKDTufuL+7H30zlw1NC5EWs+7pss26bIp+KuMBFkf+Na8/uNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489080; c=relaxed/simple;
	bh=ZIK5FIADrHI3Qbw5X9+PJYbVuDPOLvIX9tR0MavLlf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enYQcR3jOAgHf3ddSgyL2lsM7ZxHNAA3caLAx6J41YRtsa3mxbGoy595gs4awcVHG95qAMrX/Ux+tLxtzWBr3Y7cFxvf0uAbLg2pWUxFOHAyLAsHoeTwhQpemfNqJKJ+9nDQJe6xv0jL3MgLWztdy0talk0zQNYp/tMOA19lVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Byr6OAqj; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Byr6OAqj"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ef60dbaefbso3408273fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jul 2025 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751489078; x=1752093878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vuTdU5StZnbSx7ggsvliRVgwm0+SXRQuop9hvEJ1mRs=;
        b=Byr6OAqjSfqzrVavhxD1onT0+J0mHBCG0DyHw7vaex+kK9pcD0rl878kZ4Vd/91NKx
         D8ENx3jm3EAuIyk2ncBaHcRxcKdHzpFH9u4AbxIpz78HEPzekqkmkKgqsILcbMNb+oky
         aIOAI/kH5rfbepHWGnj8FXs6C8qB3p27hV4w+xv9R6F7oMfJS2GwAsA8N4yFCUHeJnAr
         nLXpw8vyZdLu2kdgXzi//0T5lQBfj1UVlSFmX5W8VTlHYd3snsZu38FAGd4MsFp2bq2e
         rSYKuSb6xhzpCpZR1FRn+s334u95tRdF5+8WQDVnp3D5qIqkC8y2BFOIQ6j+dowx1vVQ
         R+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489078; x=1752093878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuTdU5StZnbSx7ggsvliRVgwm0+SXRQuop9hvEJ1mRs=;
        b=oq/ROg4/cEfeV9n7u7uocU7NPz7myfK27YRnBFS09bOXkNU+/bVX26MMW20gDtviin
         fIv9kcLaLP/xToh8G8WXrUdz2afZ+T96+mCgz9X4h8hfL8RXPnd9xuADv7OIMUi6Vvis
         kJBN47/qR+bDJH3pv0QCyeC7LS3BX4I/PwEsfFmeqpGa1+nfgA9Ja8Xm64bCkkluWdc0
         CC5qknrhoOzh8u1URjiRV22PC4TIqF0I7ZoqmCEQCGh4VR/2pJG506KsX8/fQq95N6+0
         JF3Ucs1GKXI2W40bgXDPJQJrvFbHRTg6yMvnl363+9mXRz86meROKq87tGqFZ3wL9vyb
         gqoQ==
X-Gm-Message-State: AOJu0YzwRJye/Kg2a5F4ul2ki9u5RSpHJErUD+GIwbTZGZoWI8gptXF7
	dOSszb0t+189lWIrYGvIv22h2JHOUPwa8O5zJtPN3J+96/u7sndSh2SJCkA5M8uMDao=
X-Gm-Gg: ASbGncuCqJ5Mrw/yGvIwr+lLcHtwXDSPQwZasUYmxrDj/Is9CzAFpST2VdeyKi5OY2n
	7fAdwG2SR5fac/aHFheCG0v5TYHjujRvv31wTj7CyVYT0wgRjJp40zKKfSlmSYkpRsiN9PqsDi/
	m+NDn4LaJCE2nQ5r0uAxV8k+O5KzePsZBYLMs58F1QuKmVXT5HaCfOFWgZgT8xc+nXk8Pl63o4q
	1urq1AKVW1q6As2t8LSuVlHz0cS7ePjtaZdUszd7RyZ7ze9VKQv93VDNrfAo0D45IlfRVUhetWr
	GF+CJ/QW6N3DD9o52B19qFwZfCKICXgkqF2jq0MugDxY6+mExf1RYKQoX+kbuN9nokyLuw==
X-Google-Smtp-Source: AGHT+IEDEAnDPw/0MrM/EUu6CnwLIgv2IiIX9bN/bNyywYb3+pxQqD9rP1d6A+Ud4dq+iMa0XfF+uA==
X-Received: by 2002:a05:6870:b6a9:b0:2d5:ba2d:80df with SMTP id 586e51a60fabf-2f76c67053fmr701504fac.8.1751489076955;
        Wed, 02 Jul 2025 13:44:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:7056:ddb5:3445:864f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd512dc69sm4040925fac.47.2025.07.02.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:44:36 -0700 (PDT)
Date: Wed, 2 Jul 2025 23:44:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruben Wauters <rubenru09@aol.com>
Cc: kernel-janitors@vger.kernel.org,
	"Robert P.J. Day" <rpjday@crashcourse.ca>
Subject: Re: Kernel Janitor resources/organisation
Message-ID: <dafce66b-8ea3-4f68-b8f9-6016334aa318@suswa.mountain>
References: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel.ref@aol.com>
 <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>

Hi Ruben,

No, there isn't really anything like that.  There used to be a TODO
list with ideas but the list was never maintained.  I had suggested
that people add "KTODO" in their email if they think of a todo item.
But it's hard to actually do that.  https://lore.kernel.org/all/?q=KTODO

https://lore.kernel.org/all/20ad879e-689b-4b09-823c-4cb4f9b010e7@stanley.mountain/
KTODO: basically create defines which explain the length of char buffers

https://lore.kernel.org/all/0a1aa580-50b2-4657-8308-94bffb194aea@moroto.mountain/
KTODO: make checkpatch.pl warn about files that don't end in a newline

https://lore.kernel.org/all/CAKXUXMxSnEEYCtvxVN6Z_QuDTEpLiq=Zsz+=g=kNzwKuLeH=Pg@mail.gmail.com/
KTODO: Investigate if the make checkstack tool is really obsolete
	(Arnd would know for sure)

regards,
dan carpenter

