From: Greg KH <greg@kroah.com>
Date: Thu, 30 May 2013 11:45:37 +0000
Subject: Re: [Patch] Staging: winbond: Macros values enclosed in parenthesis
Message-Id: <20130530114537.GA18245@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A434EB.9070208@gmail.com>
In-Reply-To: <51A434EB.9070208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 28, 2013 at 10:09:07AM +0530, Harsh Kumar wrote:
> Macros with complex values enclosed in parenthesis

What does that mean?

> -#define MTO_CNT_ANT(x)			MTO_DATA().Cnt_Ant[(x)]
> -#define MTO_SQ_ANT(x)			MTO_DATA().SQ_Ant[(x)]
> -#define MTO_AGING_TIMEOUT()		MTO_DATA().aging_timeout
> +#define MTO_POWER_CHANGE_ENABLE()	(MTO_DATA().PowerChangeEnable)
> +#define MTO_CCA_MODE()			(MTO_DATA().CCA_Mode)

These are not "complex" values at all, this patch isn't needed,
checkpatch needs to be fixed to not complain about it.

thanks,

greg k-h
