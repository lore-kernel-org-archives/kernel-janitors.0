From: Darren Hart <dvhart@infradead.org>
Date: Tue, 14 Jul 2015 19:47:06 +0000
Subject: Re: [PATCH] intel_scu_ipc: move local memory initialization out of a mutex
Message-Id: <20150714194706.GA35521@vmdeb7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436798694-6907-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436798694-6907-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 13, 2015 at 04:44:54PM +0200, Christophe JAILLET wrote:
> '{ }' and memset will both reset the cbuf buffer.
> Only once is enough and this can be done outside fo the mutex.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Queued, thanks Christophe.

-- 
Darren Hart
Intel Open Source Technology Center
