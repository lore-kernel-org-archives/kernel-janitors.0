From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 11 May 2016 19:02:11 +0000
Subject: Re: airo: prevent potential underflow in airo_set_freq()
Message-Id: <20160511190211.9054D6133D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160510192037.GB30712@mwanda>
References: <20160510192037.GB30712@mwanda>
In-Reply-To: <20160510192037.GB30712@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ondrej Zary <linux@rainbow-software.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Felipe Balbi <felipe.balbi@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> I'm not sure if this can underflow but Smatch complains.  It seems
> harmless to add a check for negatives.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, 1 patch applied to wireless-drivers-next.git:

03ba4a1b718e airo: prevent potential underflow in airo_set_freq()

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9061381/

