From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Oct 2019 13:15:48 +0000
Subject: Re: tcp: Checking a kmemdup() call in tcp_time_wait()
Message-Id: <CANn89i+WzeMhCysz7QngWM7iMMv1GAuzVez0Gviiud5MZoKO-w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de> <124b41aa-7ba5-f00c-ab73-cb8e6a2ae75f@gmail.com>
 <fc39488c-f874-5d85-3200-60001e6bda52@web.de> <0984a481-f5eb-4346-fb98-718174c55e36@gmail.com>
 <248c2ca6-0c27-dc62-6d20-49c87f0af15f@web.de>
In-Reply-To: <248c2ca6-0c27-dc62-6d20-49c87f0af15f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

On Mon, Oct 14, 2019 at 5:51 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/tcp_minisocks.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n306
> >>>> https://elixir.bootlin.com/linux/v5.4-rc2/source/net/ipv4/tcp_minisocks.c#L306
> …
>
> >> Can an other error reporting approach be nicer here?
> >
> > There is no error reported if kmemdup() has failed.
>
> How do data from the Linux allocation failure report fit to this information?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=4f5cafb5cb8471e54afdc9054d973535614f7675#n878
>

This is coding style for newly submitted code.

We do not refactor code to the latest coding style, this would cost a lot.

Especially TCP stack that is quite often changed.

>
> > timewait is best effort.
>
> How do you think about to return an error code like “-ENOMEM” at this place?

tcp_time_wait() is void, the caller won't care. I told you time_wait
is best effort.

What is the problem you want to solve _exactly_ ?

Have you seen a real issue, or should you augment your static analyser
to not complain on :

ptr = kmemdup();
BUG_ON(<any condition>);

(<any condition> being different than (ptr == NULL))

I believe we have enough real bugs to fix.
I would prefer to not spend time arguing for every single BUG() or BUG_ON().

Thank you.
