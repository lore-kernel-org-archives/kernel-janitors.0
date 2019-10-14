From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 14 Oct 2019 12:33:14 +0000
Subject: Re: tcp: Checking a kmemdup() call in tcp_time_wait()
Message-Id: <0984a481-f5eb-4346-fb98-718174c55e36@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de>
 <124b41aa-7ba5-f00c-ab73-cb8e6a2ae75f@gmail.com>
 <fc39488c-f874-5d85-3200-60001e6bda52@web.de>
In-Reply-To: <fc39488c-f874-5d85-3200-60001e6bda52@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>



On 10/13/19 11:51 PM, Markus Elfring wrote:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/tcp_minisocks.c?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n306
>>> https://elixir.bootlin.com/linux/v5.4-rc2/source/net/ipv4/tcp_minisocks.c#L306
> …
>> Presumably the BUG would trigger if a really disturbing bug happened.
> 
> How “buggy” is this place if the function call “kmemdup” failed?

It is not buggy. The BUG will not trigger.

BUG_ON(tcptw->tw_md5_key && !tcp_alloc_md5sig_pool());

This would be different if we had instead :

BUG_ON(!tcptw->tw_md5_key && !tcp_alloc_md5sig_pool());

> 
> Can an other error reporting approach be nicer here?

There is no error reported if kmemdup() has failed.

timewait is best effort.
