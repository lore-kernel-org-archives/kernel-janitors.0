Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F866370AD7
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Jul 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076957; cv=pass; b=LEC3bllCQ8VCrOZobOLi9kGEnn1YmWLYZBrbABF2hHRe5TCcVExc79XsNoTCsKQryNfXt4zrJjhZngUJSx4MW3xI4xduS1heM+JZLauwGh+xqvZcyEz77AJ6HisjLQ5JGyir+80USmTUFACQPiwX8OeGEXWC7Nh4pGj0ODmbB04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076957; c=relaxed/simple;
	bh=ky6LfkgCQQeUzwvB4OpjP0MRqV9I5n463ukg4Hx0N0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD6/74GZR1UH1EjkoyisNB8CYRUTRA/ztlXBj6/5F4JZY+4xFbjhdrHCrb04GSm6lBz+PDxhAoZ4GbvAt1paA51KP5EtSW54Q2C7k/4txSj7oCSDf/zO2ODhWxcjKg44nWxB5S3t0OEVG1uoJpdRuY6DPk2f0vBzm8/WiMW7u5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aenZx4wq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pnvxf+pP; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aenZx4wq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pnvxf+pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783076955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh7HGlG5BHoSUsvlsYaBrF++hCjSyZH34tmkueyHFBM=;
	b=aenZx4wq18Qu+HQG3r2Zu1xEl0SqOCuCzLU62fubE8S3MiX8XJsPJh2rOxuIB+c0rLKHjr
	hhPFnFCDzE//KpkTkISYOCjpohOVbFUwdpXaxZGiHUEyJn2Z7EbhJAFue07fMFkWzYTcsI
	J6g0cAwKMZLo8WO/0yqDJu41TgC2zqs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-and6eMDPPbCcAZRhpr8n-Q-1; Fri, 03 Jul 2026 07:09:13 -0400
X-MC-Unique: and6eMDPPbCcAZRhpr8n-Q-1
X-Mimecast-MFC-AGG-ID: and6eMDPPbCcAZRhpr8n-Q_1783076953
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so5800621cf.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jul 2026 04:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783076953; cv=none;
        d=google.com; s=arc-20260327;
        b=XWvboA17C/llzgk+obi6ip33P2ZFr/X0tETlfpz/24dd+0+e+ykZFF8xzo9+3SWpzx
         0Iv2DvPYRBCmewNCo04uuTGALLAKbrw5nofCwCvYoDvC2lOHOc84uAWq+Q3U1H9eupB5
         /hkJwxMw/s8PJFbUQ2cDv3BgG+oqaz5N+/2fcpJI7sS1iW9MluUqM4TaESOzfh6lrwNu
         torxImkAGHDcPCPHwYXgLI4/y/ZNokY7i1kgtk+MuE1l016g/nSF1CQx9UCBOui+Im6A
         Mgckwb+1b3Kqtm4O+XXTDN12rMQnGIOPRwojZbPvFWH7YOKZuM80Bv+T0/D4cBFga+Ss
         zp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uh7HGlG5BHoSUsvlsYaBrF++hCjSyZH34tmkueyHFBM=;
        fh=o9LmcpOsZGLyrfifTUGO1kDu96kLFIioD6n1b+eX9Aw=;
        b=hfkG5lyRdd4PDHqUTesX00B81BsGfn6HirGHf228fsi+XxoEiySiGiAA/0xlQ4509f
         pRw4gzURIIJQnrZ8b9xKMCT2l/36ZNwheI1vB0Q8TdyZ7mzhwM6ykfl9Ihkyi4VsacbI
         vVIqIKUlHdY1tT7C7rWfwTCIgrKIWct8o8u2VG8MRpgQOtBsJM0SWgcgM44cSEdod5DN
         2vPnNYrOjLMrS00F+5m49Tnb7Ri3Zyvx0kLa5Ys0OGJY1eOGt/piirgPejZrobo3M52m
         WNyEJQgq+GozfaLtMGWqEx/dGHCq4dEWerPtTNBsmJdXa6XiO4MYcrNlBOwVlXNUBOvR
         DXEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783076953; x=1783681753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh7HGlG5BHoSUsvlsYaBrF++hCjSyZH34tmkueyHFBM=;
        b=Pnvxf+pP9TXtXtwpsPVDzKav6wvk/MOHiTfMg+tkFZhXZ7rn0zXJdjjnfHncje2s8m
         +QVUgISyhBs6RMYI3SLOAw253sB56X7tVOXauxVzajJTt6Ni1O0DUzYXoOba86Loiq9e
         tFQHKefzHODVJBoE2MTSicJp7g/OC9Nb76Ut5L7nrqO/D/iGOESsCabf9FX89jRun8IL
         zlUVqvLqcqZlMBkxqpVWaSiYmE90eHlck2ySnNQ2/rUCfQ2K1kjPXI67Fdw4+IWBGqeh
         wjjoyuUzuoAWULEoDUr70JIktIZn6JhJ0YURg8z1Ker14Vxwysy5mh7PmMAsUpG9eSx3
         a2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076953; x=1783681753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh7HGlG5BHoSUsvlsYaBrF++hCjSyZH34tmkueyHFBM=;
        b=Hx/rBD5aThqlrcDlEAgKUl7YQssBctyE4prtt6COQ95GKR2ZGEb2oZTbw+t8tB/RaD
         3qrEBHjXStspuifWfvAa3Vq4XssJzc00zBC8+REm7GzzSrve5cagrp9x1it/a4Ameogd
         z8DAOAPPErGNFuWz155HsGjwPVqzGweXzvCegCqgGJDwQH76XADc2/AcwSz9AREd+gQL
         XrnPJyjabRTDGWcyKNN3JGBnWg6UsdYaNLb9PyhL/UGdtM7b2dTLGqG6Pn6W7te9naiD
         D84Tg87MbnFT+DapCB1Lxo1TIeOush+9UWhKTjRloViPKHIB9Sp9e4MVyBQhAQspnMyc
         Vekg==
