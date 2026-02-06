Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5623D7E3
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Feb 2026 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385560; cv=none; b=MSvTJfm0e90vpWc4Av+unSg7tH9HE1JbVcdVHaS+j6tfiO+rpDbxWp1Eip4F/lNGzUAKNk1+vbM99i7bRU9cNC0cmidEeXk4Dk3Mdw/L4OWdefsqXRq6X1anjRnWOcXFXO/tpRK7IcFCW3sxb0lcbb0h/K/SpJM2Df77OlV5wjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385560; c=relaxed/simple;
	bh=89yh1QiXKI2Jts0olOiajmg0U5qtmjfCoXB/fnfFT8k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICzgUBhaIFTWVVDvVAoTPT+sS/lGiXf5gBNTxYhjfp9qFOD/2jE8NQ0JgEhHuJy0GhMD2rg8tzFrjwa9yQ23wTiKovLy11yP+Ukgwo+2GiZFCMC8Xa/6uNsawgmi2uW4DGQ/BQS2uJVgg7x4fQrKXDwShcWDlGZ+38NH73vYK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HQF+F7zF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ak3vyguJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O7DjVMbx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NEhykCX/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HQF+F7zF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ak3vyguJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O7DjVMbx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NEhykCX/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EFBB15BCC5;
	Fri,  6 Feb 2026 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770385559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jmcd64dI6Xh+cMrYC87CgBGDD03F64mVODdCX+9cG0=;
	b=HQF+F7zFpI0WFcqZxXmg3jkwRrQoC5cERVhytvT9hLuK+T4XDE+HpS1LamYTeK1bQ0Jjnu
	5/ZjNy900gTj2ZmBwgSb/1rE19pwAFFMwMLxKwNEZMpXo9eWSnn8hdasIWUGifW96FQZne
	60p1H7+xcqzWRVBmavHDY2WkyQfc/PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770385559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jmcd64dI6Xh+cMrYC87CgBGDD03F64mVODdCX+9cG0=;
	b=ak3vyguJ9Oe6BSojylL6fXZVXFNHKHVodDSFfXn32lkneun+MWerZue5ZHfAcVInI6RKOJ
	iKxnlYSkFkCyq3Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770385558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jmcd64dI6Xh+cMrYC87CgBGDD03F64mVODdCX+9cG0=;
	b=O7DjVMbxLXwy6tbhI+7btnGgrO+MgSE9oAjh0kgz4uMQALM9g1Szf6gL2uCD2jEObnMYQ/
	Hf4DxYvuiKHRi+Ng7+H/fLrIRQ4sen8oaMXJVBeHcQavHx9VDa+DEH1RDv7yvbcYsoxpwu
	R0O1pLQvC1IbAhyP0mJHcPH0iWH6Gw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770385558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jmcd64dI6Xh+cMrYC87CgBGDD03F64mVODdCX+9cG0=;
	b=NEhykCX/BpdK87Ej66dLoh2DfIySeuldkZ7UJXpIemxY1Fx4p73UC/pZOmcDd1fkL313kC
	susQq2wEkums1XAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B41083EA63;
	Fri,  6 Feb 2026 13:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4F6yKpbwhWnXJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Feb 2026 13:45:58 +0000
Date: Fri, 06 Feb 2026 14:45:58 +0100
Message-ID: <874inu9e95.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: oss: delete self assignment
In-Reply-To: <aYXvm2YoV2yRimhk@stanley.mountain>
References: <aYXvm2YoV2yRimhk@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,linaro.org:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 06 Feb 2026 14:41:47 +0100,
Dan Carpenter wrote:
> 
> No need to assign "uctl" to itself.  Delete it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, it's a garbage at the previous fix commit 55f98ece9939 ("ALSA:
oss: Relax __free() variable declarations").  So I applied with a
Fixes tag.


Takashi
