From: David Miller <davem@davemloft.net>
Date: Mon, 06 Apr 2020 17:20:27 +0000
Subject: Re: [PATCH] wimax: remove some redundant assignments to variable result
Message-Id: <20200406.102027.658947559034471738.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405120603.369405-1-colin.king@canonical.com>
In-Reply-To: <20200405120603.369405-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky.perez-gonzalez@intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  5 Apr 2020 13:06:02 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> In function i2400m_bm_buf_alloc there is no need to use a variable
> 'result' to return -ENOMEM, just return the literal value. In the
> function i2400m_setup the variable 'result' is initialized with a
> value that is never read, it is a redundant assignment that can
> be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
