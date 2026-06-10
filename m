Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117E34D4FE
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113703; cv=none; b=qMeDryjgfN2uAVclBRHskhnBKTkar5iZGMPXPO7t7BWT1tW/54uvVPRspzuJT//y3jt7O5uoALievP31yviQf8jgU8Ws3jz9Sb5nhhPboRj6Yd98M2zjUIj5XLqcF+C2j9Em9j0TavvginjTb57owaUuu/IvICbbubE/XxghKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113703; c=relaxed/simple;
	bh=75two1c0UgRf3rBvUtpN6LBHBYk7Z+P0nbh/g7E1xno=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKLbdY3ZsvZ1E/ixiypdD1yVDAzffHyduFcHPmMW6bKAz6EsKGKowVGmxkcUxYijTW+XMqmhlbdB0C2yRfNW77K8PCjAnjcXtXx+tlV1HXNLZJ4NR5aFqnAbLKaeYhN8qdpmh3DqNoLS9iOB2lS/6mZ6t866HxFChWzk9Q2ij1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oYOs6QpH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H1x4geKy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oYOs6QpH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H1x4geKy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oYOs6QpH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H1x4geKy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oYOs6QpH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H1x4geKy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 38AA975CAD;
	Wed, 10 Jun 2026 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781113700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLuF51RC/o7ifF3vLqgDJGUCP6OvVUzEIX6pED6UrMc=;
	b=oYOs6QpHAPw8kf1CXUwUJJrCgp+ClOTSM1spcBP0GURv9VEKz47OpJaDPir1uYI6Gze7Vr
	bXuxdhLHLvOYZiGigG1ZPN73uW7oEB7TT2OKCWqoRuEzLPCZA1wpMDr5BPOeBF4xmo5OfT
	zrCm/x+nR4U2G82Cw5T8rbi2PlC+TMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781113700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLuF51RC/o7ifF3vLqgDJGUCP6OvVUzEIX6pED6UrMc=;
	b=H1x4geKy0OfiERaFL7pJXq1qnDZzYzYmdPq5hcqNFMaR2GnioI+BH860WtE+yp+Sqab78s
	BCRNwQ/lbkbq5fAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oYOs6QpH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H1x4geKy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781113700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLuF51RC/o7ifF3vLqgDJGUCP6OvVUzEIX6pED6UrMc=;
	b=oYOs6QpHAPw8kf1CXUwUJJrCgp+ClOTSM1spcBP0GURv9VEKz47OpJaDPir1uYI6Gze7Vr
	bXuxdhLHLvOYZiGigG1ZPN73uW7oEB7TT2OKCWqoRuEzLPCZA1wpMDr5BPOeBF4xmo5OfT
	zrCm/x+nR4U2G82Cw5T8rbi2PlC+TMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781113700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLuF51RC/o7ifF3vLqgDJGUCP6OvVUzEIX6pED6UrMc=;
	b=H1x4geKy0OfiERaFL7pJXq1qnDZzYzYmdPq5hcqNFMaR2GnioI+BH860WtE+yp+Sqab78s
	BCRNwQ/lbkbq5fAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D03B8779A7;
	Wed, 10 Jun 2026 17:48:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XLfyMGOjKWraJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 17:48:19 +0000
Date: Wed, 10 Jun 2026 19:48:19 +0200
Message-ID: <87zf12jnh8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kees
 Cook <kees@kernel.org>,	Takashi Iwai <tiwai@suse.com>,	LKML
 <linux-kernel@vger.kernel.org>,	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: 6fire: Use common error handling code in usb6fire_control_init()
In-Reply-To: <a24a6bd9-a8e1-423c-9eae-b9ab08a8de81@web.de>
References: <a24a6bd9-a8e1-423c-9eae-b9ab08a8de81@web.de>
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
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,perex.cz,kernel.org,suse.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 38AA975CAD
X-Spam-Score: -4.51

On Wed, 10 Jun 2026 19:02:39 +0200,
Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 10 Jun 2026 18:57:17 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to for-next branch now.  Thanks.


Takashi
