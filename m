Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306318FDBD
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Jul 2026 04:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782881931; cv=pass; b=dZnHDp9vgnUNVehdMnJz7e4oezIXbp5/Lp6kTvTi8SMwTDb9RheqBIOcdhbme5bAH0oaosXv8j/S/t/oN91nVT+0II/7ajGORyGO1GibzqBjuqfA6Xs7GZovuZ+BSb+PodJZi7fOCZG5AsjvUV88PhSJF1cHpPk/vLSr+iqF7ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782881931; c=relaxed/simple;
	bh=+0XPcsWuxEDcy8kzyztKUj7qpXFWihbDSFb/98Lt4jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzqzZfzFtBpeBuVeX/SQdSKxZ2LJzpl5B4ZgRQbcHtSU1RhpClcs3yUbpKE4sAbZ+MU/tAZDCTnG9XmBdQui5nYy3HqQOaMWZejGQtFbzZSK94dfdMvj0mqptiLjA4DmbFlnAmS3NUdypsMxCBSOG/v9H/4GOa1o3OWUudWGf6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrH0AeAK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZcccIjI; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrH0AeAK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZcccIjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782881928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
	b=KrH0AeAKE2Cw9/vHJytQh/L6LVC1o7vaGWuukg/XWFQyIyca+m+o5cYHjZp07jn/Sw51/b
	+bHsuJexkzzkPucJHS9uP9miz/nMnMUjzDpda6jv6CkKiZYElGoO9thDMDhYkI6eWl5Lq6
	P7PQe/liVyuRdtP275k7LkqZytJOiSw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-KwDOwgWuOYeKEWYP3EsnAg-1; Wed, 01 Jul 2026 00:58:46 -0400
X-MC-Unique: KwDOwgWuOYeKEWYP3EsnAg-1
X-Mimecast-MFC-AGG-ID: KwDOwgWuOYeKEWYP3EsnAg_1782881926
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso4995601cf.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jun 2026 21:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782881926; cv=none;
        d=google.com; s=arc-20260327;
        b=UVg/DbaMBI4EB5jU/brrFsqI0ddGO96qf/+KSgxwt24wa2zcukELFKXjSV+5HqcSQY
         a7J8bj4WpP8Qs5Z25UP2kY16rdXJZutUSC/B+65MW9JJhOWr+TrEu7GPKgknhMcbpL4P
         nT2aR7knB1bBxc9modAl3HQXqp8kzMvOFsfuT/iLLuRwiV2gJuPLje+5jGgKSe9Fcno6
         JoocXmL3T0W6vb8t2rTeOs2ZNpxdRqRMjdodvw/Y7lZp226iExxeKnDSnQQleyLe303D
         DdqYIU3wwfLtQQYsKyZjTuKI961f7g78SZnAWm/cBCU/Y7pV6ygp2DsFeRLxvtOv2xzF
         bVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
        fh=22zH7AxUYGAOMZwH9tnM4//7ozebUcEJH7Hlg/Q+m0s=;
        b=rkB/9hcQbH9x7VWkA63hTqZezSbX8P5Lcb8l7UMsEtI4vVlJKsyl330JGZGdWRi0iz
         Uj4IrMHpB6rzEhGXMVtDnhcuKso5dHq4dEAjsuFanHWGCsRSf56K06aOWUkvjdrzVRwK
         +VVm4nbwt8euPslAcTTaj19XwlNNH4pI9FDHCf3uW9h5fiamqnPizJSClorfiR2nTHgp
         hwcoxNfSS5g5YHGIuKQzPGmjcQty/W0PFq3Wx8rpLw6xfop+jHsfNzpglJ6SvjGM5h/J
         lDY+nou0wpdFTdjA9suIturyzeFtTM583l4msEjNszA8rvUkBFW6Th6zgXPOkYl6v2V9
         YbLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782881926; x=1783486726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
        b=CZcccIjIXArdJ3gditTkES1UaoPFU42ukPgxc4ACkc9djzgHXTbzsnJpt7t99o6BR0
         LA3QOspifKqijzHzoaYbpl1rsVf3C5m8I77emU3Of51EBeI5NNfxd5NscHKNDBgKXdne
         bSHhFPPwapQHWv7VSxHu4KX6Q7Z9GfGi25CelrLNK++ShAJkqz+lXJyG5lQqWXb6GcYX
         9U0EkQ0nI5oS8ftoc6QNb8ew4rrehrD5EgPeDwS00QHwm/OZnGTwAhmehHVDhXB/gA/L
         2Y3QaEUGOSLE4o6qhs+cH31G1gf/f84t2xGsGQdwwYupoGTWkwiJYGLNTnnp3vEJ+QZf
         5m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782881926; x=1783486726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
        b=mnlTCUt10PA+jkELDVYP1vjVqW4rT/doEcl0QVgShH4AdSZzhnzecDGsoClK5eq5tC
         4BG6UP02HNiOAolW/ULsQ5tgZnhG0QhTmI4V9U911hm2ZYZjov8mHs1mwnXxVm+UGYQU
         uqR+LIXmpGjblEpZcmI6BYT0Kp0gIGIfNAz9tqon37kJW6hDZ9qwaHyctwuAL5PFf173
         tTMbPXzj6EPPAb6J93Q8bBznRLXmz1t3jkRu2SK8o9g8XIyzoy2G13MGWux7lJU+gTCK
         RIHmnvI6y5A2Tg/MHjjN4FnYIsTTBqKWyHZVy4eium6w/Z7mUuKMqU9jF+2YzBCCPclW
         jhxw==
