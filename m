From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Sun, 21 Jan 2018 21:35:08 +0000
Subject: Re: [PATCH 0/2] Input: auo-pixcir-ts: Adjustments for two function implementations
Message-Id: <2419092.du2IquVYHz@diego>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df18b548-f95e-e315-9e77-f379af7909e8@users.sourceforge.net>
In-Reply-To: <df18b548-f95e-e315-9e77-f379af7909e8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Am Sonntag, 21. Januar 2018, 22:14:15 CET schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 Jan 2018 22:10:44 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete an error message for a failed memory allocation
>     in auo_pixcir_parse_dt()
>   Delete an unnecessary return statement in auo_pixcir_input_close()

if it helps, both
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
