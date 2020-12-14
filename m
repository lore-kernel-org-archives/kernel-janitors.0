From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Dec 2020 07:05:36 +0000
Subject: Re: mmc: atmel-mci: Reduce =?utf-8?Q?scope?= =?utf-8?Q?_for_the_variable_=E2=80=9Cslot=E2=80=9D?= in
Message-Id: <20201214070536.GB2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net> <20201211083731.GP2789@kadam>
 <e7910b04-4c4a-567b-d87d-d12352a48cfc@web.de>
In-Reply-To: <e7910b04-4c4a-567b-d87d-d12352a48cfc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On Fri, Dec 11, 2020 at 10:08:54AM +0100, Markus Elfring wrote:
> > This makes it hard to review any patches or follow discussion...
> 
> You shared also special software development opinions about extra variable
> initialisations occasionally, didn't you?

I generally put everything at the top of the function...  I don't have
a well developed philosophy for when variables should be declared with
a smaller scope.

	int ret;  <-- this should always be function scope

Probably the other people are right that making scopes shorter is more
important when the function is very long.

regards,
dan carpenter
