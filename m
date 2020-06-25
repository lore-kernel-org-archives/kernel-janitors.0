From: Igor Russkikh <irusskikh@marvell.com>
Date: Thu, 25 Jun 2020 16:32:28 +0000
Subject: Re: [EXT] [PATCH] qed: add missing error test for DBG_STATUS_NO_MATCHING_FRAMING_MODE
Message-Id: <a562bb9e-f158-3cdb-f969-fcbf88a2fad8@marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624101302.8316-1-colin.king@canonical.com>
In-Reply-To: <20200624101302.8316-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2 <GR-everest-linux-l2@marvell.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Kalderon <mkalderon@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin!

Thanks for catching this, indeed this was missed!

> 
>  	/* DBG_STATUS_INVALID_FILTER_TRIGGER_DWORDS */
>  	"The filter/trigger constraint dword offsets are not enabled for 
> recording",
> -
> +	/* DBG_STATUS_NO_MATCHING_FRAMING_MODE */
> +	"No matching framing mode",
> 

Could you please however change the string to

	"No matching framing mode found for the enabled blocks/Storms - use less
dwords for blocks data",

If you don't have much time, I can repost this for you. With this change it'll
 be in sync with our internal error descriptions.

Thanks
  Igor
