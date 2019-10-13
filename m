From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 13 Oct 2019 19:45:53 +0000
Subject: Re: tcp: Checking a kmemdup() call in tcp_time_wait()
Message-Id: <124b41aa-7ba5-f00c-ab73-cb8e6a2ae75f@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de>
In-Reply-To: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>



On 10/12/19 7:51 AM, Markus Elfring wrote:
> Hello,
> 
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “tcp_time_wait” contains also a call of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/tcp_minisocks.c?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n306
> https://elixir.bootlin.com/linux/v5.4-rc2/source/net/ipv4/tcp_minisocks.c#L306
> 
> * Do you find the usage of the macro call “BUG_ON” still appropriate at this place?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n4080
> 
> * Is there a need to adjust the error handling here?

Presumably the BUG would trigger if a really disturbing bug happened.

There is no chance a timewait socket could be created with a MD5 key, 
if the established socket that is the 'parent' of the timewait
has not a MD5 context itself.

The parent socket only could have MD5 context if tcp_md5sig_pool_populated
could have been set to true.

Once tcp_md5sig_pool_populated is true it can never go back to false.

So the bug here would be that a socket  had a successful MD5 context,
and following tcp_alloc_md5sig_pool() would return false.

We can discuss of all BUG() in general, some people simply disable
all of them (cf CONFIG_BUG), but this particular one does not seem
specially bad to me, compared to others.
