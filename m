From: Bert Kenward <bkenward@solarflare.com>
Date: Tue, 07 Feb 2017 08:43:06 +0000
Subject: Re: [patch v2 net-next] sfc: fix an off by one bug
Message-Id: <bac041b8-d30f-cd06-359d-6347765d9879@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207074431.GA18377@mwanda>
In-Reply-To: <20170207074431.GA18377@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/02/17 07:44, Dan Carpenter wrote:
> This bug is harmless because it's just a sanity check and we always
> pass valid values for "encap_type" but the test is off by one.
>
> Fixes: 9b4108012517 ("sfc: insert catch-all filters for encapsulated traffic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan.

Acked-by: Bert Kenward <bkenward@solarflare.com>
The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
