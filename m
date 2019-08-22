From: Song Liu <liu.song.a23@gmail.com>
Date: Thu, 22 Aug 2019 21:13:10 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_net=2Fcore=2Fskmsg=3A_Delete_an_unnecessary_ch?= =?UTF-8?Q?eck_before_th
Message-Id: <CAPhsuW4aH_kPc5NnWXQp5jgdvOZjq+eDWpUQGBgyZ9USEA6LKA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2755f638-7846-91f2-74f4-61031f3e34c8@web.de>
In-Reply-To: <2755f638-7846-91f2-74f4-61031f3e34c8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, John Fastabend <john.fastabend@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 10:18 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Aug 2019 18:00:40 +0200
>
> The consume_skb() function performs also input parameter validation.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Song Liu <songliubraving@fb.com>
