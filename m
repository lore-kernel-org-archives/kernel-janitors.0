Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8E24DCF6
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Apr 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097516; cv=pass; b=EUEiFO5TCjtxEEtujyUub+MO/bDsLROUENJ5NSfwdibFGDsKenR7RBBmDcSby1XxYFWWTNzQ7keM/YZYvwtUJUYIuJ6h3SB8+sj30Ggpx0A0fNz2cV59krObF57iH6glJ22pKzZLkZ6eSkFzXixpvZv8UR0aTKEOwiMAljXLH1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097516; c=relaxed/simple;
	bh=Tt66dLjvi1Tbi198cQKKBoqUSSRp6JTLj+fs+G7J4es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKvHKUTwrzJAZJtYyDs+ujPiqHKElhnHWXZ7MEvrGnfCTYlT1tzQx1dhOCPPeGrQ3BCIrfF9j9TRq6VsT41phywuTvSHmHnGpOKVLtZnyRHbb6FXXqqga/D55JL0P6uZ2oM+saj9pqgUE+usOqGeCe4AnAT+LNebewdvWI1mSWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20251104.gappssmtp.com header.i=@omnibond-com.20251104.gappssmtp.com header.b=iWbUFf04; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20251104.gappssmtp.com header.i=@omnibond-com.20251104.gappssmtp.com header.b="iWbUFf04"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so2210129a91.0
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Apr 2026 09:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776097514; cv=none;
        d=google.com; s=arc-20240605;
        b=PbkB16UCbEcTOnHZODITptJar9tn/k5ru/oPRGVzJVT99PwylpzWZed7IMJKmp/8Eg
         a5Rbat9heWNs5qmCIaTbtwkvDqS181xVm654ZY02SzpDMg+s5AFMe9XPg0XaPAssEyOf
         LXcua0a57mMGaq6FFxHD7B1zljUFdA5aYraONQMzu2BSqcRb00fal/P9jVr2AH4J7wf4
         Tt1Fbc+OSGG/xOeKGELut0RHVTNMyDIX4HIK4KUlBorZ0KVXzBYbsejPw8cpfuIV+2+f
         J4DNyC4fVIeKHGzu8kvrOVb7KSvlJQXefldVHlw0D8PXNGFZSkrGqEfhforH/xwZA83n
         mNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4Wts6ksoH5R7VuCQL+vc+KlDjHQwhSehxgYzxC9ZWI=;
        fh=u1iJL474Ke2I7uSLvwXIl8hab7NfK5QvptJ2nI3NLAs=;
        b=W/a4ducyXNVjBNrDvy5nWs85Eh8t+bsbql8lH7U6hGgrBcAZVKj+f7cXPjDX17QA14
         paUB2xhAyAK9c+AXFnGoj88V8ehrWXqXOo4AVICyuW0Rk5CDKBg7/RvxAKgXMp0OLVgy
         32Scf2318bzNwPRiMNwx0wWdXQ0zMAjiYEePTAIwjbz6MxveW4sbJMIM/o5Q6RUYtEI3
         1g2mCSkTHIkpVlCaBxCC3yFCnJK17JGw6UJRcuoqH8fm63kLie9N5JjkET/ezXd5/r3k
         6kzYV2/pKCXGwEt2QNPSt/HIauCS2S6pVgZLgQ0uxUK2kt5JOd+ypBNI73UcJuxJSLjO
         1SPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20251104.gappssmtp.com; s=20251104; t=1776097514; x=1776702314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4Wts6ksoH5R7VuCQL+vc+KlDjHQwhSehxgYzxC9ZWI=;
        b=iWbUFf04+Ia+Oz6cl6FHkD3pxwIebinJV9Ox0WNKg/ggOEUkOG+rhVOn405SSipdeR
         NsDW6EsXx/q44i9gKAcnYk1uAEd4+YZ6rGYx0A/b9YtKef2DcPNtFRavQfOp9fgthULA
         f45gTbiXioIjUv1B70U8WYaPIdl0wiq2k3Afz/YZ7rItVN4wsRKmdXj/JSmUVQK74Nvw
         NL6L0jlKqRKTnYPiTeqn897VASqhkjjbJLxCZE5lHcvd/XqgLyx68/aJcgN1DImkHsm0
         Ze1ZH27Z6EZLYlk1LyJX4HpwXyi8UFQN6jLWSWiVLCxwgWCmmKpnSAn8Cvii/fwxq5Oh
         SmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097514; x=1776702314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4Wts6ksoH5R7VuCQL+vc+KlDjHQwhSehxgYzxC9ZWI=;
        b=O/73NBqb5spzJfMs1Bsye7q+MGLspECHvnMi2kDgJUMiQarR2ygBqg9sRIW6gezNYw
         ZyF7+vhSErb6w9ENEUP0fuSYl2a8G4BECY5NneLZ35klx7fDVHazsKrSsHIwQ7HeXymQ
         xEMcNj/uW6zhNg879XPjTVzDyHcNzjLPBM5P43M1syAt8PBbQgoTJ0bcpupb4M1/ZlS8
         EnQwZWsqjv7LX9oL7mDo3Uj0+XGDPFSNXNWrzzYXYM+A2IU7wAk4lOcPQfza3LODaYcZ
         Hqn96WriE/05lLp9eEtzK6jPHxr8/xNMc3qT3ES/wVFM2ETpm0Sr+3J5pC4r+plOdR/4
         EEsw==
