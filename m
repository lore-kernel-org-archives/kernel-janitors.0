From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 31 Aug 2018 15:45:42 +0000
Subject: Re: [PATCH] orinoco: remove unused array encaps_hdr and macro ENCAPS_OVERHEAD
Message-Id: <20180831154542.78A9260242@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180816125944.7804-1-colin.king@canonical.com>
In-Reply-To: <20180816125944.7804-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array encaps_hdr and macro ENCAPS_OVERHEAD are declared but are
> not being used, hence they are redundant and can be removed.
> 
> Cleans up clang warning:
> warning: 'encaps_hdr' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

5945310a1755 orinoco: remove unused array encaps_hdr and macro ENCAPS_OVERHEAD

-- 
https://patchwork.kernel.org/patch/10567409/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
