Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADE3BB132
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Jul 2026 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076398; cv=pass; b=FbxQ0RZDH8e5s5HtaBXqRHbhAouv1DcqGsZc1q6cG3SYUZ0r8KWZ3tj9u1t69PWbGsWvBCuJpOI4W2aEA/aVbm+lO7lRD3iTjJfuh1vV7gCrEgT/d/GMFaSBMm3xwqkQoNCDvibZFRTNxvQo+bSiPUOH208nBWEGnkb2PGPeZOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076398; c=relaxed/simple;
	bh=Kdp2PH2HMMYY6AaCbfMKyegYJNpecovxW46S2fuHfAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2sFrJRPC1XQYwvLt0nf51EYtktGT92FLj5FsVBLnG2y+Z/vxjkA2x91NPipwABKgLust1lsaTEQAgFqPtYXRjwaJbODGrWuEPhe4r/XTxDs7HBxdDDTCSIOh7yI1fuplXEnZ0Q9xQIHEWvcQd1b9aCBPh5mErFyrXf2ezKW5rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WqamhOy7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVeDA70K; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqamhOy7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVeDA70K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783076396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
	b=WqamhOy7gAPRXxJTOKPKH2HeG4kK/3+d6KDRhFpYzsnfwCBofBxDy5BYHkcrmv8LYpjFKs
	YCFlvV0XWpBHQZX3FToxaG4G5t1tfCH8XtCInEA9vthZlwnXLVT/64xspo5I9YslKhBaBy
	jZNpAMsupqCdNol0+zfADB6YFMlgNYU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-wdB8EppwO66nld5nqmHzrg-1; Fri, 03 Jul 2026 06:59:53 -0400
X-MC-Unique: wdB8EppwO66nld5nqmHzrg-1
X-Mimecast-MFC-AGG-ID: wdB8EppwO66nld5nqmHzrg_1783076393
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so33384985a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jul 2026 03:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783076393; cv=none;
        d=google.com; s=arc-20260327;
        b=pE8Tj31TYEnENu0YqXu2a92Z5sf0sdjt/SnA1P+eS1T4BbVd8VkgkP78nxClQBr9xJ
         Wrjre7BsETOY+1Ucq7Q1zP8tRnlMpvfEnwxPpjIZibz/7AVra180h2EVbmTwRouUKvqY
         zTP1lH2kf1cRCh7sNt+6uODFLRZZf/R+S7xBz/fHJkoDFyXB+phpGXipeehE4n5QWKaZ
         KweZUsz9IJYHt6ADXCC+63adUiApE/RjLKypRQ4IVKUY9OcN1T34vt1R4f8z2mN75QVi
         W28JLAjLLLxK0ajzN2QiunP6XkXOMA5Tb56h2PvKFljKYyjgN07byYmu7k5xSID6BEgk
         ZBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
        fh=Im0iOkL+UBobE0a8/UxL7dMytdxwnC1uT8TkuSmaSdA=;
        b=A+3uCN0hif2QMD+vRaMPFGmmRzp2pYMdhLepNi/tV3UXFTictX0GWydDb3tpbKFwmm
         Jiz/g41vIZOLSVLGR/B4an3pRXsNz6ZRSJ7Jn66H3pIiUDPw+uZypATnoj8drC2yrJNO
         VUFVMQ67HXw4/q/eO7hbMD8vUrxicwLr5TF1jtNwM2HPjq8WDVx4h98jx6TO724Mf2Lp
         wlJ0bvToEwty6nbGWwlJ5nmEFcJH/MBaVIE1FASsR7jTaBEvMZWEn/3ovpaMMzsc8xXV
         CrfQkBXmkO67k3PK5ZSF8DZwF6mIjSHrbp7K5SQ6LrKaLFqCmCaQoDw/SwESijRhqcPL
         FPZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783076393; x=1783681193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
        b=bVeDA70K4ksaazHQYpA4UhYenAC8HV7yk4Klli93b3vflFTJ6anQYho56kSrGKUjfp
         HnfNKpSb9KK92mHt4YS8KGQP1kHs5nT07oQ5Dli2GpkTIRHvsMNr4/BsC2l2d0b7rOyi
         ujXHDmKA1w8MZnorBPyDSiiZKlfGtL3TyVf8I7t/EwWWxyaro60F9Z0+AZWXMeTRWj2X
         /lzm/nT0OtY9MsivKvy9apty16/AWkOlFBefkjmTQ75vQEYXAt1xsPpHIg7C488p5u9W
         qr+sGD0nz+ENmnbqSkQgGXFnqBCAje/4mQnSlkuu/ST/kM2Ryg+JOO09uoH1mMqysMQt
         7xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076393; x=1783681193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
        b=tDtnk1hkve/We8FSh5O+wmNiUK0ARyGVrXZMbTITdL7e/9TB00bL8yfQn51u0ZniuC
         +xi6BlJnVvA73Ze8yOatl15sP8h17trdQO+rrM9zTnlJfHGSagJc0apNP25AxcWbgVVc
         rOdCKdaMffhu4fElaSNzhKjF2iwSbKCCRjdnZvDvJ1BNS/Ff0J2Sn/6yVvuYjWqxvhlX
         dRMh1ki0sHXNSKvKinMjzGwPtNuIkGNOP5YPkfuKlbR7Xbw7iH8SxFu+pjirMDYMBPxm
         fzxX2wlLRzz8sTBOPrbgORHz+VRNIiUgAGQNKb/AxkqwA4nVSSUyDV9f6CFz16qNq5k7
         OW/w==
