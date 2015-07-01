From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 01 Jul 2015 07:50:00 +0000
Subject: Re: XFS: Fine-tuning for checks before the function call "xfs_qm_dqrele"?
Message-Id: <55939BA8.1090400@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<5479F823.60900@users.sourceforge.net>
	<20141130230904.GF16151@dastard>
	<558D1833.3080009@users.sourceforge.net>
	<20150629214355.GE7943@dastard>
In-Reply-To: <20150629214355.GE7943@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

> xfs_dqrele_inode() gets called on every inode in the inode cache,
> and this change results in a cacheline in every inode being dirtied
> even if they don't have dquots attached. Given the inode cache can
> hold tens to hundreds of millions of inodes on large machines, we
> don't want to dirty any cachelines we don't need to while walking
> the inode cache and releasing dquots...

Would it make sense to annotate checks before such function calls
as "LIKELY"?

Regards,
Markus
