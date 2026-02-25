Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD033A70F
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Feb 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013880; cv=pass; b=u7LgA9wpPyZntvYuwqPalMDjC2EAPOoayHc7QM8JDYIAfrAwDKhxg4+lnNlSqFZ1MCIUutX4q5y+njU0ejkinfbhay2ajPrOyliPtTa3LIN+855wfjd73efYhJojVF88I4RHIPNOO1nuY0DSvz+rSESCUUgv2QyNc9sIDaKRWXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013880; c=relaxed/simple;
	bh=8M5R32h56N+GE+3p6222Pi+jD6v59RXbo4rIa3GGXzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPllKQc/UBq7Z+sY8kn7pg/G03Cvp2S34W5pwNiyEwEmM+eiEsBi9UHuXuWyECZZOfS0MLiSHECaWHkuyOjcuj4lRImYyNYPtUvjip6akgkrb22m0gKXAAbr0yrFvKXBq0MnzKoGcY+RIEqVdm7Z9ffZZ6LrkkH03fzDTJnX0EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZasswQh6; arc=pass smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZasswQh6"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso10977052a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Feb 2026 02:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772013877; cv=none;
        d=google.com; s=arc-20240605;
        b=Xn93DD+Kq+YILtbA6xe70FTs5VB0m4R97QuYETYNaZoi0XzX/viMjwZDMzTar6/TIe
         wuSqUte62LhveTwjCigPBnhjuZkWSAwsVrbDdgHlwl/P4vV0IRqDDUXdApA2xf0j0zLa
         4F6kISn0xKH996sxHRBcFNZOv2Ds/b9+dzEVIAcMKWszFnWWHKRtOLVK0+zhVhJjnqVg
         tUyFds3v9RLSwkXHn5MAJ1ZwXiOtZX1Zz3n3u2osV1EnvGXF129/IbSw7qqdbYtqNK1E
         SxZ82ctKDtAahefUf8SRPZUJx+FSaRjiz7y8MhuWFbBi3QrfTLQvNx03XpnpFdZBpsKt
         LeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8M5R32h56N+GE+3p6222Pi+jD6v59RXbo4rIa3GGXzs=;
        fh=A8AvrG6Zhjng6xYPs1ZkQ0XhVZAtRWpOM0woSI8uZKE=;
        b=gHZex6dE2KlREt9tPqEg7RA5X39DbL7jh5XrrVIhvlV6zf1T3vdsAvviqG6Bhd+Csp
         M9cNMGRPFVm3XcohNtZqnK4ggNynQ2hRYdSgYMJOlXJNCzSJKIeAZTmevLbGotL+4huy
         cIugFKPnqBVJbACmbv+PaNTmyT6zDO6Bi5ZW0eE+McCWe40XSFrQbMb42jN2GRbYlJKV
         vldxrX9it1ELMfND5rOfDkLg4Jy0qa9a4OGSToW6OiJgcNTawCipqnXQkoPqn0Fl8+3E
         GQ0AdMSer1ztjfBDgiqshymAeDOcuaCy5ZerktZZuo1BsuEmFyX1BMb5JnLwZO1JQSYC
         07rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772013877; x=1772618677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8M5R32h56N+GE+3p6222Pi+jD6v59RXbo4rIa3GGXzs=;
        b=ZasswQh6Z6BNfzyr9lAVHafJlmUHyHbi5oAIapRpAlceF09IqIAu9C2cLbbQ0pk+pA
         +rYTrhd3Pn72geZSEtd3fPXUI78HYC5q1PHA8D4XCVUHR6dsoLzvvgybGFnTa7GJMgzQ
         K79FAYshyrB8HyY9JXLFKYVOR8rHXTZBz2d1/sNxRh/8ycXQ8bOTJ7xcYnXx3G1V0Rml
         QdzIGlyM5fUkLXz58RMy6n8ujD/cLSaBAYpOL9xWPjKw4u/JNesejtSNQqzFpUf6cW1Y
         uH2dFNTVqEI52/vfPfqmdEDTmrxitOXGv//DJCkdUyaTJfLv9+9lxKQ5kBGptKyfVBYP
         D4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772013877; x=1772618677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M5R32h56N+GE+3p6222Pi+jD6v59RXbo4rIa3GGXzs=;
        b=OT57YbI/pKtXsCSjOgtWvaNFq5Rt4Wg9msfdSpF2v6Qsj+Fnbi4sXoh3/pXuspntxG
         aeAIvKs+MDxzW/5YNO8GfD1I2z4DnrDPWstBgAAEMh4MeKvcwOSs5aVoCnWgpz48laU1
         vFc4KkKwEdgGg9rFgHOl6wyLrokeAmI+nixAEYjd9i/kyxZKXf3pZ7wDFJgxlljQQWmZ
         bDAVgon/j1oR5gMf4Nh3c/1SKLdMGFrOXxaYplyZxuqV51OrambFGriKQsSv8eL/a9Xd
         xc7qUHBGw3fiwQgOxSvafZoAC0lGQLECWxzE1nDTYJh9xhiDfh3V8KDy3WoQVXs3I7jY
         MGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVRFM1FWihyUDOCdt+LVkP4rcLNkcYB///+nv0xWpfn99aSyB4FiC5HgY7knm+n6D3sk5Jlq+wKfe4V5y/5xNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Yr1Q4mTAlvHQOVtXRAo0hfMCI7KaEKmK8JHcj2cbkk/AEbqU
	dBPS74EolN1d0j1ElSAkloxmNnKthTV3bRUA1wxQt8kFUPdRpGHN36laWVEyIYAfUrSSp9fmn2m
	pcTl607YtBJY7Qzng5wyn3uQuMaOVsTo=
