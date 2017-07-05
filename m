From: David Miller <davem@davemloft.net>
Date: Wed, 05 Jul 2017 08:09:08 +0000
Subject: Re: [PATCH][bpf-next] bpf: add missing break in for the TCP_BPF_SNDCWND_CLAMP case
Message-Id: <20170705.090908.458530250899642598.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170704152112.18623-1-colin.king@canonical.com>
In-Reply-To: <20170704152112.18623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  4 Jul 2017 16:21:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> There appears to be a missing break in the TCP_BPF_SNDCWND_CLAMP case.
> Currently the non-error path where val is greater than zero falls through
> to the default case that sets the error return to -EINVAL. Add in
> the missing break.
> 
> Detected by CoverityScan, CID#1449376 ("Missing break in switch")
> 
> Fixes: 13bf96411ad2 ("bpf: Adds support for setting sndcwnd clamp")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