X-Forwarded-Encrypted: i=1; AFNElJ/jLUrH6S/qeaV+C9YDe/qGwaTVwwgqLqQ5CRNLbmFUXnJEdMLAN/ApUyDePKdpTBTp4OidNdItTAueGOuRoFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Yois4E+5eEZMCE63jgrBdSdb6GGZDQKFJY3fwbobWoxE4m5X
	chAdd31tGfq3w2S/2ANw7a2sMe7S1ipDiFpG3J8/m7py/HR98fqsUqlMTb6HHymQYdS4geYBkix
	T6Vl46bs9m26CvYhNSrAAiCcyDCd3I8bPKmb0i3uX
X-Gm-Gg: AeBDiet/ZKI3eoC7K+pdiNxwendP44iWzAJM4Mlz4M2yovLnxcSUg7EGK3BxDy5jiOm
	PQr0XYyKvQPE/i7hPQi46X2cMGwreQIE1WE6hthElTHhI7rEaRm1l3naBVTtVKfWcyxlyUkaF2a
	QykNCW9M449rjT3Fo1UmEYIeT0V6v5ilu982jK0pKMMpmS42cBQynOK85MH9lTRVqCoqObntib+
	08diVRi5XsKpbpWfEO1roYlXdBCQwWPXoHdM/DtahZiPWCu0OWwVx1O7IskNu44eps/jEiLIa2I
	4Fn49X/JNMM5R7OsyNY=
X-Received: by 2002:a17:90b:4b90:b0:356:35a5:4a64 with SMTP id
 98e67ed59e1d1-35e4254fb08mr14727136a91.4.1776097514571; Mon, 13 Apr 2026
 09:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adk038m9nU2HdCCK@stanley.mountain>
In-Reply-To: <adk038m9nU2HdCCK@stanley.mountain>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 13 Apr 2026 12:25:03 -0400
X-Gm-Features: AQROBzCKXIr6hGGQhiRpYo5-_lEUpPncKIgoBKHqx5ijpVisATAAYS44IlTDSnU
Message-ID: <CAOg9mSSf7x3b+jxZskTJtnJpC+QVKZ1pxHvoY=ypg-VgK5-tFA@mail.gmail.com>
Subject: Re: [bug report] bufmap: manage as folios.
To: Dan Carpenter <error27@gmail.com>
Cc: devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, 
	Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Dan...

I made a V2 of my patch that I think addresses the
problems you have pointed out. I'll post V2 as soon
as xfstests completes and I get it committed to
my linux-next...

-Mike

