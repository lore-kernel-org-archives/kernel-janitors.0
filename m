From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 26 Mar 2008 00:50:24 +0000
Subject: Re: useless variable initializations
Message-Id: <9a8748490803251750u68728f2cmf5ce439a39618d21@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803250951380.22289@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803250951380.22289@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 25/03/2008, Julia Lawall <julia@diku.dk> wrote:
> Is there any policy about useless variable intializations, such as:
>
>  struct foo *x = NULL;
>  ...
>  x = kmalloc(...);
>
>  where the original value of x is never used?
>
>
>  Another example is (fs/nfs/client.c):
>
>  struct rpc_clnt *clnt = NULL;
>  ...
>  clnt = rpc_create(&args);
>
>  This could actually be slightly misleading, because rpc_create returns
>  either a valid pointer or a value created with ERR_PTR, never NULL, so
>  NULL is not really in the set of reasonable values for clnt.
>
I've submitted a few cleanup patches in the past that removed such
obviously pointless initialization and they have generally been
accepted.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
