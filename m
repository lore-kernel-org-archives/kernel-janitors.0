Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4B219EB;
	Sun, 29 Dec 2024 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735454524; cv=none; b=A7umJK7vuvipiB9eZINdU9Cmdzp2WdFRzRwSPCnvdYLGD9uiweh82C3icl9kqd9ueh//fUMJW4dxE3vbkBbTSmdepz1lvYxsRc5FpjcGwt8hdb4LFi4PTr42pX7sqh4Ftay8KWAnYBNI1mFCkr2XV8u1QI8hfmxG6PnPVyt3QVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735454524; c=relaxed/simple;
	bh=LfvIXnnK+g8OOYxG0E9RecJ5c83C19LSBRYzScoDZdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmozILlxyUXVgZ72HyXiUpsY5aVpNVOjJNY7rzBaOtp+z03+7v3sh1kZdasVsrDdgG1mThPjxqnHisNJls67GOnLrM81fRtguoTWczN3uYyCKnA8QN1wtTriJQXu9dxbsemnKEGmWTHyyxFgfZXmrtdRYxZcwAesRn9ZU0jOqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOjTgLK1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOjTgLK1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso16809393a12.0;
        Sat, 28 Dec 2024 22:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735454521; x=1736059321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoQs17Sw2Xyoi+9aEpzBByXBdm4OjNM+7umUp5NjZM0=;
        b=fOjTgLK1WtResXqt0o8bjMRGNXGlARcjdFIgkBt7CXGAhJnhy3WPetPo5HKzBhFMuD
         HVCLWndU9BtH7eaHO9o0Ztda/MgJWrIiJvVjJTWRibJOJ4jdDcPCIAx1LnIY1DKcoaqN
         INDqcv7lVdGsRldH8V84xkXNkdb4YNti+pRFbU+JG0vW/J3xoteMTthXsfiWaf6N/jAG
         yVOI6KId8PsIv1VWCf/6FSi6BiTp0sETQY6SWY+gDnvZsjiTbw9655ttzYTuYMrXGtTk
         0koL96w1JeSjrcMg9MxaRV+r5RBDUS/7ew/sytnvTVFIgACQT+HFWWGDSUtqozgcAhoK
         5HMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735454521; x=1736059321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoQs17Sw2Xyoi+9aEpzBByXBdm4OjNM+7umUp5NjZM0=;
        b=iCpLjxZo/HwdlAj4ROQulqxRtg+G8WFZGdr7DjxlcPMyQ2IKgSpaiwoNZFzPKoc/4B
         q4dHP2KlWj3b/+u4a2+Z2SK0ZJAbtljQroiHvVPkvAafUWoWgsBe1S7JSB1DRa3wYHUz
         jcMNL9bvA1OIGBbv8qT5dEryRpHnK4IHwwPWjTdZrxO4tYupzSJITizij2e5Rf9Y4bKv
         LNJyKJ/aUG+5PVFqKmwU0cRBZP0uEKHpUWzPHIJaPAMcvrqUVVZ20YJbtb5XDua+8Cuo
         3ifZHWOK0ifqYN0//H6eF8Uv9DkycagKIwuKBfI2uqmigfJT9NEpGLP55seCo5KN+FQD
         z4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQRRmjrPnqAnAU+HPKsinmSOK7zIFeoSFsmzrg3ki2ta2bWlwGVB+lH1SsUdkvN+PRGC1L2T0j5Y9BM2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBc0nP7uKO+a78nJI1Cer4opjMRUDLC2LCxvHkbnsCZ940i7Sp
	HjofcSufsRtgL6z+/dHmdWpxC0wXwkfVkiM5FZBJ33QVecSiTGna22HNVS6uIfhsIj344r1yiFY
	ygy+9Uhv56hJjj4CE5YwNvFksdv5uPy8E
X-Gm-Gg: ASbGncuC3Xl8k6YUnV9MDbxSzgdADCKpGlgDxehANHOxPKjTx8zMkWqCGLn2ALEqVoc
	9Q/jbQnTEApJCmNcDLq+7Cj1MJtJP4aZGwauc
X-Google-Smtp-Source: AGHT+IFMexdolapzsNWCSErE2ta/6RJx3HbXRPOmvab2v0Wbh21e200XRuc5yaE/u8IvQ06ETXnrw3pIyQU85KtqXVc=
X-Received: by 2002:a17:907:d9e:b0:aac:61b:a079 with SMTP id
 a640c23a62f3a-aac334f3b6amr2712896966b.40.1735454520681; Sat, 28 Dec 2024
 22:42:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228074246.3572-1-tanyaagarwal25699@gmail.com> <6b3a53ee-666f-4f1c-b00a-4bcacaf8cfb5@web.de>
In-Reply-To: <6b3a53ee-666f-4f1c-b00a-4bcacaf8cfb5@web.de>
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Date: Sun, 29 Dec 2024 12:11:49 +0530
Message-ID: <CAPdGtUyz_w5bGJtr7OR2oQWVehuAi-OUKS_pZZKk4p3GvOJseA@mail.gmail.com>
Subject: Re: [PATCH] lib: Fix return check in 842_compress.c
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Haren Myneni <haren@us.ibm.com>, 
	LKML <linux-kernel@vger.kernel.org>, Anup Sharma <anupnewsmail@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 11:52=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> > Add missing error handling for add_repeat_template() return value.
> =E2=80=A6
>
> * Would the summary phrase =E2=80=9CImprove error handling in sw842_compr=
ess()=E2=80=9D
>   be more appropriate here?
>
> * How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D an=
d =E2=80=9CCc=E2=80=9D) accordingly?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.13-rc4#n145

Thank you Markus for reviewing.
I have incorporated these changes in v2.

Best Regards,
Tanya
