From: Bin Liu <b-liu@ti.com>
Date: Mon, 24 Feb 2020 21:12:15 +0000
Subject: Re: [PATCH] usb: musb: remove redundant assignment to variable ret
Message-Id: <20200224211215.GA28269@iaqt7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222135420.135692-1-colin.king@canonical.com>
In-Reply-To: <20200222135420.135692-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

Hi,

On Sat, Feb 22, 2020 at 01:54:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ret is being initialized with a value that is never read,
> it is assigned a new value later on. The assignment is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued for v5.7-rc1. Thanks.

-Bin.
