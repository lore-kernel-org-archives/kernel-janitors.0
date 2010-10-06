From: Greg KH <greg@kroah.com>
Date: Wed, 06 Oct 2010 01:52:04 +0000
Subject: Re: [PATCH 00/28] Staging: comedi: Fixed numerous file so that it
Message-Id: <20101006015204.GA22411@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=GrHjrZaKdX8DiDf2nT-SByifSxn2sW_0NQWd_@mail.gmail.com>
In-Reply-To: <AANLkTi=GrHjrZaKdX8DiDf2nT-SByifSxn2sW_0NQWd_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: T Dent <tdent48227@gmail.com>
Cc: abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 05, 2010 at 09:15:16PM -0400, T Dent wrote:
> I fixed a lot of coding style errors, that checkpatch.pl had found. I
> didn't do some files in the drivers/ subdirectory because the warnings
> that were being produce was spacing errors. So spacing wasn't that
> serious ,so I skim and look for if it was anymore wranings or errors.
> There was none so I skip the rest.
> 
> This is my last full scale checkpatch.pl patch series, as I'm going to
> try to contribute more interesting things to the Linux kernel. :)

As mentioned in the response to 01/28, these are all just fine as-is and
don't need to be changed, sorry.  Go bug the checkpatch author to remove
this from the tool.

sorry,

greg k-h
