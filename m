From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Mon, 22 Dec 2008 22:09:05 +0000
Subject: Re: [PATCH 20/27] drivers/net/wan: fix sparse warnings: make do-while a compound statement
Message-Id: <m3lju7ooam.fsf@maximus.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191755.11807.57896.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191755.11807.57896.stgit@vmbox.hanneseder.net> (Hannes Eder's message of "Mon\, 22 Dec 2008 20\:17\:55 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder <hannes@hanneseder.net> writes:

>   drivers/net/wan/wanxl.c:414:3: warning: do-while statement is not a compound statement
>   drivers/net/wan/wanxl.c:441:3: warning: do-while statement is not a compound statement

It's by design.
-- 
Krzysztof Halasa
