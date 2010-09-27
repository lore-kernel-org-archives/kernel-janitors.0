From: Yehuda Sadeh Weinraub <yehuda@hq.newdream.net>
Date: Mon, 27 Sep 2010 17:47:21 +0000
Subject: Re: [PATCH] block: rbd: fixed may leaks
Message-Id: <AANLkTinN_o2O1amBvsM7nFp_ozp13zRPZm=RNH5cp+DV@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491578-32580-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285491578-32580-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 26, 2010 at 1:59 AM, Vasiliy Kulikov <segooon@gmail.com> wrote:
> rbd_client_create() doesn't free rbdc, this leads to many leaks.
>
> seg_len in rbd_do_op() is unsigned, so (seg_len < 0) makes no sense.
> Also if fixed check fails then seg_name is leaked.
> ---

Pushed to our unstable tree. Added missing signed-off by.

Thanks,
Yehuda
