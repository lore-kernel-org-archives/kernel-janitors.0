From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Mon, 21 Nov 2011 08:52:15 +0000
Subject: Re: [patch] iwlegacy: off by one in iwl3945_hw_build_tx_cmd_rate()
Message-Id: <20111121085150.GC2787@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111120210400.GB7354@elgon.mountain>
In-Reply-To: <20111120210400.GB7354@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 21, 2011 at 12:04:00AM +0300, Dan Carpenter wrote:
> We use "rate_index" like this:
> 	rate = iwl3945_rates[rate_index].plcp;
> The iwl3945_rates[] array has IWL_RATE_COUNT_3945 elements so the
> limit here is off by one.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan. I queued patch into iwlegacy github tree on top
of my current changes, otherwise there would be problems with
merging.

Thanks
Stanislaw