X-Forwarded-Encrypted: i=1; AFNElJ/SycfwPspW2uKz1uoO7FsqtMN+bS87gXujpPV+E7HlJB6rTtrxeNoXA4ULdhe/NteXOs6uPLrkFKHaYEan/3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwazsoHburb0zQdf9o+mK0iPGm8tP9v683nHTwc015E9aguMNnX
	9E6J7rHC4RHti9sOWJ3sjx3NEG7IFJ9rlcsQOr0dKdMcVgwsLRh/cORz6G/b3wjmGsQqhB6T8Pk
	4EBdt1G8zoCnXwgscAXaGVNYl2VhKX+CI+tgMqYH03U/htY9CtObGph7RpC8+M5E+A7U5X+xiHo
	va680o25t/s4JZNCp/ws3jiLVlAHu01Lk6rf+dpirbs1DUvVQEFxgMfsT8dg==
X-Gm-Gg: AfdE7cmfZxlKFv7PjjqJ2uDoJHViU9AXx4FdN7BKL6nvViOCbNEeJduMGI+QC1x1Qr4
	V+gsdFxewbP9v2gcq+yX6tOHdDcQVvicVXbsaKzjj+Oi0qVsXyuDGCWTOz93OYR9irjgnVkHRyB
	kLYZLsGyRSLJ9ZFSV/Oui4m/zD3MKu2jrgMIsFJRykEUvveQ8capTvenQcncmrX5vIPA==
X-Received: by 2002:a05:622a:5506:b0:517:5f04:f24c with SMTP id d75a77b69052e-51c26b0074emr1885971cf.39.1782881926272;
        Tue, 30 Jun 2026 21:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:5506:b0:517:5f04:f24c with SMTP id
 d75a77b69052e-51c26b0074emr1885651cf.39.1782881925860; Tue, 30 Jun 2026
 21:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <akSOb1_1tcJvFyda@kernel.org>
In-Reply-To: <akSOb1_1tcJvFyda@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Wed, 1 Jul 2026 16:58:09 +1200
X-Gm-Features: AVVi8CecY3QtyR15biAB9c6BdBCvMEH22nDddc-TMyZfwtXlVx2ChNVQ9i9xRmk
Message-ID: <CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, bhe@redhat.com, zohar@linux.ibm.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	linux-integrity@vger.kernel.org, pratyush@kernel.org, Markus.Elfring@web.de, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

On Wed, Jul 1, 2026 at 3:50=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org> =
wrote:
>
> On Wed, Jul 01, 2026 at 02:57:33PM +1200, Tao Liu wrote:
> > A NULL pointer dereference issue is noticed in riscv's machine_kexec_pr=
epare,
> > where image->segment[i].buf might be NULL and copied unchecked.
> >
> > The NULL buf comes from security/integrity/ima/ima_kexec.c:
> > ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
> > but kbuf.buffer is NULL
>
> This should have a proper call sequence. Now the root cause is
> obfuscated.

Sure, I will attach the stack trace in v4. Here is the one:

