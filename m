From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Tue, 18 Jan 2005 17:34:37 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41ED48AD.6090703@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox escreveu:
> On Tue, Jan 18, 2005 at 03:03:37AM -0200, Arnaldo Carvalho de Melo wrote:
> 
>>I suggest not removing the "finished stuff", just move them to a "finished
>>as of 2.6.something", as these cases may well come back in the future, say
>>when something big like infiniband gets merged it can come packed with
>>those "finished" things 8)
> 
> 
> Funny you should mention that.
> 
> drivers/infiniband/ulp/ipoib/ipoib_ib.c:                yield();
> drivers/infiniband/ulp/ipoib/ipoib_ib.c:                yield();
> 
> *SLAP*.


See? 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
