From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 08:37:54 +0000
Subject: Re: [patch] Input: synaptics-rmi4 - using logical instead of bitwise AND
Message-Id: <20160315083754.GA30221@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315071140.GF13560@mwanda>
 <1458030809.11972.178.camel@perches.com>
In-Reply-To: <1458030809.11972.178.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Duggan <aduggan@synaptics.com>, Henrik Rydberg <rydberg@bitmath.org>, Christopher Heiny <cheiny@synaptics.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2016 at 01:33:29AM -0700, Joe Perches wrote:
> Right and as well these are bool so the !! isn't necessary.

Not necessary but nice for reading...

regards,
dan carpenter

