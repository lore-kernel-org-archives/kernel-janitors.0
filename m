From: Ferruh Yigit <fery@cypress.com>
Date: Wed, 03 Jul 2013 13:53:23 +0000
Subject: Re: [patch 3/3] Input: cyttsp4 - leak on error path in probe()
Message-Id: <51D42CD3.2000705@cypress.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130702214455.GC1598@elgon.mountain> <51D42350.10504@cypress.com> <20130703135013.GU5714@mwanda>
In-Reply-To: <20130703135013.GU5714@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/03/2013 04:50 PM, Dan Carpenter wrote:
> On Wed, Jul 03, 2013 at 04:12:48PM +0300, Ferruh Yigit wrote:
>> On 07/03/2013 12:44 AM, Dan Carpenter wrote:
>>> We leak "cd" if the cd->xfer_buf allocation fails.  It was weird to
>>> "goto error_gpio_irq" so I changed the label name.  (Label names should
>>> reflect the label location not the goto location otherwise you get an
>>> "all roads lead to Rome problem").
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>> xfer_buf still may not be freed, I propose following one instead:
>>
> That's a good point.  I missed that leak.  The problem is that my
> patch was already applied so this patch would have to be re-written
> on top of that.  Also this patch is whitespace dammaged and won't
> apply.
OK, I am preparing the patch over previous one.

Thanks,
ferruh
This message and any attachments may contain Cypress (or its subsidiaries) confidential information. If it has been received in error, please advise the sender and immediately delete this message.
