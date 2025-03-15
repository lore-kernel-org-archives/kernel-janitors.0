Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C617799F
	for <kernel-janitors@vger.kernel.org>; Sat, 15 Mar 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031594; cv=none; b=LY20CAhbK581eaYqr809hYrnFyVYWEMEGBkbTMee4mgGd+DlWRY0tA1qqYhkkpEdnHT1WmFmqqesKEiNY0jHIoO9oWpA2hma76QY0pQRS4b+8/uCC6qZNqqw5/pQIQGhe0a4o8wzGVtuXOcVn53rUTLDAa9IR3F+fk1T39ApYDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031594; c=relaxed/simple;
	bh=sq47Oh+DTt8mQvgg0HAPCaqwqq5A7Wu/avEExEqpCoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2U6Z+U7KciXbXGNxHGmQAehFFdVe2ByG6yACsbgmdBQT560ejEg4QluuXpXLPTzeLWGw0QLHGGM7dVJAdjXuYlcMSgPUCVI73tAYIOjpT69mJ+3+gegOaAYSKItG8rOVdIIuusZz5uE3pEibvczdYpQKdKEb10jnSo+Aj3djhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7WhZ8hX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7WhZ8hX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391211ea598so1625754f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Mar 2025 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742031590; x=1742636390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpprGEUK/a4fpAj/8Aqk/exRNk0cc1umgsVYwo9fvxM=;
        b=I7WhZ8hXXiqD+MUPmqpTT4nqbja3m53jEhDWy/TUOr4nPcTaKpR6vb84Q21mRT8xot
         7WPm9MYvqmv+AE3a3UbLdRC9IQdG8UOkZR1uFqXCZR0jHSExIhQf1qbKQKPmWhrkh0CJ
         l9uN0gNRY3woedydz/t/MVNL5gztPNBTOfzPgmoI7dU32Mpitejv71t50DxQ+1sj7198
         lFfeDTg+Hu9ALLHmvXozpY1AtZQUlW3gYUJW42A1b/xcNQpCWYvM/CdKRKxPdGS22dbD
         7jx2LmYo0t13WaKoa8elQzyMDQ7uXB9zYzIWh+GGjFQG9Xsy6uHLwvRu6vUo9Y2YwfGZ
         zyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742031590; x=1742636390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpprGEUK/a4fpAj/8Aqk/exRNk0cc1umgsVYwo9fvxM=;
        b=ZPG1K15IlY4Y7e6JREJuRhaLQS0Ka5sdq1QzrRbw1qMoxEOdTtKU3Lnx/ixAiW5MYD
         15rUq7EAm8gCzB5B0QQSYyMYQDlndQF9duybcx3giTTp26oN8VEA5eu7eNtCbsWyo+3c
         +b0Qux/4OqXcZAdHBkXsZK8C+ZfDwBEl0zFcKmqxdffIxtytWerOujv8CyxrQsxMNVww
         NNX2JA8uTlVfl1Ni4FrT1HseT9xRhh7eag9YINw7lBDuCzp4E55IMF9DuBoghOFpL78+
         ZIqw+wfkwYs7HtDJSnOVzXLY4Z1iB/7GkgU7ReXkbQdgNhBxh7e3ar39NpcQJ6UG4/EA
         bVMw==
X-Forwarded-Encrypted: i=1; AJvYcCXtxuU2bVGyjAPMzD7jVexM9JB6SX8EO4wRJVHn9IUF7V9Axczrx6/zaHQn/6p+1j0koBgzsa/ZUbp9S+Z9wQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6UbSFtbV+HQOalaptS9gD58Iyhi09JHl+Mx9Y5TUsYpASrRM
	EbkB4bvvQ2lPYcWX+0tTz4Zy7CRmk2ZYii6TZhQEBYCUMifRSgARyucME+QLTB4=