X-Forwarded-Encrypted: i=1; AFNElJ/4twR5AriOPAMlppb5pnDukZuGn0yJaJ5mkya/2bfbeDonfUrU4ZJl2FT4uP+19FyDZhObJ307c8jIlRareS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz8qY5VfU7aioVa2E19T6l6UWiJxKL0OSbfcaux0vPrJW6OsI5
	mYjdqIE/T3QG4s/XzqLHhB177bpFoycIpmxxGOj7tsMMTpjw3OY7wFd2fZi06RHFsGRqFYC6dOu
	MEswqldZkJgvSBCKn8Aa9Nx+GszCmd2tNLHJHx5bfE7OxmGLqTLCCBrMwjmY+og9COoykKdvT2T
	i8Vv8S3DPdNbx59g3O3fgKg0XpkDPPQppqKYA15hoql4aw
X-Gm-Gg: AfdE7cmdajxxYDid1KnjPXELuDVazkrv9H0cufsENqV8ZOdr/pHQVg2rYSHgmhTkviV
	6E+VAT/aNM2xctO7C1iptuHmbql4e+xhV60bAcI4ekEw50/jm6QaSS5DM1tl3LAryaEZv5dJV0v
	sCbMdsbcstpxcAMpuN3ZDjFYNP7bmBcRdUM1iZG+Bi76YHR+0/GzArH4cVPlFFmKdPiw==
X-Received: by 2002:a05:620a:4016:b0:92e:6a43:4768 with SMTP id af79cd13be357-92e781cde5emr1264293885a.11.1783076392674;
        Fri, 03 Jul 2026 03:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:92e:6a43:4768 with SMTP id
 af79cd13be357-92e781cde5emr1264290485a.11.1783076392257; Fri, 03 Jul 2026
 03:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <akSOb1_1tcJvFyda@kernel.org>
 <CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com> <2vxz33y2j4mi.fsf@kernel.org>
In-Reply-To: <2vxz33y2j4mi.fsf@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 3 Jul 2026 22:59:15 +1200
X-Gm-Features: AVVi8Cezbo0yX7OHAq34QhJe08uT7CxY47RNCIsfCYAyC3SXHTFCS-ZJgPFpSss
Message-ID: <CAO7dBbXBc4kvE2J09EhBs+MYpcJOV1UdNnSG=5RqcUUqimU5Qg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, bhe@redhat.com, 
	zohar@linux.ibm.com, roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, linux-integrity@vger.kernel.org, 
	Markus.Elfring@web.de, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratyush,

On Thu, Jul 2, 2026 at 12:06=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Wed, Jul 01 2026, Tao Liu wrote:
>
> > Hi Jarkko,
> >
> > On Wed, Jul 1, 2026 at 3:50=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.o=
rg> wrote:
> >>
> >> On Wed, Jul 01, 2026 at 02:57:33PM +1200, Tao Liu wrote:
> >> > A NULL pointer dereference issue is noticed in riscv's machine_kexec=
_prepare,
> >> > where image->segment[i].buf might be NULL and copied unchecked.
> >> >
> >> > The NULL buf comes from security/integrity/ima/ima_kexec.c:
> >> > ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
> >> > but kbuf.buffer is NULL
> >>
> >> This should have a proper call sequence. Now the root cause is
> >> obfuscated.
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
> From my reading of the IMA code, I think they do so because they don't
> want to add a buffer to the kimage just yet. This is because there can
> be IMA measurements between kexec load and kexec reboot. So they use
> kexec_add_buffer() to reserve the physical address space, then they vmap
> the destination pages in ima_kexec_post_load(), and then update the
> destination pages directly via a reboot notifier. So they do not have a
> buffer copied to the destination pages at the time of
> kexec_add_buffer().
>
> Now all that is fairly convoluted and not very obvious, but I am not
> sure if there is a better way of doing this off the top of my head.

Thank you very much for resolving my confusion! Now I understand it
much better...

Thanks,
Tao Liu

>
> >
> >>
> >> >
> >> > Fix this by simply adding a check before copy.
> >> >
> >> > Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
> >> > Acked-by: Baoquan He <bhe@redhat.com>
> >> > Acked-by: Pratyush Yadav <pratyush@kernel.org>
> >> > Signed-off-by: Tao Liu <ltao@redhat.com>
> [...]
>
> --
> Regards,
> Pratyush Yadav
>

