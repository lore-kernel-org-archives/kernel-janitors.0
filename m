From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 05:00:36 +0000
Subject: Re: I2C-Octeon: Use common error handling code in octeon_i2c_probe()
Message-Id: <20e16385-afab-1d3d-b682-04589568850e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <73affb84-9cdd-9f5c-b96a-5a392739e789@users.sourceforge.net>
 <77df0e64-bf30-b6d0-b28b-ddb3c0574dfe@caviumnetworks.com>
In-Reply-To: <77df0e64-bf30-b6d0-b28b-ddb3c0574dfe@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Daney <ddaney@caviumnetworks.com>, David Daney <david.daney@cavium.com>, linux-i2c@vger.kernel.org
Cc: Jan Glauber <jglauber@cavium.com>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> NAK.  We don't need any more Markus Elfring spam.

Why do you not like another update suggestion for this use case?


>> Add a jump target so that a specific error message is stored only once
>> at the end of this function implementation.
> 
> Please read C standard about duplicate literal strings to see
> why this is a completely misleading and false statement.

* I proposed to adjust the position for one function call, didn't I?

* Do you care for a bit of code reduction?

* Do you prefer to use an optimisation option like “-fmerge-constants”
  (instead of integrating the shown small change)?

Regards,
Markus
