Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BA8C25B48
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 21:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjJZV66 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 17:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZV65 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 17:58:57 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E4B91
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 14:58:53 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da0359751dbso1279966276.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698357533; x=1698962333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwMcqSWwKO0wXJv0H7UCPPqsu6sxGdcOrGctTr5qgQ=;
        b=Nyn45E+T9Qn+U3s9c3+cDbMhQoeVTqtDG52CqIGsbYa17hMoh0HWICo3zHTHIa5JvN
         kbvYA6upDB9Yvc662R8gYw2Er5g0UdtTJOzG+lgKkHkv3gv0GaHYX41wkdEeIbnotXe4
         o/ZQbspRgjLmM0fKzhHB+WQRsBodsLH6+6Xi39V5MJwmSj0YLMeK6MddoGXGZxZ5iCFa
         HUHfLRUa41Ep52JavCQzNBsppDqHl81IJMwT+tGK6DFnxvXev3LzAfvC+X+eGpPi/sKw
         cYVXZYfcKjAYqQWgxIXsstpNHTiksd7W4KSrFanMek3KZT0Fg31Rw+o7SAm+y3drhUPW
         Vy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698357533; x=1698962333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvwMcqSWwKO0wXJv0H7UCPPqsu6sxGdcOrGctTr5qgQ=;
        b=XakreVMMiVQlEOkTSTXjUSZpxpvVQDq1rjTT6z9fcf4rXwdYRNZgT3novU8QJbDX86
         2xpaqO75OgoXaj+I0BdkfnkQHSaaKkJ6PJkErNSWlFgxCsgqWiNaXKr1DBUHia/oFKCq
         zhh01kphPRvtE2zomFCB/urJUJC7NlVMWqmNWXDs+FZrzE3kNL2zbCtfUyTqCQzvfDCl
         8OVfhBn2xz0qsEXFi84skYpAp2I9AVtr6CydrwUQaYpOA5HQ87UdOlNFCYFMQASI3R30
         ZQgARCbh6LHlTnMBYjWjkAk2IxF+jHJVT5Um+inHMypx2cYifgQp7lopOQg3pE+UZfuk
         ApKg==
X-Gm-Message-State: AOJu0Yz53p/fGsah91pn/8iGS6aePQjNt0Qhj5wBTrZqoWKD0BpoTw5W
        1ps+MPjXy6htzxRAJ3j85oazTJnbi77H80N2cmTuWeRejgVRSQ==
X-Google-Smtp-Source: AGHT+IGx/ZHQdoq72DxRa+WbDxL2QzPV1zMjFCJVUT76NH83eBA1Fk7QbBfs4Yj0Olum11qg0SZMgiYJ097GUhy6e1Q=
X-Received: by 2002:a25:4041:0:b0:da0:8283:416e with SMTP id
 n62-20020a254041000000b00da08283416emr6952142yba.27.1698357532913; Thu, 26
 Oct 2023 14:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023-righteous-peridot-parakeet-1bbda0@meerkat> <20231024-notorious-elegant-crayfish-a45d63@meerkat>
In-Reply-To: <20231024-notorious-elegant-crayfish-a45d63@meerkat>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 26 Oct 2023 23:58:41 +0200
Message-ID: <CANiq72nndjv301OE9oZpO5Uqwf1-hMyGn5FVVWqyrCEY0_ZG2A@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Konstantin Ryabitsev <mricon@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 5:28=E2=80=AFPM Konstantin Ryabitsev <mricon@kernel=
.org> wrote:
>
> FWIW, such page now exists:
> https://subspace.kernel.org/etiquette.html

Thanks Konstantin -- I have added a link to it in the Rust for Linux webpag=
e.

I would suggest linking it at
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions
too.

Cheers,
Miguel
