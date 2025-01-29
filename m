Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4602D627;
	Wed, 29 Jan 2025 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144353; cv=none; b=gSt5YXQ0VKpTagEvXtrX4WnC5HX31wfYH1VZ9cfmincNHL8Yne53Ym0mHtzw/CG6K2vcAuFZSquc6/u5IcgaHKSQ6tmKtTG4dWn149RB83GvNW1AIZqrSjSSaCKw7ZwYhCqXPGhoWxb1vtTHH3LbR3MvZfg8jTM6FPIHuCnKgEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144353; c=relaxed/simple;
	bh=fPUqY1YN3qIsOziWAtXy/f/sllzF38CUpxbQVy18CRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3KfedqK/grAeMeUHjVWlhlUP4WRvzxyce7EUykfxBB69KBU/FXG0QcgpcxK0TBOl7s8s8IT+1l4rcVTN+OW9Cyt0SBDOoT12yE7dcTOgIgoymkIF0ttIRcPXgBuVvsF8cAn4dWRoDIePG7LMQpRIXJHCPIeHKcfw3CK3KEFJm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Qt53ijwN; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Qt53ijwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nZMMrtTMI7zmm6JbHCMQpOFuA/Odui5O1E7ucxY9VgY=;
  b=Qt53ijwNCqXg72CQUXreits+Ex1uxpjMz1/1OLR2Rzkpg2uW1l7hnBnr
   VyrzWskWwiAH8vyiLKu+ePIIOvMDOIw2pjPX8IEDLl5Fo5JrWVIuvA7pP
   DP56Zk37GXhXSW541n87/U+Yit6VZNsYeZj6chGaoH9jCWNX78iUJoUmn
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=victor.gambier@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,243,1732575600"; 
   d="scan'208";a="205538979"
Received: from ptb-02008469.paris.inria.fr (HELO [128.93.66.153]) ([128.93.66.153])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 10:51:21 +0100
Message-ID: <35764b92-edf0-490f-beea-c36207de4cc2@inria.fr>
Date: Wed, 29 Jan 2025 10:51:20 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Markus Elfring <Markus.Elfring@web.de>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
 <fe13604a-2626-4641-908e-87eeaca53288@web.de>
 <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
 <fce88885-8c10-4f22-a19c-3b04430aec3d@web.de>
Content-Language: en-US
From: Victor Gambier <victor.gambier@inria.fr>
In-Reply-To: <fce88885-8c10-4f22-a19c-3b04430aec3d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the patch :)

On 29/01/2025 09:46, Markus Elfring wrote:
> I prefer to avoid a temporary workaround when a more useful solution
> is actually simple.

Markus, this is not helpful. Either provide a fully working example or 
stop nitpicking useful patches for projects you don't maintain.

Victor


