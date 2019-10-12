From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 14:51:48 +0000
Subject: tcp: Checking a kmemdup() call in tcp_time_wait()
Message-Id: <a219235e-bad5-8a9d-0f3e-c05d5cb11df1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “tcp_time_wait” contains also a call of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/tcp_minisocks.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n306
https://elixir.bootlin.com/linux/v5.4-rc2/source/net/ipv4/tcp_minisocks.c#L306

* Do you find the usage of the macro call “BUG_ON” still appropriate at this place?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n4080

* Is there a need to adjust the error handling here?

Regards,
Markus
