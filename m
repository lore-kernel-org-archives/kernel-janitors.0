Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977537EFED
	for <kernel-janitors@vger.kernel.org>; Sun, 31 May 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233892; cv=none; b=lAHpAdVzYWs2J1sIB1Z8dni7Uq7/SDVzrBbQSFmr/pz/yr3mKMk0RXvDFe5rZwDmmETqKtvlC5uevOu3Kko9Kb40VuXymhL5h+q5//3GMiH9ER5/Q3Ef37hn87bbu96UX1n091H5pqyoqhuFagG4YmukPs+LHN2Vy1abUcWU2qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233892; c=relaxed/simple;
	bh=NauQmOqH2BWaS9XrDsh3i/IoMHQC/pPyf/qJ+C6ZAzs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLfTVEGjPCk5kMXOpxyjTm7HelvZXtY4opHlsQEDv6smnkVOxdviTtgO/8rPhR5qiEi2G5sTRYd6d8IfyfZ3AxYnZ8dw0AsYS6/K95krfTrNDwC8IdgtmT+ihJiPVZ6e6p+/NeewLz5/7OZX9DqUN9Q32bWInWc5l4AnXMgo9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FFshQuSI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/R1nftf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FFshQuSI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/R1nftf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FFshQuSI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/R1nftf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FFshQuSI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/R1nftf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7535F6BA8A;
	Sun, 31 May 2026 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd0wtAtPNKQYOdHOD/3SBAX/qXIEzbY1AZ5fhK+DaU=;
	b=FFshQuSIGwNfM7MLaKVEViczD634ZSSJH8Qu/Vuayt9HucWHnzBpLU4tkW2IUslMUps1wX
	224GWZxOnAJ6ISY1l3D5yJmYtEzjcqrE5E85C0whN8b8c83R8oSWl1bczLX7XHwALjr0t+
	VVLYAycdoWgO0KA54IGlSZSt1M3IKFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd0wtAtPNKQYOdHOD/3SBAX/qXIEzbY1AZ5fhK+DaU=;
	b=8/R1nftf0XrwMH3MwL6uUyQxESOGGO3/KOeAvdxKSEvp2rSPYvqnpiUP8jBeiCQAAbJGFZ
	dnfA7HRM4ofne8Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FFshQuSI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8/R1nftf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd0wtAtPNKQYOdHOD/3SBAX/qXIEzbY1AZ5fhK+DaU=;
	b=FFshQuSIGwNfM7MLaKVEViczD634ZSSJH8Qu/Vuayt9HucWHnzBpLU4tkW2IUslMUps1wX
	224GWZxOnAJ6ISY1l3D5yJmYtEzjcqrE5E85C0whN8b8c83R8oSWl1bczLX7XHwALjr0t+
	VVLYAycdoWgO0KA54IGlSZSt1M3IKFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd0wtAtPNKQYOdHOD/3SBAX/qXIEzbY1AZ5fhK+DaU=;
	b=8/R1nftf0XrwMH3MwL6uUyQxESOGGO3/KOeAvdxKSEvp2rSPYvqnpiUP8jBeiCQAAbJGFZ
	dnfA7HRM4ofne8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D7CD779A7;
	Sun, 31 May 2026 13:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2TWqCJs2HGqUWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 13:24:43 +0000
Date: Sun, 31 May 2026 15:24:42 +0200
Message-ID: <875x43pv8l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: hda/tas2781: Fix spelling mistake: "Froce" -. "Force"
In-Reply-To: <20260531101339.42155-1-colin.i.king@gmail.com>
References: <20260531101339.42155-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7535F6BA8A
X-Spam-Flag: NO
X-Spam-Score: -2.00
X-Spam-Level: 
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]

On Sun, 31 May 2026 12:13:39 +0200,
Colin Ian King wrote:
> 
> There is a spelling mistake in a snprintf statement. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
