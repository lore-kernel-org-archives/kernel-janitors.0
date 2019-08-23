From: Luca Coelho <luca@coelho.fi>
Date: Fri, 23 Aug 2019 05:10:52 +0000
Subject: Re: [PATCH] iwlwifi: remove redundant assignment to variable bufsz
Message-Id: <df4c42b44950c8d145479ade68786335f9d0526c.camel@coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190801164419.3439-1-colin.king@canonical.com>
In-Reply-To: <20190801164419.3439-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2019-08-01 at 17:44 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable bufsz is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks! I applied this to our internal tree and it will reach the
mainline following our usual upstreaming process.

--
Cheers,
Luca.
