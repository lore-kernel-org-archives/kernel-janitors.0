From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 21 Mar 2017 22:55:38 +0000
Subject: Re: [PATCH] kprobes: Remove an unneeded condition
Message-Id: <20170322075538.e441b607af0f041854aa8db3@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170321204348.GD22118@mwanda>
In-Reply-To: <20170321204348.GD22118@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 21 Mar 2017 23:43:48 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We know that "addr" is non-NULL here so there is no need to check if
> "addr + offset" is NULL.

What about "UINT_MAX - addr + 1 = offset" case on 32bit arch ? :)

Thanks,

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index d733479a10ee..88617178a63e 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1403,9 +1403,7 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  			return ERR_PTR(-ENOENT);
>  	}
>  
> -	addr = (kprobe_opcode_t *)(((char *)addr) + offset);
> -	if (addr)
> -		return addr;
> +	return (kprobe_opcode_t *)(((char *)addr) + offset);
>  
>  invalid:
>  	return ERR_PTR(-EINVAL);


-- 
Masami Hiramatsu <mhiramat@kernel.org>
