From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 20 Mar 2015 07:00:19 +0000
Subject: Re: mwifiex: missing curly braces in mwifiex_write_data_complete()
Message-Id: <20150320070019.9A289140DB9@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150318082235.GC10434@mwanda>
References: <20150318082235.GC10434@mwanda>
In-Reply-To: <20150318082235.GC10434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Zhaoyang Liu <liuzy@marvell.com>, Avinash Patil <patila@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> It's clear from the indenting that curly braces were intended here.
> 
> Fixes: e35000ead491 ('mwifiex: preprocess packets from TX queue')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
