Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EA20C00C
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Feb 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669482; cv=none; b=X6NSrl74xke0Y7mQso5Lz8brr3mLYlSawWy/h4GnBKBbwyrL0DXXnzEHBim0tCdB6kFsmHpbxeB8AQCcbTfNG7BZiW5g3UV3w5FC5q0G1gOgLFCQasgcSEZvEbIqaCqrsJzLR/l9zVly/FjceGb3Hodu6tkyxw4N18kY5Rmngvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669482; c=relaxed/simple;
	bh=mN7tslh+i2S6HSh5V2VOg1tYyph90nCPYwFf0QHyu/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fj0rKJ0SwxGL2xTGYE6Ef6QqT0YwMJkgkbRtLZhxwPvcY+ju4/8E/8TVjn3zthfi/OXfXtK2RQJcLYHXyCedrcoQIBrd0nv4X6HZQzy6wEWbwazg8rWW6YK7p0/X5wKDmnaAHtBbxesVXUxf8BcuYk+8m7I1RB5bCGA5uextRxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aA7eikKr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aA7eikKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
	b=aA7eikKr0O3t/r64cqKRVygGg7iiLC8zbmV9Mc0bM9xvmuzCvbyrdAzK39GvM6/37511yH
	WHLfNOHfAa0rEpxTLCMiM41g4wun1dsx+z+hy3Bm6UENaqa5+cgeRuxCCoj4swlPC69zwe
	xGE8WSv7tGgWFSY4gty7YPS7rDsJfeY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-GOdhx5WaNF2B2l4l2D1_eg-1; Tue, 04 Feb 2025 06:44:38 -0500
X-MC-Unique: GOdhx5WaNF2B2l4l2D1_eg-1
X-Mimecast-MFC-AGG-ID: GOdhx5WaNF2B2l4l2D1_eg
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f9c774c1c1so1146032a91.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Feb 2025 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669477; x=1739274277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
        b=SMMDo4veRTWQQ/WP/LLJot9FgdR0ZBx+rtMYkrHW+ErBKZmra+mdiQmXhBRpS/td9f
         hiqiGjEcLnzSsR3KzDlgmBJr3CXo3ieACGRkiGfZhOgh5nk4uIHNuS8P2159kwYn5rez
         /HxEcafksLfbYN8fnmuHI2jk6r+BOEpZUR3P6ZtmxDq7TR7IngVl57tFDVNs65FKSsuS
         2mdXR86KQikTGTixaS48n1ayni0QyRU19stVnBXA37FXRajNrBcZwG261zRV8ZQ3eK21
         rXNk90btv2fPA4uTNS5xpj6Q8haOfXuY/9bipOWjvr+/55K1Ot0WNwVyJiRSAtJ+X8PZ
         +lrA==
X-Forwarded-Encrypted: i=1; AJvYcCX42CaTBLc7G60L3+0cgHRZlgx/Fqw3WyX6CbvDlf3it3fIbV5JLC0KxZgVl5akMZtq59Gt0thns/4NT+acTmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySt+13pN36pK3GuJjevCPLAc+x8Twe0kmdCSfP/V7sCXzGuD/9
	FVZulTPwiGwCFul9gviKzWDKbRhkk8AjCEe3ia5F1ggvzCrOSP3sBxI/eS0PWCIgcEhLxl5b/cl
	nLFwtkHLNUItGbg4hQNs9A0p90wUjkKWvUPWkJmdAnZWN68k3BYLywbcK/i1xHEXhAMrG67I1Uf
	PJRCF7ss2lmkuaKWa5uQteOyD5XqCQ8SLkfew6fLcr
X-Gm-Gg: ASbGncswNGUtfUZn8vBUe63U/fi6ebn+vA0pVGAeKW3i8xbjpoGsZ9OHjeXBuPrdFFN
	Ah1uvgnwspra5Dt+aUd281wbxN63ZKOhipGvBbwe94imR83OKMVLkljHXrZJC15HZRa5qxOzxs0
	CkHny/x2gIKz7cirWnRhCK
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f83abb3532mr35197896a91.3.1738669477480;
        Tue, 04 Feb 2025 03:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT1215YnlE/ZrpMQgdXRPpcUHi+R5LKcJT0ZErl0b04QYANkPy1LfVqSEokWJgpg/IOvaQL+JB/pyKlW4LRIs=
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id
 98e67ed59e1d1-2f83abb3532mr35197867a91.3.1738669477224; Tue, 04 Feb 2025
 03:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com> <20250204113614.GD893@willie-the-truck>
In-Reply-To: <20250204113614.GD893@willie-the-truck>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Tue, 4 Feb 2025 12:44:25 +0100
X-Gm-Features: AWEUYZlGlZEjRarXyn4DMZdt0GYLGOVYedjIdYC8RRdsZP_eC31hKcwXeaYXrKs
Message-ID: <CAOc5a3O-8wrQq3oNJC+H9ncFt0yxcm4O+QSgPk4QckF6Ak5pGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
To: Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 12:36=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Jan 17, 2025 at 07:55:22AM -0500, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> > HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in t=
he
> > various architecture Kconfig files. In the arm64 architecture, the comm=
it
> > adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> > 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> > config.
> >
> > Remove selecting the replaced config. No functional change, just cleanu=
p.
> >
> > Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > ---
> >  arch/arm64/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
>
> Hmm. There are still a couple of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL guards
> kicking around:
>
> include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>
> so it's not clear we can just remove the option from arm64 without
> breaking ftrace_return_to_handler(). What am I missing?
>

Will,

I believe you are looking at a tree, which did not include commit
a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs") yet.

A quick look:

$ git checkout  a3ed4157b7d8~1
HEAD is now at 41705c4262aa fgraph: Pass ftrace_regs to entryfunc
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
./include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
./kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL

$ git checkout  a3ed4157b7d8
Previous HEAD position was 41705c4262aa fgraph: Pass ftrace_regs to entryfu=
nc
HEAD is now at a3ed4157b7d8 fgraph: Replace fgraph_ret_regs with ftrace_reg=
s
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
$

Once commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
ftrace_regs") is applied, grepping for
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL should not have any further use of
that config.

I was looking at linux-next at the time of writing that patch.

Lukas

