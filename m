From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 01 Oct 2018 08:14:40 +0000
Subject: Re: [PATCH] ipw2x00: clean up clang warning on extraneous parentheses
Message-Id: <b7ab11aa-0ec5-0c29-9170-4e62f5ab4ac3@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180930223809.18136-1-colin.king@canonical.com>
In-Reply-To: <20180930223809.18136-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 10/1/2018 1:38 AM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are extraneous parantheses that are causing clang to produce a

    Parentheses.

> warning so remove these.
> 
> Clean up clang warning:
> equality comparison with extraneous parentheses [-Wparentheses-equality]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