X-Forwarded-Encrypted: i=1; AFNElJ9h9e49J462h6OsmNdEv66bQpEghKuBLeG01q//uImW7yANds7Hjj8erRrxRy+56NzRW3ijZyp/D/jOcmtpbvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtCs9ouytN068oeUHpaEKphH+7GgPwBcNvN4RAnC9mWXrE29x
	IM35UFuZE0OWvgKjHUTTfJFU0bXVW/PW9W05nat2wLjCyme0CQvpyz5v1Ue5itQmPYF1mel0PO4
	mvkWZOw30YdJk0O+OtoFRnLAtH7A75DSQ+7f9cJ36Fprc/r3yLjgVdTudCfnFqj5bZp/OqjnvBI
	RJWutQYhclu15ucM8v41LMKnlhEs8sxw0b7ADL1PExRUYV
X-Gm-Gg: AfdE7clXNt0JIcxJj3zIqvSBs8NNapDCQ96jbsbYbnhmL7eWeAWoFQaHvT1Gd4JUdDv
	7UmD3HXS8q4m/dLepHKQLGOi8APKZZbu0Ea8MdqT7fhDtkGvmNi9nfzaZQblkOydqZMulrH+eeD
	93pSShYsA2/XCT4XrL/xRD4NcPfN44IQoGdcJ0r6oCjEifcnpCny9gMElBrl2j9j7+zg==
X-Received: by 2002:a05:622a:44:b0:51c:24c:59de with SMTP id d75a77b69052e-51c26b629eamr143143251cf.72.1783076953340;
        Fri, 03 Jul 2026 04:09:13 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:51c:24c:59de with SMTP id
 d75a77b69052e-51c26b629eamr143142551cf.72.1783076952684; Fri, 03 Jul 2026
 04:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <akSOb1_1tcJvFyda@kernel.org>
 <CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com> <akTsE_jYq-GtXcpF@kernel.org>
In-Reply-To: <akTsE_jYq-GtXcpF@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 3 Jul 2026 23:08:35 +1200
X-Gm-Features: AVVi8Cclc4CZSlkWyFCrDTmGWrXtXO513XB-yjh4k4HPtk_zt3VKjRYaC6ARqq0
Message-ID: <CAO7dBbVoppy-1AY8paE8KBb93UubhBHBhvsgjOm0Hnbxiq4byQ@mail.gmail.com>
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

