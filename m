Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76617545
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902481; cv=none; b=Ye/GpORgaQoT8MMYrVmoO+YcEbisiRYdK12XuyuwNnUTcrdOBz4XsTr+n/lFHMJNovkKolF1s2c0M0Tr50mfu4We7lpyRSC17TBW4vofQZfl7/aiHCbkBd3sxEkFlI/AT3tBv2MJfgUSv3tGZKKA02RA2bPVfNiBhnvDv/GzsiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902481; c=relaxed/simple;
	bh=Wqp9vZOjGXxNeztCTRhZXaV/kM8U5SAYlJJa2Su7aFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLhBC+QqkK335u8fPApx0aIbuz5NRSzh/dmcPQxFlZYmfyLL4+EHHffY2MtcKb1eUGcYCvIYFMi+SRiR7kY02sYJpSt3k2V0+kZSmy08SvSIWVZsJIVZz3PLBSiMgZTBgZgpeH4rDrhwiGhUnhowLdw5gZHc7Mleb4xJg7RBz9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ODwvZO3o; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ODwvZO3o"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso985389276.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718902478; x=1719507278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU32yJqLVWlauO1MOjGbdfeZvhkP3RdEVxn5gIXcZPk=;
        b=ODwvZO3ogo2UMLwhPrtupguu3JIurgoLDcMxA3oKU5Abw+okdMRfgtCpGq/ZXLgioB
         uOrWl3X5Nx/efGnBlUSulgfd1mMyhre+nyHhLGGWqQZLYDcjzsR/P3Z9/JlNPEDopCSt
         clKO17sS7CI7lKviTQzMbOF+eQyR9ZsZVz1fwZsszoAdTpRvKmPWLrNWge3HgVIYGrVi
         W1tHg6pRNkmKQtgr2XBVMJZNBjbHi1iFyaoG0dIGmdc9ydgy3CC+Qw0F+/sYAuIfd1pM
         UyY2j6tb97KGh8EWdo7ooBHSuX5ETEyz8HAdf4dsJMQPIGQjW8wcIGZg4qOuQctnNEi/
         TB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902478; x=1719507278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU32yJqLVWlauO1MOjGbdfeZvhkP3RdEVxn5gIXcZPk=;
        b=waWpQvLK/05G88sJHKqsaxait8xvmkH81qpgwwgo2Qwl4VGE8I6LWPGCqjnLkXtPAj
         ZYry6EEAfB+ByDE3hUbIhdGV+ZQZQ2AEgAm7mZ6G+LlgY8nfXjZC6p5ejgQgqUyQKPz9
         58cSZaGZ1VTOpKtQkiAT1mv7BLn79c17L62SBoXuGHIf29pQoZUZM1SH+U/RNA0q6GW7
         sL3kMCNh/32g8O45iYYeVRdatY48qELFJEYWhbj9vi+gRdg7nQP8O947ntBXRXcNHCK3
         3heZ+iqlYsxqDnFZShsu5IWzYKfjy/cNuRb0opT5PTOQ8K86pffEIHM+Lq5RyKZNlyNV
         iQQA==
X-Forwarded-Encrypted: i=1; AJvYcCWuwc2cdxIRu+sNZxCM5DAXbQls+ipU5CZJPIjaKD4rW9NXZU89Nh4/73d95+o/TCfjLpdLiIm006sxKag7upV2egDmaj6Iptv/cSXDaElp
X-Gm-Message-State: AOJu0YwdciNvWlgrexds9UOCc+paBF0LlshBQldgoB/LwaZ5pq+yK8F2
	q/PAgOZUq08c5hi+zoyMtiAbJ+qPeBzUgG+Gp71XlcN6SKgyElBm++lKSvLCsSgw76ug6/xdiaX
	6SPmt+OOP4Dbt+x5mlVeJrUAufCZlzJP+73Mz
X-Google-Smtp-Source: AGHT+IF13BHpoNYPwS4PQPx7j7170Xyxvk6ucDaOXGDhfaS1JKo7NId9A6sAy7bCJmw3neQ25h0P/Cwv0uX6xpzNWNQ=
X-Received: by 2002:a25:7442:0:b0:dfe:3e88:3649 with SMTP id
 3f1490d57ef6-e02be13b1e3mr6638405276.20.1718902478328; Thu, 20 Jun 2024
 09:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606-md-trusted-v3-0-42716f15e66e@quicinc.com>
 <20240606-md-trusted-v3-1-42716f15e66e@quicinc.com> <D24EWHXV14EM.S0NQ3H51R892@kernel.org>
In-Reply-To: <D24EWHXV14EM.S0NQ3H51R892@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Jun 2024 12:54:26 -0400
Message-ID: <CAHC9VhSVSS46oCAz_NrUUGstmG3j0NVk70-SwwtCTVJ-R1Z+OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] KEYS: trusted: add missing MODULE_DESCRIPTION()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 8:19=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> On Fri Jun 7, 2024 at 4:47 AM EEST, Jeff Johnson wrote:
> > kbuild reports:
> >
> > WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted=
-keys/trusted.o
> >
> > Add the missing MODULE_DESCRIPTION() macro invocation.
> >
> > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > ---
> >  security/keys/trusted-keys/trusted_core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/=
trusted-keys/trusted_core.c
> > index 5113aeae5628..e2d9644efde1 100644
> > --- a/security/keys/trusted-keys/trusted_core.c
> > +++ b/security/keys/trusted-keys/trusted_core.c
> > @@ -395,4 +395,5 @@ static void __exit cleanup_trusted(void)
> >  late_initcall(init_trusted);
> >  module_exit(cleanup_trusted);
> >
> > +MODULE_DESCRIPTION("Trusted Key type");
> >  MODULE_LICENSE("GPL");
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Are you planning on taking these patches Jarkko?

--=20
paul-moore.com
