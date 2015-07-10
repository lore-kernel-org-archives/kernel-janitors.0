From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Jul 2015 09:25:52 +0000
Subject: Re: [PATCH] arcmsr: Fix a potential data corruption issue
Message-Id: <20150710092552.GV4341@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436505490-9640-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436505490-9640-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: JBottomley@odin.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 10, 2015 at 07:18:10AM +0200, Christophe JAILLET wrote:
> Resetting rqbuffer or wqbuffer must be done within a critial section
> in order to avoir potential data corruption.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

I don't know the code well enough to say if it's necessary, but it seems
reasonable to me.

regards,
dan carpenter

