Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11125395C
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Jun 2025 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202711; cv=none; b=RPfYY0zlK75BTwCrbG4ic+feOZVZ1qP/QuMMUhx3NybNKfmRiXletolmiKr4dgMwXafor+lJmZLBl1/yF/BO4++Ysro7dE18IiQs7wGDUSmDyPgYr99G8q+KEc6MfZCbK6bjvAQQPN1NUpr7LPtJ/RfgiQBHP3GKkmTdp5zkZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202711; c=relaxed/simple;
	bh=jZh8jvo3lyT78zBIAuub14qMFwnpBif3VNd4GueNpac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IoG6KkT9XHAK4t/Nd0VXIn7eh/VY3OsjSa1n3iQmFvzsSJe/ydslC1NsfeGO9Z+SgWBrIweRFLTuvpl4mUGKJCBxyHU5oxS9e9ryx/IbxxIMAccsOWBuA7+udhIaSdfMXvNRjzGp1/MNcGRV6YN7bUX/Yv5wwOq92ZtwifPHq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-WGlonNqOP46Tr9LW1Mcq6A-1; Fri, 06 Jun 2025 05:38:24 -0400
X-MC-Unique: WGlonNqOP46Tr9LW1Mcq6A-1
X-Mimecast-MFC-AGG-ID: WGlonNqOP46Tr9LW1Mcq6A_1749202703
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb9c80deso912011f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jun 2025 02:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202703; x=1749807503;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
        b=Gyr47VNd+t+5lSQt0INVOW32tSUOxKmyrlBQ1jhIMb3JlAWHEAO5aQHdLazWEwCbZ1
         c9tm9z36dWEkzp+f+VNmgtwR4ZW0F13RUliByc0MDD6xDdmATWF1CE5HZ1TCxXt8vriF
         HUpcQi+drtTLbZ4ol+++LzSu6NVwPEKjAYVIU3P9Wa2SEFTUCKcmnX54bBOStkgN1CDP
         ZmGzrw3wsegdh1D0nV4GUyi5uLyFZbRJA/LBfiJZkHB3GI49uoPpeYx+dxlHNwpH7ltu
         u/Y6mpO8xPQZ546dJQaS/bTxcqWE0ZTbyxNjAG8E7aaT+oPXVIa0mMgNtyxaDAGDOFaR
         gHBQ==
X-Gm-Message-State: AOJu0Yzaa0KYwF9u+DVqvRkHUeCCnM7bTn8jZ1S5qYIsrI5FTtEozPOn
	Amsva7l6nLPXq/w3w7GlToBJcpSM9ORa4wFT0YEs9F215g7HHJgMaxcyiQQH4WgpybFCVpQcAe0
	3/E08sPwhAqaeBOjJZvdkE/fe8ZPcTipQMmCBx2l6/UjyR27TJ/qV4Er5g69thcmVQiRlqg==
X-Gm-Gg: ASbGncsbhPzP7NRCndhuoVKrId1Vd9G/4fX9tBzjGzgcFLbErCSLbEGDuRBzcSbmP3+
	jFeTW07LynPsFQym/bZK0n+gkRQWPh4JpubYmC79LIbVOtGbEjdwSKdAK7hOAePB4Im4fZZJuvE
	Vg/08UPRFnOCca3pxS+F6CZd+9V68/WChqkskTtYPsWN56bKtyR+a97biL+mH8j6seVYHIn5F8N
	hMlXklhcsg3wgGwU9NAsSArNq/BSCCeeMd1p6YLdg/JboAGKSP1ahiJH4770WdwcDO7ko5Jtxll
	X3K5po4pNLrskIhaOFpnluKJRouYq/Jzrn0QcQxj2z6DjLipcwhbuJNayW9vf/GFrtYzEw==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442150f8f.13.1749202703120;
        Fri, 06 Jun 2025 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2hgVVQ9Gk7GHogece0bM9/ZswNLeykZTGpNB8vcSGMUSbHrTwRCq1omPf2ID9eCFShi5YvA==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442120f8f.13.1749202702694;
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056122sm15416265e9.6.2025.06.06.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
Date: Fri, 06 Jun 2025 11:38:19 +0200
Message-ID: <8734cddxbo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

