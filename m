Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B42580E1
	for <kernel-janitors@vger.kernel.org>; Sat, 17 Jan 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649620; cv=none; b=J9a2xDR5JDXfh7C7bKw9r/6uCdUTw2wrE9YvoiLNPe8Ebn4cfSkAUjgUBLvJgpfPMM+BrTPxjDpmc44SLm4leyWUwJWI1py0VAL9e/sOyA/B+lvbGFFkwPWul5ps5Q2IyhOR7TTOlBS5Z/8cyeub3DGqFUVmDjusUFiOUCF6NJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649620; c=relaxed/simple;
	bh=qiGXVqfXwDoFWcpI/QBpkhZIypb80VUbaHByvSPuqVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/jBafdJ7VzUgVU45sWRc+9kg2LIdgs7MOngModfTO5Stj9Ji+PNThLfQR7FlQqNatw9ziarc2vvx6H0et3PvS5gW5v47hAQPJ1ciRxERB1Ut/HeYRQjIdLL8zfUQSASJPSyLUN5VvZcwmkLH6p6G1f7nHUpB4Dhbr9pVXGVOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmrTOn6C; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmrTOn6C"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6611c3b147eso942853eaf.2
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Jan 2026 03:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768649617; x=1769254417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOzQ1khzRrSH94mr21KFZdEC2mQ+Ktkw7PoKvjMdSQM=;
        b=YmrTOn6CxoRUgwpHHrRJbqNCPLDSXWCCJfmmYkm7htCr2QCaClJ1Gq1Fvo64n6dfXx
         THMzom6nU04hyVpBS2JUy1w/C27PrLuW0XMcA6nhHvKihD/lY+ZgrESACclngcKn/E+/
         sXKooLGXzne9sSDjtlUkbDj6GSbB39vMn0OTodo7gBABc8+4XdsqFN3yAxXH/J2Xmp2z
         TimVnZ7ZKKlanIxgww3ONgRyaEGk2/qpN39zJ2IEolijIyYSVzC/CalrBQdRxJoOzNO9
         OrnmTmy6JqeLhJI2CKBAOBLNMWEZjG2+O/1JyNZX69rIFRBmLGClPu1z7qD8JccEZQML
         9s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768649617; x=1769254417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOzQ1khzRrSH94mr21KFZdEC2mQ+Ktkw7PoKvjMdSQM=;
        b=Qd1CGwDeQ5wWKq/X2GwRdZFdNuWbuP+HMTJkqesn2+rIxc/DX+DJXosIAQMFB4e712
         WwV7k0dC0iu8t/GtYJhEg87iAhKaihuik7KSDSSavYIcZR10ddAHAjTGQGYpKQXgwqjr
         fu74LgM3DCv+7dkyQr8ZoXTcylaOq0MZu+oc/98xw9YCWhCoqFcoZPShg2QBgP4suYkU
         qIZgzZB4A3DgfKvmKxApi7MzK+YssjKIxQMt6736uy6fkmyyW3upmpKoPBUWzE+ld9YL
         8TvW1TmKk1DZfOJoIzx+mEzhFzJ1iEYib8i1cxCnSfzT1XKFUCrFP/YU3qcHuXjVKiQK
         pLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkv8RQiqoLdxnuA9q820CUoBOVUmHYkFZhZ8dPgwEVSlnS1qas0lKbIS9n0aqRuVz8X4HBDb+XrTNmanPiH5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lMMFpHdil4MD7jHs/IbkkWGfKbHT9c1sIIuuqT1RdBn+8qaO
	BOxdvIr7eujBTM0zk3Nn2UoNEfoY7CiHg6O8Bznz4t1Ev4d7OJmM1Z7Ewy0vFGzV2gdV2tk97jz
	aMPezDrmDrudAq+WITcxFUf8n5a2kgoV1931UCssyAg==
X-Gm-Gg: AY/fxX6U2xjXjxis7gf+SyJpHGWbQTaL7jHZ+dyITeZqyQ/p8eIuHkWW2wSVks7DfO5
	mGMaeHt31fhtl+gAoDgJ9lY9CVc0SV4zz38JpQO73Y4ElH9k9pT6R4WFclEJufWASvc9ulZ2ZDK
	8Am1lQXrzPPf2x+I9b4J5f5hYJevKCNtIJT5HR2ZZx87WxizZcoO77XEA21ROd3v/zQQ+MXTiGk
	CeWjFRGZyioNQ9SN7N6RL4WomMyKYkKTmJvQZtNSfjylgvjIJsP84Sw3ppvo+Pahx1EUnAAB+no
	V8nqEMxAP83Kb4eBzTy3oj6pzgzn9wi+SzqZ