On Fri, Apr 10, 2026 at 1:35=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> Hello Mike Marshall,
>
> Commit df6fd4485d7a ("bufmap: manage as folios.") from Apr 6, 2026
> (linux-next), leads to the following Smatch static checker warning:
>
>         fs/orangefs/orangefs-bufmap.c:451 orangefs_bufmap_map()
>         warn: should for loop be < instead of <=3D? 'bufmap->desc_array[j=
]'
>
> fs/orangefs/orangefs-bufmap.c
>     308 static int orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
>     309                                 struct ORANGEFS_dev_map_desc *use=
r_desc)
>     310 {
>     311         int pages_per_desc =3D bufmap->desc_size / PAGE_SIZE;
>     312         int ret;
>     313         int i;
>     314         int j;
>     315         int current_folio;
>     316         int desc_pages_needed;
>     317         int desc_folio_count;
>     318         int remaining_pages;
>     319         int need_avail_min;
>     320         int pages_assigned_to_this_desc;
>     321         size_t current_offset;
>     322         size_t adjust_offset;
>     323         struct folio *folio;
>     324
>     325         /* map the pages */
>     326         ret =3D pin_user_pages_fast((unsigned long)user_desc->ptr=
,
>     327                 bufmap->page_count,
>     328                 FOLL_WRITE,
>     329                 bufmap->page_array);
>     330
>     331         if (ret < 0)
>     332                 return ret;
>     333
>     334         if (ret !=3D bufmap->page_count) {
>     335                 gossip_err("orangefs error: asked for %d pages, o=
nly got %d.\n",
>     336                                 bufmap->page_count, ret);
>     337                 for (i =3D 0; i < ret; i++)
>     338                         unpin_user_page(bufmap->page_array[i]);
>     339                 return -ENOMEM;
>     340         }
>     341
>     342         /*
>     343          * ideally we want to get kernel space pointers for each =
page, but
>     344          * we can't kmap that many pages at once if highmem is be=
ing used.
>     345          * so instead, we just kmap/kunmap the page address each =
time the
>     346          * kaddr is needed.
>     347          */
>     348         for (i =3D 0; i < bufmap->page_count; i++)
>     349                 flush_dcache_page(bufmap->page_array[i]);
>
> i =3D=3D bufmap->page_count at the end of this loop.
>
>     350
>     351         /*
>     352          * Group pages into folios.
>     353          */
>     354         ret =3D orangefs_bufmap_group_folios(bufmap);
>     355         if (ret)
>     356                 goto unpin;
>
> Assume we hit this goto
>
>     357
>     358         pr_info("%s: desc_size=3D%d bytes (%d pages per desc), to=
tal folios=3D%d\n",
>     359                         __func__, bufmap->desc_size, pages_per_de=
sc,
>     360                         bufmap->folio_count);
>     361
>     362         current_folio =3D 0;
>     363         remaining_pages =3D 0;
>     364         current_offset =3D 0;
>     365         for (i =3D 0; i < bufmap->desc_count; i++) {
>     366                 desc_pages_needed =3D pages_per_desc;
>     367                 desc_folio_count =3D 0;
>     368                 pages_assigned_to_this_desc =3D 0;
>     369                 bufmap->desc_array[i].is_two_2mib_chunks =3D fals=
e;
>     370
>     371                 /*
>     372                  * We hope there was enough memory that each desc=
 is
>     373                  * covered by two THPs/folios, if not we want to =
keep on
>     374                  * working even if there's only one page per foli=
o.
>     375                  */
>     376                 bufmap->desc_array[i].folio_array =3D
>     377                         kzalloc_objs(struct folio *, pages_per_de=
sc);
>     378                 if (!bufmap->desc_array[i].folio_array) {
>     379                         ret =3D -ENOMEM;
>     380                         goto unpin;
>     381                 }
>     382
>     383                 bufmap->desc_array[i].folio_offsets =3D
>     384                         kzalloc_objs(size_t, pages_per_desc);
>     385                 if (!bufmap->desc_array[i].folio_offsets) {
>     386                         ret =3D -ENOMEM;
>     387                         kfree(bufmap->desc_array[i].folio_array);
>     388                         goto unpin;
>     389                 }
>     390
>     391                 bufmap->desc_array[i].uaddr =3D
>     392                         user_desc->ptr + (size_t)i * bufmap->desc=
_size;
>     393
>     394                 /*
>     395                  * Accumulate folios until desc is full.
>     396                  */
>     397                 while (desc_pages_needed > 0) {
>     398                         if (remaining_pages =3D=3D 0) {
>     399                                 /* shouldn't happen. */
>     400                                 if (current_folio >=3D bufmap->fo=
lio_count) {
>     401                                         ret =3D -EINVAL;
>     402                                         goto unpin;
>     403                                 }
>     404                                 folio =3D bufmap->folio_array[cur=
rent_folio++];
>     405                                 remaining_pages =3D folio_nr_page=
s(folio);
>     406                                 current_offset =3D 0;
>     407                         } else {
>     408                                 folio =3D bufmap->folio_array[cur=
rent_folio - 1];
>     409                         }
>     410
>     411                         need_avail_min =3D
>     412                                 min(desc_pages_needed, remaining_=
pages);
>     413                         adjust_offset =3D need_avail_min * PAGE_S=
IZE;
>     414
>     415                         bufmap->desc_array[i].folio_array[desc_fo=
lio_count] =3D
>     416                                 folio;
>     417                         bufmap->desc_array[i].folio_offsets[desc_=
folio_count] =3D
>     418                                 current_offset;
>     419                         desc_folio_count++;
>     420                         pages_assigned_to_this_desc +=3D need_ava=
il_min;
>     421                         desc_pages_needed -=3D need_avail_min;
>     422                         remaining_pages -=3D need_avail_min;
>     423                         current_offset +=3D adjust_offset;
>     424                 }
>     425
>     426                 /* Detect optimal case: two 2MiB folios per 4MiB =
slot. */
>     427                 if (desc_folio_count =3D=3D 2 &&
>     428                   folio_nr_pages(bufmap->desc_array[i].folio_arra=
y[0]) =3D=3D 512 &&
>     429                   folio_nr_pages(bufmap->desc_array[i].folio_arra=
y[1]) =3D=3D 512) {
>     430                         bufmap->desc_array[i].is_two_2mib_chunks =
=3D true;
>     431                         gossip_debug(GOSSIP_BUFMAP_DEBUG, "%s: de=
scriptor :%d: "
>     432                                 "optimal folio/page ratio.\n", __=
func__, i);
>     433                 }
>     434
>     435                 bufmap->desc_array[i].folio_count =3D desc_folio_=
count;
>     436                 gossip_debug(GOSSIP_BUFMAP_DEBUG,
>     437                         " descriptor %d: folio_count=3D%d, "
>     438                         "pages_assigned=3D%d (should be %d)\n",
>     439                         i, desc_folio_count, pages_assigned_to_th=
is_desc,
>     440                         pages_per_desc);
>     441         }
>     442
>     443         return 0;
>     444 unpin:
>     445         /*
>     446          * rollback any allocations we got so far...
>     447          * Memory pressure, like in generic/340, led me
>     448          * to write the rollback this way.
>     449          */
>     450         for (j =3D 0; j <=3D i; j++) {
>
> The intention here is that this would unwind the bufmap->desc_count
> loop but we never reached that loop.  Do we know that bufmap->page_count
> is less than bufmap->desc_count?  Either way, it doesn't make sense.
>
> I always use opportunities like this to promote my blog!
> https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style=
/
>
> --> 451                 if (bufmap->desc_array[j].folio_array) {
>     452                         kfree(bufmap->desc_array[j].folio_array);
>     453                         bufmap->desc_array[j].folio_array =3D NUL=
L;
>     454                 }
>     455                 if (bufmap->desc_array[j].folio_offsets) {
>     456                         kfree(bufmap->desc_array[j].folio_offsets=
);
>     457                         bufmap->desc_array[j].folio_offsets =3D N=
ULL;
>     458                 }
>     459         }
>     460         unpin_user_pages(bufmap->page_array, bufmap->page_count);
>     461         return ret;
>     462 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter
