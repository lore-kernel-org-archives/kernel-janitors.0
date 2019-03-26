From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 26 Mar 2019 07:19:16 +0000
Subject: Re: [v5] coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1903260818460.2463@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <CAK7LNASzd=bL1H34w-E_UD9x6w2=ObyS+EPDZ_jrvfV+ncw-yA@mail.gmail.com>
 <1691b160-5558-d4c3-afed-5773e115c5aa@web.de>
 <CAK7LNASVRbroW9_j1Kda3azHb6PzD3WyVAsKe0HfD1ri0RFPOQ@mail.gmail.com>
In-Reply-To: <CAK7LNASVRbroW9_j1Kda3azHb6PzD3WyVAsKe0HfD1ri0RFPOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cocci@systeme.lip6.fr, Markus Elfring <Markus.Elfring@web.de>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>



On Tue, 26 Mar 2019, Masahiro Yamada wrote:

> On Sun, Mar 24, 2019 at 1:19 AM Markus Elfring <Markus.Elfring@web.de> wr=
ote:
> >
> > > Applied to linux-kbuild.
> >
> > A questionable development version was integrated for this SmPL script.
>
>
> Sorry for my bad job.
>
> I usually use LKML patchwork to find patches.
>
> When I searched "Wen Yang", v6 did not show up for some reasons.
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D&submitter"=
638&state=3D*&q=3D&archive=3D&delegate>
> So, I just thought v5 was the latest one
> and I was completely missing the context.

I think it is a minor detail that will have no impact in practice.

julia


>
>
> Apology.
>
> Masahiro
>
>
>
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/scripts/coccinelle/free/put_device.cocci?id=DA9cfb87a44da61f2403c431291=
6befcb6b6d7e8
> >
> > https://lore.kernel.org/cocci/201902191014156680299@zte.com.cn/
> >
> >
> > Now I am curious on how such a source code analysis approach will be
> > improved further.
> > Which changes will get the desired acceptance?
> >
> > https://lore.kernel.org/patchwork/patch/1053979/
> > https://lore.kernel.org/lkml/1553321671-27749-1-git-send-email-wen.yang=
99@zte.com.cn/
> > https://systeme.lip6.fr/pipermail/cocci/2019-March/005679.html
> >
> > Regards,
> > Markus
> --
> Best Regards
> Masahiro Yamada
>