[   62.867540] kexec_file(Image): Loaded kernel at 0x80200000
bufsz=3D0x34ed800 memsz=3D0x35d0000
[   62.879983] Unable to handle kernel access to user memory without
uaccess routines at virtual address 0000000000000000
[   62.880736] Current kexec pgtable: 4K pagesize, 57-bit VAs,
pgdp=3D0x00000001062eb000
[   62.881185] [0000000000000000] pgd=3D00000000413b4401,
p4d=3D000000004151bc01, pud=3D00000000415b7801, pmd=3D0000000040af5801,
pte=3D0000000000000000
[   62.881969] Oops [#1]
[   62.882077] Modules linked in:
[   62.882717] CPU: 1 UID: 0 PID: 894 Comm: kexec Not tainted 7.1.1 #4
PREEMPT(lazy)
[   62.883037] Hardware name: QEMU QEMU Virtual Machine, BIOS
edk2-20260508-2.fc44 05/08/2026
[   62.883365] epc : __memcpy+0xd4/0xf8
[   62.883685]  ra : machine_kexec_prepare+0x8a/0x298
[   62.883914] epc : ffffffff81393ee8 ra : ffffffff800366ca sp :
ff20000004a83d10
[   62.884214]  gp : ffffffff83258db8 tp : ff6000008573db80 t0 :
ffffffff80033640
[   62.884433]  t1 : 2152ffffffffffc0 t2 : 0000000003000000 s0 :
ff20000004a83d80
[   62.884710]  s1 : 0000000000000000 a0 : ff20000004a83d10 a1 :
0000000000000000
[   62.884987]  a2 : 0000000000000028 a3 : 0000000000000028 a4 :
0000000000000000
[   62.885208]  a5 : 0000000000000000 a6 : 0000000104e33fff a7 :
0000000000000000
[   62.885486]  s2 : ff60000082a35800 s3 : 0000000000000000 s4 :
0000000000000010
[   62.885774]  s5 : 0000000000000028 s6 : ff20000004a83d10 s7 :
0000000000000005
[   62.886005]  s8 : 00000000000000c0 s9 : 000000000ac0d220 s10:
ffffffff835420e8
[   62.886218]  s11: 0000000000000000 t3 : ffffff800000007c t4 :
ff1c000002138d00
[   62.886515]  t5 : ffffffffffffffff t6 : ff20000004a83d10 ssp :
0000000000000000
[   62.886860] status: 0000000200000120 badaddr: 0000000000000000
cause: 000000000000000d
[   62.887162] [<ffffffff81393ee8>] __memcpy+0xd4/0xf8
[   62.887388] [<ffffffff801b253a>] __do_sys_kexec_file_load+0x1b2/0x338
[   62.887612] [<ffffffff801b26e4>] __riscv_sys_kexec_file_load+0x24/0x40
[   62.887855] [<ffffffff81395ea4>] do_trap_ecall_u+0x1a4/0x5a8
[   62.888134] [<ffffffff813a9eec>] handle_exception+0x16c/0x178
[   62.888445] Code: 7613 07f6 ca05 86b3 00c5 e7b3 01f5 8fd5 8b8d eb89
(4198) 0591
[   62.889223] ---[ end trace 0000000000000000 ]---
Segmentation fault         kexec -l /boot/vmlinuz-7.1.1
--initrd=3D/boot/initramfs-7.1.1.img --reuse-cmdline

(gdb) p image->segment[0]
$3 =3D {{buf =3D 0x0, kbuf =3D 0x0}, bufsz =3D 0, mem =3D 10737586176, mems=
z =3D 4096}

The buf =3D 0x0 and bufsz =3D 0 comes from ima_add_kexec_buffer(), thought
I'm not sure why it added a NULL segment, but it is no harm to add a
NULL checker here in case any other scenarios similar as IMA.

>
> >
> > Fix this by simply adding a check before copy.
> >
> > Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
> > Acked-by: Baoquan He <bhe@redhat.com>
> > Acked-by: Pratyush Yadav <pratyush@kernel.org>
> > Signed-off-by: Tao Liu <ltao@redhat.com>
> > ---
> >
> > v3 -> v2: Add fixes tag; Replace "reference" to "dereference".
> > link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-=
ltao@redhat.com/
> > link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-=
ltao@redhat.com/
> >
> > ---
> >  arch/riscv/kernel/machine_kexec.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/mach=
ine_kexec.c
> > index 2306ce3e5f22..afc68f6a4aa1 100644
> > --- a/arch/riscv/kernel/machine_kexec.c
> > +++ b/arch/riscv/kernel/machine_kexec.c
> > @@ -41,6 +41,13 @@ machine_kexec_prepare(struct kimage *image)
> >               if (image->segment[i].memsz <=3D sizeof(fdt))
> >                       continue;
> >
> > +             /*
> > +              * Some segments (e.g. IMA) reserve space but have no buf=
fer
> > +              * loaded yet. Skip them as they cannot contain an FDT.
> > +              */
>
> This is destined to rot over time. It also adds up also potentially to
> the backporting effort while backporting to stable kernes. And most
> importantly. Please, don't document every other null check.

OK, will get rid of it.

Thanks,
Tao Liu

>
> > +             if (image->segment[i].buf =3D=3D NULL)
>
> if (!image->segments[i].buf)
>
> > +                     continue;
> > +
> >               if (image->file_mode)
> >                       memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
> >               else if (copy_from_user(&fdt, image->segment[i].buf, size=
of(fdt)))
> > --
> > 2.54.0
> >
> >
>
> BR, Jarkko
>

