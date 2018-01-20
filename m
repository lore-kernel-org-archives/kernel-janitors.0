From: Heiko Stuebner <heiko@sntech.de>
Date: Sat, 20 Jan 2018 20:26:57 +0000
Subject: Re: [PATCH 1/2] Input: zforce_ts: Delete an error message for a failed memory allocation in zforce_p
Message-Id: <4286739.AIUNhEQfUE@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e36553b1-3221-7944-59bd-6bb9358c488f@users.sourceforge.net> <2f111be7-11cd-d4a5-3c42-92290c1597d2@users.sourceforge.net>
In-Reply-To: <2f111be7-11cd-d4a5-3c42-92290c1597d2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Am Samstag, 20. Januar 2018, 21:18:45 CET schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Jan 2018 20:36:33 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

if it helps
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
