From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 05 Oct 2017 20:02:10 +0000
Subject: Re: [PATCH 1/2] powerpc/platforms/cell: Delete an error message for a failed memory allocation in th
Message-Id: <20171005220210.681f78e8@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
 <62146108-5be0-c236-f404-4be122e162ac@users.sourceforge.net>
In-Reply-To: <62146108-5be0-c236-f404-4be122e162ac@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

On Thu, 5 Oct 2017 21:36:26 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 5 Oct 2017 21:04:30 +0200
> 
> Omit extra messages for a memory allocation failure in these
> functions.

this is bogus. All these functions return -1 on any error. Until they
reflect the error in their return value (and it is properly propagated
to the user) there is no way to tell WTF failed without the message.

> 
> This issue was detected by using the Coccinelle software.
> 

... which provides only a hint which should be evaluated by the user.

Thanks

Michal
