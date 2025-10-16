Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D232D0CB
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Oct 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630474; cv=none; b=VdZBS+xwa4KcCehJjUYzLThnCDvMWM2pXaNG7/RhOPlqIMbMM6AR6e/jX4mcj0FiWnvxJKycIm9XxWCCV5J9S1Zb+YWer2R/Y5neyF88yBQq3Gdbq8RXt1YRMtS7pORIbetNQZdBoVla+Ot1bGgmvQisPCHlIjdmvSqUD3pE2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630474; c=relaxed/simple;
	bh=OkLmE1s7BCfavCRHWUlfiNzNqHQRLUNV9toLcXurg7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZqsvFrmJWS9xoiLreVchMAiHh4Bt60ZLYJ3VZ8OBSDvkAzQa0y4p9M3EGQuii3hFvDFAAzRzn7TQ527GahZcTfD32o8/gKcjIoBspB3XsxVG3AlZ/hsSka2L1TWFtiZLS6D6V/bdWtVUw+mW/HGE7UrFZYAWm6NRZc3rBBW3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUPbFIXF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUPbFIXF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-87bf3d1e7faso18418376d6.3
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Oct 2025 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760630471; x=1761235271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFQ+JESL9UIjpR6PcV9P6XUYYp4yVYWVkfQwglpsal0=;
        b=TUPbFIXFhdmctjY+zWePfelAMI3NoubXrsoF6dFjQGnrMlEg79jj2uaVMCWRs5CRYE
         P4r0U7Emits0PxLuTWfLSN2zkgHreNV6lEW7UADi/gPB3b+t4sNZwnjepNLpyKUjY71l
         CC+cQdYo0rWCwSiUSJy0lsyXTwu3MNbdI/9hCk7nvrWlNiGpFYiuM+HNAs6GuB6EwKnU
         g6/owUto+TW+yuP3ASgLIkKdNRO9zR25ixi+LSYG2LE0zBFk4c82boGemQap0I5Ah4kG
         uKdpHccXu3gsJ/Lp2uC+AmVPYY7YtghUBaZXBTLWQEOS/M0hbmTH+TjriA2rPu75xoE9
         1sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630471; x=1761235271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFQ+JESL9UIjpR6PcV9P6XUYYp4yVYWVkfQwglpsal0=;
        b=kadG/VHASu+YwvZXt4p30QenM96kzusDf4H65lk8HbAezczXMpB8P5lKUtmdu9dV/H
         x7viTgnM8hqZpOK1Kl/hBufQtR62T8pWvEnXux0utAE4lpaRG3GWn2m+MwZLrlQd41g7
         OBT9nMIPCJvF2g1Hvs75kF5DzLixNEGJwUW+wlYqyMiv6x8xmmogNHKYHoFS6L6pOobG
         abkAjgh11+SWoW0cTr/9/+RW+LOkl9RcSgMIiYqxn36pTjaeeEAoGhvQKmm5ig8qxku3
         E++X/Lti2N73SswidCevNrEQcIPFFbCV6jbWxa2wqVKUeJ/Xi5q+qx1fvFXNHVXS1ST7
         5ixQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5E6wzGyRYlkQ4TbqfW1VMmpwyvmcCrTdDlutys/buRSaajINk32Ol2KrO25SKosrtnMzNvVMhgPNn4lE1qIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZh0z7pn+F32Bb7dQwinFl0wLKkw2ftsl66rYCkemwrF4uWhP
	bWxXYlRuYk0SPn5hKVYmml8ry3dhe5BSqiDedcJHDLRGhyqRKADN4IL5dMXWknsSJl3nDcWyd7T
	mMUgNeaLBqinrXUDd0dPfvf3ZhUUGHBSePE3q
X-Gm-Gg: ASbGnct4s/ssZj3zU9bt+TvDn9SgOaBOFTC33PAv3FSKrNqEKzLwLpXYUZgYn11uRJv
	1SAsPLlSkmIViUzMOONrxU1fWzOtmck/0eST1NqhRUcm8yC1qo+y8tl4SP0LboD4tk6H3FZlVWj
	qf98EpaprQIHhAlRnRQLLP/FXTXBgDabo60VbvO4RUI40sR0qNMDqGKldyBlkGMg5uyemTm8h2l
	ENCnxhNGB9BO0JKTinO5POdGjT/bBv4h2PuwJgsN6P00HBjEmRF8IaGY/vVf894wXxD0TNScpab
	BW0URDp4JF/Zo2++isiXsPkso8vdQuAMnhK3PW/dTStsIKLDIEDYfN9FvFAB3viDeVEDaK+2iZ7
	pDPGXeN+ZGD+aTN9D9XyMtfbeM5mQJLXgnNOp8jOBgvohc320QkUkhOH5+D31zXCUk1Mk72raRP
	/r65J2xY50
X-Google-Smtp-Source: AGHT+IEjNzMcEiWFAsmyuj/Yi6bdGpUfk6izOvZ1EcmWMdmqpXJOOCJ14NVAuKFiY/6bCaKVNofLoAP/TbJKGrstSkg=
X-Received: by 2002:a05:6214:460c:b0:87c:21b0:79e9 with SMTP id
 6a1803df08f44-87c21b07fc2mr1201866d6.60.1760630469114; Thu, 16 Oct 2025
 09:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPBeBxTQLeyFl4mx@chcpu18> <1f9e946d-91e3-4f9a-b26c-e69537cbbd4c@web.de>
In-Reply-To: <1f9e946d-91e3-4f9a-b26c-e69537cbbd4c@web.de>
From: Steve French <smfrench@gmail.com>
Date: Thu, 16 Oct 2025 11:00:57 -0500
X-Gm-Features: AS18NWCxy8CAvRIZM1Ad_Rzkx26Gk4ZxkE8KTaqrRNxF0A5mEjrWE1pFjeru6T0
Message-ID: <CAH2r5mvKpoaD3DDPAc=xUpbcF4TH4nedNdvZg6LBiETG5x3-DQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: Fix refcount leak for cifs_sb_tlink
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Shuhao Fu <sfual@cse.ust.hk>, Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch looks fine.  More important is focusing on the fixes (and
missing features) - minor wording of description can be helpful but
MUCH more important is focusing on xfstests, new test scenarios,
automated analysis to find places where use after frees possible etc,
fuzzing (like the great scripts Dr. Morris created for us to show some
potential security issues), fixing the various known bugs, adding the
missing features etc

On Thu, Oct 16, 2025 at 2:22=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> I find such an introduction sentence not so relevant here.
>
>
> > Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> > called after successful calls to `cifs_sb_tlink()`. Three calls fail to
> > update refcount accordingly, leading to possible resource leaks.
>
> * Can it be preferred to refer to the term =E2=80=9Creference count=E2=80=
=9D?
>
> * Would you find a description of corresponding case distinctions more he=
lpful?
>
> * May resource leaks be indicated also in the summary phrase?
>
> * Would it be helpful to append parentheses to function names at more pla=
ces?
>
> * Is there a need to mention change steps more individually?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.17#n94
>
> * Will development interests grow for the application of scope-based reso=
urce management?
>
>
> Regards,
> Markus
>


--=20
Thanks,

Steve
