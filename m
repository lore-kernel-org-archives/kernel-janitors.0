From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 19:56:00 +0000
Subject: Re: [PATCH v4] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <20200428195600.GN2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200425113234.GA14492@blackclown> <8518467.FNpd3NTrYF@pc-42>
 <20200427115827.GA3214@blackclown>
In-Reply-To: <20200427115827.GA3214@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2020 at 05:28:27PM +0530, Suraj Upadhyay wrote:
> On Mon, Apr 27, 2020 at 11:50:23AM +0000, Jerome Pouiller wrote:
> > On Saturday 25 April 2020 13:32:34 CEST Suraj Upadhyay wrote:
> > > Break lines with length over 80 characters to
> > > conform to the linux coding style and refactor
> > > wherever necessary.
> > > 
> > > Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> > > ---
> > > 
> > > Changes in v4:
> > > 	- Added a space after declaration in wfx_get_hw_rate().
> > > 	- A checkpatch warning for this commit is retained at line 75,
> > > 	  to maintain uniformity in function declarations. (Reviewer
> > > 	  jerome suggested).
> > > 
> > > Changes in v3:
> > >         - Changed the temporary variable name for the memzcmp statement
> > >           to is_used. (as suggested).
> > >         - Added a temporary ieee80211_supported_band variable to address
> > >           the problem in wfx_get_hw_rate() more efficiently. (not
> > >           suggested, but still).
> > > 
> > > Changes in v2:
> > >         - Introduced a temporary variable for the memzcmp statement.
> > >         - Addressed the checkpatch problem with wfx_get_hw_rate().
> > >         - Restored the function definition of wfx_tx_get_tx_parms
> > >           as suggested by the reviewer.
> > >         - Added suggested changes for req->packet_id statement.
> > > 
> > >  drivers/staging/wfx/data_tx.c | 40 +++++++++++++++++++++++------------
> > >  1 file changed, 26 insertions(+), 14 deletions(-)
> > 
> > This patch does not contain the suggestions from Dan. However, it is
> > sufficient from my personal point of view.
> 
> Yes, I considered them but thought it would be bad to introduce a new
> variable at every iteration of the for-loop.
> 

It's not bad at all.  I don't know why someone would think that.

regards,
dan carpenter
