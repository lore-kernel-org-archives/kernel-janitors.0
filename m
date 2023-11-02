Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0EF15484
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="USCyJZST"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E9F194
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698925862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXvh0HaN7chqLYewNa2LL+UKTHm+C7BuJqCkmXwm+hI=;
	b=USCyJZSTDBCXDiq5yT9cLdzjZZnMPqg/SIWV8fo7pZCEiuowbR3Ysylz625DvPIBZN1rzr
	sydkyZjOsC4qEZpkuQ7Indg5HsTWAgaXd3KHt2bHP2OaDjTDA+BPqZuq6kKKxfFjHtUhf0
	uw7OGWiGk3epPAALvs1uE9t9BGAYr9M=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-zOOYF8KhMAygW9R6LzMiWA-1; Thu, 02 Nov 2023 07:51:00 -0400
X-MC-Unique: zOOYF8KhMAygW9R6LzMiWA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc281f1214so7048115ad.2
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 04:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698925860; x=1699530660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXvh0HaN7chqLYewNa2LL+UKTHm+C7BuJqCkmXwm+hI=;
        b=nurM1Bvie9QwwsTcKYaIG24yRmZ/tGA2z+itWeG3td+rRMx6Mz+dt5Q0ZraqBH9ZUl
         FxuT2RV+CHvQOgch829c7VH8SoWKx0qs3lNwpXjPXlNprvZVE9+16lEgj/5e/ftfFFLE
         bJfdpVjIoVCXrZn6TC4L9WgXtiSM48i1ywahP4KdYmiCkmgVIl1OYf0s9BuHTs4zAhPu
         Wk3coREj5xHcnxYSzCKBGrD9ad5ocvG9cmb03ussQGF8W1YfyULebSJYU4g7KkG8qk/z
         jsjALvce5FO8QgWYLfWrInnE4qCcbY3lhyu1kBUEnvS6hnD+eYNrIlPpkrTN0URyPp7F
         uanA==
X-Gm-Message-State: AOJu0YxHEoHtEfh6clkHlpUc45b/Hf2x9CKGCBFNlfFbPX841dhTqZfo
	0cTRg3ePaf1y/0zL3T3OTcG1UwMASh0CO58qvd/5yGk15fA8TmSdjdyURDFqhSvDEdQ6Vdlicc8
	nd1Q452REn7EISc2l9+9X84V6GgoYh0z9ZnZ/WPFzWxBh
X-Received: by 2002:a17:902:ec91:b0:1cc:54fb:60f9 with SMTP id x17-20020a170902ec9100b001cc54fb60f9mr10689020plg.37.1698925859918;
        Thu, 02 Nov 2023 04:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeDlGc9ZGH6KLUUs2Oy1+WEmNgkUJb5lFfrVvtguyJjyCi7rE9YZlkZPXYJTVtaydPfwGnkT4uiclyiO5PhFc=
X-Received: by 2002:a17:902:ec91:b0:1cc:54fb:60f9 with SMTP id
 x17-20020a170902ec9100b001cc54fb60f9mr10689005plg.37.1698925859679; Thu, 02
 Nov 2023 04:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102015141.1355762-1-suhui@nfschina.com>
In-Reply-To: <20231102015141.1355762-1-suhui@nfschina.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 2 Nov 2023 12:50:47 +0100
Message-ID: <CAHc6FU5H-Ju9129Xr3RGA6DePDL58tQ7nOkSJXdig4gJc1w+WA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: remove dead code in __acquires
To: Su Hui <suhui@nfschina.com>
Cc: rpeterso@redhat.com, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 2:54=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> clang static analyzer complains that value stored to 'gh' is never read.
> The code of this line is useless after commit 0b93bac2271e
> ("gfs2: Remove LM_FLAG_PRIORITY flag"). Remove this code to save space.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/gfs2/glock.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 3772a5d9e85c..347f8a020c82 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -1524,7 +1524,6 @@ __acquires(&gl->gl_lockref.lock)
>                 return;
>         }
>         list_add_tail(&gh->gh_list, insert_pt);
> -       gh =3D list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_l=
ist);
>         spin_unlock(&gl->gl_lockref.lock);
>         if (sdp->sd_lockstruct.ls_ops->lm_cancel)
>                 sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
> --
> 2.30.2
>

Thanks, I'll add this.

(The subject "gfs2: remove dead code in __acquires" is misleading
because the function this is in is called add_to_queue(); __acquires
is just an annotation.)

Andreas

