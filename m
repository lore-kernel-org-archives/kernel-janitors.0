From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 11 Jul 2009 08:33:38 +0000
Subject: Re: [PATCH 5/5, revised] staging/otus: Drop an unnecessary NULL test
Message-Id: <4A584E62.6050500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907111031480.29592@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907111031480.29592@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/11/2009 10:32 AM, Julia Lawall wrote:
> Apparently, the NULL test is not necessary at this point.
> 
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Jiri Slaby <jirislaby@gmail.com>
