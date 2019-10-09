From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 09 Oct 2019 08:28:31 +0000
Subject: Re: [PATCH] iwlegacy: make array interval static, makes object smaller
Message-Id: <20191009082832.7B8BC61AC6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007134113.5647-1-colin.king@canonical.com>
In-Reply-To: <20191007134113.5647-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array interval on the stack but instead make it
> static. Makes the object code smaller by 121 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  167797	  29676	    448	 197921	  30521	wireless/intel/iwlegacy/common.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  167580	  29772	    448	 197800	  304a8	wireless/intel/iwlegacy/common.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

55047fb783e0 iwlegacy: make array interval static, makes object smaller

-- 
https://patchwork.kernel.org/patch/11177531/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
