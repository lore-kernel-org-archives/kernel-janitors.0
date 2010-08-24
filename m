From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 24 Aug 2010 12:17:52 +0000
Subject: Re: [rfc patch] libertas: fix if_spi_prog_helper_firmware()
Message-Id: <1282652273.3695.21.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824120743.GG29330@bicker>
In-Reply-To: <20100824120743.GG29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Dan Williams <dcbw@redhat.com>, "John W. Linville" <linville@tuxdriver.com>, Ben Hutchings <ben@decadent.org.uk>, Mike Frysinger <vapier.adi@gmail.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2010-08-24 at 14:07 +0200, Dan Carpenter wrote:
> The indenting is not correct here.  I don't have this hardware and I'm
> just guessing as to what was intended.  I think that if there is an
> error we should return an error code, but if there isn't an error we
> should return success directly without releasing the firmware.

>  		goto release_firmware;
>  	err = spu_write_u16(card, IF_SPI_CARD_INT_CAUSE_REG,
>  				IF_SPI_CIC_CMD_DOWNLOAD_OVER);
> +	if (err)
>  		goto release_firmware;
>  
> -	lbs_deb_spi("waiting for helper to boot...\n");
> +	lbs_deb_spi("helper firmware loaded...\n");
> +
> +	return 0;
>  
>  release_firmware:
>  	release_firmware(firmware);

This doesn't look correct, the caller of this function also sometimes
releases the firmware, but it looks like it could lead to a double-free?

johannes

