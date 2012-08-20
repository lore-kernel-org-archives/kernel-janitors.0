From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 20 Aug 2012 07:24:51 +0000
Subject: Re: [PATCH 4/5] drivers/net/wireless/ath/ath6kl/main.c: introduce missing initialization
Message-Id: <5031E643.1070105@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345325159-7365-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345325159-7365-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/19/2012 12:25 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The result of one call to a function is tested, and then at the second call
> to the same function, the previous result, and not the current result, is
> tested again.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression ret;
> identifier f;
> statement S1,S2;
> @@
> 
> *ret = f(...);
> if (\(ret != 0\|ret < 0\|ret = NULL\)) S1
> ... when any
> *f(...);
> if (\(ret != 0\|ret < 0\|ret = NULL\)) S2
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, but this was already fixed in ath6kl.git by this commit:

commit 3206209f231062170f060fdbae38faacff86ddbf
Author: Pandiyarajan Pitchaimuthu <c_ppitch@qca.qualcomm.com>
Date:   Wed Jul 11 12:51:43 2012 +0530

    ath6kl: Make use of return value from ath6kl_diag_read()

    In ath6kl_read_fwlogs(), return value from ath6kl_diag_read()is not
    used to bail out in case of any errors in reading fw log. No real issue
    is observed because of this, reported by source code analyzer.

    kvalo: fix a long line warning

    Signed-off-by: Pandiyarajan Pitchaimuthu <c_ppitch@qca.qualcomm.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Kalle
