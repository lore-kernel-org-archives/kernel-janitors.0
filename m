From: Richard Cochran <richardcochran@gmail.com>
Date: Tue, 06 Feb 2018 21:06:53 +0000
Subject: Re: [PATCH] igb: Fix a test with HWTSTAMP_TX_ON
Message-Id: <20180206210653.qjqmbxyqsdw43t3w@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206194759.26991-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180206194759.26991-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jeffrey.t.kirsher@intel.com, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 06, 2018 at 08:47:59PM +0100, Christophe JAILLET wrote:
> 'HWTSTAMP_TX_ON' should be handled as a value, not as a bit mask.
> The modified code should behave the same, because HWTSTAMP_TX_ON is 1
> and no other possible values of 'tx_type' would match the test.
> However, this is more future-proof, should other values be allowed one day.

Nice catch, and I am going to introduce more tx_type values soon.

Thanks,
Richard
