From: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 03 Dec 2020 01:27:28 +0000
Subject: Re: [PATCH net v2] net/x25: prevent a couple of overflows
Message-Id: <20201202172728.43f387a3@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ZeAKm8FnFpN//B@mwanda>
        <41de2a35016a1eb9a188a71d11709f16@dev.tdt.de>
In-Reply-To: <41de2a35016a1eb9a188a71d11709f16@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Martin Schiller <ms@dev.tdt.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, linux-x25@vger.kernel.org, netdev@vger.kernel.org, Andrew Hendry <andrew.hendry@gmail.com>, "=?UTF-8?B?a2l5aW4=?=( =?UTF-8?B?5bC55Lqu?=) " <kiyin@tencent.com>, security@kernel.org, linux-distros@vs.openwall.org, "=?UTF-8?B?aHVudGNoZW4=?=(=?UTF-8?B?6ZmI?= =?UTF-8?B?6Ziz?=) " <huntchen@tencent.com>, "=?UTF-8?B?ZGFubnl3?= =?UTF-8?B?YW5n?=(=?UTF-8?B?546L5a6H?=) " <dannywang@tencent.com>, kernel-janitors@vger.kernel.org

On Wed, 02 Dec 2020 10:27:18 +0100 Martin Schiller wrote:
> On 2020-12-01 16:15, Dan Carpenter wrote:
> > The .x25_addr[] address comes from the user and is not necessarily
> > NUL terminated.  This leads to a couple problems.  The first problem is
> > that the strlen() in x25_bind() can read beyond the end of the buffer.
> > 
> > The second problem is more subtle and could result in memory 
> > corruption.
> > The call tree is:
> >   x25_connect()  
> >   --> x25_write_internal()
> >       --> x25_addr_aton()  
> > 
> > The .x25_addr[] buffers are copied to the "addresses" buffer from
> > x25_write_internal() so it will lead to stack corruption.
> > 
> > Verify that the strings are NUL terminated and return -EINVAL if they
> > are not.
> > 
> > Reported-by: "kiyin(尹亮)" <kiyin@tencent.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Martin Schiller <ms@dev.tdt.de>

Applied, thanks!
