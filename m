From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 18:21:25 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
 <20160720155216.GD1688@katana>
In-Reply-To: <20160720155216.GD1688@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

>> Adjust jump targets according to the Linux coding style convention.
> 
> Really? Is that documented somewhere?

How do you think about information from the chapter "7: Centralized exiting of functions"?
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/CodingStyle?idGef4ad2684d380dd6d596140fb79395115c3950#n389


> Quoting Jean Delvare:
> 
> "> It is generally accepted to indent labels with a single space. This
>  > avoids breaking the -p option of diff."

Would you like to take another look at the warning "LEADING_SPACE"?
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?idGef4ad2684d380dd6d596140fb79395115c3950#n3004

Does such a check need further considerations?


> So, NACK for now unless we know 'diff' has been fixed.

I am also curious on corresponding software evolution.

Regards,
Markus
