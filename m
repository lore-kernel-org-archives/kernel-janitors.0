From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Dec 2020 13:36:31 +0000
Subject: Re: [PATCH] media: cec: fix trivial style warnings
Message-Id: <20201218133631.GL2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201218063117.GA80700@fedora>
 <20201218101630.GM2831@kadam>
 <20201218123558.GA4088@fedora>
In-Reply-To: <20201218123558.GA4088@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Christian <nigel.l.christian@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sakari.ailus@linux.intel.com, gustavoars@kernel.org, linux-media@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 18, 2020 at 07:35:58AM -0500, Nigel Christian wrote:
> On Fri, Dec 18, 2020 at 01:16:30PM +0300, Dan Carpenter wrote:
> > On Fri, Dec 18, 2020 at 01:31:17AM -0500, Nigel Christian wrote:
> > > Comment has 'then' repeated twice. Let's clean it up.
> > > Use unsigned int to maintain naming consistency.
> > > 
> > 
> > Do you use a tool to find the double "then then"?
> > 
> > regards,
> > dan carpenter
> > 
> 
> Started working on nodejs script to run the 'checkpatch.pl -f'
> on directories and filter the output by command line arg.

Ah...  I didn't realize that checkpatch could find this sort of thing.
Thanks!

regards,
dan carpenter
