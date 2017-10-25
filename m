From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Oct 2017 06:03:13 +0000
Subject: Re: hwmon/amc6821: Use common error handling code in amc6821_init_client()
Message-Id: <482baa1b-ea2d-76db-3aee-719b6645156c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cc80503-aa2b-bb5e-ab40-fa31b401b6a2@users.sourceforge.net>
 <20171024201812.GA5769@roeck-us.net>
In-Reply-To: <20171024201812.GA5769@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Nack; I am not a friend of that much verboseness to start with,
> and I don't think the patch improves readability.

* Do you care to avoid code duplication for two error messages in this use case?

* How do you think about to return a single error code directly
  without using an intermediate variable?

Regards,
Markus