On Wed, Jul 1, 2026 at 10:34=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed, Jul 01, 2026 at 04:58:09PM +1200, Tao Liu wrote:
> > Hi Jarkko,
> >
> > On Wed, Jul 1, 2026 at 3:50=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.o=
rg> wrote:
> > >
> > > On Wed, Jul 01, 2026 at 02:57:33PM +1200, Tao Liu wrote:
> > > > A NULL pointer dereference issue is noticed in riscv's machine_kexe=
c_prepare,
> > > > where image->segment[i].buf might be NULL and copied unchecked.
> > > >
> > > > The NULL buf comes from security/integrity/ima/ima_kexec.c:
> > > > ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
> > > > but kbuf.buffer is NULL
> > >
> > > This should have a proper call sequence. Now the root cause is
> > > obfuscated.
> >
> > Sure, I will attach the stack trace in v4. Here is the one:
> >
> > [   62.867540] kexec_file(Image): Loaded kernel at 0x80200000
> > bufsz=3D0x34ed800 memsz=3D0x35d0000
> > [   62.879983] Unable to handle kernel access to user memory without
> > uaccess routines at virtual address 0000000000000000
> > [   62.880736] Current kexec pgtable: 4K pagesize, 57-bit VAs,
> > pgdp=3D0x00000001062eb000
> > [   62.881185] [0000000000000000] pgd=3D00000000413b4401,
> > p4d=3D000000004151bc01, pud=3D00000000415b7801, pmd=3D0000000040af5801,
> > pte=3D0000000000000000
> > [   62.881969] Oops [#1]
> > [   62.882077] Modules linked in:
> > [   62.882717] CPU: 1 UID: 0 PID: 894 Comm: kexec Not tainted 7.1.1 #4
> > PREEMPT(lazy)
> > [   62.883037] Hardware name: QEMU QEMU Virtual Machine, BIOS
> > edk2-20260508-2.fc44 05/08/2026
> > [   62.883365] epc : __memcpy+0xd4/0xf8
> > [   62.883685]  ra : machine_kexec_prepare+0x8a/0x298
> > [   62.883914] epc : ffffffff81393ee8 ra : ffffffff800366ca sp :
> > ff20000004a83d10
> > [   62.884214]  gp : ffffffff83258db8 tp : ff6000008573db80 t0 :
> > ffffffff80033640
> > [   62.884433]  t1 : 2152ffffffffffc0 t2 : 0000000003000000 s0 :
> > ff20000004a83d80
> > [   62.884710]  s1 : 0000000000000000 a0 : ff20000004a83d10 a1 :
> > 0000000000000000
> > [   62.884987]  a2 : 0000000000000028 a3 : 0000000000000028 a4 :
> > 0000000000000000
> > [   62.885208]  a5 : 0000000000000000 a6 : 0000000104e33fff a7 :
> > 0000000000000000
> > [   62.885486]  s2 : ff60000082a35800 s3 : 0000000000000000 s4 :
> > 0000000000000010
> > [   62.885774]  s5 : 0000000000000028 s6 : ff20000004a83d10 s7 :
> > 0000000000000005
> > [   62.886005]  s8 : 00000000000000c0 s9 : 000000000ac0d220 s10:
> > ffffffff835420e8
> > [   62.886218]  s11: 0000000000000000 t3 : ffffff800000007c t4 :
> > ff1c000002138d00
> > [   62.886515]  t5 : ffffffffffffffff t6 : ff20000004a83d10 ssp :
> > 0000000000000000
> > [   62.886860] status: 0000000200000120 badaddr: 0000000000000000
> > cause: 000000000000000d
> > [   62.887162] [<ffffffff81393ee8>] __memcpy+0xd4/0xf8
> > [   62.887388] [<ffffffff801b253a>] __do_sys_kexec_file_load+0x1b2/0x33=
8
> > [   62.887612] [<ffffffff801b26e4>] __riscv_sys_kexec_file_load+0x24/0x=
40
> > [   62.887855] [<ffffffff81395ea4>] do_trap_ecall_u+0x1a4/0x5a8
> > [   62.888134] [<ffffffff813a9eec>] handle_exception+0x16c/0x178
> > [   62.888445] Code: 7613 07f6 ca05 86b3 00c5 e7b3 01f5 8fd5 8b8d eb89
> > (4198) 0591
> > [   62.889223] ---[ end trace 0000000000000000 ]---
> > Segmentation fault         kexec -l /boot/vmlinuz-7.1.1
> > --initrd=3D/boot/initramfs-7.1.1.img --reuse-cmdline
> >
> > (gdb) p image->segment[0]
> > $3 =3D {{buf =3D 0x0, kbuf =3D 0x0}, bufsz =3D 0, mem =3D 10737586176, =
memsz =3D 4096}
> >
> > The buf =3D 0x0 and bufsz =3D 0 comes from ima_add_kexec_buffer(), thou=
ght
> > I'm not sure why it added a NULL segment, but it is no harm to add a
> > NULL checker here in case any other scenarios similar as IMA.
>
> The mission oriented purpose of kernel's git log is to be a quick
> checklist for bisecting bugs for instance. You have a dump of details
> there for a transcript. Now you should do rationalize that because how
> can you otherwise trust your own code?
>
> Here's one recent example from me:
>
> https://lore.kernel.org/linux-integrity/20260509185108.2681198-1-jarkko@k=
ernel.org/
>
> This is IMHO way more important part for a bug fix like this than the
> code change itself.
>
> It's the "engineering part" of the  equation.
>
> >
> > >
> > > >
> > > > Fix this by simply adding a check before copy.
> > > >
> > > > Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
> > > > Acked-by: Baoquan He <bhe@redhat.com>
> > > > Acked-by: Pratyush Yadav <pratyush@kernel.org>
> > > > Signed-off-by: Tao Liu <ltao@redhat.com>
> > > > ---
> > > >
> > > > v3 -> v2: Add fixes tag; Replace "reference" to "dereference".
> > > > link to v2: https://lore.kernel.org/linux-riscv/20260627222602.2359=
4-2-ltao@redhat.com/
> > > > link to v1: https://lore.kernel.org/linux-riscv/20260529032739.1326=
4-2-ltao@redhat.com/
> > > >
> > > > ---
> > > >  arch/riscv/kernel/machine_kexec.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/=
machine_kexec.c
> > > > index 2306ce3e5f22..afc68f6a4aa1 100644
> > > > --- a/arch/riscv/kernel/machine_kexec.c
> > > > +++ b/arch/riscv/kernel/machine_kexec.c
> > > > @@ -41,6 +41,13 @@ machine_kexec_prepare(struct kimage *image)
> > > >               if (image->segment[i].memsz <=3D sizeof(fdt))
> > > >                       continue;
> > > >
> > > > +             /*
> > > > +              * Some segments (e.g. IMA) reserve space but have no=
 buffer
> > > > +              * loaded yet. Skip them as they cannot contain an FD=
T.
> > > > +              */
> > >
> > > This is destined to rot over time. It also adds up also potentially t=
o
> > > the backporting effort while backporting to stable kernes. And most
> > > importantly. Please, don't document every other null check.
> >
> > OK, will get rid of it.
>
> general rules of thumb i personally follow usually:
>
> 1. features/improvements: can be a bit more eager with comments
> 2. bugs: you really have to have rationale for having a commnet. E.g.,
>    mandatory SAFETY comment in linux-rust would obviously qualify.
> 3. both: if you add a comment are you sure it won't rot over time?
>

Thank you very much for providing detailed guidance on code commenting
and commit log drafting. I really appreciate your help with those!

Thanks,
Tao Liu

> >
> > Thanks,
> > Tao Liu
> >
> > >
> > > > +             if (image->segment[i].buf =3D=3D NULL)
> > >
> > > if (!image->segments[i].buf)
> > >
> > > > +                     continue;
> > > > +
> > > >               if (image->file_mode)
> > > >                       memcpy(&fdt, image->segment[i].buf, sizeof(fd=
t));
> > > >               else if (copy_from_user(&fdt, image->segment[i].buf, =
sizeof(fdt)))
> > > > --
> > > > 2.54.0
> > > >
> > > >
> > >
> > > BR, Jarkko
> > >
> >
>
> BR, Jarkko
>

