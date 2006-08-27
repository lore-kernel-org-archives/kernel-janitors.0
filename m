From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sun, 27 Aug 2006 23:46:11 +0000
Subject: Re: [KJ] Item to remove from TODO list
Message-Id: <9a8748490608271646y2ada47dfo5e5a382b5cb7a9a9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44F1EEA2.3090602@gmail.com>
In-Reply-To: <44F1EEA2.3090602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28/08/06, acme@conectiva.com.br <acme@conectiva.com.br> wrote:
> Quoting Greg KH <greg@kroah.com>:
>
> > On Sun, Aug 27, 2006 at 09:40:04PM +0200, maximilian attems wrote:
> >> On Sun, Aug 27, 2006 at 03:12:34PM -0400, Jim Nelson wrote:
> >> >
> >> > Just finished checking the MOD_INC/DEC_USE_COUNT item in the TODO
> >> list - there
> >> > are no more code paths that use it, and only a couple of commented-out
> >> > references, comments and changelogs.
> >> >
> >> > It probably should be removed from the TODO list.
> >> >
> >> > Jim
> >>
> >> one shouldn't remove too early,
> >> as some items tend to show up in newly merged code ;)
> >
> > It would be hard to have it show up in new code, as it would not be able
> > to compile if it were to be present in new stuff. :)
> >
> > Yes, I think this can be removed from the list.
>
> Indeed :-)
>

A patch to remove the commented out references might also be nice.
might as well kill the thing completely :)

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
