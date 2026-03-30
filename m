Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39383B47D9
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863367; cv=none; b=uZw9zl0v43/UaB57LT1aZ6kGlwN0fWPFsEtGDLpvRnaPxV+3uGGBZr3hFn9VrdGdv4Q1AJ6Jq4yf+jz109ZchVqSnxAWRNY5MhUAx+IofrY8/a+crRnbKOL+fXrMVTYI8ye+VH0Kqn1XUw0+g3vijFRxmGvUBHAg91DKHQUb+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863367; c=relaxed/simple;
	bh=IGxp/rqI38tyUsvOysuytbAr+H9oKCSZ8vNvt2yXXrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJXqU4EAjGvinzVn7FuoZ5vMwd5r5hhrR2zUmTdTPSjgJXKk30mhueyjP02scCEdofq9o3jiPNbjAkVHBdoeDDGCRQIr6VtmDFouu4Ndnhmt4uIIZh3aSBlqPPU8tWeegc7yjI2SGtsMFjnkQt+QzzlhX3Twi9pfia183PM99Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtfVvS+a; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtfVvS+a"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so832104166b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863364; x=1775468164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGOT0YD066IlL0iTHorc+otlHQeCNtqJmMfEev18gTY=;
        b=OtfVvS+a0C82nZ1K+psfpWHIj21BSTVvdEIk7qpadjycyLn2koySMgcWTiB4bJc28H
         PktSeDaZKZN4tfSGgGzzovWPrmuvZTvudbXMlIDLTgHzrztdqlsvrsamAGN8jE1e4h60
         EVe09rGQw5XgtfH4DYjtDxwjeNPmIxjKGRm3CAkdFQQ/EtXkeTn79PjWNhyq4HJOt86k
         zL/VtuyKQeI+1dxFUpBkBEz12ZDCRthOR8VqejW/5glAfVc+LSkaZvrlq86LLSs7v2zd
         yZD8cWT8WWclpGeT85iETXYrE27N5G0j3BRWwC0ks6lkidfyIcIN2Qs7gwvZuvgqTAKV
         dZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863364; x=1775468164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGOT0YD066IlL0iTHorc+otlHQeCNtqJmMfEev18gTY=;
        b=bU764tKKqgyus/7OkxwXqaqH31jEKewHOwa2UsXv85y7n/N60+PZv2PxNtJUjYhMQV
         lunMkzxsDZmBptV5kP3837QuxPpl6lU/IGHWOJnfcyzw/+t58jbHHngKPwQAhi51oWjs
         wXIAwW9oEakGSLWaGBYDynucTQXSD3sNoZWwEqpKcZQJ03AtLL5K+nTEXXRL0RPfApzB
         VgXtjNhDc6Qv6dz0jjnc879H9lgf4Kv/1GogPaSkYpggRBboFBvB+3TmIqAS13kS4HFO
         jMYzT6PmT1aoUFPHMgWpnWE8HT/ou9FME56y3tObkzsg6bPUGWX1BZOARid0Rj24IgXD
         sCKA==
X-Gm-Message-State: AOJu0Yw+kzj/qy9yeBwo10E953NW+jrfMv5cHpgHYlzJPZzjCpM/KHj/
	tTXFb54Rofg7bXCaKnlKNrW90klVXgarm7pfycPNAo6U0DgiUMl6vUqc
X-Gm-Gg: ATEYQzzec3kwjFJrm1067LD77ywhbU9fb0URDh5L53LrXXbgLbS2iJ/lCBctWaXmRPv
	7ePbpnRz2YCDwfIUO/krJpPh1sVVVKSJkQHePTP4YzKDsnq6q8dy8G6RDk4CTNgJeusg9971ajo
	GdX5wqkJudIORLL/KMXuySCmrPc+01nhbIWe6YTbha3++33eZUkCrzZdCqwGI4OSpb7NTrWjpeR
	2sd930idtrrm6go0FY+2GitT2uNNg11yoRGctCz4w3XRE0q3ObjB4yRcnbcgXanph5WftqE5RBD
	THJskcSCWBQO7NfceMbiD+pq+/UO4ifmJ3p2YbKSOGog9Zu1WQEj0NJXq3jNfMgO8WaMlrz7a0n
	RjhWFHxU9mtDh1x9CS1tHttHpnsU/1GsX9JvMAZMgvL2yC87C2zip+2BM2JOMzWY5aPSTCkdCYp
	YQHUXL9xxVa3XPd9OVmMHkHaZ6adv3og==
X-Received: by 2002:a17:907:c312:b0:b99:7697:76cb with SMTP id a640c23a62f3a-b9b507a7556mr630119766b.35.1774863364189;
        Mon, 30 Mar 2026 02:36:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e3aeesm268091166b.48.2026.03.30.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:36:02 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adrian McMenamin <adrianmcmenamin@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Ensure Dreamcast VMU code keeps building
Message-ID: <acbc0m-O97qdc6Z6@stanley.mountain>
References: <CACwZE5SJiHmoufCMAP5pJtRn=LRN9Jp3=zSh2j0UoUikwVKr-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACwZE5SJiHmoufCMAP5pJtRn=LRN9Jp3=zSh2j0UoUikwVKr-g@mail.gmail.com>

git log --oneline drivers/mtd/maps/vmu-flash.c  | head

The subsystem prefix for this file is "mtd: maps: vmu-flash:".

I wouldn't normally nit-pick, but you're going to need to resend this
anyay.  A better subject would be:

[PATCH] mtd: maps: vmu-flash: include device.h explicitly

On Fri, Mar 27, 2026 at 06:12:30PM +0000, Adrian McMenamin wrote:
> Make necessary include explicit

Add a period on the end of the sentence.

Why is the include necessary?  There isn't enough context in the
diff to see and I don't want to spend time figuring it out myself.

When you resend, send it to the people from:
./scripts/get_maintainer.pl -f drivers/mtd/maps/vmu-flash.c

regards,
dan carpenter

