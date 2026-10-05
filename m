Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CD47F789
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Oct 2026 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203211; cv=none; b=MJ+tPX+4ygL1sVSuWQaJ1IMdRbMaprt5ATCfEZo/VL5m91AqdbRXK4vw4LDGis1fcF3HBPFmDX6a3ooujIrY3bChxTw1qEMC4PY9k6RG7XJ/zbfzE/fmmHP0op+1dQ8T8fu3UAP7nZwMFYUvUfj7Y48Bi/evZIMlIScP/NkynNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203211; c=relaxed/simple;
	bh=2wrZ8L3fuDou8T3wuy8I5zA//dBy/9DfZ0w0WLLM6iI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ng/dlDCyJcfNWGMmlY7/5VdVmnf3OphZ9vtsdDUYUB1C60sNil42pfaF1jBXUwxktCRYbl6fS8whufvtGxh15f07uo2FW4PPXvHfGR94FzCFDJI3xNwmIW1Bm0CIhIAoWCaDTaqCoKksROoCqkgj+q+U4J83fJ+PFPdsldGsbOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJLEU9+E; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJLEU9+E"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so1011707f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Oct 2026 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791203206; x=1791808006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=jJLEU9+E5M6Vjc0l0lzQZJcZwbN9YfPd40jKPCJ/IyrVTgbbioggdFul8dWWqUN8WY
         z1XfxvR5uI0RCozpYjH4VRbMFEnpuPi47xR9D6j4N4eQxG0XD34ufU3pit1MKL2dontZ
         127zDteoUIxXajQ1w2UvIxdLy2F+BULWRd48wVOj4x5TOziNR2LzRYYwsqZ3CSigDy/k
         1KskKUdqQ66ea+C1BOQq80lh8TlNVei4mIQc0U3aIOilkQZ17L4xbrehnoTLzYItlTP4
         2dx7NVUi330wROC378S/jVLM7ZsdAyl836qNzawaAW8GOsXm5J9lQ1FQ9BDn2KSl2eg9
         yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203206; x=1791808006;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=s7NE/nQRVNtWFif8tFlO4jK6lbshpg6Qm6FHh+OV82zbs4mdX89+M7YuZITJuD0D4v
         /twrtura7l6HRM+skaHTnKwWriVYbUrjT34fLyTCfPOHp2ntGJm7GfCQYjk3zwgHauBK
         CRuinzSWD0SBZJlla3NraJMWNzsRPOpRzyJLzvyXKEVnUPwY2e86NI9lW0N5vM7/0Lng
         C6DAa9pyNPG/KXuD1gLh3PfLte9hS4nO24j/wzRIM3FuBmYTUNdv1mYNSYkxgm8lozpc
         cWcnB0S7k7PelC2yCMftWhBcx6dqs2emCdSr9/ImS39iFx9R0KeLKisntYT4LjaikoR5
         WlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3O9m7Ua7ifvY23DbMnsJKJ4McQQq7HdY/UXgpi0cmLhI6zPax8hszTd1ArJT8t8Dzt/TEmVnpGj9YHp3fEFI=@vger.kernel.org
X-Gm-Message-State: AFuF++l00InYGC7KElSOCoyOF6T08YalEqcP3/hnXfI7fXb3e+jpCZ0r
	bEXLMSxzugZLjvVS68OkNggguV64H2InLrOjdoFTjZ4RrOgD6c2wV2OS
X-Gm-Gg: AYBFou1gog1woml+SHhEaiPwi775VhM1hJd3h9dtMmzeNv6Sj8th26d5CIl93BLb722
	hj79fLHTnTz5NnW0jLYHCmNnB42pqdwPsQ9XCHAaTFgTcKHj37Fr9U5G224pc1mCui1wtsYus7B
	g0q8tOnhxRRc0FEx67moMI9ohloWKZBluKBWvGdjjN1BUHtRFhEvuaHMTzY6fspL9kzkIirtB2w
	aDroe3EejMBxHrrbDo2gnfkS8ea+90kpk+XisPX9iTHg5u2nujQrCSbPj9sSAWDv50c0isvPERy
	XbQ+djrbdA9hcPHEBhphJRbWWSXPMfGUYnH62XR73HJuVPkFg65cXs9gH1L0b9jYj/h5wERsC+3
	SLXwW0o2LBFlNEecmAw2s6VdV+Df14yS5Agmq126CspjBIPme4WertkfulPdTHBg8qpXlRBzasp
	L/P7MfSJcja6NesibBNeDQTAUAYdzWooCCgvk/xhdyjmuzgnQm4/0QtsTCmvGtAxbizU2Ufjx0U
	1vRr8bkmm+5pfgrrWYum/3rP44Yg9sDjPlIkjg46tWyEw==
X-Received: by 2002:a05:600c:1f87:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a0275a1d54mr186457595e9.20.1791203206334;
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm336935255e9.4.2026.10.05.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Date: Mon, 5 Oct 2026 13:26:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-sound@vger.kernel.org, Colin Ian King
 <colin.i.king@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" ->
 "config"
Message-ID: <20261005132644.583ba73d@pumpkin>
In-Reply-To: <179113127609.150114.13801161604243660987.b4-ty@b4>
References: <20261002113953.1782731-1-colin.i.king@gmail.com>
	<179113127609.150114.13801161604243660987.b4-ty@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 04 Oct 2026 18:27:56 +0200
Mark Brown <broonie@kernel.org> wrote:

> On Fri, 02 Oct 2026 12:39:52 +0100, Colin Ian King wrote:
> > ASoC: tas2781: Fix spelling mistake "config" -> "config"  
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Did you fix the patch subject?

David

> 
> Thanks!
> 
> [1/1] ASoC: tas2781: Fix spelling mistake "config" -> "config"
>       https://git.kernel.org/broonie/sound/c/7d6adf283a83
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 

