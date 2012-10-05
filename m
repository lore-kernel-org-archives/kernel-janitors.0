From: Francois Romieu <romieu@fr.zoreil.com>
Date: Fri, 05 Oct 2012 21:40:41 +0000
Subject: Re: [PATCH 2/20 V2] drivers/net/ethernet/natsemi/natsemi.c: fix error return code
Message-Id: <20121005214041.GA11601@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349469667-6137-1-git-send-email-peter.senna@gmail.com> <1349469667-6137-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349469667-6137-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: davem@davemloft.net, rick.jones2@hp.com, netdev@pradeepdalvi.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Peter Senna Tschudin <peter.senna@gmail.com> :
[...]
> The function natsemi_probe1() return 0 for success and negative value
> for most of its internal tests failures. There is one exception
> that is error case going to err_create_file:. Fore this error case the
> function abort its success execution path, but returns non negative value, 
> making it difficult for a caller function to notice the error.

Ok. natsemi_probe1() forgets to return a negative status code in one of
its failure paths.

[...]
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Francois Romieu <romieu@fr.zoreil.com>

-- 
Ueimor
