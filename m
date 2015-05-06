From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 May 2015 13:45:23 +0000
Subject: Re: [patch 119/197] scripts/coccinelle/free: Delete NULL test before freeing functions
Message-Id: <554A1AF3.9010802@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53e53fd1.zO3IbUqJ421c7VXf%akpm@linux-foundation.org>
 <53E5DA60.90902@users.sourceforge.net>
 <alpine.DEB.2.02.1408091028520.2016@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1408091028520.2016@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>>> +@r depends on context || report || org @
>>> +expression E;
>>> +position p;
>>> +@@
>>> +
>>> +* if (E)
>>> +*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb\)(E);
>>
>> How do you think about to add the construct "@p" also behind the function name
>> "usb_free_urb"?
> 
> Yes, that would be needed, thanks.  Also, it was recently suggested to add 
> of_node_put to the list of things that are checked for.

Would you like to achieve further improvements for this approach?
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/scripts/coccinelle/free/ifnullfree.cocci?id=refs/tags/v4.0.1#n34

Regards,
Markus

