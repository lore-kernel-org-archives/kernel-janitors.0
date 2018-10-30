From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Tue, 30 Oct 2018 11:48:43 +0000
Subject: Re: [PATCH] xfrm: Fix error return code in xfrm_output_one()
Message-Id: <20181030114843.GC2441@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540620726-100678-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1540620726-100678-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Oct 27, 2018 at 06:12:06AM +0000, Wei Yongjun wrote:
> xfrm_output_one() does not return a error code when there is
> no dst_entry attached to the skb, it is still possible crash
> with a NULL pointer dereference in xfrm_output_resume(). Fix
> it by return error code -EHOSTUNREACH.
> 
> Fixes: 9e1437937807 ("xfrm: Fix NULL pointer dereference when skb_dst_force clears the dst_entry.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks a lot!
