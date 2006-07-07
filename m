From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 07 Jul 2006 12:33:39 +0000
Subject: Re: [KJ] request_region
Message-Id: <9a8748490607070533p370bbeb3x58f5d0f20fb60d64@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060707141257.GA10920@chello.nl>
In-Reply-To: <20060707141257.GA10920@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/07/06, Richard <h.vanberkum@chello.nl> wrote:
> Some files scan a IO range for request_region and that same range is released when the
> module unloads. Is it necessary to check those functions on return values?
>
Yes. request_region() can fail, and if it does the code needs to deal
with the error in a sane way.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
