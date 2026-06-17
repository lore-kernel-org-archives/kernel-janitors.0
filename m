Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53479395AF0
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687211; cv=none; b=ocbE5sARV3lGyO6NWSWZZJ6dm3sGBhkaVdLE1LCXbrwmjjiCP+LzMW0iZkTI4vSdrtnSwy17TUTmKXfJsD5crMubTy5a7bpO2goxsYRUEA9q7BzzboW02zPpeVHQocE6cLJpfAZsgN8g7xr7ktOUQroyk2lYptPYT/7VA0csL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687211; c=relaxed/simple;
	bh=k4hU/bJNYIZYVBoZm4ey2C0VS7roJ9hgJ6Ob5HJRF9Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r43gT3tg3UgcdtoHomIxFeTdA+zvdCKFi1PjJWia9A5d5FlEsrpA0kYIY4neG0omGciLxsOXsRfmRuM5dAyi5+vw+4TmFXQe4KyeqHEdLqD/UXA2gWPvT1au1pD+czw0trVeE3ObP5Io4z4xhSDD5/yiXlj4gXJyBPoB2QhMwlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh+PPX2E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9pkslwLn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh+PPX2E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9pkslwLn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh+PPX2E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9pkslwLn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh+PPX2E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9pkslwLn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 730FB6BB20;
	Wed, 17 Jun 2026 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTqkhUNRcUhNVW52f8j6a05RijLbI0bw+oku8F61r+k=;
	b=jh+PPX2EeO17SBjqH10E+OBaS6lT7psb5uTSkhiTJQYxF8TPZaJ+ETCmolBopoL+73QjjI
	IOy4sW/hmW36gAzu7sFIzS5WYbhAMAsXVgp+tCsjDr0t+BDznRRh+/4q9Eg6l3Zrs6yQaq
	IPGB+HJarbIM8LSpMbgdqGF/l5iGWNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTqkhUNRcUhNVW52f8j6a05RijLbI0bw+oku8F61r+k=;
	b=9pkslwLny2iZIQspTlysvYyRfAALQRz4CLQXtuTK9XhvwdIBOSdhLG6U5naf0pUTTpQ8JS
	ywT3SwFZOSuTPvDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jh+PPX2E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9pkslwLn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTqkhUNRcUhNVW52f8j6a05RijLbI0bw+oku8F61r+k=;
	b=jh+PPX2EeO17SBjqH10E+OBaS6lT7psb5uTSkhiTJQYxF8TPZaJ+ETCmolBopoL+73QjjI
	IOy4sW/hmW36gAzu7sFIzS5WYbhAMAsXVgp+tCsjDr0t+BDznRRh+/4q9Eg6l3Zrs6yQaq
	IPGB+HJarbIM8LSpMbgdqGF/l5iGWNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTqkhUNRcUhNVW52f8j6a05RijLbI0bw+oku8F61r+k=;
	b=9pkslwLny2iZIQspTlysvYyRfAALQRz4CLQXtuTK9XhvwdIBOSdhLG6U5naf0pUTTpQ8JS
	ywT3SwFZOSuTPvDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 352B1779AB;
	Wed, 17 Jun 2026 09:06:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RD3EC6hjMmrdUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 09:06:48 +0000
Date: Wed, 17 Jun 2026 11:06:47 +0200
Message-ID: <87mrwtpmc8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: sh: Use more common error handling code in snd_aica_probe()
In-Reply-To: <47413de1-015b-4543-8e8c-25e41dfa9e39@web.de>
References: <47413de1-015b-4543-8e8c-25e41dfa9e39@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[web.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 730FB6BB20
X-Spam-Score: -3.51

On Wed, 17 Jun 2026 08:52:53 +0200,
Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 Jun 2026 08:42:18 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied now.  Thanks.


Takashi
