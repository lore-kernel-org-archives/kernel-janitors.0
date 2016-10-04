From: David Miller <davem@davemloft.net>
Date: Tue, 04 Oct 2016 01:54:37 +0000
Subject: Re: [PATCH] ptp: Fix resource leak in case of error
Message-Id: <20161003.215437.766104609153539683.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475391856-15046-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475391856-15046-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: richardcochran@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  2 Oct 2016 09:04:16 +0200

> A call to 'ida_simple_remove()' is missing in the error handling path.
> 
> This as been spotted with the following coccinelle script which tries to
> detect missing 'ida_simple_remove()' call in error handling paths.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
