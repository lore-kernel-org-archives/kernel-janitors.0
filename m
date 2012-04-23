From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 23 Apr 2012 11:37:11 +0000
Subject: Re: [patch 1/2] ath6kl: change || to &&
Message-Id: <4F953EE7.9000006@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064328.GC22649@elgon.mountain>
In-Reply-To: <20120420064328.GC22649@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/20/2012 09:43 AM, Dan Carpenter wrote:
> The original conditions are always true.  I think && was intended here,
> but I don't have the hardware to test.  Could you take a look?
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, both patches applied to ath6kl.git.

Kalle
