From: Arik Nemtsov <arik@wizery.com>
Date: Tue, 15 Nov 2011 06:38:26 +0000
Subject: Re: [patch] mac80211: use kfree_skb() instead of kfree()
Message-Id: <CA+XVXfcegKfEqkyMFeWa7gW_bi+GJvUmNvOkpY5ryrAAsSM5pw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111115063309.GB30827@elgon.mountain>
In-Reply-To: <20111115063309.GB30827@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 15, 2011 at 08:33, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> sk_buff structs should be freed using kfree_skb().
>
> This was introduced recently in 029458212 "mac80211: Save probe
> response data for bss".
>

Thanks for this one. I'm getting careless lately.. :)

Arik
