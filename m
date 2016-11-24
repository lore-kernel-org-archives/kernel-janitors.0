From: Bert Kenward <bkenward@solarflare.com>
Date: Thu, 24 Nov 2016 12:03:56 +0000
Subject: Re: [patch net-next] sfc: remove unneeded variable
Message-Id: <7620ba33-2595-5315-821e-1cfc59a727ce@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124111651.GJ17225@mwanda>
In-Reply-To: <20161124111651.GJ17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 24/11/16 11:16, Dan Carpenter wrote:
> We don't use ->heap_buf after commit 46d1efd852cc ("sfc: remove Software
> TSO") so let's remove the last traces.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Bert Kenward <bkenward@solarflare.com>
The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
