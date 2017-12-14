From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 13:21:55 +0000
Subject: Re: [PATCH 0/2] Fixed voltage regulator: Adjustments for two function implementations
Message-Id: <4766f560-89bb-89a3-ed12-5780ce569434@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
In-Reply-To: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

> Date: Tue, 16 May 2017 13:55:44 +0200
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete error messages for failed memory allocations in reg_fixed_voltage_probe()
>   Improve a size determination in two functions
> 
>  drivers/regulator/fixed.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

How are the chances that such change possibilities will be integrated
in this software module?

Regards,
Markus
