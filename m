Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C429224236
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051267; cv=none; b=Q1EFvSo6RKr/Vg7tXkwqylsGEQV1SpCgP98rPhc3/fM8cA8tGAJk8JJeUfqy8SXkEynIa0oVdAy2jcahCSNtxSPprFPh79Qd3thOgGmGhndpYAO2FUd9gW1JyrZHCjTU/5hBgeyE0pmx6YIpFbOnug0Q3cBTw1/PSmkDUBlHiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051267; c=relaxed/simple;
	bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6X7AqC4/qi8h4wHBpaFeVyuek45vfjartSSOmCyzkM3kHPk3O5F56OYS+jTM7RxOOvibt900k7J0Ml8zT0bgWq7uT4N6JU5J3aMPvJbCPexfqcdg2PZIZmxtQ9Zj2dB1hIRWHmW53K4/iEqCuY+Hppjuowpppnr5thEZqTAPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4fn8nvr9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4fn8nvr9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bee278c2aso16645301fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746051264; x=1746656064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
        b=4fn8nvr9x+3k1U/zHznXCY8BeZx9Iv1CFiM/j+MIN7LwljExhjWvoKTZF4d06i5rtn
         4ULpfk1QcAY2nGC3iZleLiUnUVB5bTCyzam2J5ftNgRCfe3clUYx7fgmA22G55RebHPe
         xP8MC5st85GGNwoTJlNUkmRSoWXoyMkkogFwfKQythFuPqL0I6u31/vVOQEAr7Cys4aK
         hfWCzm5/mcL+swWusLwxzfRFpGV2E+U894yqReHlIrTGcjo8lnYYUCj8qe5rSQ4VhPGi
         QMMn9OwosKFv5QEQXZ2kBRkrJXpOhB8TLqtxEJQ2smcFPMtj/Br5wdnTQjDVLMYJuSjE
         lDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746051264; x=1746656064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9WDxKmbdiSpIlDadQAH2ZhEjw6NkGRgMf5OeffVS+s=;
        b=YJb9osH+X+jb5h3HRTZQcvn8ggyzY6EqXbz/OoC/BKfaczuAOBHNfee3PFwdNBNpRL
         oVMgJS6PP//5vCzJUbrWz/XjjlpsWQBjPbBuYiUjdDKHC00OQqU/uhqjp0ZM7I4opT4W
         QkyG+pPVOIFw/JP92OU+SRO2uay1Kr4f6pUBKLzrgqRXZD2Q8IWWXEYcrgglbKoTOVJU
         lwdUXdmnp23k70rsM/7vxfiGA0cSY6SZGmM1wOGFK0zXeVd0MS+rpY1e4ObISI9NZDSq
         9QBX+f7re9xf14BS0HGXESZ2ryitCiak1Is9qiSVvUlvviSxC5ZRe28UA5/8gv725zFO
         Jalg==
X-Forwarded-Encrypted: i=1; AJvYcCWr6b4H6obTYI6wLwTzk2COs/Ppc4NVGVNomjsPR9TWfgFi9kU3JQ5cX4pMAZFO4Wu5I7QG37wfiZp5zNdWOjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVFqRdPFpOzkHJiGlDqY3glPh2jrIEA7EVnF4I8CffMlAtFAq
	g7vBE0cAVaDZspKDkT+4RIssRxeKXZARG8ebAoHSMsAorB0X9iR4n7nANLB0rtVcIlAAxVdWHwM
	yCfSxSmAhg98eK147cZZVcfv6KmdJ6peuEFUdjiM3wow+gsJ3
X-Gm-Gg: ASbGncta75UQh+jFZkM+1VNWSFjqUGa5bO6mEnjyjWSF8BUPbpojOnchmzD39az25Oc
	WxexnxXN9YZEOlUNMo8zkUjt+GFxW8nYY+hoPB/IkzDGfj+FWHRO+UK0FjFT/uAeJS1WAgiQCCn
	NLzu0TwBlVw4yWrJ9CgDkh5QfnjI0Exo0cyagX+FSCJJaEItDkSqY=
X-Google-Smtp-Source: AGHT+IGcNh9yw9nc4Yx/ffRiXl092nCHuoLn11PQbii50lPqD4q9Py5oNhPVn6IHL0f3qmlN9GjqYP02rpgrtGeBNnk=
X-Received: by 2002:a2e:a542:0:b0:30d:6270:a3b4 with SMTP id
 38308e7fff4ca-31fbcf4c9ddmr379181fa.15.1746051263441; Wed, 30 Apr 2025
 15:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430032734.2079290-1-suhui@nfschina.com> <20250430032734.2079290-3-suhui@nfschina.com>
In-Reply-To: <20250430032734.2079290-3-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 30 Apr 2025 15:14:10 -0700
X-Gm-Features: ATxdqUERc6GpuG98Jh6BtDrV4nw-tcK2ntbbVRGaQhHKl6XNSl4xdHGIuhRzOR8
Message-ID: <CANDhNCqgQ_c3_fsUcUcuUoiUrHRh267PiCSvb_XXU5O2rP8R5Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] alarmtimer: remove dead return value in clock2alarm()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:27=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> 'clockid' only can be ALARM_REALTIME and ALARM_BOOTTIME. It's impossible
> to return -1 and callers never check the value of -1.
>
> Only alarm_clock_get_timespec(), alarm_clock_get_ktime(),
> alarm_timer_create() and alarm_timer_nsleep() call clock2alarm(). These
> callers using clockid_to_kclock() to get 'struct k_clock', this ensures
> clock2alarm() never returns -1.
>
> Remove the impossible -1 return value, and add a warn to be aware of any
> misuse of this function.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Acked-by: John Stultz <jstultz@google.com>
