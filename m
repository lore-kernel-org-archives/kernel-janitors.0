Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5B3AEF37
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249707; cv=pass; b=JjsqlLcHDNFfKjyrGCYNwf9p+IVgS0yXq7HRUgbqnNJhWMTpD2n/dXoKqXU6Eb/jFJH8WDKOqOlfCHI+4TcNGVh6leux6nCqs8hK74ch6aVnPJToqiCTNJE9Ue6fuRMNDbXndTtDeY0PzdNuDyAWqPP1smZhcZQdhE6qvS3X5F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249707; c=relaxed/simple;
	bh=HuNz3gzaU3SpTitrCcjHSjnqT31gir+cVrJY9GeZkhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaEmPodL5zYhfKVeYchWQLDEId7wFcKHlpRCJQW6vYKNVygXrO/mvrbEjIlnQQTe/pB/VIVr+eeU+wzTQ+tSs6UL9LBnJsQXHF1tI4S1n/fseo8ewps9l4wSjpOrE2vCDJZoJWS2mqXftlEv4xVrrd0E3pvUDropmcZOGxLgTwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0Kfzsla; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0Kfzsla"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963a722ed59so126927241.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 14:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782249705; cv=none;
        d=google.com; s=arc-20240605;
        b=aIZ4eInMAF7OVW3uAbXSxM9P9sie+fVeTGoO0t/l7yAGvO7yE8NmJkvjADESNEg+ql
         9P6URtNtO2NkWNMsrsrlwbmhrFAtpy4dPxCJ0nPQ9C1DTf71WxYkj5euSb9LPr/j2oKy
         sdPqxoQmlMu+hQvuV8PNtsbn47JLG0MloQuY53CbsISQPqA6IGWbVRnNer8Z2On4S/eZ
         ahLG0sVPp5ikXINrMOkS9hF8FTez4XIG2N82o8hfB3PNJuB3wdkjiurpLn8cn0tSU8HI
         NO9Iim4h1AfVZuNVDlmjdtPKPlwnx2yBmBvoLi89Na5NhAxJ4ZU+RXFP7vNK3pXQQ+Zb
         uY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        fh=jLdq8yhUJTGsAGU9Dwdpcy88GuHD3d0V92H76KSrexA=;
        b=awsO/9JU0DgQZQn83svi2rasSbFld1r8ae5+3D2Q0edJKv9Ae2ZE4iV79YCaJQnC93
         1lzf3aM50AkYYAG6ppA1IaBF0ncjfW8PTk5AlkhrQ1HTpHWtkUuKvIWVJsZu33apvlBt
         Rz4fM13IPljPuf8gCv8a7CNzhJLZgcjNJM1+sYs7p4AJmIen7wmqiqvGUBD+P/NsrVcR
         J5iVVotNrqXikSdUDA1FMykDJY6Nnf5HwPLqz6vGRawm703ZNeG6PwXIoqCEpRRs6qfe
         xUTzkiGpb2yODmdKCUqyAMyCiyAgNFHoKU/ksnnVC8XDk9LI2DCVfaavAencbTfFmm8k
         FhXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782249705; x=1782854505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        b=H0KfzslaJQKqaFVWhRmsNHsSk6Xq6v6uHWTYIh6jxXsHJiiY0PXkZ2pxS2ednso3aj
         G2zY1spvenfri9+La/DL27ug05nuBE7tcoxTgqZ3Y+K+YzwycM6+RSID97kKDXjvTe+c
         hHo18ktpiImtKDEeRi8HrdyPs8SC8TdcO8CR/3t2JozFUire15EgqpDs6l2jSiWrDqlS
         iaGAY5hgwnbAv3+QyEYbIBD08JRaqNKTfG5TgMoU1r8DXeg0uGtGBOkWUHe/AOTxRpQq
         UOqTwSzoseAqqrv1rHB2bZ91CT7BABo2FCzIqn+BfXWOpOtrl+Qii8vBBopnbsiwKcKT
         6Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249705; x=1782854505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        b=tWkp7MpNq2xobdGxqehWMrEScS2bL8S9O88lohSV2k6KzXu7qTI/z/LbPSAmGHTNyu
         dRpGr0J3oXSF/hWk+2f+60wTTCaj2CBrRFj7Dk6zuZET33vFqGVWcA9NSFgZR8waXJkS
         Yqi9IwBt+7Keneukp6zu1t/3rRmhOIIjM7sElt6XfRkprkb8B2MzLXoGUdJ0vUUqRkeF
         RYNo4+8/tP0OwGW5ig1eoqHfCR8sSoyBilxred3hFPqD8zDHx532NKYg296HPs5HhVL7
         hAOfcg6rqMX1+WE/2myqEYJKhAQoY1AZqLLFbCs6crxMEUXz+B+HSqVUlFP3UmQcShCZ
         ixSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NR6PDT6nketQr8Wx6EqbWlTDs5syX76dglDyLOTYMVP9MzJUaf8EyoXOWSUqlWNGx+y+PJ24xTElISvEF3Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYZ0IGBgyo7zrOsBWOwJhj5CJuaXjJFV5yNnYl5pJv30P7ekA
	KHCOSd7Ie7ttk422IHqOUP1kEQKciToNsqSWR9ESms6PgpOBkolJ2OZ3afNwMHs9MxbWUJIokgE
	MHuh2zzmF7PCw4kQLoaMYCGUr7YCzqRI=
