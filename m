From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 28 Mar 2017 10:20:14 +0000
Subject: Re: [PATCH] usb: gadget: udc: remove redundant initial assignments to the pointer 's'
Message-Id: <66ad4118-7c0a-06b9-b780-d0d613cb8152@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170327223439.10063-1-colin.king@canonical.com>
In-Reply-To: <20170327223439.10063-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Bhumika Goyal <bhumirks@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 3/28/2017 1:34 AM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The initial setting of pointer s to the driver name or to the literal
> string "(none)" is redundant as later it is always set to point to
> a different literal string before it is printed log.  Remove this

    Printed to log, perhaps?

> redundant code.
>
> Detected with CoverityScan, CID#1227032, CID#1227033 ("Unused Value")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei

