Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531020694A
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429011; cv=none; b=kARXGqPTAMQjJdE0iczrhY5wIJe3h5FZ1uQTv1yb7y+xnZ9sRAX6apzMRj4V9KMd8IYMj0VQkFWu5ZoMcGXjvr+mlND4kU4fpXQ0PrzSWWw8M4WJ7iCyG2qOjBUKVsgSRwvpdLR1WIvlC5JTQWglihDtefJ+lRniRruw/h/f61k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429011; c=relaxed/simple;
	bh=8vIwmJ/+4m5wOhC4ieLUeluEzzdiMVyNAjPQoO5ODS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ7aOpuzw51NgHxHMG4PVgVF3Tlc9Dn7nMAPe7NKeXxVha5kgzelBR0y7Zw5lsnX27Y7FQLGu7e/H3BGKd2I0mJLBFxkBtwwHIUShWUjthDZPvmob0dCo/QkEfV42BU3Y5IPD08yr6HAsKw3oGJ4z5G2IJtUi83xFHK2kVkr7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txLV2or7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txLV2or7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so4159982f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 08:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731429008; x=1732033808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwqekHTXSDgXsDI3RdTo14WCCfnnAAvGaD9ots6hOTU=;
        b=txLV2or7XBsS4LjYgw9SJoupHhZnFkIa9iV8pKPj0Jqo5gPOgxNP0Xn/UwfCKJO+SO
         ddplx+5aBUWJwiB/Eg3ygj0CwYurxhk2J6CllwTxtEkc+/O8SfIuCI7iB3zVpzgDbfCQ
         1rSc5CLjUFGwOpnZgKKP1jYOG7ttkOuTIB79Ue0JHh5vxVA0KFgEAnicHM2OM4hyH4HZ
         H+Z+as0ewKCBSePh5sCGdtP/sNDhcf2LfRsGJZz6cD9jxEmRLIIocAOckMMGcLywz/oP
         toI+B209nrtYyjPKMDzoE0/+SEK7CTViLG1TUi/bwLmtohNqdT+JhrtxphJGrBGZ+mfz
         SD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731429008; x=1732033808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwqekHTXSDgXsDI3RdTo14WCCfnnAAvGaD9ots6hOTU=;
        b=xUN/UxjMLPje6YSCZNVeyOzsKc/smc/cOPeyHg+MeUYz2EmkBX75+WqinV/3nIqzN+
         QhihAfIeowDi4My82xi0oWiaIZ3iWHcWUscRWgPYBAoWlGTGKV5kc+K72xkFgS3ygv2D
         MoGhrrU47O/RLE4xL3WOY1msGrTv7DBxOnvzp7/m+vDEiKMA0hg6bWlPuUuMjwlKEeBT
         4PwMqWVlnIdkqQ3l/LyQY17wI6cW8gHbOlBUjaODJDvCSwKBt/kvbWn9XbrY8rKC9sS3
         q5HwnZFUEwOTdd3uYkj5b1ZVltuvy8VE8Ch89mW3jOjY+L/3JJdyImEbgJ1JVAFuwbZw
         8JJw==
X-Forwarded-Encrypted: i=1; AJvYcCVnGJ17D2YrlllVdX30s7GREy1oM1oUSBqc445mhx1vFx6JKXHOORQRFHfV1t3dqJJFz5sq6qZtEXaC9i26WOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMdE67hJFB+phzt6Zw8exky/7l7e4Qp/h7Pv5LHVlcWGa13oPa
	DrecjWHzEKcUCmXsQ/B9Nckq3OEDR4DFeU7SRv7PGICLpPHm9Hxq+Cb6ELfdTsI=
X-Google-Smtp-Source: AGHT+IFtALBXrwd3Y3rxevzTqm/aZf3UiOGXh6n/rVS1DJex7USZ2M5gctne+yuo9jidW5rLOTF8Dw==
X-Received: by 2002:a05:6000:2aa:b0:374:c8e5:d56a with SMTP id ffacd0b85a97d-381f188c8ffmr14302092f8f.48.1731429007689;
        Tue, 12 Nov 2024 08:30:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6c1205sm255947045e9.26.2024.11.12.08.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 08:30:07 -0800 (PST)
Date: Tue, 12 Nov 2024 19:30:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scftorture: Handle NULL argument passed to
 scf_add_to_free_list().
Message-ID: <ec532c16-c7c3-4029-b996-284ac32f9820@stanley.mountain>
References: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
 <20241112162023.glRj_YAz@linutronix.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112162023.glRj_YAz@linutronix.de>

On Tue, Nov 12, 2024 at 05:20:23PM +0100, Sebastian Andrzej Siewior wrote:
> Dan reported that after the rework the newly introduced
> scf_add_to_free_list() may get a NULL pointer passed. This replaced
> kfree() which was fine with a NULL pointer but scf_add_to_free_list()
> isn't.
> 
> Let scf_add_to_free_list() handle NULL pointer.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain
> Fixes: 4788c861ad7e9 ("scftorture: Use a lock-less list to free memory.")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> Thank you Dan. I had to look twice, that `scfsp' above looked almost
> identical.

Yeap...  Me too.  #LowHammingDistance

regards,
dan carpenter