X-Gm-Gg: AfdE7ckSINyektkLkLJDYQhDKCADlKDRI/gQdxmZe95uu1Kx4B7X+uh4aOTwj/DLLuU
	ulZEty/7dcvy2SvS6byX7ovoufDBoYOQ4j5TITuNHY+/RY+g+fmx7vwSpFv1YX7aKs+57TRQtCm
	uLz2T5UriRyUxifq+tfQsUNaCgAXwyelrZrbs1lSI+Sh5kw+Vhcif8Ot/jKvd9+o/m86JkaXu+R
	aTI58MAyFNG/8Asswj2PJ41Z5cMm82naLaXi4tvbbDHzmXg78ZQViJun0RPGsBJDDTg0m4T3yOd
	YBZYibjZJg==
X-Received: by 2002:a05:6102:953:b0:631:b834:e052 with SMTP id
 ada2fe7eead31-7311370159emr292424137.12.1782249705032; Tue, 23 Jun 2026
 14:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622200239.14683-1-andrem.33333@gmail.com>
 <ajobVOpSu1PMHaNo@stanley.mountain> <CACO0qFLm0KCdyiKuaQQy9zwX0iwEStgg7n0XyyDP6DOBX+ZF3g@mail.gmail.com>
In-Reply-To: <CACO0qFLm0KCdyiKuaQQy9zwX0iwEStgg7n0XyyDP6DOBX+ZF3g@mail.gmail.com>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Tue, 23 Jun 2026 18:21:33 -0300
X-Gm-Features: AVVi8CfwBCD6LSV3vmKyidR4Jc050w9Cy_5ytpkDQs8XyhW_hSI_HAztgc61Rek
Message-ID: <CACO0qFKBW8WSKNVaJ-8ps6k-TCVEpc_-sPucP67x8r=YW8WSqw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: clean up style and dead code in rtw_recv.c
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 23 de jun. de 2026 =C3=A0s 18:11, Andre Moreira
<andrem.33333@gmail.com> escreveu:
>
> Thanks for the review, Dan.
>
> I see how removing the 'else' broke the loop logic there. Thanks for the =
explanation and for catching that.
>
> It's great that this helped identify a pattern for a new Smatch check. I'=
ll make sure to double-check the control flow on these legacy cleanups next=
 time.
>
> Regards,
> Andr=C3=A9
>
> Em ter., 23 de jun. de 2026 =C3=A0s 02:36, Dan Carpenter <error27@gmail.c=
om> escreveu:
>>
>> On Mon, Jun 22, 2026 at 05:02:39PM -0300, Andr=C3=A9 Moreira wrote:
>> > Fix checkpatch.pl warnings in rtw_recv.c by removing an explicit '=3D=
=3D true'
>> > comparison with extra parentheses from check_fwstate() and dropping a
>> > redundant 'else' block after an early return.
>> >
>> > Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
>> > ---
>> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_recv.c
>> > index f78194d508dfc..3fb48a8a52b17 100644
>> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
>> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
>> > @@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_f=
rame *precvframe)
>> >       eth_type =3D ntohs(be_tmp); /* pattrib->ether_type */
>> >       pattrib->eth_type =3D eth_type;
>> >
>> > -     if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) =3D=3D true)) {
>> > +     if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
>>
>>
>> Someone already did this.
>>
>> >               ptr +=3D rmv_len;
>> >               *ptr =3D 0x87;
>> >               *(ptr + 1) =3D 0x12;
>> > @@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv=
_reorder_ctrl *preorder_ctrl, un
>> >                       /* Duplicate entry is found!! Do not insert curr=
ent entry. */
>> >                       /* spin_unlock_irqrestore(&ppending_recvframe_qu=
eue->lock, irql); */
>> >                       return false;
>> > -             else
>> > -                     break;
>> > +             break;
>>
>> This change introduces a bug.  I created a Smatch check based on the
>> new bug.  It's in the Smatch devel branch.
>> https://github.com/error27/smatch/blob/devel/check_pointless_loop.c
>>
>> KTODO: review loops that are really if statements
>>
>> Some of these have comments where it was originally intended to be
>> a loop but it lead to bugs so they hacked around it by only looping
>> one time.  These are mostly quite old code and they seem to be working
>> okay so probably they are false positives in one way or another but
>> just I feel like most would be more readable as an if statement.
>>
>> kernel/rcu/tasks.h:1521 rcu_tasks_verify_self_tests() warn: replace whil=
e loop with if statement?
>> kernel/bpf/btf.c:7383 btf_struct_access() warn: replace while loop with =
if statement?
>> drivers/net/wireguard/selftest/ratelimiter.c:170 wg_ratelimiter_selftest=
() warn: replace while loop with if statement?
>> drivers/video/fbdev/sis/sis_main.c:2226 sisfb_sense_crt1() warn: replace=
 while loop with if statement?
>> drivers/video/fbdev/sis/sis_main.c:2228 sisfb_sense_crt1() warn: replace=
 while loop with if statement?
>> drivers/video/fbdev/aty/radeon_base.c:1556 radeon_calc_pll_regs() warn: =
replace while loop with if statement?
>> drivers/media/pci/tw686x/tw686x-video.c:133 tw686x_memcpy_buf_refill() w=
arn: replace while loop with if statement?
>> drivers/media/pci/tw686x/tw686x-video.c:159 tw686x_contig_buf_refill() w=
arn: replace while loop with if statement?
>> drivers/ntb/test/ntb_perf.c:462 perf_cmd_recv() warn: replace while loop=
 with if statement?
>> fs/afs/rxrpc.c:526 afs_deliver_to_call() warn: replace while loop with i=
f statement?
>> fs/xfs/scrub/attr_repair.c:532 xrep_xattr_find_buf() warn: replace while=
 loop with if statement?
>>
>> regards,
>> dan carpenter
