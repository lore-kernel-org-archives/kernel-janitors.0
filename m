From: Jean Delvare <jdelvare@suse.de>
Date: Thu, 27 Apr 2017 12:50:30 +0000
Subject: Re: [PATCH 0/4] hwmon-NCT: Fine-tuning for four function implementations
Message-Id: <20170427145030.5507a32e@endymion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
In-Reply-To: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-hwmon@vger.kernel.org, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 27 Apr 2017 11:27:21 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 27 Apr 2017 11:18:22 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (4):
>   Use devm_kcalloc() in nct6683_create_attr_group()
>   Adjust five checks for null pointers
>   Use devm_kcalloc() in nct6775_create_attr_group()
>   Adjust seven checks for null pointers
> 
>  drivers/hwmon/nct6683.c | 15 +++++++--------
>  drivers/hwmon/nct6775.c | 19 +++++++++----------
>  2 files changed, 16 insertions(+), 18 deletions(-)

Nack. You have proven in the past on various lists that 1* you have no
understanding about the changes you are proposing and 2* you have no
skills to discuss any problem that could be found in your patches.

So I'll make it straight: we will not take any patch from you. You are
an annoyance we don't need. Do not waste our time. Go away.

-- 
Jean Delvare
SUSE L3 Support
