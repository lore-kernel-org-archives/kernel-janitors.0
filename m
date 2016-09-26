From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 26 Sep 2016 18:01:21 +0000
Subject: Re: hostap: Delete an unnecessary jump label in prism2_ioctl_priv_hostapd()
Message-Id: <874m52zgjy.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65ed528f-7ec5-a0f2-6219-3e63a78ca0ee@users.sourceforge.net>
        <20160926150656.213D961568@smtp.codeaurora.org>
        <88d5023a-9a59-ab36-8c6c-a146cae803b5@users.sourceforge.net>
In-Reply-To: <88d5023a-9a59-ab36-8c6c-a146cae803b5@users.sourceforge.net> (SF
        Markus Elfring's message of "Mon, 26 Sep 2016 18:03:00 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> writes:

>> 9291771 [2/3] hostap: Delete an unnecessary jump label in prism2_ioctl_priv_hostapd()
>> 9291775 [3/3] hostap: Delete unnecessary initialisations for the variable "ret"
>> 
>> Reason: The benefit is not clear.
>
> How do you think about to reduce the source code a bit at these places?

hostap is an obsolete driver, it's waste of time doing style fixes to it
as nobody maintains it anymore.

-- 
Kalle Valo
