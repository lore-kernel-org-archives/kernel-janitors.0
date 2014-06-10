From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Jun 2014 08:06:08 +0000
Subject: Re: [Q] Which tree should we work agains?
Message-Id: <20140610080608.GI5500@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <006601cf8478$52fb3310$f8f19930$@gmail.com>
In-Reply-To: <006601cf8478$52fb3310$f8f19930$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jun 10, 2014 at 02:50:45PM +0800, Yi Li wrote:
> Hi Dan,
> I=E2=80=99m a kernel newbie, and sorry for bother you in advanced.
> >From your this email: http://article.gmane.org/gmane.linux.kernel.janito=
rs/30739,
> you have pointed out we should work against linux-next tree. is it true f=
or all of us?

Pretty much, unless you are fixing an important bug and then you work
on the latest Linus tree.

>=20
> >From this site: https://code.google.com/p/kernel-janitors/, I got this s=
tatements:
> "Q: What version should I be patching against?=20
> A: Latest "linus" (2.6.x-rcY from kernel.org). Be sure to check -mm and -=
kj trees to see=20
> 	if someone already did that. "
> For -mm tree, is it means the linux-mm tree? after reading this wiki: htt=
p://en.wikipedia.org/wiki/Mm_tree,
> it seems linux-next is the substitution for linux-mm tree's "new features=
" functionality.
> For the -kj tree, I event can't find it from https://git.kernel.org/cgit =
website, only found it at here: http://cba.si/kj/
> is it outdated, and un-useful?

Yes.  Those are all outdated.

>=20
> So, in one word, could you kindly point me out which tree I should work a=
gainst ?Or just kindly give me the links for document.
> Thanks for your help in advanced.

Btw, one constant problem that we have had in kernel janitors is that
the TODO list gets outdated.  I have started tagging my emails if I want
to record something in a TODO list.

https://lkml.org/lkml/2014/5/28/184
http://lists.linuxfoundation.org/pipermail/ksummit-discuss/2014-May/000690.=
html

I can do a:  `grepmail ^TODO-list inbox` to see my todo list.  Anyone
can add stuff to it.

Eventually, I'm hoping someone will put the TODO list on a webpage, but
for now if you want to subscribe to driver-devel then that's where there
are the most TODO items.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
