Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUVjIBxY"
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A4B110;
	Wed,  6 Dec 2023 22:00:32 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db5e5647c24so1488641276.1;
        Wed, 06 Dec 2023 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701928831; x=1702533631; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QRHCxpHCMlXoUxYx1tdD59XOr07O3l50BkYll7WRfSM=;
        b=NUVjIBxYr41sVKIXElw7F2VLrr5YIlp8Pg91zL3fFxlFbFXZGQ2CaWwrSIb6TFBwqK
         t+4JSFaDImqI1Ra36zrbodrb+1MXwQJT5GQ9tj+XuEWA/Obvb1m6Sy4fTYoXnvhj3mKQ
         tz4IybywDH+BOxfXIGSBcCV58T7iQcw2EHbXUGWwwWzmcTvUn2IX9IM7eH5Fm1ZGNvry
         ITIP30umEEn/5A+D5kIwmIrBOygclz+E6SnJPiwFg7nCOJNJrgb48E/lvlsTNC/Gmvd2
         HMWuRfSnBdiU6XX8Xy77m2MYbxxwsg1WL9d1in5QnIuKYEtG+rstj1ZKVIMfPcsIvYQ4
         GqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701928831; x=1702533631;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRHCxpHCMlXoUxYx1tdD59XOr07O3l50BkYll7WRfSM=;
        b=Zz3kembYTrEghsPjK7gCkCFvAfFVdKK/lI730LFai2r9RuvY/wABuKZY55Q8YHIyo7
         m+PG658fHSkpXZtGC9y5sfoV13ybT4dGNCaZ9dRSuWHQjRZRXlYYy0U+CUm/X8o9Pa8T
         wDj8cJZu/uys43IeKizP1u/vYsOUkSurBQSH+8sYJixfj5yWEm+mPnlhcvJaxnOhogPj
         g0rDQp7VdSv3JaWnYfWc2qaGYM9dq1BazN8JkVD9tJZ/DIWxiyC2Z1rkZrGxy5tM+FD8
         Wbh1CUNUX8VVk6afRNDkyPxc7YsNz2Zk2sObrRUjWZoVuEeWcZujTNBRWVxm1zNJGIb6
         f9PQ==
X-Gm-Message-State: AOJu0YwL3JQBRsOPFsh7ULYwdczIBSFMErA/W4Rz99Cz7SHM9os0DR+F
	3va0+0ylAuuzHY/eaEdAnx8CYTHTvJhQWwAK2Kz0cogYXXqY7w==
X-Google-Smtp-Source: AGHT+IEezmI1zlnqy3nahzvvFvDbp17zXRddh+K+JICaqddfWPc+CtYcp6tGDkeTlrkENZ4SvDgltAHbuElc8mYApCk=
X-Received: by 2002:a25:3295:0:b0:dbc:2f73:953f with SMTP id
 y143-20020a253295000000b00dbc2f73953fmr629261yby.48.1701928831496; Wed, 06
 Dec 2023 22:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dawei Li <daweilics@gmail.com>
Date: Thu, 7 Dec 2023 13:59:55 +0800
Message-ID: <CAG5MgCpdTt5ZpSVg==YN92zr+0_ug+3sUOAwdjXJEu0a1BkWFg@mail.gmail.com>
Subject: when/how is the schedule() function actually called?
To: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-smp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Greetings!

I am reading several resources regarding the linux kernel scheduling
in kernel 2.6.34.
There seems to be the periodic scheduler (tick_periodic()), which
invokes the scheduler_tick() function, then the entity_tick()
function, and then the resched_task() function. However, eventually,
the resched_task() function doesn't invoke the schedule() function; it
only invokes the set_tsk_need_resched() function. So, it is only
setting the need_resched flag.
My question is, when/how is the schedule() function actually called?
Also, I notice that at many locations in the code, when there is the
need to do a scheduling, the code is just setting the need_resched
flag. Same question: when/how is the schedule() function actually
called?

Not sure if this list is still active. Appreciate any response.
Thanks!
