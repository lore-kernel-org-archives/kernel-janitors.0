From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Fri, 26 Jul 2019 16:29:26 +0000
Subject: Re: [PATCH] ipw2x00: remove redundant assignment to err
Message-Id: <CA++WF2PS_3X-fs7nKuxipizXE3QAPYXbYk=AV9waxDEc9JVJNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190726100614.6924-1-colin.king@canonical.com>
In-Reply-To: <20190726100614.6924-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 26/07/2019, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable err is initialized to a value that is never read and it
> is re-assigned later.  The initialization is redundant and can
> be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/intel/ipw2x00/ipw2100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks fine, thanks!

Stanislav.
