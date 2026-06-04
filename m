Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E440315E
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jun 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569738; cv=none; b=RAA42OyCFRxEfhfjKFGpuFRxS6s9qfUXiOOjO2m1mtSgDT5WvmIkAHGZ90ZjzEr9hY48Iczv04Jm8RYi3jEJdMGpYWk1x3bhjBj8D3xtm9ot9YxihyVV+iinaJN+oL6ELegDewrDNHTMZmxxOL/P6qwdiGkKmoxQC7kz/ACIT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569738; c=relaxed/simple;
	bh=xbcepqutzZlLnilfEksjMXSq1uOmhT80rGdIOtRA0pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfWYSh4wITPEwPPhaYcoCYk548qzn70uXT6AEP0BsmMqVCYplvlIXmWscRNI9D2JP+HlgitgcFKtvEdQ2W5PsFmF92Pp3qf6BI4g4wZwPf4DD1dcfK3abvsV6sevgMig8ZPHUq10t2niGIJfkrISVMMi5xIMG1pyb0w5Nb1lLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFSknZFm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFSknZFm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef82204c6so291433f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2026 03:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780569735; x=1781174535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LmsHUCkINh84aTqk7R6AM7AcvSURHOWGdlfRqXt7/g=;
        b=QFSknZFmsHt08rzGixOflykYCvJeihGKIe8uQQp4iQtj5PI1AFya/I37FBQ86InzBp
         CSOi0GB7z35fl2y4Q0jEqhtnVb0AChY6tPVJL73o4sDaq6FMU93qReRu3d04+kutKGXQ
         1h2HT12uJ+noY8pR/yerNFWfsJd4r2+DDQXJ/bgoXT6UGH0WbogjXnBMmDdHpOY5noNb
         6Q8ZDPaszkPm+s+RmHvfYheNR5tBNObVrmbNrdjLWZ0HGgA7h9vc8vCDguhSwqa0k30k
         Ly8oaOX7HIvLXpIkg9540IJTXylWTJON9ml7gVWyka/8H00CyDagbWrCka/GJdNOLxZr
         Gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780569735; x=1781174535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LmsHUCkINh84aTqk7R6AM7AcvSURHOWGdlfRqXt7/g=;
        b=mhMDDfOLnScwI7b0vymyJ9PqyJ452pUDKRq4gl3yvugD1l8QXUDaiZ3C3+5QCgqgyU
         uw1YcNOf3+OwQTZpTIMcIP2lpiCM1lnyJGUtMbda8MifaWae6YwD7exSiYmD1bPrlFj4
         xGp0CksjV4KOys5F5ikSVQP9OOGNI9AljpRdFUQCmEa27TXR12qiNAEAWuGm/zU+DC5U
         PjcdvBKUwRG6xIIde8K5fq9gC+BZCy7KNb8lJRniE0wPjDAcmXlHa0zwjCwy0opyb2+f
         Um5k6VnMhCxkiirUD/Lw7HltOGuc0xekRStGKeXE0zU0U4obXJktmdY7jqONWF7+olJ3
         bv+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KuUP4202NORSXrkpc4pYJ8q1gXLa7JmZUIVrzqpkgWELJ3HsM2/58ePZ5plNIp9SYEm7kAl5GQKFInWgCXu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4ET3ZRaGIdIEEBbi43kkI/WjOlYrcUMazq1W8E+9DePEARGs
	gYsYEXotGwJcVlnIEky8kAKdneMHtf7ZBypTka12xoLLmjZh2fzztDkybsAUfDG2
X-Gm-Gg: Acq92OEkWkhCmvLuz/drLLf1dhdnfKyw3PikUQWAuxXfy9ZA4eI9sVqAP6l9e1diVS1
	QU8CiNsfVqh7SviYoPvK8mj4bMc7qTT7r8TIaf01NWunnzX3M1k5Is3tCsDRUsyBz2VL7BWdWa2
	gBU0y6OkLOJHIfGS0C8/0tyYyL5XnsPBxIEJ9gTw3Yip67n07qPn5/CveRxyaZ7i4rIXd085iZq
	FLXtLI/J2rIgMEpclIoc8L5qfTaC59GzFQSUt2rXntSVLxyAeCCXyhmr8r/P5XO68Qys/aSedYv
	NHusjQdkQsT8lX622sWc55cFptBzAqSivOcNZ4YMBF7BWwaZeAjWapGJ2QoxtO62ZdwxwZIuJHX
	nsxZMd3TDYQJBgJGr3iVZW7yAvUoXJuqqWO3rhNpb4RFsjEgFQ6KMoF3fGBM2xULP2+hQYXTWfk
	qdWS9ZmXmK7osJuY/KWUO4rV9YAYJ/Xw==
X-Received: by 2002:a05:6000:2993:10b0:448:7049:a6c9 with SMTP id ffacd0b85a97d-460217800ddmr8692539f8f.5.1780569735217;
        Thu, 04 Jun 2026 03:42:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm14871477f8f.8.2026.06.04.03.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:42:14 -0700 (PDT)
Date: Thu, 4 Jun 2026 13:42:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aiFWg6vC2cVbONTK@stanley.mountain>
References: <ahP3O2tQdu4dNx_c@stanley.mountain>
 <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
 <20260526191946.409160c8@jic23-huawei>
 <aiEpmqKwFuIMRfdl@ashevche-desk.local>
 <aiEtIGOFhF8AfUCT@stanley.mountain>
 <aiExQzpIOwPgwd3-@ashevche-desk.local>
 <aiE3N6zErq2WcCvS@ashevche-desk.local>
 <aiFVuvVtaWbjfVzA@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiFVuvVtaWbjfVzA@stanley.mountain>

On Thu, Jun 04, 2026 at 01:38:50PM +0300, Dan Carpenter wrote:
>    168          ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
>                              ^^^
> Uninitialized variable.

s/variable/data/.

regards,
dan carpenter

