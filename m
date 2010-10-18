From: "Harsha, Priya" <priya.harsha@intel.com>
Date: Mon, 18 Oct 2010 15:38:13 +0000
Subject: RE: [patch] Staging: intel_sst: off by one bug
Message-Id: <98769532B4BB14429434178695419EAE053605A670@bgsmsx501.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015203644.GO6614@bicker>
In-Reply-To: <20101015203644.GO6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 
> This should be >= instead of > or we go passed the end of the array.
> 
> Also the arrays are declared with size MAX_NUM_STREAMS.  This is the
> only place that uses MAX_NUM_STREAMS_MFLD.  It seems like asking for
> trouble to use two variables for the same information.  I've changed
> everything to use MAX_NUM_STREAMS.
> 
> This bug isn't really harmful.  In the worst case, if you enabled
> debugging then you would see a message.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
Acked-by: Harsha Priya <priya.harsha@intel.com>
