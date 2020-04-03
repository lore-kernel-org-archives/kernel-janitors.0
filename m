From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 03 Apr 2020 09:25:21 +0000
Subject: Re: [PATCH] mfd: asic3: Delete redundant variable definition
Message-Id: <20200403092521.GD30614@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b2a0e5f6-1f07-a7bd-2f3c-c95119efe635@web.de>
In-Reply-To: <b2a0e5f6-1f07-a7bd-2f3c-c95119efe635@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 03 Apr 2020, Markus Elfring wrote:

> > In this function, 'ret' is always assigned, even if 'pdata->leds'
> > don't carry out,
> 
> I notice possibilities again to improve such a commit message.
> 
> 
> > it has already been assigned a value in the above code, including '0',
> 
> The variable assignment will eventually be performed only in if branches.
> 
> 
> > so it's redundant.
> 
> I suggest to reconsider this interpretation of the source code here.
> Would you like to move the mentioned statement into an else branch
> at the end?

Why wasn't this sent 'in reply to'?  Something wrong with your mailer?

Now this messages is orphaned.  Floating about in my inbox on its own.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
