From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 11 Nov 2020 01:45:01 +0000
Subject: Re: [PATCH net v5] net: Update window_clamp if SOCK_RCVBUF is set
Message-Id: <20201110174501.703879e8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANn89i+ABLMJTEKat=9=qujNwe0BFavphzqYc1CQGtrdkwUnXg@mail.gmail.com>
        <1604967391-123737-1-git-send-email-wenan.mao@linux.alibaba.com>
        <CANn89iL6UW9mG6hW7f3Yv+32Pe_i9F-5cQhfo2uV68wdcgSuZA@mail.gmail.com>
In-Reply-To: <CANn89iL6UW9mG6hW7f3Yv+32Pe_i9F-5cQhfo2uV68wdcgSuZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>
Cc: Mao Wenan <wenan.mao@linux.alibaba.com>, David Miller <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 10 Nov 2020 08:32:52 +0100 Eric Dumazet wrote:
> On Tue, Nov 10, 2020 at 1:16 AM Mao Wenan <wenan.mao@linux.alibaba.com> wrote:
> > When net.ipv4.tcp_syncookies=1 and syn flood is happened,
> > cookie_v4_check or cookie_v6_check tries to redo what
> > tcp_v4_send_synack or tcp_v6_send_synack did,
> > rsk_window_clamp will be changed if SOCK_RCVBUF is set,
> > which will make rcv_wscale is different, the client
> > still operates with initial window scale and can overshot
> > granted window, the client use the initial scale but local
> > server use new scale to advertise window value, and session
> > work abnormally.
> >
> > Fixes: e88c64f0a425 ("tcp: allow effective reduction of TCP's rcv-buffer via setsockopt")
> > Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>  
> 
> Signed-off-by: Eric Dumazet <edumazet@google.com>

Applied, thanks!
