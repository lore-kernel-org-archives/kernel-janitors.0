From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Tue, 17 Feb 2004 10:54:37 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check kme
Message-Id: <20040217105437.GE29263@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, Feb 17, 2004 at 11:09:12AM +0100, Walter Harms escreveu:
> 
> 
> hi acme,
> must free will be reached.
>                if (!fn_hash_kmem)
>                            return NULL;
>                must_free=1;
> 
> lost tab in space :)

Errm... whistles... 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
