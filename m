From: Joe Perches <joe@perches.com>
Date: Tue, 15 Mar 2016 08:54:36 +0000
Subject: Re: [patch] Input: synaptics-rmi4 - using logical instead of bitwise AND
Message-Id: <1458032076.11972.179.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315071140.GF13560@mwanda>
	 <1458030809.11972.178.camel@perches.com> <20160315083754.GA30221@mwanda>
In-Reply-To: <20160315083754.GA30221@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Duggan <aduggan@synaptics.com>, Henrik Rydberg <rydberg@bitmath.org>, Christopher Heiny <cheiny@synaptics.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2016-03-15 at 11:37 +0300, Dan Carpenter wrote:
> On Tue, Mar 15, 2016 at 01:33:29AM -0700, Joe Perches wrote:
> > 
> > Right and as well these are bool so the !! isn't necessary.
> Not necessary but nice for reading...

<shrug> opinions vary.

cheers, Joe

