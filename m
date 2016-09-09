From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Sep 2016 09:21:45 +0000
Subject: Re: mwifiex: scan: Simplify code
Message-Id: <20160909092145.2A21861EAC@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1472644259-15605-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: akarwar@marvell.com, nishants@marvell.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe Jaillet <christophe.jaillet@wanadoo.fr> wrote:
> This patch:
>    - improves code layout
>    - removes a useless memset(0) for some memory allocated with kzalloc
>    - removes a useless if. We know that 'if (chan_band_tlv)' will succeed
>      because it has been tested a few lines above
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, 1 patch applied to wireless-drivers-next.git:

b71165761694 mwifiex: scan: Simplify code

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9307009/

