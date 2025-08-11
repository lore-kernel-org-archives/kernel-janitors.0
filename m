Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535E2D8799
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896407; cv=none; b=LcqHqO66P+lJ+5of8lygCO4qMsfTRbcTQSMae1H01f+XnqCEk/bY5vAyV56OO/2V62CC8xP+0lMQor18u7t553a8YdtAcBfJSEnSmOGCDgIbJ/LLrc+9dJg6lpgxodPByWoZsNoYJn5Q2Z87VOKGw1zOjUS/EtTEEhjBle6agSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896407; c=relaxed/simple;
	bh=xCB0WbttFcfBfSP2OKH09UmQcRPyguBwxuyE0MN9f+8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkW1A98EHVBZC2Iekx4THJmyUl5wyU8VrZTcDoIvmxHq65WAihAZjJdVXB18u8/SutJYJeoIuelod/94YQxkApUjyyVi8g6b88wIkmKn+wW+/OeuktJhnddBXjU0JpOJKwEO1UR2G+Y6rtuLx3V5SZKBxncVvtoL8TN/4j7t0Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kahi17ZI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0E2t0YAg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kahi17ZI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0E2t0YAg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kahi17ZI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0E2t0YAg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kahi17ZI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0E2t0YAg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 08F135BDE7;
	Mon, 11 Aug 2025 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754896404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exo7gOXMV6ysRdu0W71MW4rowBZS3bLmeSYPWE+GKVA=;
	b=kahi17ZIxkS9ur86gd12/Rdi8HB4l3wV+5urU49pZqZxNOHn5dmB8TYmfWx7XFbxRfOnxA
	XbkU+Wgonyi8NJspRDx25Nab0tPEAynooBPw9lr2Rt2ZgdPjlC1bRguWDXgDZK6eaATtON
	Mwiwzygx2hC5vgYpRTxci0ZjOTLWIK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754896404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exo7gOXMV6ysRdu0W71MW4rowBZS3bLmeSYPWE+GKVA=;
	b=0E2t0YAgP1rCi4/SVsAAhZuFsRPx0nCOl9dxiQ+Im4Mpr9TNym4ngf+etMNWaG8soAKqZt
	qfaYj46OmMPT5CAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kahi17ZI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0E2t0YAg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754896404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exo7gOXMV6ysRdu0W71MW4rowBZS3bLmeSYPWE+GKVA=;
	b=kahi17ZIxkS9ur86gd12/Rdi8HB4l3wV+5urU49pZqZxNOHn5dmB8TYmfWx7XFbxRfOnxA
	XbkU+Wgonyi8NJspRDx25Nab0tPEAynooBPw9lr2Rt2ZgdPjlC1bRguWDXgDZK6eaATtON
	Mwiwzygx2hC5vgYpRTxci0ZjOTLWIK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754896404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exo7gOXMV6ysRdu0W71MW4rowBZS3bLmeSYPWE+GKVA=;
	b=0E2t0YAgP1rCi4/SVsAAhZuFsRPx0nCOl9dxiQ+Im4Mpr9TNym4ngf+etMNWaG8soAKqZt
	qfaYj46OmMPT5CAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBEA213A55;
	Mon, 11 Aug 2025 07:13:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FZlALBOYmWg7UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 07:13:23 +0000
Date: Mon, 11 Aug 2025 09:13:23 +0200
Message-ID: <871ppixre4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: hda: Fix spelling mistake "dismatch" -> "mismatch"
In-Reply-To: <20250808104621.829448-1-colin.i.king@gmail.com>
References: <20250808104621.829448-1-colin.i.king@gmail.com>
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
X-Rspamd-Queue-Id: 08F135BDE7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.95 / 50.00];
	BAYES_HAM(-2.94)[99.75%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.95

On Fri, 08 Aug 2025 12:46:21 +0200,
Colin Ian King wrote:
> 
> There is a spelling mistake (or neologism of dis and match) in a
> dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, applied now.


Takashi
