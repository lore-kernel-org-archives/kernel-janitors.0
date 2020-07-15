From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 15 Jul 2020 09:13:46 +0000
Subject: Re: [PATCH net-next] mwifiex: Prevent memory corruption handling keys
Message-Id: <20200715091346.5FF4DC433A0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708115857.GA13729@mwanda>
In-Reply-To: <20200708115857.GA13729@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Ganapathi Bhat <ganapathi.bhat@nxp.com>, Xinming Hu <huxinming820@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "John W. Linville" <linville@tuxdriver.com>, Bing Zhao <bzhao@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, Marc Yang <yangyang@marvell.com>, Frank Huang <frankh@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The length of the key comes from the network and it's a 16 bit number.  It
> needs to be capped to prevent a buffer overflow.
> 
> Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Ganapathi Bhat <ganapathi.bhat@nxp.com>

Patch applied to wireless-drivers-next.git, thanks.

e18696786548 mwifiex: Prevent memory corruption handling keys

-- 
https://patchwork.kernel.org/patch/11651443/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
