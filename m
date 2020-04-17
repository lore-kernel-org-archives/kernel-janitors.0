From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Apr 2020 10:24:20 +0000
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <20200417102420.GR1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
 <20200417101428.GA10295@Mani-XPS-13-9360>
In-Reply-To: <20200417101428.GA10295@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 17, 2020 at 03:44:28PM +0530, Manivannan Sadhasivam wrote:
> Hi Hemant,
> 
> On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
> > 
> > On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> > > Hi Dan,
> > > 
> > > On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> > > > Hello Manivannan Sadhasivam,
> > > > 
> > > > The patch 189ff97cca53: "bus: mhi: core: Add support for data
> > > > transfer" from Feb 20, 2020, leads to the following static checker
> > > > warning:
> > > > 
> > > > 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> > > > 	error: double locked 'mhi_chan->lock' (orig line 1110)
> > > > 
> > > > drivers/bus/mhi/core/main.c
> > > >    1142          }
> > > >    1143
> > > >    1144          /* Toggle wake to exit out of M2 */
> > > >    1145          mhi_cntrl->wake_toggle(mhi_cntrl);
> > > >    1146
> > > >    1147          if (mhi_chan->dir = DMA_TO_DEVICE)
> > > >    1148                  atomic_inc(&mhi_cntrl->pending_pkts);
> > > >    1149
> > > >    1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> > > >    1151                  unsigned long flags;
> > > >    1152
> > > >    1153                  read_lock_irqsave(&mhi_chan->lock, flags);
> > 
> > parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); first
> > and later
> > 
> > mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);
> > 
> > Both are read locks which are recursive, is this problematic ?
> > 
> 
> read_locks are recursive but I wanted to make the static checker happy.

Don't do things just to make the static checker happy.

regards,
dan carpenter
