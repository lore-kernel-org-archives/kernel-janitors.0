From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 18 Feb 2019 10:25:08 +0000
Subject: Re: [PATCH] mac80211: mesh: fix missing unlock on error in table_path_del()
Message-Id: <20190218102508.wiflqxvfyxqcss2y@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218065216.155259-1-weiyongjun1@huawei.com>
In-Reply-To: <20190218065216.155259-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 06:52:16AM +0000, Wei Yongjun wrote:
> spin_lock_bh() is used in table_path_del() but rcu_read_unlock()
> is used for unlocking. Fix it by using spin_unlock_bh() instead
> of rcu_read_unlock() in the error handling case.
> 
> Fixes: b4c3fbe63601 ("mac80211: Use linked list instead of rhashtable walk for mesh tables")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks for catching this!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
