From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 16 Apr 2012 06:27:38 +0000
Subject: Re: [patch] ath6kl: list_first_entry() is never NULL
Message-Id: <4F8BBBDA.9030502@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120413192718.GD18505@elgon.mountain>
In-Reply-To: <20120413192718.GD18505@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath6kl-devel <ath6kl-devel@qualcomm.com>

On 04/13/2012 10:27 PM, Dan Carpenter wrote:
> We can remove the NULL check here.  It triggers a Smatch warning because
> list_first_entry() never is NULL and people who check for it normally
> intend to check for list_empty() instead.  In these cases however,
> we've already verified that the lists are not empty.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to ath6kl.git.

Kalle
