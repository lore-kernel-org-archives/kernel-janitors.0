From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Sat, 02 Jun 2007 18:13:17 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <39e6f6c70706021113j71e6a488laa13b5b8cf1da308@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/2/07, Andi Drebes <lists-receive@programmierforen.de> wrote:
> >   some thoughts on how much of the "#if 0" stuff can be removed.
> > first, in a lot of cases, there's little you can do.  there will be
> > some code that has been commented out, with no indication as to why
> > that was done.
> ok, now I'm cautious with my comments because the discussion became
> quite emotional (the change of views between Matthew and you). However,
> I think that if there's no indication why the code was commented out and
> if even the maintainer doesn't know why, I think it is quite clear that the
> affected lines should be removed, because the collective memory of the
> community has forgotten why it was done. If nobody knows it, I think that
> nobody will ever use this code again.

And we have source control management these days, so I think this
specific cleanup case is not that contentious.

But please add a comment when somebody remembers why the #if 0 was put there :-)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
