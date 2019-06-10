From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 10 Jun 2019 14:34:03 +0000
Subject: Re: [PATCH -next] packet: remove unused variable 'status' in __packet_lookup_frame_in_block
Message-Id: <CAF=yD-+g1bSGOubFUE8veZNvGiPy1oYsf+dFDd=hqXYD+k4g_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190610115831.175710-1-maowenan@huawei.com> <CAF=yD-JOCZHt6q3ArCqY5PMW1vP5ZmNkYMKUB14TrgU-X30cSQ@mail.gmail.com>
 <caf8d25f-60e2-a0c0-dc21-956ea32ee59a@huawei.com>
In-Reply-To: <caf8d25f-60e2-a0c0-dc21-956ea32ee59a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan <maowenan@huawei.com>
Cc: David Miller <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jun 10, 2019 at 10:03 AM maowenan <maowenan@huawei.com> wrote:
>
>
>
> On 2019/6/10 21:05, Willem de Bruijn wrote:
> > On Mon, Jun 10, 2019 at 8:17 AM Mao Wenan <maowenan@huawei.com> wrote:
> >>
> >> The variable 'status' in  __packet_lookup_frame_in_block() is never used since
> >> introduction in commit f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer
> >> implementation."), we can remove it.
> >> And when __packet_lookup_frame_in_block() calls prb_retire_current_block(),
> >> it can pass macro TP_STATUS_KERNEL instead of 0.
> >>
> >> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> >> ---

> >>         /* Ok, close the current block */
> >> -       prb_retire_current_block(pkc, po, 0);
> >> +       prb_retire_current_block(pkc, po, TP_STATUS_KERNEL);
> >
> > I don't think that 0 is intended to mean TP_STATUS_KERNEL here.
> >
> > prb_retire_current_block calls prb_close_block which sets status to
> >
> >   TP_STATUS_USER | stat
> >
> > where stat is 0 or TP_STATUS_BLK_TMO.
>
>
> #define TP_STATUS_KERNEL                      0
> #define TP_STATUS_BLK_TMO               (1 << 5)
>
> Actually, packet_current_rx_frame calls __packet_lookup_frame_in_block with status=TP_STATUS_KERNEL
> in original code.
>
> __packet_lookup_frame_in_block in this function, first is to check whether the currently active block
> has enough space for the packet, which means status of block should be TP_STATUS_KERNEL, then it calls
> prb_retire_current_block to retire this block.

I know. I mean that the status here is what is passed to userspace on
block retire.

It is not intended to be TP_STATUS_USER | TP_STATUS_KERNEL. That makes no sense.

> Since there needs some discussion about means of status, I can send v2 only removing the parameter status of
> __packet_lookup_frame_in_block?

Sounds good.
