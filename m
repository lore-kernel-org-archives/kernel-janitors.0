Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0048BD3F
	for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574097; cv=none; b=crwkVqbHlD49wMRJwIWScOEQCnXKo4IhEJEqAAX2avZBYupipSvcc/S+DNQCo3uEZCIexn9l0f7gEobesWOkcyDKC3nu14XL3kr+qeHuzEP6rWqkPPge+aN/uFLvbqe810WbIHTNGqO3rdmbOOlf+mnYQRRuRG6fLNkiA1yrT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574097; c=relaxed/simple;
	bh=S0c8l0KVzi9gFkfqKaRogVnJ6mPO0mScQwH1sYke9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPv105R7nwbQUBV8PJu7p34vcS9vbVmT0BwWrquonwRmMKETr/T8f6krpUYydJvuQ5uxyTd13cJtoR1OrQZRL17WNB2WsCsErngVob03NHA3lXhymaDWnpqfna945N5myZK0RwV5tqh7hx1p2CFlzAsTjCADu35cn/jniR7LUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU8uvc6x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU8uvc6x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44509921fbcso2614867f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778574094; x=1779178894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q3CO0P33u84+scWxvorwCoGWLliF7I5j4WDQyYtcSH8=;
        b=HU8uvc6xgdUqTQXujIn/X9wCF7auaZbJj3QlK+5bjOCRkw+DkMgR/nTCWXFkXKB8ic
         vr+3QM7R+xk2XYEe/l1XZTzvabs916Gtpk/Z/LpgRUW7Ge/dBHLgGwGlOQDR3d0oRw5X
         CTBd3vbcSiRwPSqPjqpZmmIHnthn047G+9wW+euBqFZOYpfqKVCId9rKj6sdSzt4sH7G
         eUvPKvpIk3+VLOZzNU6kcwx+2pJdyD2lop0YLfpMinugPfk6qzmQJw9Qv8TuJAj4M1on
         ml1eV4lJ4q7OArXsH+LjTf3edxDzJEpUtoQw+Jhn8ChyrX4DhB3yBH/nUv3p5DQR3DEc
         TZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574094; x=1779178894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3CO0P33u84+scWxvorwCoGWLliF7I5j4WDQyYtcSH8=;
        b=nsp+IN+ddBkKQisd2+PZiruJZOTEjVwIcbIeZ34hCcT6NbBxlzZU0+m58EDaP9RN8l
         4i2WUXQFP5vo+A49e+oj8YTPflPzaAg+2Ir4bxymydKUkURtK6qaHFZRJKRr/Yr1G6p4
         y11ng6ZR+NB3vBZpdPRq92F9uHqwBHYFvco8CPxOabA7FnpvoRzhMotrT1CPF8cZLk1J
         j8LVrABS979ClVeIZ53Qf/6bmXWhYTYsjPS0UwIp/2SbGtFUOJq6DjSpIuXRcwUycwUr
         rE9bGa9b/tfosy+FvLD091jE1dcbGshhveL21v2WXj4EKpLca0hTZTHtQdAU55KnsQ0y
         KMaQ==
X-Gm-Message-State: AOJu0YzentXbcOCO3y2HSmDEsi1+HYFASAQ4LOR5TNRBE2HtPk9TJKt+
	SQ37gjlqnMYQPQv3SoCuqCS7I1hODMb6igUlw1glGR4HD3NL7Qcm7nJc
