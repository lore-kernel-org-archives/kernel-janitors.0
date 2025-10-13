Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36D155322
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Oct 2025 19:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384742; cv=none; b=gHg6pESbW7iwPq3sA58BQAU7nWDG9WcO7PIFnNx8o1IBIQO8UdW19C8Wn9UnGlKFboiQvW54+cvMSsar8ITVXrg8xDWus9fK6f228aPwm7fYEEzSomNsEgQIefPVYHNBJg2CtlxQG8OIYJ87aPQekpMMx393x9BPFQGCuxpSs0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384742; c=relaxed/simple;
	bh=xP+zHGnOtpfP5QFBJ8g36SIoM8qYnQZm2nJvGRd9Yrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQADjPsfXvqLUumzg75WqVI7u6B0Q9oIm6QkkrMfs0aKwH8ah0/5hhkB+VBbDPBkBQStKNr3nAdjEROPl0ermAtPPNHaNqPe8978iJ/YPnKuRwo6LKkewl/0gLo4dQESVCFpWXRuFqE+XsZxfKl2JfkKASK8/8XnHl1Mc8ijEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHJ8NdXN; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHJ8NdXN"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-856222505eeso599014085a.1
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Oct 2025 12:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760384740; x=1760989540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcmZEKTNBTIPCp8q96eFzSv9hIg6mWUgJbBgwmUh3jc=;
        b=UHJ8NdXNDOWJKAw/eKhG85roRU6qN5mkCVuhu/0AlebmXVyKR3xFdeimYZc+WKg7Zs
         zw7NMTTa9mNbNjdHrO+I+lBybzXYwh7qNQUngRy5pPg2lqhwS1+SZAlIKZbikonoIqfH
         OwsHn8Qq6X969ODkJnjOwUvurf+CM/KrSdvD2X5pufLfPBkzQMA5u2twfDTjFwdBs2oh
         JrrnTTaydJecyoqP8V2e2bl4ub4TIw6edgzhzZRUTFec4O+ntLn7qKg/qiVj142Io/1/
         AgxfefI4I6jwSdiR5Ea1t5VaFbjFDYvLc4CXq74I/HYG7bv9WPCdbd3BQhQvlUNSSBjB
         Ynfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760384740; x=1760989540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcmZEKTNBTIPCp8q96eFzSv9hIg6mWUgJbBgwmUh3jc=;
        b=oxq8XTCays0XK+1JYMC/HdkIj3MX/qum56MWfaHW/ugELa2L7kbFKGXDFs9WWhMrTb
         qQYn9EIe9nQ7SX4LwsV5lwAYjPPQ/JHhVw4V/KkOaqzbZRRbHfbfpWOJHNIzwjoj9qP/
         7Uo3tjGqJijPM+roNZt1IC34vRq4EaAjukVHYNU8JZls4ysAA7xwryQZ+v7A0u7kySG3
         4Wvh9IA3PcDufbMlJFfzDaZmj8F9lzt5PDvFWAwgBn3EyKNCva5LWwrwglzkmVTg3hzF
         f51KgAG0fO1WijBUn0Q01xKNK8u41FgEM2VL3UWxiQKLDB14Asr4Q/UHldCy6dahgVGg
         RhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK1/PyXyBFuJrEJ68SZWkDi86zGut480OwKZbeJc7msCT4+4j7U7KO5JuS3TbqG35gS5G07lyObtb5JEPI9W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxOw8Vojp0eyatepl2ox6ozvI4qyJw38Rxkss7Igw1CP8mxec
	LhCGm9hIqsS41DQpWqczBU0Eco+sGAHmakoUTfhNS+o1VLF4R97oyD0UKflwufefo05Q9pFSNfm
	MDbcGhvnOHw68+ZSaOsF0SmQYtZRhzVEj3Yw/
X-Gm-Gg: ASbGnctdFETKnqPWORa23jmAXRmtYgWk7F0YQsSaqnzecUAs3qHvcjkwKtA5bcU8TTl
	nQRJEgfVvP4fKQXIvtq8WUwan0w1Ig9ZsXCLpKL+xKo4IutzwEKzmPf6JLICxETp+Sys5fMdmVf
	jFG6NMy89t/lW9KcAGLruQpKfz7v/yQGiW918UAtSYvk6NIv/de7uvmRyDP6bzATsMsOBJNaeaD
	vPIhOZMSku9SxZKFC4HLDdtApeyiRUOB7PYIOrK5C9yzIRxUd8EJsLRcKpo4Rs9LzAhaDu00Yrs
	lNp5dYD/ql3CtYDxQ8qb5lt/6dMWiufRzLijMWhCX4XA7MK1JrDZ2+je8rcOWWfg/KyMqAON9lQ
	Dil5X8dBq/paWbvRq4gjiunu2Rn+X0xn4bUDQ0qVZjWPRw/ftzdY=
X-Google-Smtp-Source: AGHT+IF9sCYKN0g9TVqil8pUkwyUn+jjklPZeGO8CcLdwB2We9WKmu9BxTJaYyjQC5nrE6Edju/O9ncg/zr0gPWjkuo=
X-Received: by 2002:a05:622a:2cf:b0:4b4:9522:67a with SMTP id
 d75a77b69052e-4e6ead12f0amr281990381cf.33.1760384739785; Mon, 13 Oct 2025
 12:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e8a44f5e-0f29-40ab-a6a3-74802cd970aa@web.de> <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
 <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
In-Reply-To: <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 13 Oct 2025 14:45:28 -0500
X-Gm-Features: AS18NWCd3IA-GCOJgEu5wU-1WGwlNGLY2Cee4sZPgpXfTbOgHjuM5rizQnQvuHk
Message-ID: <CAH2r5mv46wgNC5E=y+0hU9u2SWBreBOU_=F9Y_UxYFRwo_Z-wQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] smb: client: Omit a variable initialisation in smb311_crypto_shash_allocate()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org, 
	"Stefan (metze) Metzmacher" <metze@samba.org>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Removed from cifs-2.6.git for-next, as it conflicts with Eric's recent
patch series ("smb: client: More crypto library conversions").

Obviously one of the problems of minor cleanup patches, is they can
cause noise like this

On Fri, Oct 10, 2025 at 4:47=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> merged into cifs-2.6.git for-next
>
> On Fri, Oct 10, 2025 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@we=
b.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Fri, 10 Oct 2025 08:05:21 +0200
> > Subject: [PATCH 3/3] smb: client: Omit a variable initialisation in smb=
311_crypto_shash_allocate()
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > The local variable =E2=80=9Crc=E2=80=9D is immediately reassigned. Thus=
 omit the explicit
> > initialisation at the beginning.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  fs/smb/client/smb2transport.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transpor=
t.c
> > index b790f6b970a9..3f8b0509f8c8 100644
> > --- a/fs/smb/client/smb2transport.c
> > +++ b/fs/smb/client/smb2transport.c
> > @@ -50,7 +50,7 @@ int
> >  smb311_crypto_shash_allocate(struct TCP_Server_Info *server)
> >  {
> >         struct cifs_secmech *p =3D &server->secmech;
> > -       int rc =3D 0;
> > +       int rc;
> >
> >         rc =3D cifs_alloc_hash("hmac(sha256)", &p->hmacsha256);
> >         if (rc)
> > --
> > 2.51.0
> >
> >
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve
