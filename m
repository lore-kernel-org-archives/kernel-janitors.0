From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Mon, 21 Nov 2011 21:20:09 +0000
Subject: Re: [patch v2] caif: fix endian conversion in cffrml_transmit()
Message-Id: <CAJK669bL51Ct-Q9LxXwFdiaQAnfkx2Um1k0Cutci2z6mdd2THw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121061722.GD7354@elgon.mountain>
	<20111121063356.GH2203@ZenIV.linux.org.uk>
	<20111121195056.GM29436@mwanda>
In-Reply-To: <20111121195056.GM29436@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> The "tmp" variable here is used to store the result of cpu_to_le16()
> so it should be an __le16 instead of an int.  We want the high bits
> set and the current code works on little endian systems but not on
> big endian systems.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  In v1 I used a u16 instead of an __le16.  Also I've changed the
> name to "data" instead of "tmp".

Thanks Dan, good catch - this would have failed badly on a b_e architecture.

Acked-by: Sjur Brændeland <sjur.brandeland@stericsson.com>

Regards,
Sjur
