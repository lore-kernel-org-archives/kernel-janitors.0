From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Fri, 04 Dec 2015 15:46:04 +0000
Subject: Re: [patch] iwlegacy: cleanup end of il_send_add_sta()
Message-Id: <20151204154544.GA25510@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151204131645.GC12792@mwanda>
In-Reply-To: <20151204131645.GC12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 04, 2015 at 04:16:45PM +0300, Dan Carpenter wrote:
> This code causes a static checker warning because we check for
> "if (ret = 0)" but we have already had verified that was true.  Clean
> it up a little.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>
