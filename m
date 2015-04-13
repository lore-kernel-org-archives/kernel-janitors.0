From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Date: Mon, 13 Apr 2015 12:25:30 +0000
Subject: Re: [PATCH 1/2] ide: remove deprecated use of pci api
Message-Id: <20150413132530.210f1d3b@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428579988-10167-1-git-send-email-lambert.quentin@gmail.com>
	<1428579988-10167-2-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1428579988-10167-2-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu,  9 Apr 2015 13:46:27 +0200
Quentin Lambert <lambert.quentin@gmail.com> wrote:

> Replace occurences of the pci api by appropriate call to the dma api.
> 

Drivers/ide is obsolete. It probably ought to go at this point but even
so it exists solely in case of a problem or compatibility issue with
drivers/ata. Cleaning it up without testing all the drivers makes no
sense IMHO. Cleaning it up and testing them doesn't make much sense
either.

Alan
