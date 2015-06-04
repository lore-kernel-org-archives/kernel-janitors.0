From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2015 14:03:10 +0000
Subject: Re: [PATCH 5/8] staging : wilc1000 : remove WILC_Sint8
Message-Id: <20150604140310.GI28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433307037-30716-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1433307037-30716-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 03, 2015 at 01:50:37PM +0900, chaehyun lim wrote:
> -static WILC_Sint8 *gps8ConfigPacket;
> +static s8 *gps8ConfigPacket;

It's so unusual to use s8 that it raises suspiciouns...  We eventually
cast gps8ConfigPacket to char and use it to store u8 values.

TODO: wilc1000: fix ps8packet type.

regards,
dan carpenter

