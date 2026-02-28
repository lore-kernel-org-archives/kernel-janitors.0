Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FAD255F2D
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Feb 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267616; cv=none; b=LgHqhamMw9ijv0iQ0SzJwOf1ed6Za/cNapUzpvL/OoV0jBpKNsbg0fKVsas52GB1KfZi2xe1oixFSmPawwbKZitfSTN3nRbewATsrtpNrUcUeOf0J5E/X22/7hUwEmOQFqYCsnxlEtXCSRwsrHQeiVD1GxMlEmQg1egzwWCaFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267616; c=relaxed/simple;
	bh=9J4aLFNBUFimLZoXPSiviBhOcwI2yMg4Omo3sBfptTI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZKWMmWt1KGaIZp8pBUoULRAGodNt4fLs2TOxkWcSd9yei2hEATcOX/D5/uQrjzybK8eD3WeGEVATjQfONCWIiCkM8g4nYYJPME7rsFHQ670fKUn/fFtKe2E/nU/jKYwtJjh2BHsX4ZlrI/cIPpBWPt/7fQnWaMTVx/Tjk3gPKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GcSG9wfh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v2Tpj0jq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stYtJ938; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z7ONblRo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GcSG9wfh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v2Tpj0jq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stYtJ938";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7ONblRo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ACD6A3F8E7;
	Sat, 28 Feb 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=GcSG9wfh7MXdVEH4anojkW3R5eYh7VqH2o8eJUpraFCSd0ioxPuOcqoF1+BPbFOWQ7jYnp
	UHFpnQtggIAkMMErtit1Tb2NWowBoI3TwtDVaouHP/XYychr+Czccpgdne3EhOcsY7Gu34
	REqDi67deh7vBEBgE3ix2Ek/+kiYuKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=v2Tpj0jqtwVouxVCkSNrtpNVjQGf0IyDAuIuYdcLm1FM5RZW3aK177hafKGIChiO1PBS3X
	m3HUsVKjFHg3OrBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=stYtJ938;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z7ONblRo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=stYtJ938Z7u4ehosRybMS+f0aGVbgPuduOmgfZs0C/5rZI9yk3eXXnsgAk8YH24lJx60mj
	Zwu60BPK3fhQspdwgJCjtGWzRC+bpCJJMrh5eo4YacjiqC1ykisfpP0dKjFkUhtNTPQni6
	9FaAuDrJ5uxsx/dfA7Q9b4VvqcaedAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=z7ONblRo7DyDe+Ikjg5ycJYke/fpkaQJynqvXKkji/kv70az+dGJdntWrmVeoeAJsGYLbk
	ik8MK7QfgudjRXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7079B3EA65;
	Sat, 28 Feb 2026 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mUwiGluoomlyTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Feb 2026 08:33:31 +0000
Date: Sat, 28 Feb 2026 09:33:31 +0100
Message-ID: <87a4wt6zdw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct codec_connection
In-Reply-To: <4009c337cc1a1a57795562279270c03687973b3b.1772138640.git.christophe.jaillet@wanadoo.fr>
References: <4009c337cc1a1a57795562279270c03687973b3b.1772138640.git.christophe.jaillet@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[wanadoo.fr];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: ACD6A3F8E7
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 26 Feb 2026 21:44:10 +0100,
Christophe JAILLET wrote:
> 
> 'struct codec_connection' are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   10034	   3392	     12	  13438	   347e	sound/aoa/fabrics/layout.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   10370	   3040	     12	  13422	   346e	sound/aoa/fabrics/layout.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> The fabric_data field in struct aoa_codecis is only used in
> sound/aoa/fabrics/layout.c, so there should be no side effect for other
> files that include sound/aoa/aoa.h

Applied to for-next branch now.  Thanks.


Takashi
