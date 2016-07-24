From: walter harms <wharms@bfs.de>
Date: Sun, 24 Jul 2016 13:17:51 +0000
Subject: Re: is_err checking
Message-Id: <5794BFFF.7000408@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1607231653440.3490@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607231653440.3490@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 23.07.2016 16:56, schrieb Julia Lawall:
> Code like the following looks a bit clunky to me:
> 
> if (IS_ERR(data->clk) && PTR_ERR(data->clk) != -EPROBE_DEFER)
> 
> Is there any reason not to always use eg
> 
> data->clk = ERR_PTR(-EPROBE_DEFER)
> 
> Code of the latter form is a bit more popular.  Perhaps one could want
> something like:
> 
> IS_ERR_VALUE(data->clk, -EPROBE_DEFER)
> 
> but IS_ERR_VALUE is laready used for something else.
> 

note: i do not like hiding behind #defines

did you actually see code like IS_ERR_VALUE(data->clk, -EPROBE_DEFER)
in the current kernel ?
because there is no second argument:

#define IS_ERR_VALUE(x) unlikely((x) >= (unsigned long)-MAX_ERRNO)

or is this a misunderstanding ?

re,
 wh

> julia
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
