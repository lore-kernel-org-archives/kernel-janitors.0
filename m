From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 20 Aug 2012 09:04:59 +0000
Subject: Re: [alsa-devel] [PATCH 0/10] fix error return code
Message-Id: <s5hobm6q6h0.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345359780-18647-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345359780-18647-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Sun, 19 Aug 2012 09:02:51 +0200,
Julia Lawall wrote:
> 
> These patches fix cases where the return code appears to be unintentially
> nonnegative.

The patch 10/10 seems missing.  Or are all 9 patches?  The patch
number suddenly changes to X/9 from 4.

In anyway, the patches 3, 5, 6, 7, 8 and 9 are applied.
I leave patches 1, 2 and 4 to Mark.


thanks,

Takashi

> 
> The complete semantic match that finds the problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @ok exists@
> identifier f,ret,i;
> expression e;
> constant c;
> @@
> 
> f(...) {
> <+...
> (
> return -c@i;
> |
> ret = -c@i;
> ... when != ret = e
> return ret;
> |
> if (ret < 0) { ... return ret; }
> )
> ...+> }
> 
> @r exists@
> identifier ret,l,ok.f;
> expression e1,e2,e3;
> statement S;
> position p1,p2,p3;
> @@
> 
> f(...) {
> ... when any
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> (
>  if (<+... ret = e3 ...+>) S
> |
>  if (<+... &ret ...+>) S
> |
> if@p2(...)
>  {
>   ... when != ret = e2
>       when forall
>  return@p3 ret;
> }
> )
> ... when any
> }
> 
> @bad exists@
> position r.p1,r.p2;
> statement S1,S2;
> identifier r.ret;
> expression e1;
> @@
> 
> (
> if@p1 (\(ret < 0\|ret != 0\)) S1
> |
> ret@p1 = 0
> )
> ... when any
> ret = e1
> ... when any
> if@p2(...) S2
> 
> @bad2@
> position r.p1,r.p2;
> identifier r.ret;
> expression e1;
> statement S2;
> @@
> 
> ret@p1 = 0
> ... when != if (...) { ... ret = e1 ... return ret; }
>     when any
> if@p2(...) S2
> 
> 
> @script:python depends on !bad && !bad2@
> p1 << r.p1;
> p2 << r.p2;
> p3 << r.p3;
> @@
> 
> cocci.print_main("",p1)
> cocci.print_secs("",p2)
> cocci.print_secs("",p3)
> // </smpl>
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
