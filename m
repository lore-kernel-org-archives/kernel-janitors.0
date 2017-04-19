From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 19 Apr 2017 11:54:28 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170419115428.GB3444@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
 <1492593414.3108.1.camel@spectralink.com>
 <20170419103135.GA1670@localhost.localdomain>
 <1492601312.3108.3.camel@spectralink.com>
In-Reply-To: <1492601312.3108.3.camel@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?B?U/hyZW5zZW4s?= Stefan <Stefan.Sorensen@spectralink.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 19, 2017 at 11:28:34AM +0000, S=F8rensen, Stefan wrote:
> Here we still hold rx_lock while during the callback, wouldn't it be
> beneficial to release that first?

Yes, your are right.

Do you want to post a fix?  If not, I will, but later on this week.

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
