Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DF46C821
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142083; cv=none; b=UBK1TsnaJjK2yHYD0LZLOdiuIazFourvVjCG2cRG3jwHyX77P9zWcFDWw2XvtN/fXlcsJF+lSfLZfKJaLAcBtU9rl4K7unvlMWd9Qm9TL/96Qu8hJ/HySMpTixh+IklT2HXHIuaGx6pvKZNZ3YWNEbuPsXHM+mj9tUtclmmkI80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142083; c=relaxed/simple;
	bh=RjrTG7dlCmvCQaNfHYqGMEjUUYG2no0tg2xElaQykwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWmJc77hCLoI4wKGLq3ZRz99DA33qnH6xYd1aon75l2SPn5GX3JOT1BsPhAe0WVNpGYhaPtaZ3o2BBcOLYiQ5afXVywrq0tBjHu9pCa7uutnHqo113T7BZFWyHPCU2abF1MkVAjpq3gCUGEAWly+I0RYjA0khfSRjVgZH2OCWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmK3WKW4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmK3WKW4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so4008203f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142081; x=1792746881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g15pUqXB/gZtkjFNMKlMPbbN6ka4f/G72oFikrT6H5k=;
        b=ZmK3WKW4KungVImkW5V9ijnad5eDZWT9PNhh6IgKdI31jPVtEyccCMHjGJpfI29aSm
         jaD8iR7qh15Ypt0j5+ZCkagwrECjYPGubSmiAbw3nTWs8vHJ/E6oRnp9fBoOzvHPTR5j
         gBbRvE0sefikPaO/ZcbOuIwQidLF/fHyShLweLX53nR3S55Kzse/ooe7/WmXt1rx3LJP
         Uw2Tczfri4MdvC0YyyHiwcRKBLgAOza8Cnc+qp+9eAOc2NK06m1wDHtBYOXGoqSkap6l
         TxC//pyeVH7hF8FsptrMG+StAfCItSrab6E2ocb/G16hjfbYSL3VpE+sZwrCOlv6j8tq
         RNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142081; x=1792746881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g15pUqXB/gZtkjFNMKlMPbbN6ka4f/G72oFikrT6H5k=;
        b=jdBnFxto9EDtTWuaCNcvbvftsccuJDuxeF3GPMnTisfiXmlUDdHfhJbqbNf5vyyNe4
         aPrCtqN9tMVjr+BTOjn5kZ1do+HTLEG6qklXP6VDdaPXdU4FQcO/LX7w8G2Zkvljqut6
         C625m88O18HqwNNuxrj1bIVtbIoCAbWdmmdO4jzKwv0ccCtljrjMa6TtS/o9J6bh1Xmf
         BV6LqozdShsQIyI2lbmnlPIaxet7q/U8oelHh9CzhfTNtGxjGWClCrm1nAgG6ihAm288
         OGLuWBPJfTJhc44+YZ+bE6GnmmFMhm+uSiBxZL6L4kTgfX5E42AWzsgDJ5PoWDFNCwwN
         /wMA==
X-Forwarded-Encrypted: i=1; AKwUvBxgz5Uq3hsjomX3uS3b0kF4fjRXAwo3nFnaSdTbMUZS9Gtmn+KY0bYvcUOAAlRua0J96LpgyR+QxXlDjZ9G4wA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJsJdxXMmKjs6ebGj4o8/1j1z5Dq6C3oazrd7y0DYv5q+txTGM
	grMmhfczE6Bfb5WXO9o9WKLaq9YHaVRAOyb5zbhq9lltoEF+UW3zRzgT
X-Gm-Gg: AYBFou05Tzx7Q32A/gMTPNZ0nDubyBKVzSl2hMdfcV7sWAMloBozstQyVVZBs2OxN6F
	+aNJix8vnje6auoSnceWQU8L8ijPQRTDW9MD70o7xEDLE5UvGpcSKlGMbKFfPqmZ75WgGwbfeYg
	s373/iLekCYqgFHIHsgwm2Jj1SiE4Gp4asqL2GXg+HJaCG9IVANGUowgqM5nPzOitKneEcXJ+5h
	4llBIDKrj3t1ApXBDctlNg8LtFZYzfCe4JZohbDISdEELoS3+BaLxAriSx3IDru7QmBsJHlf4f5
	5qY68tqVWDgeImYc3sd2g6YKTktYJqy38vINDpUECPILOCjUKD/6siUF48b0HzeVWtd7L5NM37i
	tXIIF+Rkx5Fb8g0cwEQLQ3R8ad2sEYHYTrqSv4T9e1RIgcWk1+mdbOigtUT9mq6/5P+WqM225Uo
	+PAR30rVnCeLabLxdsjpP9/V6y6pCuh7A1qZg2HKzaI92haRaeXviFymv6JoQVsDmL2B8=
X-Received: by 2002:a05:6000:4694:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-48de1015749mr17082052f8f.13.1792142080619;
        Fri, 16 Oct 2026 02:14:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm3352171f8f.15.2026.10.16.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:14:40 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:14:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alexander Aring <aahringo@redhat.com>, gfs2@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	David Teigland <teigland@redhat.com>
Subject: Re: dlm: clean up a type in waiters_read()
Message-ID: <atHq_LLtPx8SXMUt@stanley.mountain>
References: <ar4BZ26gjQEjZgIa@stanley.mountain>
 <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
 <CAK-6q+heOWNY8CY8dgotxzEeFC_-huHnnO2pgH8kJsJSGryOtw@mail.gmail.com>
 <c8b6843c-c87a-4330-b6f4-e556117a8026@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8b6843c-c87a-4330-b6f4-e556117a8026@web.de>

On Tue, Oct 13, 2026 at 05:27:10PM +0200, Markus Elfring wrote:
> >>> This doesn't affect runtime but "rv" stores error codes and so
> >>> declare it as ssize_t instead of size_t.
> >>
> >> Can a similar adjustment matter also for the local variable “ret”?
> > 
> > What do you mean by 'matter'? It's declared as cleanup.
> Can the usage of a data type like “int” become more desirable for “ret”
> according to the affected function implementation?

Either way is a defensible style choice for "ret" so I left it as-is.

regards,
dan carpenter

