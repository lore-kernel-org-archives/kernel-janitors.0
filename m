From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 28 Jan 2021 18:44:18 +0000
Subject: Re: [PATCH] rtlwifi: rtl8192se: remove redundant initialization of variable rtstatus
Message-Id: <CAF=yD-KvXYW-r69k8Mf80uQ5Ww60HEfT+FrxNbu4FCxOF=Xy0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128171048.644669-1-colin.king@canonical.com>
In-Reply-To: <20210128171048.644669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2021 at 12:15 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable rtstatu is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

(for netdrv)

Acked-by: Willem de Bruijn <willemb@google.com>
