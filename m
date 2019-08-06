From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Aug 2019 12:36:18 +0000
Subject: Re: [PATCH v3] libertas: Fix a double free in if_spi_c2h_data()
Message-Id: <20190806123619.30B4260EA5@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9153261627a0f84b996e023f1349a2bc06dd03ee.camel@redhat.com>
In-Reply-To: <9153261627a0f84b996e023f1349a2bc06dd03ee.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>
Cc: Philip Rakity <prakity@yahoo.com>, libertas-dev@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Dan Carpenter <dan.carpenter@oracle.com>, Allison Randal <allison@lohutok.net>

Dan Williams <dcbw@redhat.com> wrote:

> The lbs_process_rxed_packet() frees the skb.  It didn't originally, but
> we fixed it in commit f54930f36311 ("libertas: don't leak skb on receive
> error").
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dan Williams <dcbw@redhat.com>

Patch applied to wireless-drivers-next.git, thanks.

3915a252ce71 libertas: Fix a double free in if_spi_c2h_data()

-- 
https://patchwork.kernel.org/patch/11057049/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
