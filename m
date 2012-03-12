From: David Miller <davem@davemloft.net>
Date: Mon, 12 Mar 2012 06:48:08 +0000
Subject: Re: [PATCH 3/3 v2] netxen: qlogic ethernet : Fix endian bug.
Message-Id: <20120311.234808.1919218898572322534.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331534303-4093-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331534303-4093-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Mon, 12 Mar 2012 12:08:23 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Fix endian bug.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

This is a very non-trivial patch, therefore the terse commit
message and the lack of any comments in this code is unacceptable.

This commit message is not only terse, it's wrong.  You're not
fixing an endian bug, you're fixing several of them.

Explain everything in your commit message.

>  	req.words[0] = cpu_to_le64(cmd);
> -	req.words[1] = cpu_to_le64(ip);
> +	memcpy(&req.words[1], &ip, sizeof(u32));

Nobody is going to read that and have any idea why it's correct unless
they happen to be able to discover the long thread you guys had this
past week working out how to do this change correctly.

Putting a comment here for the rest of us mere mortals is therefore
absolutely required.