X-Gm-Gg: ASbGncsdF7ev7CeEKkxWB1ko+o8LWFC+B5B0jZoZQjUSpUYi6RIl7tg8dQTt2i/Rosv
	hDNqpHEwhLBvn0O5rxTu1lg7au3Q3t8xfCm0w0RhHqVe0jattO6vq3ADCQ6qQlSBF1hS5pwpwWH
	XbJuhex1AsFBsJZ6RfBav+v/3gvdlILI7wRNxxNQfX6poXLyZbTQOUBG6ysl5ILzdUzpU8hNvH9
	LedzFaX0PSeOzw96UVzOFqQnY3WR23xlxVqDkHJFGL2cP3FhrqRkotK9prszXp7IKkMgp9JvOTq
	0JvYIvMxWLO5ePAUfwLbNDOnvewSn06nQQQ9lZAiAVwjy2YxDA==
X-Google-Smtp-Source: AGHT+IFWe+lGcd8hOfySiAmaHi5FuBTMwIsDk2czxA5eUnLjOHnRjuiXJKnQtaEEiRnhc7xs3djV9w==
X-Received: by 2002:adf:a2ca:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39720d47d2fmr5370083f8f.47.1742031590443;
        Sat, 15 Mar 2025 02:39:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3419sm8214531f8f.9.2025.03.15.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 02:39:50 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:39:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Su Hui <suhui@nfschina.com>, shuah@kernel.org, wine-devel@winehq.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests: ntsync: fix the wrong condition in
 wake_all
Message-ID: <f86c7af5-9e7f-41a0-a357-6a356fdeb0b9@stanley.mountain>
References: <00d17d6d-19c9-4431-a3ac-c0f767c533d4@nfschina.com>
 <2051560.PIDvDuAF1L@camazotz>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2051560.PIDvDuAF1L@camazotz>

On Fri, Mar 14, 2025 at 05:13:50PM -0500, Elizabeth Figura wrote:
> On Friday, 14 March 2025 05:14:30 CDT Su Hui wrote:
> > On 2025/3/14 17:21, Dan Carpenter wrote:
> > > On Fri, Mar 14, 2025 at 03:14:51PM +0800, Su Hui wrote:
> > >> When  'manual=false' and  'signaled=true', then expected value when using
> > >> NTSYNC_IOC_CREATE_EVENT should be greater than zero. Fix this typo error.
> > >>
> > >> Signed-off-by: Su Hui<suhui@nfschina.com>
> > >> ---
> > >>   tools/testing/selftests/drivers/ntsync/ntsync.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
> > >> index 3aad311574c4..bfb6fad653d0 100644
> > >> --- a/tools/testing/selftests/drivers/ntsync/ntsync.c
> > >> +++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
> > >> @@ -968,7 +968,7 @@ TEST(wake_all)
> > >>   	auto_event_args.manual = false;
> > >>   	auto_event_args.signaled = true;
> > >>   	objs[3] = ioctl(fd, NTSYNC_IOC_CREATE_EVENT, &auto_event_args);
> > >> -	EXPECT_EQ(0, objs[3]);
> > >> +	EXPECT_LE(0, objs[3]);
> > > It's kind of weird how these macros put the constant on the left.
> > > It returns an "fd" on success.  So this look reasonable.  It probably
> > > won't return the zero fd so we could probably check EXPECT_LT()?
> > Agreed, there are about 29 items that can be changed to EXPECT_LT().
> > I can send a v2 patchset with this change if there is no more other
> > suggestions.
> 
> I personally think it looks wrong to use EXPECT_LT(), but I'll certainly
> defer to a higher maintainer on this point.

I'm not sure I understand what you are saying.  Are you saying that we
should allow zero as an expected file descriptor here?  I don't have
strong feelings about that either way.

Putting variables on the right, Yoda speak is.  Unnatural is.

I did a git grep and the KUNIT_EXPECT_LT() just calls the parameters
left and right instead of "expected" and "seen".  Expected is wrong
for LT because we expect it to be != to the expected value.  It's
the opposite.  We're expecting the unexpected!  It would be better
to just call them left and right.

regards,
dan carpenter
