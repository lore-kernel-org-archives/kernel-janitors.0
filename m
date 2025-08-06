Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096328B7FF
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Aug 2025 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484499; cv=none; b=VlBKe4bGv2t/pTojbPJMOEY/IRooVGoStdeNJY0X0Jp1uBYkw+OO6zwJr2gzizFdAs3h7OM4myRKkdkTI3CEE1VdOcfdLpRDndphF5s4KrV+sUp1cs6oNVoKVAWtgFj4Swa13VaROcAhKdashMSE6ziZ9Bj3lLzFlCdePLG1YjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484499; c=relaxed/simple;
	bh=HfI/zx9XDbVgQ0otqTbAOpA5i4S/wWlfQ7OSkosJO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHqxNPlwvJcSPo1WPjDYgYjQQZS9WOTTXA3itMHBeLpaIaHp8aAW7My/fxL+/rVuptSak0+2aTkjtBeMYqCbMqjPXqDJfBgB2RC/Jq675aS6xBgvjXNgQnsvFLiPnSig8hXcTjV1Aq/k7ofpOhAqAdgxRLGG2HTKdPJrexjU2zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imzq8hEa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imzq8hEa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45994a72356so7590705e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Aug 2025 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754484496; x=1755089296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFXnqIPRbV3BB6pjp/TTF7phDE5SLRKlO1oZx1A596Q=;
        b=imzq8hEaQBpaEeYBfp44rNq4dTIj4SrxeqxANKEtK3ajHy8UdWmInIe96u7qAnHC0C
         yRe+FekfmJ7V1aA5yt1Xu2+3TmL8deEKqe49J9hXWvsf++BWmndxW49sdLPjSjTY6s7s
         cWuZ0k38qMWS4VPjnBCFVq6KBfsewMfXFO9Q67lyDmMK0Dty1jbhGGNEo+hOvmCTw+10
         NiJdZlMvBb0pdTXXYJFl0/Dpno5MCzU764fyYH9nx1N+insNmrcV09rDDMuUrJS1IxH0
         icWPVTmY2ZBe/4UTa+ZcUc1ro+Uni28FoKE6JjvlVQQqTjbdlhxDbDV90DvjDcv9vJXm
         KIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484496; x=1755089296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFXnqIPRbV3BB6pjp/TTF7phDE5SLRKlO1oZx1A596Q=;
        b=uasfB6mjFLtS0psNkFZdegvsHYVuuX7SS9LSPw612RCHPjDml0qloxdnareYDKbuXC
         5ytNuX0JV3ounDE8XiFMwCxmTBOJ8AGzi2rGA0uQmMcism7DCHZ85J7eHrH2qEamwBBi
         Dkebfd61DNHdLbuEqPe7gkK1ItY5QPa+WUeZCAEoqV7W69A8fgPWQoXHUIG0p+/5hk/l
         9MSPCcLOKPpACQTSVubw7nFcrLVjYxMInxfl2jSTzewpBeQGi0b/PGJ5s9yAZoM7nHuv
         S3chsx+JWXFvB1lhNgOl3oRoVq57vjX15BO2KtghjN5SXBpGFYumE3WgdSCVJ/fqN1WE
         PVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0oqrFTt07WHajpmRQMjrHjuFbjGEUXlV8C+pegULgR/QctmvtjYdG1CuRyr6k6DHKnCGoHZEehlNzSfqz9ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSN+X9IO0zxFMS3AwpAnINcZms5X3pRPFvt+XyG/LoiTvoIs/
	tBri3aMDQMz80ywRJP8R0jONJCy0gTU8gEZmnx683NsfS9XAmGS7ubvyibtcMD/UPZE=
X-Gm-Gg: ASbGncvlF3Eqn2Agq7nHf7stmWksBt6LDKyJh1oA6q7yM7djXe24+BoqYcgNw7uCP5E
	b13CcdEnip95xGtgECXwoV/m37azKh7OxBgbwATd3tAleg6oWkYdva9+W5vKToBdD1VquEW7N8S
	Fpi/sfMRziXDbRL53sdBNX9hRxG4hSoozlZptKNQl1js5TJZiea8voykmBjb5ko2BaCwtIyvsSl
	SG9DxFsc6uNdxfD2zIjA+sshdw0adGTs+NlC4e88SQAfF1mQRtjJvfOe/99GUsU43Ut0lMiPXls
	p76KGbQFXHhAzHTV2tT9+CEzL3xx7ZZxkTB3GNFkwPmWAta9d5J4olL1p8f0C0E3krJrqsjwEbR
	1qtbUqVp+X7pyRFpntChTnCEHiBt5BfJW4jeaRQ==
X-Google-Smtp-Source: AGHT+IHNdtNiD0VN2ibLWx44aT6ddin7+JcHP84VGabSPvwF+bE3cWHRcZxCTSkZKPKy4kZcasPWeA==
X-Received: by 2002:a05:600c:3e08:b0:458:b608:509f with SMTP id 5b1f17b1804b1-459e711e039mr25952315e9.14.1754484496042;
        Wed, 06 Aug 2025 05:48:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4595cfea56fsm95238275e9.1.2025.08.06.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:48:15 -0700 (PDT)
Date: Wed, 6 Aug 2025 15:48:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Metzmacher <metze@samba.org>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] smb: client: Fix use after free in send_done()
Message-ID: <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>

On Wed, Aug 06, 2025 at 02:20:56PM +0200, Stefan Metzmacher wrote:
> Hi Dan,
> 
> > The mempool_free() function frees "request".  Don't free the request
> > until after smbd_disconnect_rdma_connection() to avoid a use after free
> > bug.
> > 
> > Fixes: 5e65668c75c0 ("smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   fs/smb/client/smbdirect.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> > index 58321e483a1a..162f8d1c548a 100644
> > --- a/fs/smb/client/smbdirect.c
> > +++ b/fs/smb/client/smbdirect.c
> > @@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
> >   	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
> >   		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
> >   			wc->status, wc->opcode);
> > -		mempool_free(request, request->info->request_mempool);
> >   		smbd_disconnect_rdma_connection(request->info);
> > +		mempool_free(request, request->info->request_mempool);
> 
> The correct fix is to use 'info' instead of 'request->info'
> other than that the order needs to stay that way.
> 
> I already asked Steve to squash such a change into the
> original commit (which is not yet upstream).
> 
> See:
> https://lore.kernel.org/linux-cifs/cover.1754308712.git.metze@samba.org/T/#m98a8607d7b83a11fd78547306836a872a2a27192
> 
> What was the test that triggered the problem?
> Or did you only noticed it by looking at the code?

This was a Smatch static checker warning.  You need to have the cross
function DB to detect it.

regards,
dan carpenter

