From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Wed, 08 Nov 2017 01:02:40 +0000
Subject: Re: [PATCH] umh: Optimize 'proc_cap_handler()'
Message-Id: <20171108010240.GL22894@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171020193331.7233-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171020193331.7233-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mcgrof@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2017 at 09:33:31PM +0200, Christophe JAILLET wrote:
> If 'write' is 0, we can avoid a call to spin_lock/spin_unlock.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sorry for the delay, I was travelling and will start nose diving now.  I hope
to have a concrete review and answer by tomorrow. Sorry for the two week delay
on the review and thanks for the patch!

  Luis
