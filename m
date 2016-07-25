From: Jean Delvare <jdelvare@suse.de>
Date: Mon, 25 Jul 2016 12:39:33 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <20160725143933.5f3da07d@endymion>
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
	<ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
	<20160720231044.4b4f2864@endymion>
	<8ef974f3-b4ce-ed2a-0697-b6c8c0c35fd8@users.sourceforge.net>
	<20160721211342.6711a272@endymion>
	<8f15564a-86c7-0c46-8fe6-1f823d4bdf4f@users.sourceforge.net>
In-Reply-To: <8f15564a-86c7-0c46-8fe6-1f823d4bdf4f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hi Markus,

On Thu, 21 Jul 2016 22:11:53 +0200, SF Markus Elfring wrote:
> >> How do you generally think about jump label renaming?
> > 
> > Renaming from "out0:", "out1:" etc to something meaningful, yes.
> 
> I suggest to take another look at such identifiers.
> 
> Would you like to support the renaming of a label like "error_out1"
> (in the function "ks7010_upload_firmware" for example)?

They should be renamed too. Anything using numbers instead of explicit
labels should be updated. I included the reasons in the patch I just
sent, hopefully the documentation is clearer now.

> Will the software evolution be continued also with information from the topic
> "Source code review around jump label usage"?
> https://lkml.org/lkml/2015/12/11/378
> http://article.gmane.org/gmane.linux.kernel/2106190

Personally I see no value in such statistics. Either labels are wrong
(either wrong indentation or wrong name) and should be fixed, or they
are correct and you should not touch them. Whether the same label name
is used somewhere else is irrelevant. Labels are local by nature, so
uniqueness isn't a goal at all, only correctness.

-- 
Jean Delvare
SUSE L3 Support
