From: David Miller <davem@davemloft.net>
Date: Fri, 03 May 2013 20:12:16 +0000
Subject: Re: [patch] usbnet: pegasus: endian bug in write_mii_word()
Message-Id: <20130503.161216.182244575049778035.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130503064420.GA14069@elgon.mountain>
In-Reply-To: <20130503064420.GA14069@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: petkan@nucleusys.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 May 2013 09:44:20 +0300

> We're only passing the two high bits of an integer.  It works for little
> endian but not for big endian.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

s/bits/bytes/, applied, and queued up for stable, thanks
