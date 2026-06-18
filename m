Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D42DFA25
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2026 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797855; cv=none; b=EFGYBCK3LEo7meahHxlweXk+GCyk9Kuy3Zxp79ocSxEQy1pLHxXx8VxVsymXy1TGSadXte4wC7e+QEu7gNCZPTEC8YOj9l/oI4hlmHNjb0U/SMSBsxMmOIg9kOdCfs6vbHbJJojgW1yDVijjX2ft7Ga7+BAmiY7/a6rr0TBv1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797855; c=relaxed/simple;
	bh=dBKFtJlU7NLE6xbSxQ+2ve/y8D66dDNqtxBr46ycCcE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsDqNCyvK2WEiu5PmMlT7/v59RPK57ClOu2cOjBSqTJudrbdDi8mWyJSKVMB7O1qzCSeizNVCB/7X68EFe44mRkWSKsgyp7xlezkOPKGsXiXlu1fR13Cl28ylxrvc/qjURFuT2DL/VIS4k1r32wlwbtKQUxmnuOOlopOdXXDmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pCZw9314; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pS5guSIW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pCZw9314; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pS5guSIW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pCZw9314";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pS5guSIW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pCZw9314";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pS5guSIW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A24E86C1EF;
	Thu, 18 Jun 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmiTTjChAvN/NoayHTd7hoLAJBint9I+SEe/J/dCfp4=;
	b=pCZw93142fkac8HTUlaK/SThkALEPcUcxnjoQ+DTp+TUBlNMDRyXOzAzdDD52244l7DcXK
	vxcLRi0qiOXPR/p7/HPr19sWiyC1/jUP5Y5ZdJg/jYWe7MzjlH5GWoYq/a/ZEd7j6GfUbf
	JOaUcS0Uq1UoVIu+Dil4HAT5iQchV70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmiTTjChAvN/NoayHTd7hoLAJBint9I+SEe/J/dCfp4=;
	b=pS5guSIWnZR+DGT/PNK+BrPtMjsp4AFwIy8l8n7OIdlNG9ggFjBPI741ceBfGstO6ASC0D
	7beRiEV8e+G6xBCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pCZw9314;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pS5guSIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmiTTjChAvN/NoayHTd7hoLAJBint9I+SEe/J/dCfp4=;
	b=pCZw93142fkac8HTUlaK/SThkALEPcUcxnjoQ+DTp+TUBlNMDRyXOzAzdDD52244l7DcXK
	vxcLRi0qiOXPR/p7/HPr19sWiyC1/jUP5Y5ZdJg/jYWe7MzjlH5GWoYq/a/ZEd7j6GfUbf
	JOaUcS0Uq1UoVIu+Dil4HAT5iQchV70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PmiTTjChAvN/NoayHTd7hoLAJBint9I+SEe/J/dCfp4=;
	b=pS5guSIWnZR+DGT/PNK+BrPtMjsp4AFwIy8l8n7OIdlNG9ggFjBPI741ceBfGstO6ASC0D
	7beRiEV8e+G6xBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66A62779A8;
	Thu, 18 Jun 2026 15:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K6jXF9sTNGo4bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 15:50:51 +0000
Date: Thu, 18 Jun 2026 17:50:51 +0200
Message-ID: <87cxxnkftw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Use common error handling code in snd_emu10k1_playback_open()
In-Reply-To: <d709474d-62b0-4f7e-9011-a0f716b35383@web.de>
References: <d709474d-62b0-4f7e-9011-a0f716b35383@web.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[web.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A24E86C1EF
X-Spam-Score: -3.51

On Thu, 18 Jun 2026 12:56:04 +0200,
Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 18 Jun 2026 12:24:36 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied now.  Thanks.


Takashi
