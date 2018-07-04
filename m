From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 04 Jul 2018 11:59:14 +0000
Subject: Re: [PATCH] mei: bus: type promotion bug in mei_nfc_if_version()
Message-Id: <alpine.DEB.2.20.1807041358580.4387@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093449.vryluk7khaudstgp@kili.mountain>
In-Reply-To: <20180704093449.vryluk7khaudstgp@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>, Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Wed, 4 Jul 2018, Dan Carpenter wrote:

> We accidentally removed the check for negative returns without
> considering the issue of type promotion.  The "if_version_length"
> variable is type size_t so if __mei_cl_recv() returns a negative then
> "bytes_recv" is type promoted to a high positive value and treated as
> success.
>
> Fixes: 582ab27a063a ("mei: bus: fix received data size check in NFC fixup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
> index 0208c4b027c5..fa0236a5e59a 100644
> --- a/drivers/misc/mei/bus-fixup.c
> +++ b/drivers/misc/mei/bus-fixup.c
> @@ -267,7 +267,7 @@ static int mei_nfc_if_version(struct mei_cl *cl,
>
>  	ret = 0;
>  	bytes_recv = __mei_cl_recv(cl, (u8 *)reply, if_version_length, 0);
> -	if (bytes_recv < if_version_length) {
> +	if (bytes_recv < 0 || bytes_recv < if_version_length) {

Is this preferred to adding an int cast?

julia

>  		dev_err(bus->dev, "Could not read IF version\n");
>  		ret = -EIO;
>  		goto err;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
