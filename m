Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894C33D4F8
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184331; cv=none; b=XTgPEx+iNVzTkSBI8ubVwYilFiia/Nek44NrEM/NBpgUaDUofA8zgtkvQMuTMCKMJesxXtvjZuQ5V33IRnnKFydGKn86OvU6smR49dW0N/rv0Q796pyHTXTAFZ2BUiRYjnKrSxVmbrLrUbBqXTnYaw2d2+UmzaUyuUca0IOOxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184331; c=relaxed/simple;
	bh=Fu38BJtlNxHdYkzxYiDkmFGEJknuthrKvC9QgjDc1Ts=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EhSLdwrDINvrhMZQLtYfM/lxeL7aJprEDOrLpfx0U20VdHSQvT7A9pkRRTk+oT+XxAx7PpcL7ORgfR504vfUyEPm959QG6A1ax+etHJRpma4VaYfNqtTy9WNZpi/4A/DCxzgNxVkDzeW4fjgqXJjwkxkpTRXLX2+jdgbHxBUoUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGESorKq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGESorKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781184329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aYS/g97xEYMH+/CRm1WrC2o941rbaUtEct5ejr/IBAw=;
	b=IGESorKq1BJr5KgFwcIBmhwO4uaLRd21tu/vYPtloe+Kj8BWHKhxEMfYrAepFRwczMQ7uN
	F0k3pbtqMp3vwURVsRHlNYKdUNNRdVtmT0tPcupoYNRgCvEecGfqjsAl7mRfHr2T0lNAmm
	cX4fTILI6k1hW9eEUVEjTQPje7xUw1I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-rUnDC8c_PZqYMPibc2vVVg-1; Thu,
 11 Jun 2026 09:25:26 -0400
X-MC-Unique: rUnDC8c_PZqYMPibc2vVVg-1
X-Mimecast-MFC-AGG-ID: rUnDC8c_PZqYMPibc2vVVg_1781184325
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1452183076A;
	Thu, 11 Jun 2026 13:25:24 +0000 (UTC)
Received: from [10.44.48.10] (unknown [10.44.48.10])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E957A175F;
	Thu, 11 Jun 2026 13:25:22 +0000 (UTC)
Date: Thu, 11 Jun 2026 15:25:17 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
cc: dm-devel@lists.linux.dev, Alasdair Kergon <agk@redhat.com>, 
    Benjamin Marzinski <bmarzins@redhat.com>, 
    Mike Snitzer <snitzer@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: dm: Use common error handling code in three functions
In-Reply-To: <3b8e5056-0611-43eb-9fc3-c82f0511d466@web.de>
Message-ID: <fd9dc2eb-5fb2-fda0-1e8d-e1c7c2f4aee9@redhat.com>
References: <be375668-6d07-4070-9b08-d6445afa324f@web.de> <d802f7e7-9ed7-e7f9-89c5-19cdc9806367@redhat.com> <3b8e5056-0611-43eb-9fc3-c82f0511d466@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811712-182789233-1781184324=:83913"
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811712-182789233-1781184324=:83913
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 11 Jun 2026, Markus Elfring wrote:

> >> Use additional labels so that a bit of exception handling can be better
> >> reused at the end of three if branches.
> >>
> >> This issue was detected by using the Coccinelle software.
> > 
> > Hi
> > 
> > I think that jumping into a nested block isn't good practice and it makes 
> > the code harder to read and maintain. I would redo the patches so that 
> > they jump to the end of the topmost function block, for example:
> Thanks for your constructive feedback.
> 
> Can any further adjustments become feasible for the design goal “Centralized exiting of functions”?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.1-rc7#n526

I think that this document is OK.

> Would you find goto chains applicable for another while?
> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standard/recommendations/memory-management-mem/mem12-c/

I think goto chains are ok if there are few variables to free.

> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v7.1-rc7/source/include/linux/cleanup.h

I am not a fan of these. I think that goto is OK if there are few 
variables to clean-up. If there is a large number of variables to clean 
up, it's better to zero-fill the whole structure and free the entries 
unconditionally (kfree does noting if it gets NULL) - see for example 
dm_integrity_ctr - it allocates the structure with kzalloc_obj and on any 
error it jumps to the label "bad" that calls dm_integrity_dtr - and 
dm_integrity_dtr frees all non-NULL entries.

Mikulas

> Regards,
> Markus
---1463811712-182789233-1781184324=:83913--

