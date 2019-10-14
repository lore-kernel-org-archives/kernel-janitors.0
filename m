From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 14 Oct 2019 17:19:27 +0000
Subject: Re: tcp: Checking a kmemdup() call in tcp_time_wait()
Message-Id: <a31967be-b59e-0da8-1119-633c4927a904@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de>
 <124b41aa-7ba5-f00c-ab73-cb8e6a2ae75f@gmail.com>
 <fc39488c-f874-5d85-3200-60001e6bda52@web.de>
 <0984a481-f5eb-4346-fb98-718174c55e36@gmail.com>
 <248c2ca6-0c27-dc62-6d20-49c87f0af15f@web.de>
 <CANn89i+WzeMhCysz7QngWM7iMMv1GAuzVez0Gviiud5MZoKO-w@mail.gmail.com>
In-Reply-To: <CANn89i+WzeMhCysz7QngWM7iMMv1GAuzVez0Gviiud5MZoKO-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Eric Dumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>

> This is coding style for newly submitted code.
>
> We do not refactor code to the latest coding style, this would cost a lot.

Were any update candidates left over also in this function implementation?


>> How do you think about to return an error code like “-ENOMEM” at this place?
>
> tcp_time_wait() is void,

Can the function return type be eventually changed?


> the caller won't care.

Will any other software developers (and source code reviewers) start to
care more for unchecked function calls?


> I told you time_wait is best effort.

Can this approach still be improved another bit?


> What is the problem you want to solve _exactly_ ?

I became curious if the software situation can be adjusted around
a possibly ignored return value from a call of a function like kmemdup().

Regards,
Markus
