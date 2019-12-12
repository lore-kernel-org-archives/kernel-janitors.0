From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 13:18:39 +0000
Subject: Re: [PATCH net-next] wireguard: Using kfree_rcu() to simplify the code
Message-Id: <CAHmME9qjDkwXCF0Q=QNJwZ6Cs97Mbm=V13wA7+zf1PEyifQeZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212120055.129801-1-weiyongjun1@huawei.com>
In-Reply-To: <20191212120055.129801-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Wei,

On Thu, Dec 12, 2019 at 1:03 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> The callback function of call_rcu() just calls a kfree(), so we
> can use kfree_rcu() instead of call_rcu() + callback function.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

I've queued this up as:
https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id-defeb5872878fe2fffb83664c02bd104fb1a52
I'll submit this to net-next next week as part of a cleanup series I'm
preparing.

In case you're curious, this originally was call_rcu_bh, as there was
no kfree_rcu_bh function. Since the _bh functions got unified a few
releases ago, this was changed to just a simple call_rcu, but
apparently missed the optimization you've done here using kfree_rcu.
So thanks for the patch.

Regards,
Jason
