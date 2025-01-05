Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846921E529
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Jan 2025 02:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736045684; cv=none; b=IpCnuYXWyPBp1kbUF2KR9XsmWH9HnqdTN3NbHx9CE6VUZumY6W6OZ2w3690OPo308NDU4VGZqox0dPKXz4c3fRDsERfmZT2mNhZE/7GLl7LBYJYaLLLpYKRkOidvDl4SV1LSbp3O4j1AuLGK6exl+zkH8NGgcz4enE2ub63sHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736045684; c=relaxed/simple;
	bh=K4BQ0O5FB2ZbQKs3Ep7eTJpcCAMT9HjPAO8b/DEqCo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4RGL7nPzehmx06qeNlDn+swQMGQF2kBkcUAH/VSkWV2QZXHHsjCHvEdAPwnkum2VxBN5WhV+y3KV4fW+MeK32GxlTyPgjortNLO7yE9Wl6dkbmdeLvc9nZOsec2ZslQ2EPxdUbsDgtDMsTw2cPmBdWD7Rlq//Keu2RbN9tNRH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EtYEVmnh; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EtYEVmnh"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so18971953276.3
        for <kernel-janitors@vger.kernel.org>; Sat, 04 Jan 2025 18:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736045680; x=1736650480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS26tpyWT7dlWr6BoTq4p/vjr1hXYpZOniphQk82fnk=;
        b=EtYEVmnhTgTiFNbFs4c7imI5fSiVYrFSylsxMwxA9WZb+DoP2dvl3LiUI/ZCO13z56
         q8HvWAxh2BYIoEQw7g/cd+QL9Jy1Y9KllyxhrH7FDqFIKUxw147Maj/cAJe9/amqtfTM
         ihLuAhGWebzd97xs6WfOffWEXa48/RbOrlFaWDFgpEZgeABrp15P6w5+L1j6GLJg86hh
         FQ9l1uWad81IpKpWL6fkDQCUKbO58i8zho6Pb2WnGeBgrCVLurD1/zOJOGZeYprnOfG2
         lV4+5iiTLw39YSG6uhcBAQusX3494jAxrLNtHcL5um+MpFBLOLY6/LfrrX8TRBjZBHjh
         MsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736045680; x=1736650480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS26tpyWT7dlWr6BoTq4p/vjr1hXYpZOniphQk82fnk=;
        b=d6rek6msCvqEx42OM7z6M5ZolohDLHcTiUcQS6jNBBEHJ5fPMyVLm4uZgmwZGtRxe7
         jegJuIM1WgJdv5Zef47tPdtVXteYF5FiO+ll7Wl0YahRSCjKHdFEZ5SSa3FrSj2/ymfq
         rfOde3sBMLkWGyubQ89BkcVm+4y9LcyqNbQpBFDTkOr7U+yqTyBY9k6GaQHCpTGHNblR
         +H3llipYnyQ6fkX9+gQSuacnsOOjU9MiiPiTRj9/vTbSFikaEHD5FaMQyfZWMIiIWS2v
         uyd49R6AyxSE7N1znmIPU4VUrAmktd90tIE/K1fC3iQ/T0oi3wjB8e+rnbmsEMS+2p3l
         NG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsJpiIzatWbWo47CagPKhEDeqgIR0Po5dhpfH+nmpndv/xMmWHaPIvmbyMmuWvM3spWOTuSiHZdWgQZ/jXM9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAbY2ABQMAZriW3rrSYG3SdkiB0CceJcI/KOI4n0JXF4DJDGk
	8pTXwETudcowB8X/Iyuirk2YPfHxqId0Jo17M6SzGy7W/jLqF1ZT/DUFCYycqzapO50FDeuwm4G
	kITCQLkevSNe+rRX6NMr7weAGVwV/uv1a0bVj
X-Gm-Gg: ASbGncuzkzx+1NeEB1wyT5ZuNGL86Q8DpnOMc+z6Y5kSl7KSg8QLU83hF89ff4vncG8
	BymfpFCFrGHpq4jB8P5Qgp3933lCQYtNIDIVu
X-Google-Smtp-Source: AGHT+IHxA4Bwa4vhQsSrWbpnPia3Eq/lgZeEjF8aSXgYYB9IwAwuXzIS9iZH8CoqCu98GYWrWJcY1wJJgL8pkYkwdVo=
X-Received: by 2002:a05:690c:6307:b0:6f2:8e62:d8f0 with SMTP id
 00721157ae682-6f3f8216b58mr369761097b3.30.1736045680661; Sat, 04 Jan 2025
 18:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112124532.468198-1-colin.i.king@gmail.com>
 <20241112133224.GA340871@mail.hallyn.com> <433bb625-480f-46f2-986a-604fda49c046@stanley.mountain>
In-Reply-To: <433bb625-480f-46f2-986a-604fda49c046@stanley.mountain>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 4 Jan 2025 21:54:30 -0500
Message-ID: <CAHC9VhQuVYCNZm9S-TsJ7vm-Zihp=A5qHXQ8BPyZcfncakvOfA@mail.gmail.com>
Subject: Re: [PATCH][next] security: remove redundant assignment to variable rc
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Colin Ian King <colin.i.king@gmail.com>, 
	James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 9:00=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Tue, Nov 12, 2024 at 07:32:24AM -0600, Serge E. Hallyn wrote:
> > On Tue, Nov 12, 2024 at 12:45:32PM +0000, Colin Ian King wrote:
> > > In the case where rc is equal to EOPNOTSUPP it is being reassigned a
> > > new value of zero that is never read. The following continue statemen=
t
> > > loops back to the next iteration of the lsm_for_each_hook loop and
> > > rc is being re-assigned a new value from the call to getselfattr.
> > > The assignment is redundant and can be removed.
> > >
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> >
> > Reviewed-by: Serge Hallyn <serge@hallyn.com>
> >
> > (long as it doesn't go to stable :)
> >
>
> There is a tag for fixes which would break stable.
>
> Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
>
> But this isn't a fix and it wouldn't break stable so probably that's not
> appropriate.

I've also talked with the stable kernel folks and they no longer
automatically pull any LSM commits with a 'Fixes:' tag.  LSM commits
need to be explicitly marked with the stable CC for them to be pulled
into the stable trees.

--=20
paul-moore.com
