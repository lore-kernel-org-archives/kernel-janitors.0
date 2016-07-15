From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 08:33:27 +0000
Subject: Re: [patch] netiucv: silence an underflow warning
Message-Id: <20160715083327.GA32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714113016.GJ18175@mwanda>
 <57888CBE.9050002@linux.vnet.ibm.com>
In-Reply-To: <57888CBE.9050002@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

That looks good.  Thanks.  This was a Smatch thing that I haven't pushed
yet.  It needs some work yet to cut down the false positive rate but
it's close.

regards,
dan carpenter
