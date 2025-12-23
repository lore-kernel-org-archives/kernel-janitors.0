Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DD1552FD
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Dec 2025 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766462439; cv=none; b=PeLwcdyBpYB8RsPIED6p51q9Y/uy9Z4ntqWrkeHLeUfLxOAqnaggLClt4fuMdTYUAaBjUaxhuWfPVK6vFSEGg25rfdSyP/QrR1g4+FNkEYhvZvm2JYwm4mLBOXQvAqqHHBE1BVdQGDxk4FvaJi8cMsK/e0CcelCcMMHzbZoCNSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766462439; c=relaxed/simple;
	bh=bICrEDy3/6B6CkqwJLZrrx4IqHmucXBNI/rhBU6Jp4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEmNInEoW8l6HZ2KjKj82Y4E9wJp2c+4rmMVnpZ8prr33izi87Jt6fbBHJnNyA0G9bOxF5M87TSfaurM+duDZn9E15QZ+faHoqHIr5L3WAAVUJTeltjGQLGOda2i1TMrEUutLGnPPywxCQ9pPOXo+YmR1xpkKMrHy8NqoZoytFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2WmfYuK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oPx7ZnQb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2WmfYuK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oPx7ZnQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766462436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TZcCotV/QfG6wRX3tVqdLU94aUxGvWejw2TKi4N7jYo=;
	b=A2WmfYuKFPTyFKDPQfpEnWsVeJ2622Ss/IClfFwhEfiDqIajWcfpHKgChe7bvB8uiD/rQD
	J0WOHT5lKbu1l60gu7WoXuwKj1uhmNLsrNr/xpAVGl4Lk63RZf6jbAKFdwWYvd198wAPhY
	NPtQrY++PPz9eW2buHQBjzJGZFojiHU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-rOrLKofcMI-UsUn_wnyoCA-1; Mon, 22 Dec 2025 23:00:33 -0500
X-MC-Unique: rOrLKofcMI-UsUn_wnyoCA-1
X-Mimecast-MFC-AGG-ID: rOrLKofcMI-UsUn_wnyoCA_1766462432
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a07fa318fdso82993045ad.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Dec 2025 20:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766462432; x=1767067232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZcCotV/QfG6wRX3tVqdLU94aUxGvWejw2TKi4N7jYo=;
        b=oPx7ZnQbf0GLAHYxPMRP1xaAz/lktfR+dkyXQBv0FCdwvz44HtalXDVDYqW5PFKUku
         XtbQFuWsiBXzuK78AMN71XVS/h5jBIyu2STpF6fcxdlQ2biGLfTEn/xklBsCwxk8mQ5C
         RDSAVLysfLksZmlKFEklPkIDmYKb1TQSu59ZBywgMP5OQqbDMfnZU8cs3+iEpV1IXlDo
         nPuZNj/Od74dkxvvfEpKpgNntl6DaFy5whX8fFokyeeGRRptyUK1sig7CWKjZcEIpKXE
         Y/C1SYIdTaG9lWJde0e4931p9feq3d5sC9Lq/9YwxGEmkiGU95Uwbr66Z0lZ+YqiN+W3
         M6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766462432; x=1767067232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZcCotV/QfG6wRX3tVqdLU94aUxGvWejw2TKi4N7jYo=;
        b=EEHaiS2Kw1Q5Xlo/pyrYOMcO4GKRp6edZPf3gvrx3cgtkC6KPDYWyQJMsiSJevLoVj
         I5X+plvPMuNJ3U4L1wE/D45MuqFJu2eWAkvtbNjlRtV+LJkHWXg2nqAMt0de+M4lUFdo
         bvViHKd+TuCN9fq06mcCxqhoxMgf6AazD2YAXLt/nDcbYdApkOEZfF2KP53iZksB9Kqa
         2fiHfvVOC7rR4qvrKDeArOv53lCkph3F79Eh0PEzbAD1dLu4yF2RP9hpc2uUX4obUKZL
         Xi8E0DumTKsuqG4ygHS6VdQyo7k0YJXK+e3mnc5K4ZGHIr4kDkXY2jKjtqe5ym2q6O+v
         7S0g==
