From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 03 Nov 2017 16:39:21 +0000
Subject: Re: [PATCH] staging: comedi: usbduxfast: Improve unlocking of a mutex in usbduxfast_ai_insn_read()
Message-Id: <1d91cb37-4b7d-3b2e-bc20-1bcd70f19c4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b0acc12a-e48c-d51a-f7e3-606e66e6fe7b@users.sourceforge.net>
 <faf75ea4-e1cf-1959-2705-7da1d49bddde@mev.co.uk>
In-Reply-To: <faf75ea4-e1cf-1959-2705-7da1d49bddde@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ian Abbott <abbotti@mev.co.uk>, devel@driverdev.osuosl.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -838,6 +834,10 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>>       mutex_unlock(&devpriv->mut);
>>         return insn->n;
> 
> Minor niggle: You could also remove that call to mutex_unlock() by replacing the above three lines with:
> 
>     ret = insn->n;
> 
> which will fall through to the 'unlock:' label below.

Thanks for your suggestion.

Such a software refactoring is also possible if a corresponding
consensus could be achieved.
* Can such a change mean that the lock scope will be extended
  for both use cases (successful and failed function execution)?

* How much does this implementation matter for you?

* Would you like to achieve a small reduction of the object code there?

* How do you think about consequences from special communication settings
  by a well-known maintainer for my update suggestions?

Regards,
Markus
