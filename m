From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 09:01:05 +0000
Subject: Re: um: Use common error handling code in port_listen_fd()
Message-Id: <e248c905-eb76-d9bd-6e10-92be8b200590@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b16407cf-0caa-ea1d-7997-0e9a231468f3@users.sourceforge.net>
 <20171023084800.p26qcpb7iqyqrz4v@mwanda>
In-Reply-To: <20171023084800.p26qcpb7iqyqrz4v@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, user-mode-linux-devel@lists.sourceforge.net
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> This business of moving the error code to the bottom of the function
> just makes the code less readable.

I got an other software development opinion on this aspect.
Could you become used to the proposed control flow structure
in the affected function?


> I know you never listen to anyone,

My response times might not fir to your preferences.


> but you should stop doing it.

I am going to offer suggestions for change patterns which I find useful.
There are some challenges around change acceptance as usual.

Regards,
Markus
