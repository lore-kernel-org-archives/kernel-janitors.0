From: Song Liu <liu.song.a23@gmail.com>
Date: Thu, 22 Aug 2019 21:12:19 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_net=2Fipv4=2Ftcp=5Fbpf=3A_Delete_an_unnecessary_?= =?UTF-8?Q?check_befor
Message-Id: <CAPhsuW5c7xn9hW70C3BV3GqysEzScJfpw11yRSMx39T5+Hxd5Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <25ca9c48-1ac9-daa1-8472-0a53e4beed6a@web.de>
In-Reply-To: <25ca9c48-1ac9-daa1-8472-0a53e4beed6a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 10:19 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Aug 2019 18:20:42 +0200
>
> The consume_skb() function performs also input parameter validation.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Song Liu <songliubraving@fb.com>
