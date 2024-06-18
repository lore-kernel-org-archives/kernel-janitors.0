Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0013C667
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719569; cv=none; b=dR++18RNz7cLa+y7YdELoSBEaUBksxm2X15zA84SXg1c2m5QTlQR3wOAY0GU9KdkRo3TA2B/9kCbbvnLW+Qyn4zAjW3LFtyjneDY9Xn0rpuqxIRHwk6+MdP4l3vtBrHhvXJDk07wkCgPgAXFPIvjxD+OULLKQNLutEDtGe3LQJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719569; c=relaxed/simple;
	bh=3tWPyz+H+5JYN2LQkZb85BN9fLWrx20Ft0eyonLfLh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryO6OXkPGoJjSF6hbusZqWq3FhtGvKOoyWeZEhFW+oQZOAOg2CAKG1LYKSEjVHVLShokQsZ0UakoAfophDgiLKvVcezjxBIngesSOw4FW1uKMS+ILO1c8FhwROm3qCOGfpoOy6/GkTomY1+bRiGrLnaSmdew8edHBCjvT0eStCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cA/prOgS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cA/prOgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718719566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRRnrgV0rt3ExE2xFfoh6/XNnVu7pAMZW64ZA8tSVOY=;
	b=cA/prOgS43MTcRJNdlLBfaTpPC6zZngYw6SGvnLav1fdtZdwQDmooOViL5CaRWXWvkF1P1
	StdvvuWDPpoeggFLhvdcUYJ06JmMN7iiuLtiZkuy+Bzuir0VRDgnwDe9jFI+VozVEVA/lA
	U2DckS1D24f0UofqMDJGvRRKQCnZ3rU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-KlgULwsvNUim-eK7iyagHQ-1; Tue,
 18 Jun 2024 10:06:02 -0400
X-MC-Unique: KlgULwsvNUim-eK7iyagHQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCD4B195C261;
	Tue, 18 Jun 2024 14:05:56 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.148])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 83D9C1955E80;
	Tue, 18 Jun 2024 14:05:54 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 18 Jun 2024 16:04:25 +0200 (CEST)
Date: Tue, 18 Jun 2024 16:04:21 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrey Krechetov <apkrechetov@miem.hse.ru>,
	Alexey Dobriyan <adobriyan@gmail.com>
Cc: apkrecheto <apkrecheto@mts.ru>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fix typo in pid.c
Message-ID: <20240618140421.GB13758@redhat.com>
References: <20240617220206.2788261-1-apkrechetov@miem.hse.ru>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617220206.2788261-1-apkrechetov@miem.hse.ru>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi Andrey,

thanks, but I guess this should be routed via kernel-janitors?
CC'ed, and add Alexey.

In any case, please don't send the patches offlist ;)

On 06/18, Andrey Krechetov wrote:
>
> From: apkrecheto <apkrecheto@mts.ru>
> 
> ---
>  kernel/pid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index da76ed1873f7..4a52afdcb731 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -220,7 +220,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  				       tid + 1, GFP_ATOMIC);
>  			/*
>  			 * If ENOSPC is returned it means that the PID is
> -			 * alreay in use. Return EEXIST in that case.
> +			 * already in use. Return EEXIST in that case.
>  			 */
>  			if (nr == -ENOSPC)
>  				nr = -EEXIST;
> -- 
> 2.34.1
> 