X-Gm-Gg: ATEYQzx5m8hcNLqDSOGwhe9wOSeZ77AoMcxcihkuxph6s/xjFCJpQTrZKYnxGVix9u4
	n8H0uCkRr86sZdHsb7PmLje0VTxYQsA/T7sxohHYNN5xMiEb3KW9zkrgwy+WAt9hHVXMhIMQ+un
	M7MilyltclmAb8qimdrkKsJ0N+qk7g8vDihWBfUUyncjpwhNs/0fNWiO5OOmGQPvwjatxo74RVu
	D1gTj9j3iUuKsMVgIbYo8KY8pWZje2HS9DK9rULBotjxseUA7+9UI1RJm7gl2OLVBx4ZE5lm20d
	fVuNEbjYnPAXkLs055L+yQ==
X-Received: by 2002:a05:6402:42c2:b0:65f:81be:e7a5 with SMTP id
 4fb4d7f45d1cf-65f8b8f35a7mr1035923a12.23.1772013877072; Wed, 25 Feb 2026
 02:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219090216.12884-1-zeeshanahmad022019@gmail.com> <aZbanQC5ci7yLqzj@horms.kernel.org>
In-Reply-To: <aZbanQC5ci7yLqzj@horms.kernel.org>
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Date: Wed, 25 Feb 2026 15:04:25 +0500
X-Gm-Features: AaiRm534VHjph1ia74LUHEryOEu6qZCq9bhwTL3nsbuK0eFqFyIDEFKjkp_nW-M
Message-ID: <CAPBWGpEzZk8oUqxD_N0mOqVw8p09Xidf7g0kfUnpm=gyZBqftQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1] net: core: fix logical inconsistency in failover_slave_register()
To: Simon Horman <horms@kernel.org>
Cc: Sridhar Samudrala <sridhar.samudrala@intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

Thank you for the detailed feedback.

On Thu, Feb 19, 2026 at 2:40 PM Simon Horman <horms@kernel.org> wrote:
> It's not entirely clear to me what the behaviour should be if fops is
> NULL, or indeed if fops can be NULL.

I've performed a deeper audit of the failover module and found that
failover_register() currently allows a master instance to be registered
with ops = NULL. This appears to be the root of the issue. However, I
checked all current in-tree callers (e.g. net_failover.c) and confirmed
they always pass valid ops. So while it practically doesn't happen
today, the framework technically allows this inconsistent state.

> So I think it would be best to do the same here - that is modify the
> code around line 66 to make it conditional on fops not being NULL.
> Otherwise, if fops is NULL then steps that would have been taken are
> skipped.

Wouldn't skipping the rx_handler registration at line 66 lead to an
inconsistent state? If we skip that hook but continue to link the slave
to the master (line 75) and set the failover flags (line 83), the device
might appear linked but the data path would remain unhooked. This
concern is why I am leaning toward a more definitive "abort" if fops
is missing.

> It is true that in those steps would never be reached and the kernel
> would have panic'ed due to a NULL dereference on line 66. So maybe your
> approach is better, perhaps with the addition of a WARN_ON_ONCE.

I agree that WARN_ON_ONCE(!fops) is the best way to handle this. It
provides a clear signal to developers of a misconfiguration without
allowing the kernel to panic.

Based on this, I will prepare a v2 targeting the 'net' tree. It will use
the WARN_ON_ONCE check to both prevent the panic and abort the
registration (returning NOTIFY_DONE) to prevent an inconsistent failover
state.

Best regards,
Zeeshan
