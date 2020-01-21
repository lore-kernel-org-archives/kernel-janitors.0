From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2020 14:17:42 +0000
Subject: Re: [PATCH] ide: make drive->dn read only
Message-Id: <20200121141742.GB1870@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200121130719eucas1p15e8bc52b9167b48a1eb7be191ef103f5@eucas1p1.samsung.com>
 <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
 <beada2e3-29bd-2165-b6d7-d28a8c83060e@samsung.com>
In-Reply-To: <beada2e3-29bd-2165-b6d7-d28a8c83060e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 21, 2020 at 03:13:29PM +0100, Bartlomiej Zolnierkiewicz wrote:
> 
> On 1/21/20 2:06 PM, Dan Carpenter wrote:
> > The IDE core always sets ->dn correctly so changing it is never
> > required.
> > 
> > Setting it to a different value than assigned by IDE core is very likely
> > to result in data corruption (due to wrong transfer timings being set on
> > the controller etc.)
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, it looks fine (though patch summary can be improved further i.e.:
> "[PATCH] ide-proc: make "number" setting read-only").
> 
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> I've also verified it (using ARAnyM emulator):
> 
> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 

Thanks!

regards,
dan carpenter
