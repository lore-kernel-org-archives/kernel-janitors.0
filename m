From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sat, 28 Oct 2017 17:04:11 +0000
Subject: Re: [PATCH] nfp: Improve unlocking of a mutex in area_cache_get()
Message-Id: <20171028100411.7c9a3f7b@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b543c761-6931-ad0a-f12c-c2152c7bcd72@users.sourceforge.net>
In-Reply-To: <b543c761-6931-ad0a-f12c-c2152c7bcd72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, "David S. Miller" <davem@davemloft.net>, Simon Horman <simon.horman@netronome.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 28 Oct 2017 17:18:56 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 28 Oct 2017 17:12:10 +0200
> 
> Add a jump target so that a call of the function "mutex_unlock" is stored
> only once at the end of this function implementation.
> Replace four calls by goto statements.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
