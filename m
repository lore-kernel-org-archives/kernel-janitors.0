Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD22260C
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 05:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737350841; cv=none; b=jaWECmGUYrQFn121KjC8G7SkHSURWlZy5sEs3g6AlKehPnsiG7SoGnuAdCTyFEP+bPJdUuXJ/jkcx75Z37Sf5B3qtPtTQUU2ZtdWqEsGCFhlNvNF2G/wiSXkE+Pws8R3zMuyXgw/DDRxp4ZsyjLhJRK+rs2vz916ARR/NFYxmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737350841; c=relaxed/simple;
	bh=kYdfModrtUH7kqp5cYxKO530PcrCY+Vttwn+dDxi1kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKLGKTXMkRYma/5hVr6cuZ7NWCbFwCOiYgYO91faR1qByynkaKaGW2EGmq61k38s0739WN0WzpaEL0sSgxRiGmjnyXgVBn4T0a0pCB61Glb90Ji1SuivvGbNxBL1QM8hpZIRYm6Ru0lp7kqFRXZ9b3qZjCz5Ry65L2mezMYDZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKrCEGG+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKrCEGG+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3323776f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jan 2025 21:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737350837; x=1737955637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNjzMtYRIPwyNV82IWd0UDyVPvJbtG7zW7b9AEaKacM=;
        b=IKrCEGG+ZZ4TJd+K/BW9yvVLTl954u9PTc5Oa5WY4E0igHJq5DV16xROl37UWbdIdM
         7usPQYYJku6t2FQ/1buVx05gwFiWaTKVNZ/WVfUSD0af+CvRIgbBB2t4uOTPNwZMDbNe
         BIqIyBBJ82nVq7jsd0RYNv8HqhB/ff0cimXhDeMfnPGVvPcJLzgdJuQgnHtJ9Jt7Mwqi
         7O/jmgPknc0d6/23J4dt9W6yc8PdrJjfriPTLnnQODa4aOOhA5hxkS2NuueiAwnalbAU
         mJc9MSnJFJ2Ugh57t1S+Hj3XmfIISaESLUrK+zQW8g4KHD3GRsI6MCAwn6PUMn7N5KOg
         zJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737350837; x=1737955637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNjzMtYRIPwyNV82IWd0UDyVPvJbtG7zW7b9AEaKacM=;
        b=hhWdm73zDbCxmRzvPCyAoIxqnaaB6Pj8FwLfN8VYFf9kzcQbsHyI1W8xSMBoZ0J8Bg
         2clZEbicjArhtKHOwszUnCXrkhxKDK+lLRP/FK30RqozZBwj1Gqz+dKf2+HPpvk1V3u1
         QM9T4wWXkuiufs1sfjod/LJZLKAYZ+UTZTRKAUy7pY7mCrUwe+SqoT5fgKZ1fqpAlSXl
         AkyHAOlN6X8/6c34ZOr5f0hfSd7fciCwggub3FYNvZWr3Z8RSpoQO3qNognu2j/lQOh4
         6jhzBgFuzkogwg59Da0stczyecZqnQ2lAymFT9dHxQOGaL/VDZNMciQzhZhvDUv5h5w/
         z4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnLSpazmx5nxQWbKxsQGyFopOT8eKDKuku6kyZ6tJHbCX5YD8vPJvXF4AvMOFV2MXIX+X/EKk5YgUbdb7Nkmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx44W1DzxODN2taf3z9HmsxeBrkvfCXTCvs31MeNSmi0pdjhDy
	eYxK0+np3yogFNmUqnZx0aNl84t20zdkLUQ+oHlmS5Vji0UQYtj9tgLJG4Z9mu0=
X-Gm-Gg: ASbGncv2sREgDu229Aw/EcNDCcmq5cV3mJ4xFqd5UdowMxod3Eom/rvBpMREmEbpP7H
	ZcVFBLUap/RtvGo+wVMoDPrZS6yQ06Gh+ewJnOvRRfh/yXXp7P2iT55KaNG8BO+qXg1nbwVwW7R
	CvmgiHJcp8xSeyjSr+NZ7IsXCNkoYBjcixv+FVmJxhNnhSVRldfn6SXXO6uuuWItgZwEvomKI4K
	cu+c1sUERGKa9LlZEjQnRYjNGLc1RSPUaRu1efWcrXeqswbdA3gR8CQ4ZpWB8MiBM67tmQ8TbQ=
X-Google-Smtp-Source: AGHT+IHZe/UsNEJMLwvYuI1BTsd426drjUsFuwxbgvmyN8Fzq23Fhqn7pTN3C3RAdUAkxLQf4v0KPA==
X-Received: by 2002:a5d:59ad:0:b0:385:f560:7924 with SMTP id ffacd0b85a97d-38bf5678104mr7860427f8f.4.1737350836889;
        Sun, 19 Jan 2025 21:27:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32755cesm9247031f8f.78.2025.01.19.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 21:27:16 -0800 (PST)
