From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 17 Feb 2004 17:24:21 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check kme
Message-Id: <20040217092421.5a7843a8.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 17 Feb 2004 07:54:37 -0300 Arnaldo Carvalho de Melo <acme@conectiva.com.br> wrote:

| Em Tue, Feb 17, 2004 at 11:09:12AM +0100, Walter Harms escreveu:
| > 
| > 
| > hi acme,
| > must free will be reached.
| >                if (!fn_hash_kmem)
| >                            return NULL;
| >                must_free=1;
| > 
| > lost tab in space :)
| 
| Errm... whistles... 8)
| 
| - Arnaldo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

So, Arnaldo, does this mean that you like this patch?

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
