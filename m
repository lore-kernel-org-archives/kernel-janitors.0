Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF8D304
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P9McitVu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UEo3p3f6"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFD1BB;
	Tue, 31 Oct 2023 00:09:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD1B02186E;
	Tue, 31 Oct 2023 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698736190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuhTPF2nGxyW2WW8m2ohxcVL9tICIUEqav9y02554yw=;
	b=P9McitVuq1lNXVZ9peFtsmlQM2/3ghmEVt6dIFBxtBnFgaSpGV2CrqGlIb3HbzahU02XVM
	XNrNl+D8crFFmffS+PBRhpg80iyP8tPihueYno/UuahSN+zRaR471K/ylxY6KTSqUKvCAm
	s/Av0yBhaGP/9kr1sHa1KYxh0BBDLqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698736190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuhTPF2nGxyW2WW8m2ohxcVL9tICIUEqav9y02554yw=;
	b=UEo3p3f6U6i9QABLiWbDd/xSpw5kQ8ZRBZ61UtTPVpo92rY8GNXyQEhjtbOKmNmIACXhu9
	pXuL2SVY7CrCTDDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BF46138EF;
	Tue, 31 Oct 2023 07:09:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lSeMAj6oQGW7FwAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 31 Oct 2023 07:09:50 +0000
Message-ID: <28a41bf1-661b-47e3-8b7e-65cb64a0b8bc@suse.de>
Date: Tue, 31 Oct 2023 08:09:51 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: Fix a memory leak
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/23 22:22, Christophe JAILLET wrote:
> All error handling path end to the error handling path, except this one.
> Go to the error handling branch as well here, otherwise 'icreq' and
> 'icresp' will leak.
> 
> Fixes: 2837966ab2a8 ("nvme-tcp: control message handling for recvmsg()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/nvme/host/tcp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 4714a902f4ca..3c35c37112e6 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1429,7 +1429,8 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
>   		if (ctype != TLS_RECORD_TYPE_DATA) {
>   			pr_err("queue %d: unhandled TLS record %d\n",
>   			       nvme_tcp_queue_id(queue), ctype);
> -			return -ENOTCONN;
> +			ret = -ENOTCONN;
> +			goto free_icresp;
>   		}
>   	}
>   	ret = -EINVAL;

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

