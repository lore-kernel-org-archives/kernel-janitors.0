From: Francois Romieu <romieu@fr.zoreil.com>
Date: Sat, 02 Jan 2016 15:07:44 +0000
Subject: Re: [PATCH 3/3] rsi: Replace variable initialisations by assignments in rsi_send_data_pkt()
Message-Id: <20160102150744.GA8926@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5687E169.4070704@users.sourceforge.net>
 <5687E27C.8000909@users.sourceforge.net>
In-Reply-To: <5687E27C.8000909@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 2 Jan 2016 15:25:34 +0100
> 
> Replace explicit initialisation for two local variables at the beginning
> by assignments.

It makes no sense for the 'adapter' variable.

-- 
Ueimor
