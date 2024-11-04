Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133B1CF8B
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Nov 2024 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735219; cv=none; b=UY1/VpERdrpyCKd+R8uP7fJnmZ+PnSLv49Ja67Ae6H9RaCte8wNP1WonrSgR1BTBfcrcodtcKpqs61PDm4JihfXX6PiUv24ifCEJr6OtLRneTANEsiIMrDv3hS02Y/SSkZQGv3grCvMpppZMOBeSL1DtnuClvrz8hX57PNkz9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735219; c=relaxed/simple;
	bh=cyh425pNXcQivIiwavEtYI0ranrZT4OUgdphHkKG6DI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n7VlS/DXDVussalTh1qMAs16WacY0qfEGhOlpJBxwJNklCnZbDkYy4S+rt5lEf4qSc4dqhhHNmbAqsqDCEG/05gaTPWjNv8d5iqUOxAxrgbXcTYZZ4EFoIr24lVXbAB+J+Ss2r2CWoA+IExid7kFmhtQo6Qo/9grsajsU5k/5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5RksTes; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5RksTes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730735216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh425pNXcQivIiwavEtYI0ranrZT4OUgdphHkKG6DI=;
	b=R5RksTesCwl6KfugZ3jm5FNZjKS0i9HgahpjOsPfx2U7gmoCorIDuR7OrKuPergIKFEEwQ
	Z6Yi6paJNyfcGIMiy58j9elUrcKW+C4JtZHgaNAfuKFz4gH+h/k2OFXx+Q2IjkleFhU54a
	JIT6iDKVjJySYxCO1foJ0D9RADrU1Ms=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-V2QZ8Dm4MnG4M42TeWBkBQ-1; Mon, 04 Nov 2024 10:46:55 -0500
X-MC-Unique: V2QZ8Dm4MnG4M42TeWBkBQ-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7180a4bf542so4071741a34.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Nov 2024 07:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735215; x=1731340015;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyh425pNXcQivIiwavEtYI0ranrZT4OUgdphHkKG6DI=;
        b=XqApQEx8uHDsRurGaOXCbUf8uCwFxGANs3kthmtnJS5V2GEP5VqGv++oeJu5gyfx8I
         mUqm1cFncKHW6FRxj8Kv9Zti/HOH97VyW6nshnEBj57Oe/vgJrxYZwgcXC9ohszjP1U2
         EBzNKJCE7nDgcAwsEeDrxVp7Nysdh+QyggNqwsKAm/WI+ZvUb8ADAfhUXCqxSyToDCNC
         HRgVIUgTO/aLA6EKf7mN1OoWxe4TYo+3cPoIRLzpoHY5qpjFLLa4ztzMa0xOBYLaaSCK
         paO9rl9+7rTn5GIBzV59FvjbvhU4ZQBbjN/YZaeueyTcwNNSScBQ69ZMZoOVViTxZQba
         TmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP6GYzWPJJ7fKKR90k/C9RjZ3O0UkcPWqmVWqsSwahNjqtpR04mfEDbriL2vIQhrqsaV53HUVpJ52373jpKHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7YntsDNyGW/qgxBjfmZ5n7Ct61eZ51Qh9krngtscUUjPTeuT
	X3mAnmLdY/FVdNjjRn6V1eYWCPUE7aGqijcd2ONnK7M1PacnH4EruUcQVP52dOKUTUx/LkxN5vN
	RUSQA4kTQgd3R4PqpCEbubVRqekcISIoTg0TCoS/pr/tnDuHoLqvYjXso7hLjNWhyzw==
X-Received: by 2002:a05:6830:6709:b0:718:1302:b2a3 with SMTP id 46e09a7af769-7189b55ae98mr14724625a34.31.1730735214900;
        Mon, 04 Nov 2024 07:46:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcEeo/DI8hPzn4CSpfberrWrU9s96A8UhritWhfiA1EvpMRtLkpYPxZCs0Ec7KP5EoLMlVpw==
X-Received: by 2002:a05:6830:6709:b0:718:1302:b2a3 with SMTP id 46e09a7af769-7189b55ae98mr14724608a34.31.1730735214628;
        Mon, 04 Nov 2024 07:46:54 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7189cccefa6sm1996109a34.66.2024.11.04.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:46:53 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andrew Kreimer <algonell@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew
 Kreimer <algonell@gmail.com>
Subject: Re: [PATCH] sched/topology: Fix a typo
In-Reply-To: <20241102131943.10103-1-algonell@gmail.com>
References: <20241102131943.10103-1-algonell@gmail.com>
Date: Mon, 04 Nov 2024 16:46:48 +0100
Message-ID: <xhsmh34k757dj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 02/11/24 15:19, Andrew Kreimer wrote:
> Fix a typo: borken -> broken.
>
> Via codespell.
>

Quick, hide behind this bush before Peter sees you!
https://lore.kernel.org/lkml/?q=f%3A%22peter+zijlstra%22+borken

This happens to be valid internet-speak and isn't really a typo, see
https://www.urbandictionary.com/define.php?term=borken

