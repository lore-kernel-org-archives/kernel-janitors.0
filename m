From: Eric Dumazet <edumazet@google.com>
Date: Fri, 05 Apr 2019 07:46:39 +0000
Subject: Re: [PATCH] tcp: remove redundant check on tskb
Message-Id: <CANn89iLsp+Nii7Y-ppBnLbinR7e=vVJ6QsMjBVLjcAKs9zQaRA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404144603.27682-1-colin.king@canonical.com>
In-Reply-To: <20190404144603.27682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Apr 4, 2019 at 7:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The non-null check on tskb is always false because it is in an else
> path of a check on tskb and hence tskb is null in this code block.
> This is check is therefore redundant and can be removed as well
> as the label coalesc.
>...

> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

SGTM, thanks.

Signed-off-by: Eric Dumazet <edumazet@google.com>
