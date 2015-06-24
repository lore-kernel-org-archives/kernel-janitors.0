From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Wed, 24 Jun 2015 20:14:04 +0000
Subject: RE: [lustre-devel] [PATCH 01/12] staging: lustre: fid: Use !x to check for kzalloc failure
Message-Id: <b6faae35ac9a40de97d7c1a98ad94fa4@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
	<1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
	<D1AECA61.F8DE5%andreas.dilger@intel.com>	<20150623092303.GN28762@mwanda>
	<alpine.DEB.2.10.1506231127120.2554@hadrien>	<20150623095704.GO28762@mwanda>
 <alpine.DEB.2.10.1506231247510.2554@hadrien>
In-Reply-To: <alpine.DEB.2.10.1506231247510.2554@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Julia Lawall' <julia.lawall@lip6.fr>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin, Oleg" <oleg.drokin@intel.com>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

>> Yes.  I know Al's thoughts and kernel style.
>>
>> But Alan Cox and Andreas have both said they think (x = NULL) can help
>> you avoid some kind of boolean vs pointer bugs.  I've had co-workers who
>> did massive seds changing !foo to foo = NULL on our code base.  But
>> I've never seen a real life example of a bug this fixes.
>>
>> To be honest, I've never seen a real life proof that (!foo) code is less
>> buggy.  I should look through the kbuild mailbox...  Hm...  But my other
>> idea of setting up code style readability testing website is also a good
>> one.
>>
>> Linux kernel style is based on Joe Perches finding that 80% of the code
>> prefers one way or the other.  That's a valid method for determining
>> code style.  I bet it normally picks the more readable style but it
>> would be interesting to measure it more formally.
>
>On today's linux-next, I find 3218 tests on the result of kmalloc etc
>using NULL and 14429 without, making 82% without.  The complete semantic
>patch is shown below.

Most people doing something a certain way is not a technical argument. Usually
people do what they are taught. From most people's comments their seems to 
be no technical reason to us one over another. I do have one technical reason not
to accept these patches. It is too easy to make a mistake and break things very badly.
I don't think it is worth the risk for a non-hard requirement.

