From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 11 Nov 2020 01:48:32 +0000
Subject: Re: [PATCH][next] net: dsa: fix unintended sign extension on a u16 left shift
Message-Id: <20201110174832.437b4951@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109124008.2079873-1-colin.king@canonical.com>
        <87y2jar76v.fsf@kurt>
In-Reply-To: <87y2jar76v.fsf@kurt>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Kanzenbach <kurt@linutronix.de>, Colin King <colin.king@canonical.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 09 Nov 2020 14:27:52 +0100 Kurt Kanzenbach wrote:
> On Mon Nov 09 2020, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The left shift of u16 variable high is promoted to the type int and
> > then sign extended to a 64 bit u64 value.  If the top bit of high is
> > set then the upper 32 bits of the result end up being set by the
> > sign extension. Fix this by explicitly casting the value in high to
> > a u64 before left shifting by 16 places.
> >
> > Also, remove the initialisation of variable value to 0 at the start
> > of each loop iteration as the value is never read and hence the
> > assignment it is redundant.
> >
> > Addresses-Coverity: ("Unintended sign extension")
> > Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek switches")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> 
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

Applied, thanks!
