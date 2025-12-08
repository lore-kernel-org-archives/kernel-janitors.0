Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827E2E4258
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Dec 2025 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231780; cv=none; b=A1Dkr//kSIvc28SMO3vzmvVMAn9ukAvvwGRWS5WFqpP8d3+UFpeYHQVNUeW5QDiGqUKgQXV/qnHBrkwPtq1vW6wvQWOlsJkGoqE+Q2SMZyBX7ztko/GJpjBDPGpBrz+rpKVTwYnUFaZf+gwzukzMOtuOwkK3/KBcCdd/P4Mrz28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231780; c=relaxed/simple;
	bh=p3sg78l1Rmo9cpHzmTNgyENt0ymd3EOPwxRutKTml6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUjJSA1uTfGMwpHpIkJBFiR7z3N2WkAHKY+y/be5hIhA85sIcqZTRj0n8g+ktrcfAuXUpMWP+Gj/NKq7AKN/w50CTOJIA2R391CfQplqujkirI29bSSCCBbiQSQMTlIa2YalZn3NyMG+GFZdfWQeir2C3SgmkU6UmOaU0rZ+eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b5YDvEUS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b5YDvEUS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DD571A2041;
	Mon,  8 Dec 2025 22:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1AC4606DD;
	Mon,  8 Dec 2025 22:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C45103C8D5C;
	Mon,  8 Dec 2025 23:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Z6XLQIPaEq+Nxc+Cv2PclK3uy5FDDYP1taw5UsNqkeE=;
	b=b5YDvEUSH70h4yPmATFM9NyVPYlvv07FU0Y1H2efa4IpejTAOjgKZNE4aYtS14rUGjAPjU
	F4L9FGCysc/LzVO0VbYwgQQOxaU0uH8Mk4lnm65/i8LWVR4J3htEdvUD0Ubq6Mi+HvDZvz
	Tv5Yj2aLILnzbjIjWm3TPRPhcNJN6NO/kpZa9xTQSXfotMBEwUWZVD+1t7Gtb1sgGKLjXH
	/I/xpeUkaaAlPwpSegIkB6ysVv9cVrbWU9RuOvy79pY+RhcgBgZ1STNlIZIqWfUM2BW9Cy
	78oSQu+/NoqQnEn3Wgc6WtDEsLty6ieTgBDSw/gS0CiZHSlhnDZxtEmbxjPuaw==
Date: Mon, 8 Dec 2025 23:09:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhi Garg <shgarg@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
Message-ID: <176523152347.342815.9191977208772431822.b4-ty@bootlin.com>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 10 Nov 2025 08:35:44 +0100, Lukas Bulwahn wrote:
> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
> 
> Note, with the changes of v6 to v7 of the patch series adding the driver,
> the content of this include file was moved into the driver file, and the
> include file was dropped from that patch. It was simply missed to adjust
> the section in MAINTAINERS that was newly added with that patch.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER
      https://git.kernel.org/abelloni/c/40d8123ff749

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