X-Received: by 2002:a4a:e914:0:b0:65f:1ab0:cdca with SMTP id
 006d021491bc7-661188cc3acmr2272492eaf.1.1768649617502; Sat, 17 Jan 2026
 03:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109154442.421248-1-coking@nvidia.com> <aWTaUvGu9dlvnJO9@sumit-xelite>
 <CAHtS329G-H8vVVr==DZUAetzVNc4couN2OV3tH7qH_7YDGe8xA@mail.gmail.com>
 <DS0PR12MB8294F8C07E39842AC16CBA21AF81A@DS0PR12MB8294.namprd12.prod.outlook.com>
 <aWoBgt66shtVTovl@sumit-xelite>
In-Reply-To: <aWoBgt66shtVTovl@sumit-xelite>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Sat, 17 Jan 2026 12:33:25 +0100
X-Gm-Features: AZwV_QjgSErz9k4igW8Ybil0s5E-zl_z4UBojBpjGipbHvYstM4bI01lX_YWxpw
Message-ID: <CAHUa44ETDyE66bRS_nP-efWnFk2L3=fHW5y-ZJiwXG4o-6+XKQ@mail.gmail.com>
Subject: Re: [PATCH][next] optee: make read-only array attr static const
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Colin King <coking@nvidia.com>, ryan foster <foster.ryan.r@gmail.com>, 
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>, 
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Mon, Jan 12, 2026 at 03:24:49PM +0000, Colin King wrote:
> > I added this change for several reasons, it's read-only so making it co=
nst is always sensible.  Making it static means we don't get the compiler t=
o generate object code that stores the array on the stack (each time it's c=
alled) and then index into it, instead the data is put into a read-only dat=
a section at compile timne and the object code just fetched data from this =
array.
> >
> > Basically, if it's read-only it's good to make it const and it's not in=
 an __init section then you may as well make it static const. It's scoped i=
nside the function, even though it's in the data section.
> >
>
> That's fair. I don't have a strict preference here. Feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens

>
> -Sumit
>
> >
> > ________________________________
> > From: ryan foster <foster.ryan.r@gmail.com>
> > Sent: 12 January 2026 14:46
> > To: Sumit Garg <sumit.garg@kernel.org>
> > Cc: Colin King <coking@nvidia.com>; Jens Wiklander <jens.wiklander@lina=
ro.org>; op-tee@lists.trustedfirmware.org <op-tee@lists.trustedfirmware.org=
>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; linux=
-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> > Subject: Re: [PATCH][next] optee: make read-only array attr static cons=
t
> >
> > This looks like a micro-optimization, const makes the lookup array
> > explicitly immutable, and static keeps it out of the stack frame,
> > avoiding per-call initialization.
> >
> > Is there a style preference for read only lookup arrays here, e.g.
> > Should these variables remain local but not static, or should they be
> > moved to file scope static const?
> >
> > On Mon, Jan 12, 2026 at 3:26=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Fri, Jan 09, 2026 at 03:44:42PM +0000, Colin Ian King wrote:
> > > > Don't populate the read-only array attr on the stack at run
> > > > time, instead make it static const.
> > >
> > > Is there any value add to do this? AFAIK, the static local variables
> > > aren't preffered.
> > >
> > > -Sumit
> > >
> > > >
> > > > Signed-off-by: Colin Ian King <coking@nvidia.com>
> > > > ---
> > > >  drivers/tee/optee/rpc.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > > index 97fc5b14db0c..1758eb7e6e8b 100644
> > > > --- a/drivers/tee/optee/rpc.c
> > > > +++ b/drivers/tee/optee/rpc.c
> > > > @@ -43,7 +43,7 @@ static void handle_rpc_func_cmd_i2c_transfer(stru=
ct tee_context *ctx,
> > > >       struct i2c_msg msg =3D { };
> > > >       size_t i;
> > > >       int ret =3D -EOPNOTSUPP;
> > > > -     u8 attr[] =3D {
> > > > +     static const u8 attr[] =3D {
> > > >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> > > >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> > > >               TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > > > --
> > > > 2.51.0
> > > >
> > >
