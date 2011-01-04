From: Dan Carpenter <error27@gmail.com>
Date: Tue, 04 Jan 2011 09:24:31 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <20110104092431.GB1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker>
 <1294124330.6617.15.camel@Joe-Laptop>
In-Reply-To: <1294124330.6617.15.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 03, 2011 at 10:58:50PM -0800, Joe Perches wrote:
> On Tue, 2011-01-04 at 08:59 +0300, Dan Carpenter wrote:
> > +			WARN("put the && or || at the end of the previous line\n" . $herecurr);
> 
> I've submitted something like this a couple of times and gotten
> various objections but I think it's sensible.
> 
> https://lkml.org/lkml/2009/12/5/65
> https://lkml.org/lkml/2010/7/11/92

If everyone except you thinks it's a waste of time, then stop asking me
to redo my patches.  :/  I don't care either way so long as CodingStyle
and checkpatch reflect the rules.

regards,
dan carpenter

