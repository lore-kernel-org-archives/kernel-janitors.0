From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Dec 2015 11:16:16 +0000
Subject: Re: iwlegacy: cleanup end of il_send_add_sta()
Message-Id: <20151211111616.B1A60141A6F@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151204131645.GC12792@mwanda>
References: <20151204131645.GC12792@mwanda>
In-Reply-To: <20151204131645.GC12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> This code causes a static checker warning because we check for
> "if (ret = 0)" but we have already had verified that was true.  Clean
> it up a little.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
