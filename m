From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Tue, 11 Dec 2012 17:27:32 +0000
Subject: Re: [PATCH] drivers/pinctrl/pinctrl-at91.c: convert kfree to devm_kfree
Message-Id: <50C77AE8.8090008@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355223525-19165-1-git-send-email-Julia.Lawall@lip6.fr>
 <50C72E75.8030706@mvista.com> <alpine.DEB.2.02.1212111407570.2091@hadrien>
In-Reply-To: <alpine.DEB.2.02.1212111407570.2091@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello.

On 12/11/2012 04:08 PM, Julia Lawall wrote:

>>> From: Julia Lawall <Julia.Lawall@lip6.fr>

>>> The function at91_dt_node_to_map is ultimately called by the function
>>> pinctrl_get, which is an exported function.  Since it is possible that this
>>> function is not called from within a probe function, for safety, the kfree
>>> is converted to a devm_kfree, to both free the data and remove it from the
>>> device in a failure situation.
>>
>>> A newline is added in the call to devm_kfree to avoid exceeding the 80
>>
>>    devm_kzalloc() you mean?

> Yes, sorry.  Should I send a new patch?

   Up to the maintainer I guess...

> thanks,
> julia

WBR, Sergei