X-Gm-Gg: Acq92OGvFb0FDiz2saQ/VhC3gvtcabITZE1xXvQE7o93e1G7MKKv9FXv5NFLnpnkPZ/
	eD51paKBjZPe67WmX7smsbPspgaXpScyiy8WejsFGKjlm+6zx5ap1iLw++iw7VL1d3ZijMdg2Go
	zR/IF17nUEcEMX0CZaxcX5NboBGH4oo3WYcbCwG6s5boP47FDpn8Ix/l1WHNATPly1K98dpIpny
	UFkSSVe4ucyjfIHoRO5FcKxk/fpTtMLuCyGYt7v4KcyottqlAMn/T8XmFjuAwZS0wRpLaokEI/Y
	7sZi+4Qm1g+CWPRx626+n5qxIyTdj9IRTpRKd/Iah3Bs4xocBwoptUhrwL0UbAWTF/bqeIuJbsx
	LBy/4GNiXqVgQ2T93RnqShrgcdLFT9jFplHXUq9TZYgvfgjOQXr6wbZU3T7oBKgdqw+AGpSaywM
	vi4nkMAt4WMb3Yn+OS9r0=
X-Received: by 2002:a05:6000:4210:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-4515ce1c80fmr42638728f8f.22.1778574093227;
        Tue, 12 May 2026 01:21:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm30583821f8f.34.2026.05.12.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:21:31 -0700 (PDT)
Date: Tue, 12 May 2026 11:21:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>
Subject: Re: [bug report] bootconfig: init: Allow admin to use bootconfig for
 kernel command line
Message-ID: <agLjCNiyupwfp3NI@stanley.mountain>
References: <af4YTUrDM-ciyoa-@stanley.mountain>
 <20260512091638.8b95253ab022d7dabf473465@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512091638.8b95253ab022d7dabf473465@kernel.org>

On Tue, May 12, 2026 at 09:16:38AM +0900, Masami Hiramatsu wrote:
> Hi Dan,
> 
> Thanks for reporting. A similar problem is pointed by Sashiko [1].
> 
> [1] https://sashiko.dev/#/patchset/20260508-bootconfig_using_tools-v1-0-1132219aa773%40debian.org
> 
> On Fri, 8 May 2026 20:07:25 +0300
> Dan Carpenter <error27@gmail.com> wrote:
> 
> > Hello Masami Hiramatsu,
> > 
> > Commit 51887d03aca1 ("bootconfig: init: Allow admin to use bootconfig
> > for kernel command line") from Jan 11, 2020 (linux-next), leads to
> > the following Smatch static checker warning:
> > 
> > 	init/main.c:368 xbc_snprint_cmdline()
> > 	use scnprintf() instead of snprintf()
> > 
> > init/main.c
> >     331 static int __init xbc_snprint_cmdline(char *buf, size_t size,
> >     332                                       struct xbc_node *root)
> >     333 {
> >     334         struct xbc_node *knode, *vnode;
> >     335         char *end = buf + size;
> >     336         const char *val, *q;
> >     337         int ret;
> >     338 
> >     339         xbc_node_for_each_key_value(root, knode, val) {
> >     340                 ret = xbc_node_compose_key_after(root, knode,
> >     341                                         xbc_namebuf, XBC_KEYLEN_MAX);
> >     342                 if (ret < 0)
> >     343                         return ret;
> >     344 
> >     345                 vnode = xbc_node_get_child(knode);
> >     346                 if (!vnode) {
> >     347                         ret = snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
> >     348                         if (ret < 0)
> >     349                                 return ret;
> >     350                         buf += ret;
> > 
> > In user space snprintf() can return negative, but in the kernel, no.
> > It returns the number of bytes (not counting the NUL terminator) which
> > would have been copied if there were enough space.  So maybe you want
> > to do something like:
> > 
> > 	remain = rest(buf, end);
> > 	ret = snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
> > 	if (ret >= remain)
> > 		return -ENOSPC;
> 
> Actually, we need to query the length of required buffer size if buf == NULL
> or the buffer size is not enough.
> 
> But as Sashiko pointed, I need to check it with UBSAN. (but I think,
> even if @buf is NULL, the @buf is char *, thus it is safe to add some
> value...)
> 

Sashiko says that pointer math on a NULL is undefined but we do it all
the time in the kernel...  When you are a the 800 pound gorilla, you can
ask compilers to implement features the way you want them to be.  :P

regards,
dan carpenter