Date: Mon, 20 Jan 2025 08:27:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel-janitors@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <4ec77bfb-16eb-4fa9-b486-8d2db47577e4@stanley.mountain>
References: <9344a80d-4e90-4190-b973-e3347caae87f@orange.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9344a80d-4e90-4190-b973-e3347caae87f@orange.com>

Thanks Alexandre for the bug report.  It looks like you're CC'ing a
bunch of networking people because you're debugging something networking
related but the actual bug is in read_kcore_iter() so let's CC Lorenzo
instead.

The read_kcore_iter() code needs to be able to handle zero returns.
The comments in vread_iter() say that a zero will be returned in the
following situation.

 * If [addr...addr+count) doesn't includes any intersects with alive
 * vm_struct area, returns 0. @buf should be kernel's buffer.

I don't know the code well enough to say if the -EFAULT and goto out that
you wrote as a quick test is correct:

> +                               res = vread_iter(iter, src, left);
> +                               if (!res) {
> +                                       ret = -EFAULT;
> +                                       goto out;
> +                               }

Or if we should just break:

		res = vread_iter(iter, src, left);
		if (res == 0)
			break;
		read += res;
		if (read == tsz)
			break;

Either way, Lorenzo probably knows the answer so this will be an
easy fix thanks to your excelent bug report.  ;)

regards,
dan carpenter


On Fri, Jan 17, 2025 at 01:02:03PM +0100, Alexandre Ferrieux wrote:
> Hi,
> 
> Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
> possible to disassemble the running kernel from gdb through /proc/kcore.
> 
> More precisely:
> 
>  - look up a function in /proc/kallsyms => 0xADDRESS
>  - tell gdb to "core /proc/kcore"
>  - tell gdb to "disass 0xADDRESS,+LENGTH" (no need for a symbol table)
> 
>  * if the function is within the main kernel text, it is okay
>  * if the function is within a module's text, an infinite loop happens:
> 
> 
> Example:
> 
>  # egrep -w ice_process_skb_fields\|ksys_write /proc/kallsyms
>  ffffffffaf296c80 T ksys_write
>  ffffffffc0b67180 t ice_process_skb_fields       [ice]
> 
>  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffaf296c80,+256" -ex quit
>  ...
>  Dump of assembler code from 0xffffffffaf296c80 to 0xffffffffaf296d80:
>    ...
>  End of assembler dump.
> 
>  # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffc0b67180,+256" -ex quit
>  ...
>  Dump of assembler code from 0xffffffffc0b67180 to 0xffffffffc0b67280:
>  (***NOTHING***)
>  ^C <= inefficient, need kill -9
> 
> 
> Ftrace (see below) shows in this case read_kcore_iter() calls vread_iter() in an
> infinite loop:
> 
>         while (true) {
>                 read += vread_iter(iter, src, left);
>                 if (read == tsz)
>                         break;
> 
>                 src += read;
>                 left -= read;
> 
>                 if (fault_in_iov_iter_writeable(iter, left)) {
>                         ret = -EFAULT;
>                         goto out;
>                 }
>         }
> 
> As it turns out, in the offending situation, vread_iter() keeps returning 0,
> with "read" staying at its initial value of 0, and "tsz" nonzero. As a
> consequence, "src" stays stuck in a place where vread_iter() fails.
> 
> A cursory "git blame" shows that this interplay (vread_iter() legitimately
> returning zero, and read_kcore_iter() *not* testing it) has been there from
> quite some time. So, while this is arguably fragile, possibly the new situation
> lies in the actual memory layout that triggers the failing path.
> 
> To add weigh to this hypothesis, I forced "breaking out" of the loop in that
> case, see patch below, but while this cures the loop, all such attempts (on
> module-text addresses) lead to a zero return from vread_iter(), as though some
> internal (in-kernel) permission barrier prevented access to those areas.
> 
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index e376f48c4b8b..8c5f29240542 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -531,7 +531,13 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct
> iov_iter *iter)
>                          * again until we are done.
>                          */
>                         while (true) {
> -                               read += vread_iter(iter, src, left);
> +                               long res;
> +                               res = vread_iter(iter, src, left);
> +                               if (!res) {
> +                                       ret = -EFAULT;
> +                                       goto out;
> +                               }
> +                               read += res;
>                                 if (read == tsz)
>                                         break;
> 
> 
> 
> Thanks for any insight, as this completely breaks debugging the running kernel
> in 6.13.
> 
> -Alex
> 
> 
> ------------
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 0/0   #P:48
> #
> #           TASK-PID     CPU#     TIMESTAMP  FUNCTION
> #              | |         |         |         |
>            <...>-3304    [045]    487.295283: kprobe_read_kcore_iter:
> (read_kcore_iter+0x4/0xae0) pos=0x7fffc0b6b000
>            <...>-3304    [045]    487.295298: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295326: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295329: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295338: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295339: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295345: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295347: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
>            <...>-3304    [045]    487.295352: kretprobe_vread_iter:
> (read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
>            <...>-3304    [045]    487.295353: kprobe_vread_iter:
> (vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
> ...
> 
> 
> 
