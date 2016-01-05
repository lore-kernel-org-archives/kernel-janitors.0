From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 12:37:33 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <20160105123733.GC23363@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's a false positive, if midi is NULL then i starts as zero so it
won't go inside the for loop.  Smatch has the same false positive.

regards,
dan carpenter

