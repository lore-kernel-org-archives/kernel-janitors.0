From: =?UTF-8?B?SMOla29uIEzDuHZkYWw=?= <hlovdal@gmail.com>
Date: Sun, 08 May 2011 23:08:44 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <BANLkTik_gMCHYp4sOnzzR1Gs=bn2pkpjfQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110507012717.GA15854@x61.tchesoft.com>
	<1304733100.11874.33.camel@Joe-Laptop>
	<20110507173141.GA4204@x61.tchesoft.com>
	<1304791360.1738.6.camel@Joe-Laptop>
	<BANLkTimKs39m_htMFEygR+3Bfu7Butc-zQ@mail.gmail.com>
In-Reply-To: <BANLkTimKs39m_htMFEygR+3Bfu7Butc-zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: matt mooney <mfmooney@gmail.com>
Cc: Joe Perches <joe@perches.com>, aquini@linux.com, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Jay Vosburgh <fubar@us.ibm.com>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On 7 May 2011 21:35, matt mooney <mfmooney@gmail.com> wrote:
> But isn't the preferred style to have a single exit point?

This is generally considered to be a bad advice, see
http://stackoverflow.com/questions/1701686/why-should-methods-have-a-single-entry-and-exit-points/1701721#1701721
for instance.

BR Håkon Løvdal
