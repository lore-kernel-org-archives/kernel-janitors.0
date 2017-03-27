From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 27 Mar 2017 02:19:39 +0000
Subject: Re: [PATCH v2] kprobes: cleanup _kprobe_addr()
Message-Id: <20170327111939.99484c418a641cb33cec20f5@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323091516.1a41f01703629a0c756d0f94@kernel.org>
        <20170324095033.GA15884@mwanda>
In-Reply-To: <20170324095033.GA15884@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 24 Mar 2017 12:50:34 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The important bit here is that at the end of the function we know that
> since "addr" isn't be NULL, it means we don't need to test
> "addr + offset" for NULL.
> 
> The NULL test generates a static checker warning because often something
> else is intended.  For example, a common bug looks like:
> 
> 	addr = strchr(buf, ':') + 1;
> 	if (addr) {
> 
> In that example, we intended to test the return of strchr() instead of
> "strchr() + 1".
> 
> Techinically, with these static checker warnings you could worry about
> the addition wrapping but the NULL check wouldn't prevent "addr" from
> pointing to some other invalid memory outside the text area.  Also
> pointer wrapping is undefined behavior in C.
> 

Looks good to me :)

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: more cleanups and changelog
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index d733479a10ee..ad30b5e22bda 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1395,7 +1395,7 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  			const char *symbol_name, unsigned int offset)
>  {
>  	if ((symbol_name && addr) || (!symbol_name && !addr))
> -		goto invalid;
> +		return ERR_PTR(-EINVAL);
>  
>  	if (symbol_name) {
>  		kprobe_lookup_name(symbol_name, addr);
> @@ -1403,12 +1403,7 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
>  			return ERR_PTR(-ENOENT);
>  	}
>  
> -	addr = (kprobe_opcode_t *)(((char *)addr) + offset);
> -	if (addr)
> -		return addr;
> -
> -invalid:
> -	return ERR_PTR(-EINVAL);
> +	return (kprobe_opcode_t *)(((char *)addr) + offset);
>  }
>  
>  static kprobe_opcode_t *kprobe_addr(struct kprobe *p)


-- 
Masami Hiramatsu <mhiramat@kernel.org>
