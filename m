From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 01:05:46 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <82faac5b0602091705yc97b5bbxf3cdc6d1b616f2e4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/10/06, Adrian Bunk <bunk@stusta.de> wrote:

> What is the purpose of all this?
>

Good question really,

Me I work with very small Uc's so I habitually optimize everything. I
guess It's not such a good idea when working with the linux kernel.

I think however understanding what is going on is fairly important,
especially for the less expert/experienced people on the list. (Like
me). So while a conversation like this will probably not benefit the
kernel, it may benefit the people involved.

> With modern compilers, the general rule is to write readable C code and
> let the compiler do the rest.
>
> Exceptions could be in real hot paths, but even in such cases there's
> the problem that tricky code performing better with today's compilers
> might perform worse with future compilers (similar to the goto tricks
> people used in the past to circumvent some compiler limitations).

So we should concentrate our efforts on readability/correctness not
optimisations
Sounds good to me.

Darren J.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