X-Forwarded-Encrypted: i=1; AJvYcCV4xUQTvZQ0pjr6p0DBE+RtaDPC8pWN8NjlNjfRiR7dF9p0QW3zdO88bB4+ubysBWxauWJmN4yty5vtAoa+8ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1j88vhF3uD6odlq8KTUx0bJtHa7yURzQdjIhrXmF1aPPYt0FX
	2lU4w2I6tn+lTnrE6ebxaOE4pWWhk7mae4GGQ8jjdMsglMWroBIK17tUJ1kRdUpnFiZSnZ/IRZ5
	6WYEStJodvnESqAkg0sxr8d+IKKyuaXC5NHiy6gifRPjAEv0ZlthcnOIo6C16vIFmQvY0uw==
X-Gm-Gg: AY/fxX5X8eo6lW7iHj0mtROEN93iK+u5msuOqiIRDRpKUuT13czdnaFogOQOV0H4fkn
	nVVdgVU/AE8XnSxFeAJKMWPDcWIZvZjQbEz4MNN/zLrTrD8O5z8borxN7wPwIEZdlmihCdPrGil
	i5f1kKZJN9pzeTHscSqzeifEQSVot3FkyGWOfDXhYXijU53a+/Pwhu5kRf2ulz2awmVI2VxR+nm
	NCdPSgNPN6C/lUyFiTizRjoQtop0gYs0ySqSBB/60VGfGPMCODiZmJoal+wi+1p5oQ10z1U+Aet
	1WmeCHXasECSzWU8I9gIVJ9rbs2r1xwqIu/E6WAqwoACxDZKkplyxpopCXaIA2lO0YvEVhAL+Yd
	s
X-Received: by 2002:a17:902:dac8:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a2f223177dmr127364775ad.16.1766462431696;
        Mon, 22 Dec 2025 20:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzwF5m/iHyn55LEilssrWhhc0HpYjAI8bNeQoZneyKJRrnoEXNFbeVjwUfxPQct8rWlymXvg==
X-Received: by 2002:a17:902:dac8:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a2f223177dmr127364375ad.16.1766462431140;
        Mon, 22 Dec 2025 20:00:31 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm113540215ad.50.2025.12.22.20.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 20:00:30 -0800 (PST)
Date: Tue, 23 Dec 2025 11:56:02 +0800
From: Coiby Xu <coxu@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH] crash_dump: Constify struct configfs_item_operations and
 configfs_group_operations
Message-ID: <xygbee3xw72kjitwo6xas6cxoqnx4zmny35tqc4anypqdxiow6@ahoenkvggcv2>
References: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>

On Sun, Dec 14, 2025 at 06:57:30PM +0100, Christophe JAILLET wrote:
>'struct configfs_item_operations' and 'configfs_group_operations' are not
>modified in this driver.
>
>Constifying these structures moves some data to a read-only section, so
>increases overall security, especially when the structure holds some
>function pointers.
>
>On a x86_64, with allmodconfig, as an example:
>Before:
>======
>   text	   data	    bss	    dec	    hex	filename
>  16339	  11001	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
>
>After:
>=====
>   text	   data	    bss	    dec	    hex	filename
>  16499	  10841	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---
>Compile tested only.
>
>This change is possible since commits f2f36500a63b and f7f78098690d.
>---
> kernel/crash_dump_dm_crypt.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>index 401423ba477d..0d23dc1de67c 100644
>--- a/kernel/crash_dump_dm_crypt.c
>+++ b/kernel/crash_dump_dm_crypt.c
>@@ -223,7 +223,7 @@ static void config_key_release(struct config_item *item)
> 	key_count--;
> }
>
>-static struct configfs_item_operations config_key_item_ops = {
>+static const struct configfs_item_operations config_key_item_ops = {
> 	.release = config_key_release,
> };
>
>@@ -298,7 +298,7 @@ static struct configfs_attribute *config_keys_attrs[] = {
>  * Note that, since no extra work is required on ->drop_item(),
>  * no ->drop_item() is provided.
>  */
>-static struct configfs_group_operations config_keys_group_ops = {
>+static const struct configfs_group_operations config_keys_group_ops = {
> 	.make_item = config_keys_make_item,
> };
>
>-- 
>2.52.0

Thanks for the patch!

Reviewed-and-tested-by: Coiby Xu <coxu@redhat.com>


-- 
Best regards,
Coiby

