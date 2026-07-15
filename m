Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0363C4171
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101689; cv=none; b=HT73v10VHBMh8s7PBBLuW4n/kxrAcvuU/knaY0gD7mEU2eDoFUd3I5pWl1x3RtIDS8gGLTr/3Z3y776q0xqMtck3KMGCXr2fMWUb3OoSZFxBSZqvem1+g0u4c63qb+AvoQUQuhgzu3UeMdzKBI2CjV7EOSmali+NBbY9UWxwOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101689; c=relaxed/simple;
	bh=tDSia30UacaQmikHFwxLeWEJ3Lu0R9bURzyG66Lq5B8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1Ivur4K2/vrkxWjAQo5qzg6+VHzSerYQorL5fUgErSbqdonsKVnMXDliG9aWoatFRBXwqI7mcBxKPTICLN0YGXFEVROY9hLbwSkSnAh1+GqW60049qIXazng4AJazoMe3IPk1Vnt74nR+Hmb6I9YVe7Es7uYqovpevNB1g4apA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ld/mV+h9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DGdHGwes; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ld/mV+h9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DGdHGwes; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ld/mV+h9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DGdHGwes";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ld/mV+h9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DGdHGwes"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C1BD33E01;
	Wed, 15 Jul 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRFBu5gMbx6mtTRWLh0Op0SGejytrG8v8g76BepWbg0=;
	b=Ld/mV+h9d9V3a1VSrdXace/SU5KpGt49uSlZkAtBim2cGceK0ngB/pnDB8UawAUCghqFk+
	IbYYOoAYW7xW6kUK+B+kOMzwBlfIpQ+RSnKf44iNMt4U38RKt589cTaCcNZXj+cNCtUj/W
	25amYCtQ6hCbla0AfJENN0goIblNmR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRFBu5gMbx6mtTRWLh0Op0SGejytrG8v8g76BepWbg0=;
	b=DGdHGwesS2qIqbPADqwwdfXpNbuzxIiBoDu0rNNz6/qRY/mcDglTjYpNrPmUgJUksk2BdF
	gReIKCOjB8fJ+8Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784101685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRFBu5gMbx6mtTRWLh0Op0SGejytrG8v8g76BepWbg0=;
	b=Ld/mV+h9d9V3a1VSrdXace/SU5KpGt49uSlZkAtBim2cGceK0ngB/pnDB8UawAUCghqFk+
	IbYYOoAYW7xW6kUK+B+kOMzwBlfIpQ+RSnKf44iNMt4U38RKt589cTaCcNZXj+cNCtUj/W
	25amYCtQ6hCbla0AfJENN0goIblNmR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784101685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRFBu5gMbx6mtTRWLh0Op0SGejytrG8v8g76BepWbg0=;
	b=DGdHGwesS2qIqbPADqwwdfXpNbuzxIiBoDu0rNNz6/qRY/mcDglTjYpNrPmUgJUksk2BdF
	gReIKCOjB8fJ+8Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 904B9779AD;
	Wed, 15 Jul 2026 07:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4TEHIjU7V2r3NAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 07:48:05 +0000
Date: Wed, 15 Jul 2026 09:48:05 +0200
Message-ID: <87qzl4y9qi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: aloop: make read-only array texts static const
In-Reply-To: <20260714163316.183165-1-colin.i.king@gmail.com>
References: <20260714163316.183165-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -1.80

On Tue, 14 Jul 2026 18:33:16 +0200,
Colin Ian King wrote:
> 
> Don't populate the read-only const array texts on the stack at run time,
> instead make it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied now.  Thanks.


Takashi
