From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 11 Jul 2009 11:09:49 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <4A5872FD.8040500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>	 <4A584A94.5010105@gmail.com>  <1247307444.3032.2.camel@hpdv5.satnam> <1247308323.3032.5.camel@hpdv5.satnam>
In-Reply-To: <1247308323.3032.5.camel@hpdv5.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: "Luis R. Rodriguez" <lrodriguez@atheros.com>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/11/2009 12:32 PM, Jaswinder Singh Rajput wrote:
> And more funny thing is that all functions are global in this file.
> 
> Greg, can you please check the scope of these function, why all are
> global.

Why don't you do that? I think patches are welcome :).
