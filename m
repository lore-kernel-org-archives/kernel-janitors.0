Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A332C2346
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513454; cv=none; b=tGOMLeufA7tdGlAP5i2JpJPtUjxRfj/o0jznMGoaDQkHbec0uQK7V0StSD1qWzd7p2tg2MV54mbJkhwgxVK7ojk4XWsP0u5OPKutZNY6rZZb0VYzf1M3v8fAGqxDaWML2DpY0efpSoPtBHMWDPtQETbBU7tqbKK+AvkGBKUszxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513454; c=relaxed/simple;
	bh=KLnOlT6LtB13skdfqvYXB1zN4BJeB3RTchndbveOY0k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8sNgmIk8zmuWnR4CxTchTHW2CHvu9pWoYruoHN/NcDciwbX+bdYOTeLC07sd8VHUNI5xRfm7qcMLnQrQMAh2uLny4Ya6+7IPq6s6426c0B71LaEBk7q9rRbAL3WP5827sTu1Y0lTG/jjf5nSea1oe7kv9N6YvtpjWNmjynUGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFX5/YZQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCCvhyao; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFX5/YZQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCCvhyao; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFX5/YZQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCCvhyao";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFX5/YZQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCCvhyao"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B409211EF;
	Mon, 18 Aug 2025 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755513449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5ysTGocTdn3plDN7+3DQTWuJBsF1ExHjxfOzLNMXTU=;
	b=fFX5/YZQUozt9sXNrO5iAEtNLMRiKcvDNrz5DElWzjD4oZS7aAKsPccHhREnBCO89yOech
	XbSJyQkIeZDHtCY266W7Bb3/CAeEHUdXkaSZS9+Eh6/mlDJZCmAralvQGw6nWTyu+Kf6/L
	vlzdPLPJegiIf2IARB5gxL9TSTtZh3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755513449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5ysTGocTdn3plDN7+3DQTWuJBsF1ExHjxfOzLNMXTU=;
	b=DCCvhyaonsJ6tEz45xZQRGyRFPVFmkmA3eRafxo2Xa6u4kY+5/SjfjDnvEs5j79+L2GRoh
	dtysJ8KD2xNg//Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fFX5/YZQ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DCCvhyao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755513449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5ysTGocTdn3plDN7+3DQTWuJBsF1ExHjxfOzLNMXTU=;
	b=fFX5/YZQUozt9sXNrO5iAEtNLMRiKcvDNrz5DElWzjD4oZS7aAKsPccHhREnBCO89yOech
	XbSJyQkIeZDHtCY266W7Bb3/CAeEHUdXkaSZS9+Eh6/mlDJZCmAralvQGw6nWTyu+Kf6/L
	vlzdPLPJegiIf2IARB5gxL9TSTtZh3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755513449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5ysTGocTdn3plDN7+3DQTWuJBsF1ExHjxfOzLNMXTU=;
	b=DCCvhyaonsJ6tEz45xZQRGyRFPVFmkmA3eRafxo2Xa6u4kY+5/SjfjDnvEs5j79+L2GRoh
	dtysJ8KD2xNg//Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273AA13686;
	Mon, 18 Aug 2025 10:37:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CoRLCGkCo2g1UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 Aug 2025 10:37:29 +0000
Date: Mon, 18 Aug 2025 12:37:28 +0200
Message-ID: <87v7mkx6dz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Karol Kosik <k.kosik@outlook.com>,
	Youngjun Lee <yjjuny.lee@samsung.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix size validation in convert_chmap_v3()
In-Reply-To: <aKL5kftC1qGt6lpv@stanley.mountain>
References: <aKL5kftC1qGt6lpv@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6B409211EF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,outlook.com,samsung.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Mon, 18 Aug 2025 11:59:45 +0200,
Dan Carpenter wrote:
> 
> The "p" pointer is void so sizeof(*p) is 1.  The intent was to check
> sizeof(*cs_desc), which is 3, instead.
> 
> Fixes: ecfd41166b72 ("ALSA: usb-audio: Validate UAC3 cluster segment descriptors")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied now.  Thanks.


Takashi
